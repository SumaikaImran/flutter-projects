import 'package:flutter/material.dart';

class FcmPushNotif extends StatefulWidget {
  const FcmPushNotif({super.key});

  @override
  State<FcmPushNotif> createState() => _FcmPushNotifState();
}

class _FcmPushNotifState extends State<FcmPushNotif> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Push Notifications',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(child: Text('data')),
    );
  }
}
