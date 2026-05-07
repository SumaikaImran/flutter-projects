import 'package:flutter/material.dart';
import 'package:phone_eats_first/src/components/circle_clip_widget1.dart';
import 'package:phone_eats_first/src/core/services/routing_service/named_routes.dart';
import 'package:phone_eats_first/src/core/theme/app_colors.dart';
import 'package:phone_eats_first/src/core/theme/theme_styles.dart';
import 'package:phone_eats_first/src/core/utils/app_assets.dart';
import 'package:phone_eats_first/src/core/utils/app_strings.dart';
import 'package:phone_eats_first/src/modules/Lists/presentation/screens/create_list_bottomsheet.dart';

class SaveToListBottomsheet extends StatelessWidget {
  SaveToListBottomsheet({super.key});
  final List<List<String>> imageGroups = [
    [AppAssets.img1, AppAssets.img2, AppAssets.img3],
    [AppAssets.img11, AppAssets.img12, AppAssets.img13],
    [AppAssets.img21, AppAssets.img22, AppAssets.img23],
    [AppAssets.img31, AppAssets.img32, AppAssets.img33],
  ];
  final List<String> textGroups = [
    AppStrings.manlyMeats,
    AppStrings.greekGoodness,
    AppStrings.morningDelight,
    AppStrings.healthyTreats,
  ];

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
                InkWell(
                  onTap: () {
                    showModalBottomSheet(
                      isScrollControlled: true,
                      backgroundColor: AppColors.secondaryTextWhite,
                      context: context,
                      builder: (_) => CreateListBottomsheet(),
                    );
                  },
                  child: Image.asset(AppAssets.HeartPlus, scale: 2),
                ),

                Text(AppStrings.saveToList, style: AppTextTheme.headingBlack15),
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
          SizedBox(
            height: 160,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
              itemCount: imageGroups.length,
              itemBuilder: (context, index) {
                final group = imageGroups[index];
                return Padding(
                  padding: const EdgeInsets.only(
                    right: 19,
                    bottom: 15,
                  ), // space between circles
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ThreePartCircleTemplate(
                        size: 90,
                        gap: 2,
                        leftChild: Image.asset(
                          group[0],
                          fit: BoxFit.cover,
                          height: 90,
                        ),
                        topRightChild: Image.asset(
                          group[1],
                          fit: BoxFit.cover,
                          width: 90 / 2,
                        ),
                        bottomRightChild: Image.asset(
                          group[2],
                          fit: BoxFit.cover,
                          width: 90 / 2,
                        ),
                      ),
                      Text(
                        textGroups[index],
                        style: AppTextTheme.headingBlack12,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
