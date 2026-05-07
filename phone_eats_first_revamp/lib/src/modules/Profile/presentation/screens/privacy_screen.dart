import 'package:flutter/material.dart';
import 'package:phone_eats_first/src/components/toggle_button1.dart';
import 'package:phone_eats_first/src/core/services/routing_service/named_routes.dart';
import 'package:phone_eats_first/src/core/theme/app_colors.dart';
import 'package:phone_eats_first/src/core/theme/theme_styles.dart';
import 'package:phone_eats_first/src/core/utils/app_logger.dart';

import '../../../../core/utils/app_assets.dart';

class PrivacyScreen extends StatelessWidget {
  const PrivacyScreen({super.key});

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
                Text('Privacy', style: AppTextTheme.headingBlack15),

                // Change icon based on selected tab
                Image.asset(AppAssets.logout, scale: 2),
                // Recent tab
                // Messages tab
              ],
            ),
          ],
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(0),
          child: Divider(color: AppColors.lighterGrey),
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 30, left: 50, right: 50),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomToggleButton(
              value: false,
              onChanged: (bool value) {
                if (value) {
                  appPrint('Permission accessed');
                } else {
                  appPrint('Permission denied');
                }
              },
              size: 0.88,
              activeColor: Color.fromRGBO(215, 51, 76, 1),
              activeTrackColor: Color.fromRGBO(241, 144, 161, 1),
              inactiveColor: Color.fromRGBO(241, 144, 161, 1),
            ),
            SizedBox(width: 12),

            Expanded(
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Public profile. ',
                      style: AppTextTheme.bodyBlack13,
                    ),
                    TextSpan(
                      text:
                          'My post and reviews will be visible to everyone using the app',
                      style: AppTextTheme.textGrey13,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
