// ignore_for_file: use_build_context_synchronously

import 'package:flutter/cupertino.dart';
import 'package:phone_eats_first/src/core/utils/app_exports.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:phone_eats_first/src/core/services/routing_service/named_routes.dart';
import 'package:phone_eats_first/src/core/theme/app_colors.dart';
import 'package:phone_eats_first/src/core/theme/app_theme.dart';
import 'package:phone_eats_first/src/core/theme/theme_styles.dart';
import 'package:phone_eats_first/src/core/utils/app_assets.dart';
import 'package:phone_eats_first/src/core/utils/app_extensions.dart';
import 'package:phone_eats_first/src/core/utils/app_strings.dart';

class Prompts {
  static Future<void> noInternetDialog() async {
    ScaffoldMessenger.of(AppRouterGo.context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        // backgroundColor: pinchToastColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        content: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Text(
            "No Internet Connection",
            style: TextStyle(
              color: Colors.white,
              fontSize: 12.sp,
            ),
          ),
        ),
        action: SnackBarAction(
          label: 'Close',
          textColor: Colors.white,
          onPressed: () {
            ScaffoldMessenger.of(AppRouterGo.context).hideCurrentSnackBar();
          },
        ),
        duration: const Duration(seconds: 5),
      ),
    );
  }

  static void showSnackBar(String message, {Duration? duration, Color? color}) {
    ScaffoldMessenger.of(AppRouterGo.context).clearSnackBars();
    ScaffoldMessenger.of(AppRouterGo.context).showSnackBar(
      SnackBar(
        showCloseIcon: true,
        backgroundColor: color,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        content: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Text(
            message,
            style: TextStyle(
              color: Colors.white,
              fontSize: 14.sp,
            ),
          ),
        ),
        duration: duration ?? const Duration(seconds: 5),
      ),
    );
  }

  static void showMaterialBanner(String message,
      {Duration? duration, Color? color}) {
    final context = AppRouterGo.context;

    // Clear any existing MaterialBanner
    ScaffoldMessenger.of(context).clearMaterialBanners();

    // Show the MaterialBanner
    ScaffoldMessenger.of(context).showMaterialBanner(
      MaterialBanner(
        content: Text(
          message,
          style: context.bodyMediumStyle?.copyWith(
            color: Colors.white,
          ),
        ),
        backgroundColor: color ?? Colors.black54,
        actions: [
          TextButton(
            onPressed: () {
              ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
            },
            child:  Text(
              'Dismiss',
              style: context.bodyMediumStyle?.copyWith(
            color: Colors.white,
          ),
            ),
          ),
        ],
        onVisible: () {
          Future.delayed(const Duration(seconds: 5), () {
            ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
          });
        },
        elevation: 6,
        padding: const EdgeInsets.only(top: 0, left: 8),
        margin: const EdgeInsets.all(8),
      ),
    );
  }

  static void popMessenger(String message, {Duration? duration}) {
    ScaffoldMessenger.of(AppRouterGo.context).clearSnackBars();
    ScaffoldMessenger.of(AppRouterGo.context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: theme.cardColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(13),
        ),
        showCloseIcon: true,
        content: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Row(
            children: [
              Container(
                width: 30.w,
                height: 30.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.primaryText,
                  border: Border.all(
                    color: AppColors.primaryText,
                  ),
                ),
                child: SvgPicture.asset(AppAssets.iconsTick),
              ),
              10.pw,
              Text(
                message.contains('Exception:')
                    ? message.replaceAll('Exception: ', '')
                    : message,
                style: AppTextTheme.titleMediumBlack14,
              ),
            ],
          ),
        ),
        duration: duration ?? const Duration(seconds: 5),
      ),
    );
  }

  static void showPermissionSnackBar(String message, VoidCallback onTap) {
    ScaffoldMessenger.of(AppRouterGo.context).clearSnackBars();
    ScaffoldMessenger.of(AppRouterGo.context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        // backgroundColor: pinchToastColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        content: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Text(
            message,
            style: TextStyle(
              color: Colors.white,
              fontSize: 12.sp,
            ),
          ),
        ),
        action: SnackBarAction(
          label: 'GO',
          textColor: Colors.white,
          onPressed: () {
            onTap();
            ScaffoldMessenger.of(AppRouterGo.context).hideCurrentSnackBar();
          },
        ),
        duration: const Duration(seconds: 6),
      ),
    );
  }

  static showLogoutAlert(
    context, {
    required String title,
    VoidCallback? onLogout,
    content,
  }) {
    return showCupertinoDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => CupertinoAlertDialog(
        title: Padding(
          padding: const EdgeInsets.only(bottom: 12.0),
          child: Text(
            title,
            style: AppTextTheme.titleMediumBlue16?.copyWith(
              color: AppColors.primaryText,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        content: Text(
          content,
          style: AppTextTheme.titleMediumBlack14?.copyWith(
            fontWeight: FontWeight.w400,
          ),
        ),
        actions: <Widget>[
          CupertinoDialogAction(
            child: Text(
              "Cancel",
              style: AppTextTheme.titleMediumBlack16?.copyWith(
                fontSize: 17.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            onPressed: () => Navigator.of(context).pop(false),
          ),
          CupertinoDialogAction(
            onPressed: onLogout,
            child: Text(
              "Logout",
              style: AppTextTheme.titleMediumBlack16?.copyWith(
                color: AppColors.eventRed,
                fontSize: 17.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  static showDeleteAccountAlert(
    context, {
    required String title,
    required TextEditingController controller,
    VoidCallback? onSubmit,
    onTapSuffix,
    required bool isObscure,
    content,
  }) {
    return showCupertinoDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => CupertinoAlertDialog(
        title: Padding(
          padding: const EdgeInsets.only(bottom: 12.0),
          child: Text(
            title,
            style: AppTextTheme.titleMediumBlue16?.copyWith(
              color: AppColors.primaryText,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        content: Column(
          children: [
            Text(
              content,
              style: AppTextTheme.titleMediumBlack14?.copyWith(
                fontWeight: FontWeight.w400,
              ),
            ),
            10.ph,
            CupertinoTextField(
              controller: controller,
              obscureText: isObscure,
              placeholder: AppStrings.password,
              suffix: CupertinoButton(
                onPressed: onTapSuffix,
                child: SvgPicture.asset(
                  !isObscure
                      ? AppAssets.iconsVisibilityOff
                      : AppAssets.iconsVisibilityOn,
                ),
              ),
            ),
          ],
        ),
        actions: <Widget>[
          CupertinoDialogAction(
            child: Text("Cancel",
                style: AppTextTheme.titleMediumBlack16?.copyWith(
                  color: theme.primaryColor,
                  fontSize: 17.sp,
                  fontWeight: FontWeight.w500,
                )),
            onPressed: () => Navigator.of(context).pop(),
          ),
          CupertinoDialogAction(
            onPressed: onSubmit,
            child: Text(
              "Confirm",
              style: AppTextTheme.titleMediumBlack16?.copyWith(
                color: AppColors.primaryText,
                fontSize: 17.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
