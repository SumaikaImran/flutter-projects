import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phone_eats_first/src/core/theme/app_colors.dart';
import 'package:phone_eats_first/src/core/theme/app_theme.dart';

class AppTextTheme {
  static TextStyle? get buttonText {
    return theme.textTheme.headlineLarge?.copyWith(
      color: AppColors.secondaryTextWhite,
      fontSize: 13.sp,
      fontWeight: FontWeight.w800,
    );
  }

  static TextStyle? get buttonTextB {
    return theme.textTheme.headlineLarge?.copyWith(
      color: AppColors.black,
      fontSize: 13.sp,
      fontWeight: FontWeight.w800,
    );
  }

  static TextStyle? get headingBlack16 {
    return theme.textTheme.bodyMedium?.copyWith(
      fontSize: 16.sp,
      fontWeight: FontWeight.w600,
      color: AppColors.primaryText,
    );
  }

  static TextStyle? get headingBlack12600b {
    return theme.textTheme.bodyMedium?.copyWith(
      fontSize: 12.sp,
      fontWeight: FontWeight.w600,
      color: AppColors.primaryText,
    );
  }

  static TextStyle? get headingBlack12600 {
    return theme.textTheme.bodyMedium?.copyWith(
      fontSize: 12.sp,
      fontWeight: FontWeight.w600,
      color: AppColors.secondaryTextDarkGrey,
    );
  }

  static TextStyle? get headingGrey16 {
    return theme.textTheme.bodyMedium?.copyWith(
      fontSize: 16.sp,
      fontWeight: FontWeight.w600,
      color: AppColors.grey,
    );
  }

  static TextStyle? get bigHeading {
    return theme.textTheme.bodyMedium?.copyWith(
      fontSize: 22.sp,
      fontWeight: FontWeight.w800,
      color: AppColors.primaryText,
    );
  }

  static TextStyle? get textRed {
    return theme.textTheme.bodyMedium?.copyWith(
      fontSize: 13.sp,
      fontWeight: FontWeight.w800,
      color: AppColors.secondaryTextRed,
    );
  }

  static TextStyle? get headingBlack16800 {
    return theme.textTheme.bodyMedium?.copyWith(
      fontSize: 16.sp,
      fontWeight: FontWeight.w800,
      color: AppColors.primaryText,
    );
  }

  static TextStyle? get headingBlack15 {
    return theme.textTheme.bodyMedium?.copyWith(
      fontSize: 15.sp,
      fontWeight: FontWeight.w800,
      color: AppColors.primaryText,
    );
  }

  static TextStyle? get headingBlack12 {
    return theme.textTheme.bodyMedium?.copyWith(
      fontSize: 12.sp,
      fontWeight: FontWeight.w800,
      color: AppColors.primaryText,
    );
  }

  static TextStyle? get headingGrey12 {
    return theme.textTheme.bodyMedium?.copyWith(
      fontSize: 12.sp,
      fontWeight: FontWeight.w800,
      color: AppColors.secondaryTextGrey,
    );
  }

  static TextStyle? get headingWhite12 {
    return theme.textTheme.bodyMedium?.copyWith(
      fontSize: 12.sp,
      fontWeight: FontWeight.w800,
      color: AppColors.secondaryTextWhite,
    );
  }

  static TextStyle? get headingBlack14 {
    return theme.textTheme.bodyMedium?.copyWith(
      fontSize: 14.sp,
      fontWeight: FontWeight.w600,
      color: AppColors.black,
    );
  }

  static TextStyle? get headingWhite14 {
    return theme.textTheme.bodyMedium?.copyWith(
      fontSize: 14.sp,
      fontWeight: FontWeight.w600,
      color: AppColors.secondaryTextWhite,
    );
  }

  static TextStyle? get headingRed12 {
    return theme.textTheme.bodyMedium?.copyWith(
      fontSize: 12.sp,
      fontWeight: FontWeight.w800,
      color: AppColors.primaryPink,
    );
  }

  static TextStyle? get headingYello12 {
    return theme.textTheme.bodyMedium?.copyWith(
      fontSize: 12.sp,
      fontWeight: FontWeight.w800,
      color: AppColors.yello,
    );
  }

  static TextStyle? get headingLgreen12 {
    return theme.textTheme.bodyMedium?.copyWith(
      fontSize: 12.sp,
      fontWeight: FontWeight.w800,
      color: AppColors.lgreen,
    );
  }

