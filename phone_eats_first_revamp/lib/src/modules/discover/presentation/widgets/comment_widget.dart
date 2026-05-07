import 'package:flutter/material.dart';
import 'package:phone_eats_first/src/core/theme/app_colors.dart';
import 'package:phone_eats_first/src/core/theme/theme_styles.dart';
import 'package:phone_eats_first/src/core/utils/app_assets.dart';

Widget CommentWidget({
  required String username,
  required String profileImageUrl,
  required String text,
  required String timeAgo,
  bool liked = false,
}) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.only(left: 19),
        child: Container(
          width: 3.5,
          height: 17,
          // color: AppColors.lighterGrey,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(2.0),
            color: AppColors.lighterGrey,
          ),
        ),
      ),
      ListTile(
        contentPadding: const EdgeInsets.symmetric(
          vertical: 0.0,
          horizontal: 0,
        ),
        visualDensity: VisualDensity(horizontal: -1, vertical: -3),
        leading: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: AppColors.backgroundPrimary, width: 3.0),
          ),
          child: CircleAvatar(
            backgroundImage: AssetImage(profileImageUrl),
            radius: 19,
          ),
        ),
        title: RichText(
          text: TextSpan(
            style: AppTextTheme.bodyBlack13,
            children: [
              TextSpan(text: '@$username '),
              TextSpan(text: text, style: AppTextTheme.bodyMediumBlack13),
            ],
          ),
        ),
        subtitle: Text(timeAgo, style: AppTextTheme.textDarkGrey8),
        trailing: StatefulBuilder(
          builder: (context, setState) {
            return InkWell(
              borderRadius: BorderRadius.circular(50),
              onTap: () {
                setState(() {
                  liked = !liked;
                });
              },
              child: Container(
                height: 25,
                width: 25,
                decoration: BoxDecoration(shape: BoxShape.circle),
                child: Image.asset(
                  AppAssets.Heart1,
                  color: liked ? AppColors.primaryPink : AppColors.grey,
                  scale: 1.7,
                ),
              ),
            );
          },
        ),
      ),
    ],
  );
}
