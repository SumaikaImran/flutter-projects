import 'package:flutter/material.dart';
import 'package:phone_eats_first/src/core/theme/app_colors.dart';
import 'package:phone_eats_first/src/core/theme/theme_styles.dart';

Widget ratingItem(String title, String assetPath, String score) {
  return Container(
    height: 82,
    padding: const EdgeInsets.only(top: 6, bottom: 6, left: 21, right: 21),
    decoration: BoxDecoration(
      color: AppColors.primaryWhite,
      borderRadius: BorderRadius.circular(12),
      border: Border.all(color: AppColors.borderC),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: AppTextTheme.bodyBlack13),
        Image.asset(assetPath, scale: 2),
        RichText(
          text: TextSpan(
            text: score,
            style: AppTextTheme.bodyBlack13,
            children: [
              TextSpan(text: '/10', style: AppTextTheme.bodyBlack13F10),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget ratingItem1(String title, String assetPath, String imgPath) {
  return Container(
    height: 82,
    padding: const EdgeInsets.only(top: 6, bottom: 6, left: 21, right: 21),
    decoration: BoxDecoration(
      color: Color.fromRGBO(34, 34, 34, 1),
      borderRadius: BorderRadius.circular(12),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: AppTextTheme.bodyWhite13),
        Image.asset(assetPath, scale: 2, color: AppColors.secondaryTextWhite),
        Image.asset(imgPath, scale: 2),
      ],
    ),
  );
}