  static TextStyle? get headingDgreen12 {
    return theme.textTheme.bodyMedium?.copyWith(
      fontSize: 12.sp,
      fontWeight: FontWeight.w800,
      color: AppColors.dgreen,
    );
  }

  static TextStyle? get headingWhite15 {
    return theme.textTheme.bodyMedium?.copyWith(
      fontSize: 15.sp,
      fontWeight: FontWeight.w700,
      color: AppColors.secondaryTextWhite,
    );
  }

  static TextStyle? get headingBlacke15 {
    return theme.textTheme.bodyMedium?.copyWith(
      fontSize: 15.sp,
      fontWeight: FontWeight.w700,
      color: AppColors.black,
    );
  }

  static TextStyle? get bodyBlack13 {
    return theme.textTheme.bodyMedium?.copyWith(
      fontSize: 13.sp,
      fontWeight: FontWeight.w700,
      color: AppColors.primaryText,
    );
  }

  static TextStyle? get bodyBlackMedium13 {
    return theme.textTheme.bodyMedium?.copyWith(
      fontSize: 13.sp,
      fontWeight: FontWeight.w500,
      color: AppColors.primaryText,
      fontFamily: 'SFPRODISPLAYMEDIUM',
    );
  }

  static TextStyle? get textWhiteMedium {
    return theme.textTheme.bodyMedium?.copyWith(
      fontSize: 12.sp,
      fontWeight: FontWeight.w500,
      color: AppColors.secondaryTextWhite,
      fontFamily: 'SFPRODISPLAYMEDIUM',
    );
  }

  static TextStyle? get bodyBlackMedium11 {
    return theme.textTheme.bodyMedium?.copyWith(
      fontSize: 11.sp,
      fontWeight: FontWeight.w500,
      color: AppColors.primaryText,
      fontFamily: 'SFPRODISPLAYMEDIUM',
    );
  }

  static TextStyle? get bodyBlackMedium12 {
    return theme.textTheme.bodyMedium?.copyWith(
      fontSize: 12.sp,
      fontWeight: FontWeight.w400,
      color: AppColors.primaryText,
      fontFamily: 'SFPRODISPLAYMEDIUM',
    );
  }

  static TextStyle? get bodyWhite13 {
    return theme.textTheme.bodyMedium?.copyWith(
      fontSize: 13.sp,
      fontWeight: FontWeight.w700,
      color: AppColors.secondaryTextWhite,
    );
  }

  static TextStyle? get bodyWhite13Regular {
    return theme.textTheme.bodyMedium?.copyWith(
      fontSize: 13.sp,
      fontWeight: FontWeight.w400,
      color: AppColors.secondaryTextWhite,
      fontFamily: 'SFPRODISPLAYMEDIUM',
    );
  }

  static TextStyle? get subtitle {
    return theme.textTheme.bodyMedium?.copyWith(
      fontSize: 14.sp,
      fontWeight: FontWeight.w500,
      color: AppColors.secondaryTextGrey,
      fontFamily: 'SFPRODISPLAYMEDIUM',
    );
  }

  static TextStyle? get bodyGrey13Regular {
    return theme.textTheme.bodyMedium?.copyWith(
      fontSize: 13.sp,
      fontWeight: FontWeight.w500,
      color: AppColors.lightGrey,
    );
  }

  static TextStyle? get bodyBlack13F10 {
    return theme.textTheme.bodyMedium?.copyWith(
      fontSize: 10.sp,
      fontWeight: FontWeight.w700,
      color: AppColors.primaryText,
    );
  }

  static TextStyle? get bodyGrey13F10 {
    return theme.textTheme.bodyMedium?.copyWith(
      fontSize: 10.sp,
      fontWeight: FontWeight.w700,
      color: AppColors.lightGrey,
    );
  }

  static TextStyle? get bodyWhite13F10 {
    return theme.textTheme.bodyMedium?.copyWith(
      fontSize: 10.sp,
      fontWeight: FontWeight.w700,
      color: AppColors.secondaryTextWhite,
    );
  }

  static TextStyle? get bodyBlack11 {
    return theme.textTheme.bodyMedium?.copyWith(
      fontSize: 11.sp,
      fontWeight: FontWeight.w600,
      color: AppColors.primaryText,
    );
  }

