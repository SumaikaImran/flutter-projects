import 'package:flutter/material.dart';
import 'package:phone_eats_first/src/core/services/routing_service/named_routes.dart';
import 'package:phone_eats_first/src/core/theme/app_colors.dart';
import 'package:phone_eats_first/src/core/utils/app_size.dart';

mixin AppTheme on AppSize {
  ThemeData get lightTheme => ThemeData(
    useMaterial3: true,
    textTheme: TextTheme(
      labelSmall: TextStyle(
        fontSize: labelSmall,
        color: AppColors.primaryText,
        fontWeight: FontWeight.w600,
        fontFamily: 'SFPRODISPLAYBOLD',
      ),
      bodySmall: TextStyle(
        fontSize: bodySmall,
        color: AppColors.primaryText,
        fontWeight: FontWeight.w400,
        fontFamily: 'SFPRODISPLAYBOLD',
      ),
      displaySmall: TextStyle(
        fontSize: displaySmall,
        color: AppColors.primaryText,
        fontWeight: FontWeight.w500,
        fontFamily: 'SFPRODISPLAYBOLD',
      ),
      titleSmall: TextStyle(
        fontSize: titleSmall,
        color: AppColors.primaryText,
        fontWeight: FontWeight.w400,
        fontFamily: 'SFPRODISPLAYBOLD',
      ),
      titleMedium: TextStyle(
        fontSize: titleMedium,
        color: AppColors.primaryText,
        fontWeight: FontWeight.w400,
        fontFamily: 'SFPRODISPLAYBOLD',
      ),
      bodyMedium: TextStyle(
        fontSize: bodyMedium,
        color: AppColors.primaryText,
        fontWeight: FontWeight.w600,
        fontFamily: 'SFPRODISPLAYBOLD',
      ),
      bodyLarge: TextStyle(
        fontSize: bodyLarge,
        color: AppColors.primaryText,
        fontWeight: FontWeight.w700,
        fontFamily: 'SFPRODISPLAYBOLD',
      ),
      labelMedium: TextStyle(
        fontSize: labelMedium,
        color: AppColors.primaryText,
        fontWeight: FontWeight.w500,
        fontFamily: 'SFPRODISPLAYBOLD',
      ),
      labelLarge: TextStyle(
        fontSize: labelLarge,
        color: AppColors.primaryText,
        fontWeight: FontWeight.w500,
        fontFamily: 'SFPRODISPLAYBOLD',
      ),
      displayMedium: TextStyle(
        fontSize: displayMedium,
        color: AppColors.primaryText,
        fontWeight: FontWeight.w600,
        fontFamily: 'SFPRODISPLAYBOLD',
      ),
      displayLarge: TextStyle(
        fontSize: displayLarge,
        color: AppColors.primaryText,
        fontWeight: FontWeight.w700,
        fontFamily: 'SFPRODISPLAYBOLD',
      ),
      titleLarge: TextStyle(
        fontSize: titleLarge,
        color: AppColors.primaryText,
        fontWeight: FontWeight.w600,
        fontFamily: 'SFPRODISPLAYBOLD',
      ),
      headlineSmall: TextStyle(
        fontSize: headlineSmall,
        color: AppColors.primaryText,
        fontWeight: FontWeight.w600,
        fontFamily: 'SFPRODISPLAYBOLD',
      ),
      headlineMedium: TextStyle(
        fontSize: headlineMedium,
        color: AppColors.primaryText,
        fontWeight: FontWeight.w700,
        fontFamily: 'SFPRODISPLAYBOLD',
      ),
      headlineLarge: TextStyle(
        fontSize: headlineLarge,
        color: AppColors.primaryText,
        fontWeight: FontWeight.w800,
        fontFamily: 'SFPRODISPLAYBOLD',
      ),
    ),
    drawerTheme: const DrawerThemeData(
      // backgroundColor: AppColors.drawerGreen,
    ),
    scaffoldBackgroundColor: AppColors.primaryWhite,
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      linearMinHeight: 4,
      color: AppColors.backgroundPrimary,
      // linearTrackColor: AppColors.backgroundPrimary,
      // circularTrackColor: AppColors.drawerGreen,
    ),
    // colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryGreen),
    dividerColor: AppColors.primaryText,
    appBarTheme: const AppBarTheme(backgroundColor: AppColors.primaryWhite),
  );

  ThemeData get darkTheme => ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    drawerTheme: const DrawerThemeData(
      // backgroundColor: AppColors.drawerGreen,
    ),
    appBarTheme: const AppBarTheme(
      //  backgroundColor: AppColors.primaryText,
      color: AppColors.primaryText,
    ),
    scaffoldBackgroundColor: AppColors.primaryText,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.backgroundPrimary,
    ),
    textTheme: TextTheme(
      labelSmall: TextStyle(
        fontSize: labelSmall,
        color: AppColors.primaryWhite,
        fontWeight: FontWeight.w600,
        fontFamily: 'SFPRODISPLAYBOLD',
      ),
      bodySmall: TextStyle(
        fontSize: bodySmall,
        color: AppColors.primaryWhite,
        fontWeight: FontWeight.w400,
        fontFamily: 'SFPRODISPLAYBOLD',
      ),
      displaySmall: TextStyle(
        fontSize: displaySmall,
        color: AppColors.primaryWhite,
        fontWeight: FontWeight.w500,
        fontFamily: 'SFPRODISPLAYBOLD',
      ),
      titleSmall: TextStyle(
        fontSize: titleSmall,
        color: AppColors.primaryWhite,
        fontWeight: FontWeight.w400,
        fontFamily: 'SFPRODISPLAYBOLD',
      ),
      titleMedium: TextStyle(
        fontSize: titleMedium,
        color: AppColors.primaryWhite,
        fontWeight: FontWeight.w400,
        fontFamily: 'SFPRODISPLAYBOLD',
      ),
      bodyMedium: TextStyle(
        fontSize: bodyMedium,
        color: AppColors.primaryWhite,
        fontWeight: FontWeight.w600,
        fontFamily: 'SFPRODISPLAYBOLD',
      ),
      bodyLarge: TextStyle(
        fontSize: bodyLarge,
        color: AppColors.primaryWhite,
        fontWeight: FontWeight.w700,
        fontFamily: 'SFPRODISPLAYBOLD',
      ),
      labelMedium: TextStyle(
        fontSize: labelMedium,
        color: AppColors.primaryWhite,
        fontWeight: FontWeight.w600,
        fontFamily: 'SFPRODISPLAYBOLD',
      ),
      labelLarge: TextStyle(
        fontSize: labelLarge,
        color: AppColors.primaryWhite,
        fontWeight: FontWeight.w600,
        fontFamily: 'SFPRODISPLAYBOLD',
      ),
      displayMedium: TextStyle(
        fontSize: displayMedium,
        color: AppColors.primaryWhite,
        fontWeight: FontWeight.w600,
        fontFamily: 'SFPRODISPLAYBOLD',
      ),
      displayLarge: TextStyle(
        fontSize: displayLarge,
        color: AppColors.primaryWhite,
        fontWeight: FontWeight.w700,
        fontFamily: 'SFPRODISPLAYBOLD',
      ),
      titleLarge: TextStyle(
        fontSize: titleLarge,
        color: AppColors.primaryWhite,
        fontWeight: FontWeight.w600,
        fontFamily: 'SFPRODISPLAYBOLD',
      ),
      headlineSmall: TextStyle(
        fontSize: headlineSmall,
        color: AppColors.primaryWhite,
        fontWeight: FontWeight.w600,
      ),
      headlineMedium: TextStyle(
        fontSize: headlineMedium,
        color: AppColors.primaryWhite,
        fontWeight: FontWeight.w700,
      ),
      headlineLarge: TextStyle(
        fontSize: headlineLarge,
        color: AppColors.primaryWhite,
        fontWeight: FontWeight.w800,
      ),
    ),
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      // color: AppColors.primaryGreen,
      // linearTrackColor: AppColors.secondaryGold,
      // circularTrackColor: AppColors.secondaryGold,
    ),
    iconTheme: const IconThemeData(color: AppColors.iconColor),
    dividerColor: AppColors.dividerColor,
  );
}

ThemeData get theme => Theme.of(AppRouterGo.context);
