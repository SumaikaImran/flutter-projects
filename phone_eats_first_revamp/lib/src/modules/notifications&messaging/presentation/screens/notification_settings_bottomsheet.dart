import 'package:flutter/material.dart';
import 'package:phone_eats_first/src/components/toggle_button1.dart';
import 'package:phone_eats_first/src/core/services/routing_service/named_routes.dart';
import 'package:phone_eats_first/src/core/theme/app_colors.dart';
import 'package:phone_eats_first/src/core/theme/theme_styles.dart';
import 'package:phone_eats_first/src/core/utils/app_assets.dart';
import 'package:phone_eats_first/src/core/utils/app_logger.dart';
import 'package:phone_eats_first/src/core/utils/app_strings.dart';

class NotificationSettingsBottomsheet extends StatelessWidget {
  const NotificationSettingsBottomsheet({super.key});
  
  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 310,
      padding: EdgeInsets.only(top: 8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Divider(
            indent: 155,
            endIndent: 155,
            color: AppColors.dividerColor,
            thickness: 6,
            radius: BorderRadius.circular(10),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('        '),
                Text(
                  'Notification Settings',
                  style: AppTextTheme.headingBlack15,
                ),
                IconButton(
                  visualDensity: VisualDensity(horizontal: -3),
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
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset(AppAssets.ns1, scale: 2),
                        Text('  '),
                        Text(
                          AppStrings.newFollowers,
                          style: AppTextTheme.headingBlack14,
                        ),
                      ],
                    ),
                    CustomToggleButton(
                      value: false,
                      onChanged: (bool value) {
                        if (value) {
                          appPrint('Permission accessed');
                        } else {
                          appPrint('Permission denied');
                        }
                      },
                      size: 0.94,
                    ),
                  ],
                ),
                Divider(color: AppColors.lighterGrey, thickness: 1, height: 1),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset(AppAssets.ns2, scale: 2),
                        Text('  '),
                        Text(
                          AppStrings.likesComments,
                          style: AppTextTheme.headingBlack14,
                        ),
                      ],
                    ),
                    CustomToggleButton(
                      value: false,
                      onChanged: (bool value) {
                        if (value) {
                          appPrint('Permission accessed');
                        } else {
                          appPrint('Permission denied');
                        }
                      },
                      size: 0.94,
                    ),
                  ],
                ),
                Divider(color: AppColors.lighterGrey, thickness: 1, height: 1),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset(AppAssets.ns3, scale: 2),
                        Text('  '),
                        Text(
                          AppStrings.saveShare,
                          style: AppTextTheme.headingBlack14,
                        ),
                      ],
                    ),
                    CustomToggleButton(
                      value: false,
                      onChanged: (bool value) {
                        if (value) {
                          appPrint('Permission accessed');
                        } else {
                          appPrint('Permission denied');
                        }
                      },
                      size: 0.94,
                    ),
                  ],
                ),
                Divider(color: AppColors.lighterGrey, thickness: 1, height: 1),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset(AppAssets.ns4, scale: 2),
                        Text('  '),
                        Text(
                          AppStrings.newmsg,
                          style: AppTextTheme.headingBlack14,
                        ),
                      ],
                    ),
                    CustomToggleButton(
                      value: false,
                      onChanged: (bool value) {
                        if (value) {
                          appPrint('Permission accessed');
                        } else {
                          appPrint('Permission denied');
                        }
                      },
                      size: 0.94,
                    ),
                  ],
                ),
                Divider(color: AppColors.lighterGrey, thickness: 1, height: 1),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
