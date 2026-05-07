import 'package:flutter/material.dart';
import 'package:phone_eats_first/src/components/circle_clip_widget1.dart';
import 'package:phone_eats_first/src/core/services/routing_service/named_routes.dart';
import 'package:phone_eats_first/src/core/theme/app_colors.dart';
import 'package:phone_eats_first/src/core/theme/theme_styles.dart';
import 'package:phone_eats_first/src/core/utils/app_assets.dart';
import 'package:phone_eats_first/src/core/utils/app_strings.dart';
import 'package:phone_eats_first/src/modules/Lists/presentation/screens/create_list_bottomsheet.dart';

class SwitchAccount extends StatefulWidget {
  const SwitchAccount({super.key});

  @override
  State<SwitchAccount> createState() => _SwitchAccountState();
}

class _SwitchAccountState extends State<SwitchAccount> {
  bool istick1 = true;
  bool istick2 = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      padding: EdgeInsets.only(top: 8),
      child: Column(
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
                Image.asset(AppAssets.addUser, scale: 2),

                Text('Switch Accounts', style: AppTextTheme.headingBlack15),
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
            padding: const EdgeInsets.all(14.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                Column(
                  children: [
                    Stack(
                      children: [
                        InkWell(
                          splashColor:
                              Colors.transparent, // removes ripple color
                          highlightColor: Colors.transparent,
                          onTap: () {
                            setState(() {
                              istick2 = false;
                              istick1 = true;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: AppColors.lighterGrey,
                                width: 2,
                              ),
                              shape: BoxShape.circle,
                            ),

                            child: Image.asset(
                              AppAssets.profilepic2,
                              scale: 4.9,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        if (istick1)
                          Positioned(
                            bottom: 3,
                            right: 5,
                            child: Image.asset(AppAssets.tickmark, scale: 2),
                          ),
                      ],
                    ),
                    Text('@kelsey', style: AppTextTheme.bodyBlack13),
                  ],
                ),
                SizedBox(width: 25),
                Column(
                  children: [
                    InkWell(
                      splashColor: Colors.transparent, // removes ripple color
                      highlightColor: Colors.transparent,
                      onTap: () {
                        setState(() {
                          istick2 = true;
                          istick1 = false;
                        });
                      },
                      child: Stack(
                        children: [
                          Container(
                            child: Image.asset(
                              AppAssets.forknife,
                              scale: 2.1,
                              fit: BoxFit.cover,
                            ),
                          ),
                          if (istick2)
                            Positioned(
                              bottom: 2,
                              right: 1,
                              child: Image.asset(AppAssets.tickmark, scale: 2),
                            ),
                        ],
                      ),
                    ),
                    Text('@pef', style: AppTextTheme.bodyBlack13),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
