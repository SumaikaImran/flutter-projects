import 'package:flutter/material.dart';
import 'package:phone_eats_first/src/core/services/routing_service/named_routes.dart';
import 'package:phone_eats_first/src/core/theme/app_colors.dart';
import 'package:phone_eats_first/src/core/theme/theme_styles.dart';
import 'package:phone_eats_first/src/core/utils/app_strings.dart';

import '../../../../core/utils/app_assets.dart';

class NewList extends StatelessWidget {
  const NewList({super.key});

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
              splashColor: Colors.transparent, // removes ripple color
              highlightColor: Colors.transparent,
              onTap: () {
                AppRouterGo.back();
              },
              child: Image.asset(AppAssets.BackButton, scale: 2),
            ),

            Text(AppStrings.listTile, style: AppTextTheme.headingBlack15),
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
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColors.lighterGrey),
              ),
              child: ListTile(
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 0,
                ),
                visualDensity: VisualDensity(horizontal: -3, vertical: -1),
                leading: CircleAvatar(
                  radius: 22,
                  // child: Image.asset(AppAssets.ProfilePic, scale: 2),
                  backgroundImage: AssetImage(AppAssets.pro2),
                ),
                title: Text(
                  'Created by John Tsintis',
                  style: AppTextTheme.bodyBlack13,
                ),
                subtitle: Text(
                  '0 Resturants · 0 Followers ',
                  style: AppTextTheme.headingBlack12600,
                ),
                trailing: InkWell(
                  splashColor: Colors.transparent, // removes ripple color
                  highlightColor: Colors.transparent,

                  child: Container(
                    padding: EdgeInsets.only(
                      top: 8,
                      bottom: 8,
                      left: 12,
                      right: 12,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: AppColors.lighterGrey),
                    ),
                    child: Text(
                      'Following',
                      style: AppTextTheme.bodylightGrey11,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: AppColors.lighterGrey,
              ),
              height: 170,
              width: 170,
              clipBehavior: Clip.hardEdge,
              child: Image.asset(AppAssets.cupCake, scale: 2), // optional, if you want square
            ),

            // Circle with overlay star
            // SizedBox(height: 10),
            ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
              visualDensity: VisualDensity(horizontal: -4, vertical: -4),
              leading: CircleAvatar(
                backgroundColor: AppColors.lighterGrey,
                radius: 18,
                child: Icon(Icons.add, color: Colors.grey),
              ),
              title: Text('No Saved Posts', style: AppTextTheme.headingBlack12),
              subtitle: Text('Tap to Add', style: AppTextTheme.bodyGrey11),
            ),
          ],
        ),
      ),
    );
  }
}
