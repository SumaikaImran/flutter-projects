import 'package:flutter/material.dart';
import 'package:phone_eats_first/src/core/services/routing_service/named_routes.dart';
import 'package:phone_eats_first/src/core/theme/app_colors.dart';
import 'package:phone_eats_first/src/core/theme/theme_styles.dart';
import 'package:phone_eats_first/src/core/utils/app_assets.dart';
import 'package:phone_eats_first/src/core/utils/app_strings.dart';

class FoodRatingBottomsheet extends StatefulWidget {
  const FoodRatingBottomsheet({super.key});

  @override
  State<FoodRatingBottomsheet> createState() => _FoodRatingBottomsheetState();
}

class _FoodRatingBottomsheetState extends State<FoodRatingBottomsheet> {
  bool israting1 = false;
  bool israting2 = false;
  bool israting3 = false;
  bool israting4 = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 210,
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width: 140),
              Text(AppStrings.rateFood, style: AppTextTheme.headingBlack15),
              SizedBox(width: 90),
              IconButton(
                iconSize: 20,
                icon: Icon(Icons.close),
                onPressed: () {
                  AppRouterGo.back();
                },
              ),
            ],
          ),
          Divider(color: AppColors.lighterGrey),
          Padding(
            padding: const EdgeInsets.only(left: 32.0, right: 32, top: 30),
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      israting1 = !israting1;
                      Future.delayed(const Duration(milliseconds: 200), () {
                        AppRouterGo.back(AppAssets.rface);
                      });
                    });
                  },
                  splashColor: Colors.transparent, // removes ripple color
                  highlightColor: Colors.transparent,
                  child: Image.asset(
                    israting1 ? AppAssets.rface : AppAssets.gface1,
                    scale: 1.7,
                  ),
                ),
                Expanded(
                  child: Divider(color: AppColors.lighterGrey, thickness: 6),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      israting1 = !israting1;
                      israting2 = !israting2;
                      Future.delayed(const Duration(milliseconds: 200), () {
                        AppRouterGo.back(AppAssets.yface);
                      });
                    });
                  },
                  splashColor: Colors.transparent, // removes ripple color
                  highlightColor: Colors.transparent,
                  child: Image.asset(
                    israting2 ? AppAssets.yface : AppAssets.gface2,
                    scale: 1.7,
                  ),
                ),
                Expanded(
                  child: Divider(color: AppColors.lighterGrey, thickness: 6),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      israting1 = !israting1;
                      israting2 = !israting2;
                      israting3 = !israting3;
                      Future.delayed(const Duration(milliseconds: 200), () {
                        AppRouterGo.back(AppAssets.lgface);
                      });
                    });
                  },
                  splashColor: Colors.transparent, // removes ripple color
                  highlightColor: Colors.transparent,
                  child: Image.asset(
                    israting3 ? AppAssets.lgface : AppAssets.gface3,
                    scale: 1.7,
                  ),
                ),
                Expanded(
                  child: Divider(color: AppColors.lighterGrey, thickness: 6),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      israting1 = !israting1;
                      israting2 = !israting2;
                      israting3 = !israting3;
                      israting4 = !israting4;
                      Future.delayed(const Duration(milliseconds: 200), () {
                        AppRouterGo.back(AppAssets.gface);
                      });
                    });
                  },
                  splashColor: Colors.transparent, // removes ripple color
                  highlightColor: Colors.transparent,
                  child: Image.asset(
                    israting4 ? AppAssets.gface : AppAssets.gface4,
                    scale: 1.7,
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                '1',
                style:
                    israting1
                        ? AppTextTheme.headingRed12
                        : AppTextTheme.headingGrey12,
              ),
              Text(
                '2',
                style:
                    israting2
                        ? AppTextTheme.headingYello12
                        : AppTextTheme.headingGrey12,
              ),
              Text(
                '3',
                style:
                    israting3
                        ? AppTextTheme.headingLgreen12
                        : AppTextTheme.headingGrey12,
              ),
              Text(
                '4',
                style:
                    israting4
                        ? AppTextTheme.headingDgreen12
                        : AppTextTheme.headingGrey12,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
