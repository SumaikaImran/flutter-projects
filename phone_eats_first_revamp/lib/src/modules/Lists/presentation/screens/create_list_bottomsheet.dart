import 'package:flutter/material.dart';
import 'package:phone_eats_first/src/components/circle_clip_widget1.dart';
import 'package:phone_eats_first/src/components/toggle_button1.dart';
import 'package:phone_eats_first/src/core/services/routing_service/app_routes.dart';
import 'package:phone_eats_first/src/core/services/routing_service/named_routes.dart';
import 'package:phone_eats_first/src/core/theme/app_colors.dart';
import 'package:phone_eats_first/src/core/theme/theme_styles.dart';
import 'package:phone_eats_first/src/core/utils/app_assets.dart';
import 'package:phone_eats_first/src/core/utils/app_logger.dart';
import 'package:phone_eats_first/src/core/utils/app_strings.dart';

class CreateListBottomsheet extends StatelessWidget {
  const CreateListBottomsheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 410,
      padding: EdgeInsets.only(top: 6),
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
            padding: const EdgeInsets.only(left: 34.0, right: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(''),

                Row(
                  children: [
                    Image.asset(AppAssets.HeartPlus, scale: 2.7),
                    Text(
                      AppStrings.newList,
                      style: AppTextTheme.headingBlack15,
                    ),
                  ],
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
            padding: const EdgeInsets.only(
              top: 12,
              bottom: 12,
              left: 19,
              right: 19,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(AppStrings.listTile, style: AppTextTheme.bigHeading),
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: ThreePartCircleTemplate(
                    size: 120,
                    gap: 2,
                    leftChild: Container(color: AppColors.backgroundPrimary),
                    topRightChild: Container(
                      color: AppColors.backgroundPrimary,
                    ),
                    bottomRightChild: Container(
                      color: AppColors.backgroundPrimary,
                    ),
                  ),
                ),
                Divider(color: AppColors.lighterGrey),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset(AppAssets.EyeCross, scale: 2),
                        Text("  ${AppStrings.privateList}"),
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
                      size: 0.82,
                    ),
                  ],
                ),
                Divider(color: AppColors.lighterGrey),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(350, 44),
                    backgroundColor: AppColors.btnGrey,
                    foregroundColor: AppColors.secondaryTextWhite,
                  ),
                  onPressed: () {
                    AppRouterGo.push(newListScreen);
                  },
                  child: Text(
                    AppStrings.createList,
                    style: AppTextTheme.buttonText,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
