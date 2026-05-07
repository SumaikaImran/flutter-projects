import 'package:flutter/material.dart';
import 'package:phone_eats_first/src/core/theme/app_colors.dart';
import 'package:phone_eats_first/src/core/utils/app_constants.dart';

Widget bottomnNavbar({
  required int pageIndex,
  required Function(int) onItemTapped,
}) {
  return Container(
    height: 65,
    decoration: const BoxDecoration(
      color: AppColors.secondaryTextWhite,
      boxShadow: [
        BoxShadow(
          color: Color.fromRGBO(0, 0, 0, 0.057), // shadow color
          spreadRadius: 0, // how wide the shadow spreads
          blurRadius: 30, // how soft the shadow is
          offset: Offset(0, -2),
        ),
      ],
    ),

    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: List.generate(iconItems.length, (index) {
        return GestureDetector(
          onTap: () => onItemTapped(index),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                iconItems[index],
                height: 24,
                width: 24,
                color:
                    pageIndex == index ? AppColors.black : AppColors.lightGrey,
              ),
              const SizedBox(height: 5),
              Text(
                textItems[index],
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                  color:
                      pageIndex == index
                          ? AppColors.black
                          : AppColors.lightGrey,
                ),
              ),
            ],
          ),
        );
      }),
    ),
  );
}
