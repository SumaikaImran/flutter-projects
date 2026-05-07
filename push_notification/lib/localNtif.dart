import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart';

class MyNotificationPage extends StatefulWidget {
  @override
  State<MyNotificationPage> createState() => _MyNotificationPageState();
}

class _MyNotificationPageState extends State<MyNotificationPage> {
  late FlutterLocalNotificationsPlugin notificationsPlugin;
  final TextEditingController _delayController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _initializeNotification();
  }

  Future<void> _initializeNotification() async {
    tz.initializeTimeZones();

    notificationsPlugin = FlutterLocalNotificationsPlugin();

    const androidInit = AndroidInitializationSettings('@mipmap/ic_launcher');
    const initSettings = InitializationSettings(android: androidInit);

    await notificationsPlugin.initialize(initSettings);
  }

  Future<void> showInstantNotification({
    required int id,
    required String title,
    String? body,
  }) async {
    await notificationsPlugin.show(
      id,
      title,
      body,
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'instant_channel',
          'Instant Notifications',
          channelDescription: 'Channel for instant notifications',
          importance: Importance.max,
          priority: Priority.high,
        ),
      ),
    );
  }

  Future<void> scheduleReminder({
    required int id,
    required String title,
    String? body,
    required int delaySeconds,
  }) async {
    final now = TZDateTime.now(local);
    final scheduledDate = now.add(Duration(seconds: delaySeconds));

    await notificationsPlugin.zonedSchedule(
      id,
      title,
      body,
      scheduledDate,
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'daily_reminder_channel_id',
          'Daily Reminders',
          channelDescription: "Reminder to complete daily habits",
          importance: Importance.max,
          priority: Priority.high,
        ),
      ),
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      matchDateTimeComponents: DateTimeComponents.time,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notification Demo'),
        backgroundColor: Colors.deepPurple,
        elevation: 4,
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 24),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFB5E2FA), Color(0xFFF9F7F3)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _delayController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Delay in seconds',
                border: OutlineInputBorder(),
                hintText: 'Enter seconds to wait before notification',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF0FA3B1),
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 14,
                ),
              ),
              onPressed: () => showInstantNotification(
                id: 0,
                title: 'Instant Notification',
                body: 'This is an instant notification.',
              ),
              icon: const Icon(Icons.notifications_active),
              label: const Text('Show Instant Notification'),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFF7A072),
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 14,
                ),
              ),
              onPressed: () {
                final delay = int.tryParse(_delayController.text);
                if (delay == null || delay <= 0) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Please enter a valid delay.')),
                  );
                } else {
                  scheduleReminder(
                    id: 1,
                    title: 'Scheduled Notification',
                    body: 'This was scheduled $delay seconds ago.',
                    delaySeconds: delay,
                  );
                }
              },
              icon: const Icon(Icons.schedule),
              label: const Text('Schedule Notification'),
            ),
          ],
        ),
      ),
    );
  }
}
