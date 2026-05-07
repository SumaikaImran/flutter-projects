import 'package:flutter/material.dart';
import 'package:phone_eats_first/src/components/primary_button1.dart';
import 'package:phone_eats_first/src/core/services/routing_service/app_routes.dart';
import 'package:phone_eats_first/src/core/services/routing_service/named_routes.dart';
import 'package:phone_eats_first/src/core/theme/app_colors.dart';
import 'package:phone_eats_first/src/core/theme/theme_styles.dart';
import 'package:phone_eats_first/src/core/utils/app_assets.dart';
import 'package:phone_eats_first/src/modules/Profile/presentation/screens/settings_notifications.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
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
                Text('Edit Profile', style: AppTextTheme.headingBlack15),

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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Stack(
                  fit: StackFit.loose,
                  children: [
                    Image.asset(AppAssets.profilepic2, scale: 3.8),
                    Positioned(
                      bottom: -5,
                      right: 0,
                      child: Image.asset(AppAssets.proLogo, scale: 2.3),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15),
              Text('Banner Images', textAlign: TextAlign.left),
              SizedBox(height: 7),
              SizedBox(
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Stack(
                      children: [
                        Container(
                          clipBehavior: Clip.hardEdge,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),

                          child: Image.asset(
                            AppAssets.pr1,
                            fit: BoxFit.cover,
                            height: 56,
                            width: 57,
                          ),
                        ),
                        Positioned(
                          bottom: -3,
                          left: -3,
                          child: Image.asset(AppAssets.proLogo, scale: 3.5),
                        ),
                      ],
                    ),
                    Stack(
                      children: [
                        Container(
                          clipBehavior: Clip.hardEdge,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),

                          child: Image.asset(
                            AppAssets.pr2,
                            fit: BoxFit.cover,
                            height: 56,
                            width: 57,
                          ),
                        ),
                        Positioned(
                          bottom: -3,
                          left: -3,
                          child: Image.asset(AppAssets.proLogo, scale: 3.5),
                        ),
                      ],
                    ),
                    Stack(
                      children: [
                        Container(
                          clipBehavior: Clip.hardEdge,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),

                          child: Image.asset(
                            AppAssets.pr3,
                            fit: BoxFit.cover,
                            height: 56,
                            width: 57,
                          ),
                        ),
                        Positioned(
                          bottom: -3,
                          left: -3,
                          child: Image.asset(AppAssets.proLogo, scale: 3.5),
                        ),
                      ],
                    ),
                    Stack(
                      children: [
                        Container(
                          clipBehavior: Clip.hardEdge,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),

                          child: Image.asset(
                            AppAssets.pr4,
                            fit: BoxFit.cover,
                            height: 56,
                            width: 57,
                          ),
                        ),
                        Positioned(
                          bottom: -3,
                          left: -3,
                          child: Image.asset(AppAssets.proLogo, scale: 3.5),
                        ),
                      ],
                    ),
                    Stack(
                      children: [
                        Container(
                          clipBehavior: Clip.hardEdge,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),

                          child: Image.asset(
                            AppAssets.pr5,
                            fit: BoxFit.cover,
                            height: 56,
                            width: 57,
                          ),
                        ),
                        Positioned(
                          bottom: -3,
                          left: -3,
                          child: Image.asset(AppAssets.proLogo, scale: 3.5),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15),
              Row(
                children: [
                  Expanded(
                    child: Text('Name', style: AppTextTheme.headingBlack15),
                  ),
                  Expanded(
                    child: Text('Username', style: AppTextTheme.headingBlack15),
                  ),
                ],
              ),
              SizedBox(height: 7),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: AppColors.lighterGrey),
                      ),
                      child: Text(
                        'Kelsey Ross',
                        style: AppTextTheme.headingBlack12600b,
                      ),
                    ),
                  ),
                  SizedBox(width: 5),
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: AppColors.lighterGrey),
                      ),
                      child: Text(
                        '@kelsey',
                        style: AppTextTheme.headingBlack12600b,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 7),
              Text('Bio', style: AppTextTheme.headingBlack15),
              SizedBox(height: 7),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(14),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: AppColors.lighterGrey),
                ),
                child: Text(
                  'I like happy hours & pickles\n Account Manager @ Phone Eats First',
                  style: AppTextTheme.headingBlack12600b,
                ),
              ),
              SizedBox(height: 7),
              Text('Phone Number', style: AppTextTheme.headingBlack15),
              SizedBox(height: 7),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.lighterGrey,
                ),
                child: Text(
                  '(555) 123-4567',
                  style: AppTextTheme.headingBlack12600,
                ),
              ),
              SizedBox(height: 7),
              Text('Email', style: AppTextTheme.headingBlack15),
              SizedBox(height: 7),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.lighterGrey,
                ),
                child: Text(
                  'kelsey@email.com',
                  style: AppTextTheme.headingBlack12600,
                ),
              ),
              SizedBox(height: 7),
              Text('Password', style: AppTextTheme.headingBlack15),
              SizedBox(height: 7),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: AppColors.lighterGrey),
                ),
                child: Text('********', style: AppTextTheme.headingBlack12600),
              ),
              SizedBox(height: 7),
              Divider(color: AppColors.lighterGrey),
              SizedBox(height: 7),
              Column(
                children: [
                  ListTile(
                    onTap: () {
                      showModalBottomSheet(
                        isScrollControlled: true,
                        backgroundColor: AppColors.secondaryTextWhite,
                        context: context,
                        builder: (_) => SettingsNotifications(),
                      );
                    },
                    splashColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    selectedTileColor: Colors.transparent,
                    tileColor: Colors.transparent,
                    contentPadding: EdgeInsets.only(
                      left: 0,
                      right: 2,
                      bottom: 0,
                    ),
                    visualDensity: VisualDensity(vertical: -3),
                    leading: Container(
                      height: 45,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(255, 153, 0, 1),
                        shape: BoxShape.circle,
                      ),
                      child: Image.asset(AppAssets.gui1, scale: 2.3),
                    ),
                    title: Text(
                      'Notifications',
                      style: AppTextTheme.headingBlack15,
                    ),
                    subtitle: Text(
                      'Push & email',
                      style: AppTextTheme.bodyGrey13Regular,
                    ),
                    trailing: Icon(Icons.keyboard_arrow_right_outlined),
                  ),
                  ListTile(
                    splashColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    selectedTileColor: Colors.transparent,
                    tileColor: Colors.transparent,
                    onTap: () {
                      AppRouterGo.push(guidelinesScreen);
                    },
                    contentPadding: EdgeInsets.only(
                      left: 0,
                      right: 2,
                      bottom: 0,
                    ),
                    leading: Container(
                      height: 45,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(140, 50, 255, 1),
                        shape: BoxShape.circle,
                      ),
                      child: Image.asset(AppAssets.gui2, scale: 2.3),
                    ),
                    title: Text(
                      'Guidelines',
                      style: AppTextTheme.headingBlack15,
                    ),
                    subtitle: Text(
                      'Terms, Conditions, & Privacy',
                      style: AppTextTheme.bodyGrey13Regular,
                    ),
                    trailing: Icon(Icons.keyboard_arrow_right_outlined),
                  ),
                  ListTile(
                    onTap: () {},
                    contentPadding: EdgeInsets.only(
                      left: 0,
                      right: 2,
                      bottom: 0,
                    ),
                    leading: Container(
                      height: 45,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(255, 191, 26, 1),
                        shape: BoxShape.circle,
                      ),
                      child: Image.asset(AppAssets.gui3, scale: 2.3),
                    ),
                    title: Text('Rate App', style: AppTextTheme.headingBlack15),
                    subtitle: Text(
                      'Review on app store',
                      style: AppTextTheme.bodyGrey13Regular,
                    ),
                    trailing: Icon(Icons.keyboard_arrow_right_outlined),
                  ),
                ],
              ),
              Divider(color: AppColors.lighterGrey),
              SizedBox(height: 7),
              PrimaryButton(
                text: 'Complete Your Profile',
                onPressed: () {},
                height: 42,
                bgColor: AppColors.primaryPink,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
