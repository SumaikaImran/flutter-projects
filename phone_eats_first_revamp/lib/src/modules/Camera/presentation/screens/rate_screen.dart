import 'dart:io';

import 'package:flutter/material.dart';
import 'package:phone_eats_first/src/components/ratingitem.dart';
import 'package:phone_eats_first/src/components/toggle_button1.dart';
import 'package:phone_eats_first/src/core/services/routing_service/named_routes.dart';
import 'package:phone_eats_first/src/core/theme/app_colors.dart';
import 'package:phone_eats_first/src/core/theme/theme_styles.dart';
import 'package:phone_eats_first/src/core/utils/app_assets.dart';
import 'package:phone_eats_first/src/core/utils/app_logger.dart';
import 'package:phone_eats_first/src/core/utils/app_strings.dart';
import 'package:phone_eats_first/src/modules/Camera/presentation/screens/food_loc_bottomsheet.dart';
import 'package:phone_eats_first/src/modules/Camera/presentation/screens/food_rating_bottomsheet.dart';

class RateScreen extends StatefulWidget {
  final String imagePath;
  final ColorFilter? filter;

  const RateScreen({super.key, required this.imagePath, this.filter});

  @override
  State<RateScreen> createState() => _RateScreenState();
}

class _RateScreenState extends State<RateScreen> {
  String selectedFace1 = AppAssets.face1;
  String selectedFace2 = AppAssets.face2;
  String selectedFace3 = AppAssets.face3;
  String selectedFace4 = AppAssets.face4;
  String selectedPlace = 'Barrio River North';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        automaticallyImplyLeading: false,

