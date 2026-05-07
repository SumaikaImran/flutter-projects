import 'package:flutter/material.dart';
import 'package:phone_eats_first/src/core/services/routing_service/named_routes.dart';
import 'package:phone_eats_first/src/core/theme/app_colors.dart';
import 'package:phone_eats_first/src/core/theme/theme_styles.dart';
import 'package:phone_eats_first/src/core/utils/app_assets.dart';
import 'package:phone_eats_first/src/core/utils/app_strings.dart';
import 'package:phone_eats_first/src/modules/notifications&messaging/presentation/screens/message_notifications_screen.dart';
import 'package:phone_eats_first/src/modules/notifications&messaging/presentation/screens/notification_settings_bottomsheet.dart';
import 'package:phone_eats_first/src/modules/notifications&messaging/presentation/screens/notifications_bottomsheet2.dart';
import 'package:phone_eats_first/src/modules/notifications&messaging/presentation/screens/recent_notification_screen.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);

    _tabController.addListener(() {
      setState(() {
        // triggers rebuild when tab changes
      });
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: AppColors.secondaryTextWhite,
        automaticallyImplyLeading: false,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () {
                    AppRouterGo.back();
                  },
                  child: Image.asset(AppAssets.BackButton, scale: 2),
                ),
                Text(
                  AppStrings.notifications,
                  style: AppTextTheme.headingBlack15,
                ),
                // Change icon based on selected tab
                _tabController.index == 0
                    ? InkWell(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () {
                        showModalBottomSheet(
                          isScrollControlled: true,
                          backgroundColor: AppColors.secondaryTextWhite,
                          context: context,
                          builder: (_) => NotificationSettingsBottomsheet(),
                        );
                      },
                      child: Image.asset(AppAssets.bell, scale: 2),
                    ) // Recent tab
                    : InkWell(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () {
                        showModalBottomSheet(
                          isScrollControlled: true,
                          backgroundColor: AppColors.secondaryTextWhite,
                          context: context,
                          builder: (_) => NotificationsBottomsheet2(),
                        );
                      },
                      child: Image.asset(AppAssets.chatmsg, scale: 2),
                    ), // Messages tab
              ],
            ),
          ],
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(35),
          child: Column(
            children: [
              Container(height: 1, color: AppColors.lighterGrey),
              TabBar(
                controller: _tabController,
                splashFactory: NoSplash.splashFactory,
                overlayColor: WidgetStateProperty.all(Colors.transparent),
                padding: EdgeInsets.only(top: 12),
                indicatorColor: Colors.black,
                indicator: UnderlineTabIndicator(
                  borderSide: BorderSide(color: Colors.black, width: 2),
                ),
                indicatorPadding: EdgeInsets.only(top: 5),
                labelPadding: EdgeInsets.only(bottom: 17),
                labelColor: Colors.black,
                unselectedLabelColor: Colors.black,
                tabs: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(AppAssets.timer, scale: 2),
                      SizedBox(width: 4),
                      Text(AppStrings.recent),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(AppAssets.msg1, scale: 2),
                      SizedBox(width: 4),
                      Text(AppStrings.messages),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [RecentNotifications(), MessageNotifications()],
      ),
    );
  }
}
