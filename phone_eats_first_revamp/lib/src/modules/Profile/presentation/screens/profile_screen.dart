import 'package:flutter/material.dart';
import 'package:phone_eats_first/src/components/primary_button1.dart';
import 'package:phone_eats_first/src/core/services/routing_service/app_routes.dart';
import 'package:phone_eats_first/src/core/services/routing_service/named_routes.dart';
import 'package:phone_eats_first/src/core/theme/app_colors.dart';

import 'package:phone_eats_first/src/core/theme/theme_styles.dart';
import 'package:phone_eats_first/src/core/utils/app_assets.dart';
import 'package:phone_eats_first/src/modules/Profile/presentation/screens/settings_notifications.dart';
import 'package:phone_eats_first/src/modules/Profile/presentation/screens/switch_account.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: AppColors.secondaryTextWhite,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                AppRouterGo.back();
              },
              child: Image.asset(AppAssets.BackButton, scale: 2),
            ),

            InkWell(
              splashColor: Colors.transparent, // removes ripple color
              highlightColor: Colors.transparent,
              onTap: () {
                showModalBottomSheet(
                  isScrollControlled: true,
                  backgroundColor: AppColors.secondaryTextWhite,
                  context: context,
                  builder: (_) => SwitchAccount(),
                );
              },
              child: Text('@kelsey', style: AppTextTheme.headingBlack15),
            ),

            InkWell(
              splashColor: Colors.transparent, // removes ripple color
              highlightColor: Colors.transparent,
              onTap: () {
                showModalBottomSheet(
                  isScrollControlled: true,
                  backgroundColor: AppColors.secondaryTextWhite,
                  context: context,
                  builder: (_) => SettingsNotifications(),
                );
              },
              child: Image.asset(AppAssets.settings, scale: 2),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 0.0,
                ), // give left/right space
                child: SizedBox(
                  height: 137, // increased to avoid clipping
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Stack(
                        alignment: Alignment.center,
                        clipBehavior: Clip.none, // prevent clipping of badge
                        children: [
                          // Row with left and right images
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                AppAssets.pr1,
                                height: 90,
                                width: 85,
                                fit: BoxFit.cover,
                              ),
                              SizedBox(
                                width: 40,
                              ), // leave some space for center widget
                              Image.asset(
                                AppAssets.pr2,
                                height: 90,
                                width: 85,
                                fit: BoxFit.cover,
                              ),
                            ],
                          ),

                          // Center circular profile with progress
                          Positioned(
                            left: 22, // shift towards left pic
                            child: Stack(
                              alignment: Alignment.center,
                              clipBehavior: Clip.none,
                              children: [
                                // Circular progress border
                                Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: AppColors.secondaryTextWhite,
                                      width: 4,
                                    ),
                                  ),
                                  width: 124,
                                  height: 125,
                                  child: Transform.rotate(
                                    angle: 3.14, // rotate to bottom start
                                    child: CircularProgressIndicator(
                                      value: 0.75,
                                      strokeWidth: 3.5,
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                        AppColors.secondaryTextRed,
                                      ),
                                      backgroundColor: Colors.grey.shade300,
                                    ),
                                  ),
                                ),

                                // Profile Image
                                ClipOval(
                                  child: Container(
                                    height: 112,
                                    clipBehavior: Clip.hardEdge,
                                    decoration: BoxDecoration(
                                      color: AppColors.secondaryTextWhite,
                                      border: Border.all(
                                        color: AppColors.secondaryTextWhite,
                                      ),
                                    ),
                                    child: Image.asset(
                                      AppAssets.profilepic2,

                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),

                                // Percentage badge
                                Positioned(
                                  bottom: -8, // push down more
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 10,
                                      vertical: 3,
                                    ),
                                    decoration: BoxDecoration(
                                      color: AppColors.secondaryTextRed,
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(
                                        color: AppColors.secondaryTextWhite,
                                        width: 2,
                                      ),
                                    ),
                                    child: Text(
                                      "75%",
                                      style: AppTextTheme.headingWhite12,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 1.9),
                      Image.asset(
                        AppAssets.pr3,
                        height: 90,
                        width: 85,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(width: 1.9),
                      Image.asset(
                        AppAssets.pr4,
                        height: 90,
                        width: 85,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(width: 1.9),
                      Image.asset(
                        AppAssets.pr5,
                        height: 90,
                        width: 85,
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18.0, right: 18, bottom: 7),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Kelsey Ross', style: AppTextTheme.bigHeading),
                  SizedBox(height: 6),
                  Text(
                    'I like happy hours & pickles',
                    style: AppTextTheme.bodyBlackMedium13,
                  ),
                  SizedBox(height: 6),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(AppAssets.camplus, scale: 2),
                      Text(' 255 ', style: AppTextTheme.bodyBlack13),
                      Text('Posts   ', style: AppTextTheme.bodyBlackMedium13),

                      InkWell(
                        splashColor: Colors.transparent, // removes ripple color
                        highlightColor: Colors.transparent,
                        onTap: () {
                          AppRouterGo.push(friendsScreen);
                        },
                        child: Row(
                          children: [
                            Image.asset(AppAssets.Followers, scale: 2),
                            Text(' 600 ', style: AppTextTheme.bodyBlack13),
                            Text(
                              'Foodies',
                              style: AppTextTheme.bodyBlackMedium13,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 6),
                  PrimaryButton(
                    text: 'Complete Your Profile',
                    onPressed: () {
                      AppRouterGo.push(editProfileScreen);
                    },
                    height: 42,
                    bgColor: AppColors.primaryPink,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6.0),
                    child: Divider(color: AppColors.lighterGrey),
                  ),
                  SizedBox(
                    height: 315, // adjust as needed
                    width: 320,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(
                        16,
                      ), // rounded corners
                      child: GridView.count(
                        crossAxisCount: 3, // 3 columns
                        crossAxisSpacing: 2,
                        mainAxisSpacing: 2,
                        physics:
                            NeverScrollableScrollPhysics(), // disable scroll
                        children: [
                          Image.asset(AppAssets.pr1, fit: BoxFit.cover),
                          Image.asset(AppAssets.pr2, fit: BoxFit.cover),
                          Image.asset(AppAssets.pr3, fit: BoxFit.cover),
                          Image.asset(AppAssets.pr4, fit: BoxFit.cover),
                          Image.asset(AppAssets.pr5, fit: BoxFit.cover),
                          Image.asset(AppAssets.pr1, fit: BoxFit.cover),
                          Image.asset(AppAssets.pr2, fit: BoxFit.cover),
                          Image.asset(AppAssets.pr3, fit: BoxFit.cover),
                          Image.asset(AppAssets.pr4, fit: BoxFit.cover),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
