import 'package:flutter/material.dart';
import 'package:phone_eats_first/src/core/services/routing_service/app_routes.dart';
import 'package:phone_eats_first/src/core/services/routing_service/named_routes.dart';
import 'package:phone_eats_first/src/core/theme/app_colors.dart';
import 'package:phone_eats_first/src/core/theme/theme_styles.dart';
import 'package:phone_eats_first/src/core/utils/app_strings.dart';

class EditPhotosScreen extends StatelessWidget {
  const EditPhotosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.black,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  Icons.close,
                  color: AppColors.secondaryTextWhite,
                  size: 18,
                ),
                Text(' '),
                Text(AppStrings.cancel, style: AppTextTheme.bodyWhite13),
              ],
            ),
            InkWell(
              child: Container(
                padding: EdgeInsets.only(
                  top: 4,
                  bottom: 4,
                  left: 10,
                  right: 10,
                ),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(255, 0, 0, 0.3),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: AppColors.secondaryTextRed,
                    width: 2,
                  ),
                ),
                child: Text(
                  AppStrings.review,
                  style: AppTextTheme.headingWhite12,
                ),
              ),
              onTap: () {
                // RateScreen();
                AppRouterGo.push(rateScreen);
              },
            ),
          ],
        ),
      ),
    );
  }
}