  static TextStyle? get bodyGrey11 {
    return theme.textTheme.bodyMedium?.copyWith(
      fontSize: 11.sp,
      fontWeight: FontWeight.w600,
      color: AppColors.grey,
    );
  }

  static TextStyle? get bodylightGrey11500 {
    return theme.textTheme.bodyMedium?.copyWith(
      fontSize: 11.sp,
      fontWeight: FontWeight.w500,
      color: AppColors.secondaryTextDarkGrey,
    );
  }

  static TextStyle? get bodylightGrey11 {
    return theme.textTheme.bodyMedium?.copyWith(
      fontSize: 11.sp,
      fontWeight: FontWeight.w700,
      color: AppColors.secondaryTextDarkGrey,
    );
  }

  static TextStyle? get bodylightGrey10 {
    return theme.textTheme.bodyMedium?.copyWith(
      fontSize: 11.sp,
      fontWeight: FontWeight.w400,
      color: AppColors.secondaryTextDarkGrey,
    );
  }

  static TextStyle? get textGrey13 {
    return theme.textTheme.bodyMedium?.copyWith(
      fontSize: 13.sp,
      fontWeight: FontWeight.w600,
      color: AppColors.secondaryTextGrey,
    );
  }

  static TextStyle? get textGrey14 {
    return theme.textTheme.bodyMedium?.copyWith(
      fontSize: 14.sp,
      fontWeight: FontWeight.w500,
      color: AppColors.grey.withOpacity(0.5),
    );
  }

  static TextStyle? get textBlack {
    return theme.textTheme.bodyMedium?.copyWith(
      fontSize: 13.sp,
      fontWeight: FontWeight.w500,
      color: AppColors.primaryText,
    );
  }

  static TextStyle? get textBlack34 {
    return theme.textTheme.bodyMedium?.copyWith(
      fontSize: 34.sp,
      fontWeight: FontWeight.w700,
      color: AppColors.primaryText,
    );
  }

  static TextStyle? get textBlackM {
    return theme.textTheme.bodyMedium?.copyWith(
      fontSize: 13.sp,
      fontWeight: FontWeight.w500,
      color: AppColors.primaryText,
      fontFamily: 'SFPRODISPLAYMEDIUM',
    );
  }

  static TextStyle? get textBlacki {
    return theme.textTheme.bodyMedium?.copyWith(
      fontSize: 13.sp,
      fontWeight: FontWeight.w500,
      color: AppColors.primaryText,
      fontStyle: FontStyle.italic,
    );
  }

  static TextStyle? get textDarkGrey8 {
    return theme.textTheme.bodyMedium?.copyWith(
      fontSize: 8.sp,
      fontWeight: FontWeight.w500,
      color: AppColors.secondaryTextDarkGrey,
    );
  }
  // ________________________________

  static TextStyle? get bodyMediumBlack14 {
    return theme.textTheme.bodyMedium?.copyWith(
      fontSize: 14.sp,
      fontWeight: FontWeight.w500,
      color: AppColors.primaryText,
    );
  }

  static TextStyle? get bodyMediumWhite13 {
    return theme.textTheme.bodyMedium?.copyWith(
      fontSize: 13.sp,
      fontWeight: FontWeight.w400,
      color: AppColors.primaryWhite,
    );
  }

  static TextStyle? get bodyMediumBlack13 {
    return theme.textTheme.bodyMedium?.copyWith(
      fontSize: 13.sp,
      fontWeight: FontWeight.w400,
      color: AppColors.primaryText,
      fontFamily: 'SFPRODISPLAYMEDIUM',
    );
  }

  static TextStyle? get titleSmall14 {
    return theme.textTheme.bodyMedium?.copyWith(
      fontSize: 14.sp,
      fontWeight: FontWeight.w500,
      color: AppColors.primaryText,
    );
  }

  static TextStyle? get titleSmall16 {
    return theme.textTheme.bodyMedium?.copyWith(
      fontSize: 16.sp,
      fontWeight: FontWeight.w500,
      color: AppColors.primaryText,
    );
  }

  static TextStyle? get titleSmall18 {
    return theme.textTheme.bodyMedium?.copyWith(
      fontSize: 18.sp,
      fontWeight: FontWeight.w500,
      color: AppColors.primaryText,
    );
  }

