import 'package:flutter/material.dart';
import 'package:phone_eats_first/src/core/services/routing_service/app_routes.dart';
import 'package:phone_eats_first/src/core/services/routing_service/named_routes.dart';
import 'package:phone_eats_first/src/core/theme/app_colors.dart';
import 'package:phone_eats_first/src/core/theme/theme_styles.dart';
import 'package:phone_eats_first/src/core/utils/app_assets.dart';

class GuidlinesScreen extends StatelessWidget {
  const GuidlinesScreen({super.key});

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
                Text('Guidelines', style: AppTextTheme.headingBlack15),

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
      body: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Column(
          children: [
            ListTile(
              contentPadding: EdgeInsets.only(left: 15, right: 9),
              leading: Container(
                height: 45,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(255, 153, 0, 1),
                  shape: BoxShape.circle,
                ),
                child: Image.asset(AppAssets.gui1, scale: 2.3),
              ),
              title: Text('Terms', style: AppTextTheme.headingBlack15),
              trailing: Icon(Icons.keyboard_arrow_right_outlined),
            ),
            ListTile(
              contentPadding: EdgeInsets.only(left: 15, right: 9),
              leading: Container(
                height: 45,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(140, 50, 255, 1),
                  shape: BoxShape.circle,
                ),
                child: Image.asset(AppAssets.gui2, scale: 2.3),
              ),
              title: Text('Conditions', style: AppTextTheme.headingBlack15),
              trailing: Icon(Icons.keyboard_arrow_right_outlined),
            ),
            ListTile(
              onTap: () {
                AppRouterGo.push(privacyScreen);
              },
              contentPadding: EdgeInsets.only(left: 15, right: 9),
              leading: Container(
                height: 45,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(215, 51, 76, 1),
                  shape: BoxShape.circle,
                ),
                child: Image.asset(AppAssets.gui3, scale: 2.3),
              ),
              title: Text('Privacy', style: AppTextTheme.headingBlack15),
              trailing: Icon(Icons.keyboard_arrow_right_outlined),
            ),
          ],
        ),
      ),
    );
  }
}
