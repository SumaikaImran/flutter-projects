import 'package:flutter/material.dart';

import 'package:phone_eats_first/src/core/services/routing_service/named_routes.dart';
import 'package:phone_eats_first/src/core/theme/app_colors.dart';
import 'package:phone_eats_first/src/core/theme/theme_styles.dart';
import 'package:phone_eats_first/src/core/utils/app_assets.dart';
import 'package:phone_eats_first/src/core/utils/app_strings.dart';
import 'package:phone_eats_first/src/modules/Lists/presentation/widgets/image_group_list.dart';

class DiscoverListsScreen extends StatelessWidget {
  DiscoverListsScreen({super.key});

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

            Text('Discover Lists', style: AppTextTheme.headingBlack15),
            Image.asset(AppAssets.Dots, scale: 2),
          ],
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1), // height of the line
          child: Container(
            color: Colors.grey.shade300, // line color
            height: 1,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            children: [
              Row(
                children: [
                  Image.asset(AppAssets.friends, scale: 2),
                  Text(
                    "  ${'Followed by Friends'}",
                    style: AppTextTheme.headingBlack15,
                  ),
                ],
              ),

              ImageGroupList(imageGroups: imageGroups, textGroups: textGroups),

              Divider(color: AppColors.lighterGrey),
              SizedBox(height: 8),
              Row(
                children: [
                  Image.asset(AppAssets.city, scale: 2),
                  Text(
                    "  ${'In Your City'}",
                    style: AppTextTheme.headingBlack15,
                  ),
                ],
              ),
              ImageGroupList(imageGroups: imageGroups, textGroups: textGroups),

              Divider(color: AppColors.lighterGrey),
              SizedBox(height: 8),
              Row(
                children: [
                  Image.asset(AppAssets.arrowUp, scale: 2),
                  Text(
                    "  ${'Trending on PEF'}",
                    style: AppTextTheme.headingBlack15,
                  ),
                ],
              ),
              ImageGroupList(imageGroups: imageGroups, textGroups: textGroups),

              Divider(color: AppColors.lighterGrey),
              SizedBox(height: 8),
              Row(
                children: [
                  Image.asset(AppAssets.cake, scale: 2),
                  Text(
                    "  ${'Tasty Treats'}",
                    style: AppTextTheme.headingBlack15,
                  ),
                ],
              ),
              ImageGroupList(imageGroups: imageGroups, textGroups: textGroups),

              Divider(color: AppColors.lighterGrey),
            ],
          ),
        ),
      ),
    );
  }
}