  static TextStyle? get bodyMediumGray13 {
    return theme.textTheme.bodyMedium?.copyWith(
      fontSize: 13.sp,
      fontWeight: FontWeight.w400,
      color: AppColors.primaryText,
    );
  }

  static TextStyle? get body13 {
    return theme.textTheme.bodyMedium?.copyWith(
      fontSize: 13.sp,
      fontWeight: FontWeight.w800,
      color: AppColors.primaryText,
    );
  }

  static TextStyle? get bodyNormalWhite14 {
    return theme.textTheme.bodyMedium?.copyWith(
      fontSize: 14.sp,
      fontWeight: FontWeight.w500,
      // color: AppColors.primaryGreen,
    );
  }

  static TextStyle? get bodyNormalDark14 {
    return theme.textTheme.bodyMedium?.copyWith(
      fontSize: 14.sp,
      fontWeight: FontWeight.w500,
      color: AppColors.primaryText,
    );
  }

  static TextStyle? get titleMediumBlue14 {
    return theme.textTheme.bodyMedium?.copyWith(
      fontSize: 14.sp,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle? get titleMediumWhite14 {
    return theme.textTheme.bodyMedium?.copyWith(
      fontSize: 14.sp,
      fontWeight: FontWeight.w400,
      color: AppColors.primaryWhite,
    );
  }

  static TextStyle? get titleMediumBlack14 {
    return theme.textTheme.bodyMedium?.copyWith(
      fontSize: 14.sp,
      fontWeight: FontWeight.w400,
      color: AppColors.primaryText,
    );
  }

  static TextStyle? get titleMediumBlue16 {
    return theme.textTheme.bodyMedium?.copyWith(
      fontSize: 16.sp,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle? get titleMediumWhite16 {
    return theme.textTheme.bodyMedium?.copyWith(
      fontSize: 16.sp,
      fontWeight: FontWeight.w600,
      color: AppColors.primaryWhite,
    );
  }

  static TextStyle? get titleMediumBlack16 {
    return theme.textTheme.bodyMedium?.copyWith(
      fontSize: 16.sp,
      fontWeight: FontWeight.w600,
      color: AppColors.primaryText,
    );
  }

  static TextStyle? get bodyNormalDark16 {
    return theme.textTheme.bodyMedium?.copyWith(
      fontSize: 16.sp,
      fontWeight: FontWeight.w500,
      color: AppColors.primaryText,
    );
  }

  static TextStyle? get titleMediumBlue18 {
    return theme.textTheme.bodyMedium?.copyWith(
      fontSize: 18.sp,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle? get titleMediumWhite18 {
    return theme.textTheme.bodyMedium?.copyWith(
      fontSize: 18.sp,
      fontWeight: FontWeight.w600,
      color: AppColors.primaryWhite,
    );
  }

  static TextStyle? get titleMediumBlack18 {
    return theme.textTheme.bodyMedium?.copyWith(
      fontSize: 18.sp,
      fontWeight: FontWeight.w600,
      color: AppColors.primaryText,
    );
  }

  static TextStyle? get bodyNormalDark18 {
    return theme.textTheme.bodyMedium?.copyWith(
      fontSize: 18.sp,
      fontWeight: FontWeight.w500,
      color: AppColors.primaryText,
    );
  }

  static TextStyle? get bodyLabelBlack {
    return theme.textTheme.bodyMedium?.copyWith(
      fontSize: 13.sp,
      fontWeight: FontWeight.w500,
      // color: AppColors.secondaryText,
    );
  }

  static TextStyle? get bodyLabelGrey {
    return theme.textTheme.bodyMedium?.copyWith(
      fontSize: 13.sp,
      fontWeight: FontWeight.w500,
      color: AppColors.primaryText,
    );
  }

  static TextStyle? get chipLabelGreen {
    return theme.textTheme.bodyMedium?.copyWith(
      fontSize: 12.sp,
      fontWeight: FontWeight.w400,
      // color: AppColors.primaryGreen,
    );
  }

  // static TextStyle? get textPrimary {
  //   return theme.textTheme.bodyMedium?.copyWith(
  //     fontSize: 14.sp,
  //     fontWeight: FontWeight.w600,
  //     color: AppColors.primaryText,
  //   );
  // }
}