        backgroundColor: AppColors.black,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                InkWell(
                  onTap: () {
                    AppRouterGo.back();
                  },
                  child: Image.asset(
                    AppAssets.BackButton,
                    color: AppColors.secondaryTextWhite,
                    scale: 2,
                  ),
                ),
                Text(' '),
                Text(AppStrings.edit, style: AppTextTheme.bodyWhite13),
              ],
            ),
            Container(
              padding: EdgeInsets.only(top: 4, bottom: 4, left: 13, right: 13),
              decoration: BoxDecoration(
                color: Color.fromRGBO(255, 0, 0, 0.3),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColors.secondaryTextRed, width: 2),
              ),
              child: Text(AppStrings.post, style: AppTextTheme.headingWhite12),
            ),
          ],
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1), // height of the line
          child: Container(
            color: Color.fromRGBO(34, 34, 34, 1), // line color
            height: 1,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 14.0),
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      height: 70,
                      width: 60,
                      clipBehavior: Clip.hardEdge,
                      child: ColorFiltered(
                        colorFilter:
                            widget.filter ??
                            const ColorFilter.mode(
                              Colors.transparent,
                              BlendMode.multiply,
                            ),
                        child: Image.file(
                          File(widget.imagePath),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ), // spacing between image & text field
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(bottom: 4),
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(34, 34, 34, 1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextField(
                          maxLength: 250,
                          // inputFormatters: [LengthLimitingTextInputFormatter(20)],
                          style: AppTextTheme.bodyWhite13Regular,
                          // maxLines: 2,
                          cursorColor: AppColors.backgroundPrimary,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Color.fromRGBO(34, 34, 34, 1),
                            focusColor: Color.fromRGBO(34, 34, 34, 1),
                            hintText: 'Enter caption',
                            hintStyle: AppTextTheme.bodyGrey13Regular,
                            border: OutlineInputBorder(
                              // optional: adds border
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              InkWell(
                splashColor: Colors.transparent, // removes ripple color
                highlightColor: Colors.transparent,
                onTap: () async {
                  final result = await showModalBottomSheet<String>(
                    isScrollControlled: true,
                    backgroundColor: AppColors.secondaryTextWhite,
                    context: context,
                    builder: (_) => FoodLocBottomsheet(),
                  );

                  if (result != null) {
                    setState(() {
                      selectedPlace = result;
                    });
                  }
                },

                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color.fromRGBO(34, 34, 34, 1),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListTile(
                    title: Text(
                      selectedPlace,
                      style: AppTextTheme.headingWhite15,
                    ),
                    subtitle: Row(
                      children: [
                        Image.asset(AppAssets.yellowStar, scale: 2),
                        Text('   4.5 ', style: AppTextTheme.bodyWhite13),
                        Text(
                          '(350 reviews)',
                          style: AppTextTheme.bodyWhite13Regular,
                        ),
                      ],
                    ),
                    trailing: Image.asset(AppAssets.map, scale: 2.2),
                  ),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Chip(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(16),
                      ),
                      backgroundColor: Color.fromRGBO(34, 34, 34, 1),
                      label: Text(
                        AppStrings.funPlace,
                        style: AppTextTheme.bodyGrey13Regular,
                      ),
                      side: BorderSide.none,
                    ),
                    SizedBox(width: 6),
                    Chip(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(16),
                      ),
                      backgroundColor: Color.fromRGBO(34, 34, 34, 1),
                      label: Text(
                        AppStrings.tastyFood,
                        style: AppTextTheme.bodyGrey13Regular,
                      ),
                      side: BorderSide.none,
                    ),
                    SizedBox(width: 6),
                    Chip(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(16),
                      ),
                      backgroundColor: Color.fromRGBO(34, 34, 34, 1),
                      label: Text(
                        AppStrings.coolServer,
                        style: AppTextTheme.bodyGrey13Regular,
                      ),
                      side: BorderSide.none,
                    ),
                    SizedBox(width: 6),
                    Chip(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(16),
                      ),
                      backgroundColor: Color.fromRGBO(34, 34, 34, 1),
                      label: Text(
                        AppStrings.cleanTable,
                        style: AppTextTheme.bodyGrey13Regular,
                      ),
                      side: BorderSide.none,
                    ),
                  ],
                ),
              ),
              Divider(color: Color.fromRGBO(34, 34, 34, 1)),
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [
                    InkWell(
                      splashColor: Colors.transparent, // removes ripple color
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        // show bottom sheet and wait for selected face
                        final result = await showModalBottomSheet<String>(
                          isScrollControlled: true,
                          backgroundColor: AppColors.secondaryTextWhite,
                          context: context,
                          builder: (_) => FoodRatingBottomsheet(),
                        );

                        if (result != null) {
                          setState(() {
                            selectedFace1 = result; // update with new face
                          });
                        }
                      },

                      child: ratingItem1(
                        AppStrings.food,
                        AppAssets.ForkKnife,
                        // AppAssets.face1,
                        selectedFace1,
                      ),
                    ),
                    InkWell(
                      splashColor: Colors.transparent, // removes ripple color
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        // show bottom sheet and wait for selected face
                        final result = await showModalBottomSheet<String>(
                          isScrollControlled: true,
                          backgroundColor: AppColors.secondaryTextWhite,
                          context: context,
                          builder: (_) => FoodRatingBottomsheet(),
                        );

                        if (result != null) {
                          setState(() {
                            selectedFace2 = result; // update with new face
                          });
                        }
                      },
                      child: ratingItem1(
                        AppStrings.service,
                        AppAssets.mpr,
                        selectedFace2,
                      ),
                    ),
                    InkWell(
                      splashColor: Colors.transparent, // removes ripple color
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        // show bottom sheet and wait for selected face
                        final result = await showModalBottomSheet<String>(
                          isScrollControlled: true,
                          backgroundColor: AppColors.secondaryTextWhite,
                          context: context,
                          builder: (_) => FoodRatingBottomsheet(),
                        );

                        if (result != null) {
                          setState(() {
                            selectedFace3 = result; // update with new face
                          });
                        }
                      },
                      child: ratingItem1(
                        AppStrings.vibes,
                        AppAssets.SpaceStars,
                        // AppAssets.face3,
                        selectedFace3,
                      ),
                    ),
                    InkWell(
                      splashColor: Colors.transparent, // removes ripple color
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        // show bottom sheet and wait for selected face
                        final result = await showModalBottomSheet<String>(
                          isScrollControlled: true,
                          backgroundColor: AppColors.secondaryTextWhite,
                          context: context,
                          builder: (_) => FoodRatingBottomsheet(),
                        );

                        if (result != null) {
                          setState(() {
                            selectedFace4 = result; // update with new face
                          });
                        }
                      },
                      child: ratingItem1(
                        AppStrings.value,
                        AppAssets.DollarAtm,
                        // AppAssets.face4,
                        selectedFace4,
                      ),
                    ),
                  ],
                ),
              ),
              Divider(color: Color.fromRGBO(34, 34, 34, 1)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset(AppAssets.inst, scale: 40),
                      Text('    '),
                      Text(
                        AppStrings.shareToStories,
                        style: AppTextTheme.headingWhite14,
                      ),
                    ],
                  ),
                  CustomToggleButton(
                    value: false,
                    onChanged: (bool value) {
                      if (value) {
                        appPrint('Permission accessed');
                      } else {
                        appPrint('Permission denied');
                      }
                    },
                    size: 0.9,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset(AppAssets.twit, scale: 1.7),
                      Text('    '),
                      Text(
                        AppStrings.tweetPhoto,
                        style: AppTextTheme.headingWhite14,
                      ),
                    ],
                  ),
                  CustomToggleButton(
                    value: false,
                    onChanged: (bool value) {
                      if (value) {
                        appPrint('Permission accessed');
                      } else {
                        appPrint('Permission denied');
                      }
                    },
                    size: 0.9,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset(AppAssets.imgAdd, scale: 2),
                      Text('    '),
                      Text(
                        AppStrings.saveToDevice,
                        style: AppTextTheme.headingWhite14,
                      ),
                    ],
                  ),
                  CustomToggleButton(
                    value: false,
                    onChanged: (bool value) {
                      if (value) {
                        appPrint('Permission accessed');
                      } else {
                        appPrint('Permission denied');
                      }
                    },
                    size: 0.9,
                  ),
                ],
              ),
              Divider(color: Color.fromRGBO(34, 34, 34, 1)),
              Padding(
                padding: const EdgeInsets.only(top: 90),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(AppAssets.cloud, scale: 2),
                    Text('   Save Draft', style: AppTextTheme.bodyWhite13),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
