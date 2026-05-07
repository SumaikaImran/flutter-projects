import 'package:flutter/material.dart';
import 'package:phone_eats_first/src/components/circle_clip_widget1.dart';
import 'package:phone_eats_first/src/core/theme/app_colors.dart';
import 'package:phone_eats_first/src/core/theme/theme_styles.dart';
import 'package:phone_eats_first/src/core/utils/app_assets.dart';

class RecentNotifications extends StatelessWidget {
  const RecentNotifications({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ListTile(
            contentPadding: EdgeInsets.only(top: 12, left: 16, right: 16),
            leading: CircleAvatar(
              radius: 21,
              backgroundImage: AssetImage(AppAssets.pro2),
            ),
            title: Row(
              children: [
                Text('@rachel', style: AppTextTheme.bodyBlack13),
                Text(
                  ' liked your post · ',
                  style: AppTextTheme.bodyBlackMedium13,
                ),
                Text('2h', style: AppTextTheme.bodyGrey13Regular),
              ],
            ),
            trailing: Container(
              height: 43,
              width: 43,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.asset(AppAssets.img21, scale: 2, fit: BoxFit.cover),
            ),
          ),
          Divider(color: AppColors.lighterGrey),
          ListTile(
            contentPadding: EdgeInsets.only(top: 0, left: 16, right: 16),
            leading: CircleAvatar(
              radius: 21,
              backgroundImage: AssetImage(AppAssets.pro2),
            ),
            title: Row(
              children: [
                Text('@markus', style: AppTextTheme.bodyBlack13),
                Text(
                  ' comment on your post · ',
                  style: AppTextTheme.bodyBlackMedium13,
                ),
                Text('2h', style: AppTextTheme.bodyGrey13Regular),
              ],
            ),
            subtitle: Text('“love this spot”', style: AppTextTheme.body13),
            trailing: Container(
              height: 43,
              width: 43,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.asset(AppAssets.img21, scale: 2, fit: BoxFit.cover),
            ),
          ),
          Divider(color: AppColors.lighterGrey),

          ListTile(
            contentPadding: EdgeInsets.only(top: 0, left: 16, right: 16),
            leading: CircleAvatar(
              radius: 21,
              backgroundImage: AssetImage(AppAssets.pro2),
            ),
            title: Row(
              children: [
                Text('@taymo', style: AppTextTheme.bodyBlack13),
                Text(' followed you · ', style: AppTextTheme.bodyBlackMedium13),
                Text('6h', style: AppTextTheme.bodyGrey13Regular),
              ],
            ),

            trailing: Container(
              height: 31,
              width: 70,

              decoration: BoxDecoration(
                color: AppColors.secondaryTextRed,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Center(
                child: Text(
                  'Follow',
                  style: AppTextTheme.buttonText,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          Divider(color: AppColors.lighterGrey),

          ListTile(
            contentPadding: EdgeInsets.only(top: 0, left: 16, right: 16),
            leading: CircleAvatar(
              radius: 21,
              backgroundImage: AssetImage(AppAssets.pro2),
            ),
            title: Row(
              children: [
                Text('@rock83', style: AppTextTheme.bodyBlack13),
                Text(
                  ' saved your post · ',
                  style: AppTextTheme.bodyBlackMedium13,
                ),
                Text('1d', style: AppTextTheme.bodyGrey13Regular),
              ],
            ),
            subtitle: Text('Plate: Pizza Party', style: AppTextTheme.body13),
            trailing: ThreePartCircleTemplate(
              size: 44,
              gap: 1,
              leftChild: Image.asset(
                AppAssets.img1,
                fit: BoxFit.cover,
                height: 90,
              ),
              topRightChild: Image.asset(
                AppAssets.img2,
                fit: BoxFit.cover,
                width: 90 / 2,
              ),
              bottomRightChild: Image.asset(
                AppAssets.img3,
                fit: BoxFit.cover,
                width: 90 / 2,
              ),
            ),
          ),
          Divider(color: AppColors.lighterGrey),

          ListTile(
            contentPadding: EdgeInsets.only(top: 0, left: 16, right: 16),
            leading: CircleAvatar(
              radius: 21,
              backgroundImage: AssetImage(AppAssets.pro2),
            ),
            title: Row(
              children: [
                Text('@sweetooth', style: AppTextTheme.bodyBlack13),
                Text(
                  ' liked your post · ',
                  style: AppTextTheme.bodyBlackMedium13,
                ),
                Text('1d', style: AppTextTheme.bodyGrey13Regular),
              ],
            ),

            trailing: Container(
              height: 43,
              width: 43,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.asset(AppAssets.img21, scale: 2, fit: BoxFit.cover),
            ),
          ),
          Divider(color: AppColors.lighterGrey),

          ListTile(
            contentPadding: EdgeInsets.only(top: 0, left: 16, right: 16),
            leading: CircleAvatar(
              radius: 21,
              backgroundImage: AssetImage(AppAssets.pro2),
            ),
            title: Row(
              children: [
                Text('@sushiking', style: AppTextTheme.bodyBlack13),
                Text(
                  ' liked your post · ',
                  style: AppTextTheme.bodyBlackMedium13,
                ),
                Text('1d', style: AppTextTheme.bodyGrey13Regular),
              ],
            ),

            trailing: Container(
              height: 43,
              width: 43,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.asset(AppAssets.img21, scale: 2, fit: BoxFit.cover),
            ),
          ),
          Divider(color: AppColors.lighterGrey),

          ListTile(
            contentPadding: EdgeInsets.only(top: 0, left: 16, right: 16),
            leading: CircleAvatar(
              radius: 21,
              backgroundImage: AssetImage(AppAssets.pro2),
            ),
            title: Row(
              children: [
                Text('@foodieee', style: AppTextTheme.bodyBlack13),
                Text(' followed you · ', style: AppTextTheme.bodyBlackMedium13),
                Text('1d', style: AppTextTheme.bodyGrey13Regular),
              ],
            ),

            trailing: Container(
              height: 31,
              width: 70,

              decoration: BoxDecoration(
                color: AppColors.secondaryTextRed,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Center(
                child: Text(
                  'Follow',
                  style: AppTextTheme.buttonText,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          Divider(color: AppColors.lighterGrey),

          ListTile(
            contentPadding: EdgeInsets.only(top: 0, left: 16, right: 16),
            leading: CircleAvatar(
              radius: 21,
              backgroundImage: AssetImage(AppAssets.pro2),
            ),
            title: Row(
              children: [
                Text('@walladolla', style: AppTextTheme.bodyBlack13),
                Text(
                  ' saved your post · ',
                  style: AppTextTheme.bodyBlackMedium13,
                ),
                Text('1d', style: AppTextTheme.bodyGrey13Regular),
              ],
            ),
            subtitle: Text(
              'Plate: Coffee Study Spots',
              style: AppTextTheme.body13,
            ),
            trailing: ThreePartCircleTemplate(
              size: 44,
              gap: 1,
              leftChild: Image.asset(
                AppAssets.img1,
                fit: BoxFit.cover,
                height: 90,
              ),
              topRightChild: Image.asset(
                AppAssets.img2,
                fit: BoxFit.cover,
                width: 90 / 2,
              ),
              bottomRightChild: Image.asset(
                AppAssets.img3,
                fit: BoxFit.cover,
                width: 90 / 2,
              ),
            ),
          ),
          Divider(color: AppColors.lighterGrey),
          Text(
            'You’re all caught up!',
            style: AppTextTheme.bodyGrey13Regular,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 10),
          Text('🎉'),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
