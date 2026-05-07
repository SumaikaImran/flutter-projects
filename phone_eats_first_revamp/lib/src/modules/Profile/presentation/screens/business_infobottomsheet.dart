import 'package:flutter/material.dart';
import 'package:phone_eats_first/src/core/services/routing_service/named_routes.dart';
import 'package:phone_eats_first/src/core/theme/app_colors.dart';
import 'package:phone_eats_first/src/core/theme/theme_styles.dart';
import 'package:phone_eats_first/src/core/utils/app_assets.dart';

class BusinessInfobottomsheet extends StatefulWidget {
  const BusinessInfobottomsheet({super.key});

  @override
  State<BusinessInfobottomsheet> createState() => _FoodRatingBottomsheetState();
}

class _FoodRatingBottomsheetState extends State<BusinessInfobottomsheet> {
  final List<String> head = [
    "Sunday",
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday",
  ];
  final List<String> text = [
    "10AM-11:30pm",
    "4-11:30pm",
    "4-11:30pm",
    "4-11:30pm",
    "4-11:30pm",
    "4PM-2AM",
    "10AM-2AM",
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 480,
      padding: EdgeInsets.only(top: 8),
      child: Column(
        children: [
          Divider(
            indent: 155,
            endIndent: 155,
            color: AppColors.dividerColor,
            thickness: 6,
            radius: BorderRadius.circular(10),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width: 110),
              Text('Dine at Barrio', style: AppTextTheme.headingBlack15),
              SizedBox(width: 70),
              IconButton(
                iconSize: 20,
                icon: Icon(Icons.close),
                onPressed: () {
                  AppRouterGo.back();
                },
              ),
            ],
          ),
          Divider(color: AppColors.lighterGrey),
          Padding(
            padding: const EdgeInsets.only(
              top: 10,
              left: 23,
              right: 23,
              bottom: 10,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(head[0], style: AppTextTheme.bodyBlack13),
                    Text(text[0], style: AppTextTheme.bodyBlack13),
                  ],
                ),
                SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(head[1], style: AppTextTheme.bodyBlack13),
                    Text(text[1], style: AppTextTheme.bodyBlack13),
                  ],
                ),
                SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(head[2], style: AppTextTheme.bodyBlack13),
                    Text(text[2], style: AppTextTheme.bodyBlack13),
                  ],
                ),
                SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(head[3], style: AppTextTheme.bodyBlack13),
                    Text(text[3], style: AppTextTheme.bodyBlack13),
                  ],
                ),
                SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(head[4], style: AppTextTheme.bodyBlack13),
                    Text(text[4], style: AppTextTheme.bodyBlack13),
                  ],
                ),
                SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(head[5], style: AppTextTheme.textRed),
                    Text(text[5], style: AppTextTheme.textRed),
                  ],
                ),
                SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(head[6], style: AppTextTheme.bodyBlack13),
                    Text(text[6], style: AppTextTheme.bodyBlack13),
                  ],
                ),
                SizedBox(height: 4),
                Divider(color: AppColors.lighterGrey),
                SizedBox(height: 4),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 0,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Map placeholder (use GoogleMap widget or Image.network for demo)
                      Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(16),
                            ),
                            child: Image.asset(
                              AppAssets.map2,
                              fit: BoxFit.cover,
                              height: 140,
                              width: double.infinity,
                            ),
                          ),

                          // Address text
                          Positioned(
                            bottom: 0,
                            child: Container(
                              padding: EdgeInsets.all(6),
                              color: Colors.grey.withOpacity(0.75),
                              width: 310,
                              child: Text(
                                "65 W Kinzie St, Chicago, IL 60654 (0.2 miles)",
                                textAlign: TextAlign.center,
                                style: AppTextTheme.textWhiteMedium,
                              ),
                            ),
                          ),
                        ],
                      ),

                      // Button
                      SizedBox(
                        height: 48,
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.zero, // <
                            backgroundColor: AppColors.primaryPink,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                bottom: Radius.circular(16),
                              ),
                            ),
                          ),
                          onPressed: () {
                            // Open maps app
                          },
                          child: Text(
                            "Get Directions",
                            style: AppTextTheme.bodyWhite13,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
