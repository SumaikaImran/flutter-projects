import 'package:flutter/material.dart';
import 'package:phone_eats_first/src/components/circle_clip_widget1.dart';
import 'package:phone_eats_first/src/components/toggle_button1.dart';
import 'package:phone_eats_first/src/core/services/routing_service/named_routes.dart';
import 'package:phone_eats_first/src/core/theme/app_colors.dart';
import 'package:phone_eats_first/src/core/theme/theme_styles.dart';
import 'package:phone_eats_first/src/core/utils/app_assets.dart';
import 'package:phone_eats_first/src/core/utils/app_logger.dart';
import 'package:phone_eats_first/src/core/utils/app_strings.dart';
import 'package:phone_eats_first/src/modules/Lists/presentation/screens/create_list_bottomsheet.dart';

class SettingsNotifications extends StatefulWidget {
  const SettingsNotifications({super.key});

  @override
  State<SettingsNotifications> createState() => _SwitchAccountState();
}

class _SwitchAccountState extends State<SettingsNotifications> {
  final List<String> titles = [
    "New Followers",
    "Social Interactions",
    "Content Engagement",
    "Messages",
    "Rewards",
  ];
  final List<String> subtitles = [
    "Foodie followed you",
    "Foodie liked or commented on your post",
    "Foodie saved or shared your post",
    "New message from Foodie",
    "Points, discounts, and promos",
  ];
  final List<String> titles1 = [
    "Your Activity",
    "App Updates",
    "Discovery Nearby",
    "Promos & Discounts",
    "Security Alerts",
  ];
  final List<String> subtitles1 = [
    "Unread notifications on PEF",
    "New features on PEF",
    "Trending spots in your area",
    "Deals from PEF partners",
    "Account logins & supsicious activity",
  ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Divider(
              indent: 155,
              endIndent: 155,
              color: AppColors.dividerColor,
              thickness: 6,
              radius: BorderRadius.circular(10),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('         '),

                Text(
                  AppStrings.notifications,
                  style: AppTextTheme.headingBlack15,
                ),
                IconButton(
                  visualDensity: VisualDensity(horizontal: -4),
                  iconSize: 20,
                  icon: Icon(Icons.close),
                  onPressed: () {
                    AppRouterGo.back();
                  },
                ),
              ],
            ),
          ),
          Divider(color: AppColors.lighterGrey),
          Padding(
            padding: EdgeInsetsGeometry.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Push Notifications',
                  style: AppTextTheme.headingBlack16800,
                ),
                Divider(color: AppColors.lighterGrey),
                ListView.builder(
                  itemCount: titles.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return ListTile(
                      visualDensity: VisualDensity(vertical: -3.5),
                      contentPadding: EdgeInsets.all(0),
                      title: Text(
                        titles[index],
                        style: AppTextTheme.bodyBlack13,
                      ),
                      subtitle: Text(
                        subtitles[index],
                        style: AppTextTheme.bodylightGrey11500,
                      ),
                      trailing: CustomToggleButton(
                        value: false,
                        onChanged: (bool value) {
                          if (value) {
                            appPrint('Permission accessed');
                          } else {
                            appPrint('Permission denied');
                          }
                        },
                        size: 0.88,
                      ),
                    );
                  },
                ),
                SizedBox(height: 10),
                Text(
                  'Email Notifications',
                  style: AppTextTheme.headingBlack16800,
                ),
                Divider(color: AppColors.lighterGrey),
                ListView.builder(
                  itemCount: titles1.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return ListTile(
                      visualDensity: VisualDensity(vertical: -3.5),
                      contentPadding: EdgeInsets.all(0),
                      title: Text(
                        titles1[index],
                        style: AppTextTheme.bodyBlack13,
                      ),
                      subtitle: Text(
                        subtitles1[index],
                        style: AppTextTheme.bodylightGrey11500,
                      ),
                      trailing: CustomToggleButton(
                        value: false,
                        onChanged: (bool value) {
                          if (value) {
                            appPrint('Permission accessed');
                          } else {
                            appPrint('Permission denied');
                          }
                        },
                        size: 0.88,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
