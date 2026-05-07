import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:phone_eats_first/src/core/services/routing_service/app_routes.dart';
import 'package:phone_eats_first/src/core/services/routing_service/named_routes.dart';
import 'package:phone_eats_first/src/core/theme/app_colors.dart';
import 'package:phone_eats_first/src/core/theme/theme_styles.dart';
import 'package:phone_eats_first/src/core/utils/app_assets.dart';
import 'package:phone_eats_first/src/core/utils/app_strings.dart';

class PhotoPreviewScreen extends StatefulWidget {
  final XFile selected;
  final List<XFile> all;

  const PhotoPreviewScreen({
    super.key,
    required this.selected,
    required this.all,
  });

  @override
  State<PhotoPreviewScreen> createState() => _PhotoPreviewScreenState();
}

class _PhotoPreviewScreenState extends State<PhotoPreviewScreen> {
  late XFile selectedImg;

  @override
  void initState() {
    super.initState();
    selectedImg = widget.selected; // initialize with the tapped image
  }

  bool tagItem = true;
  bool filter = false;
  ColorFilter? _activeFilter;
  String? _selectedFilter; // to track which filter is selected

  final filters = [
    {
      'name': 'Normal',
      'filter': const ColorFilter.mode(Colors.transparent, BlendMode.multiply),
    },
    {
      'name': 'Breakfast',
      // bright yellowish tone (morning sunshine)
      'filter': const ColorFilter.mode(
        Color(0xFFFFF176), // soft bright yellow
        BlendMode.modulate,
      ),
    },
    {
      'name': 'Lunch',
      // orange zest type filter
      'filter': const ColorFilter.mode(
        Color(0xFFFFA726), // vibrant orange
        BlendMode.modulate,
      ),
    },
    {
      'name': 'Dinner',
      // darker / grayish tone (like evening vibes)
      'filter': const ColorFilter.matrix([
        0.3, 0.3, 0.3, 0, 0, // red
        0.3, 0.3, 0.3, 0, 0, // green
        0.3, 0.3, 0.3, 0, 0, // blue
        0, 0, 0, 1, 0, // alpha
      ]),
    },

    {
      'name': 'Desert',
      // pinkish sweet tone
      'filter': const ColorFilter.mode(
        Color(0xFFF48FB1), // sweet pink
        BlendMode.modulate,
      ),
    },
  ];

  @override
  Widget build(BuildContext context) {
    final int currentIndex = widget.all.indexWhere(
      (e) => e.path == selectedImg.path,
    );

    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.black,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () => AppRouterGo.back(),
              child: Row(
                children: [
                  Image.asset(
                    AppAssets.BackButton,
                    color: AppColors.secondaryTextWhite,
                    scale: 2,
                  ),
                  const SizedBox(width: 4),
                  Text(AppStrings.camera, style: AppTextTheme.bodyWhite13),
                ],
              ),
            ),
            InkWell(
              onTap: () {
                AppRouterGo.push(
                  rateScreen,
                  extra: {
                    'imagePath': selectedImg.path,
                    'filter': _activeFilter,
                  },
                );
              },

              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(255, 0, 0, 0.3),
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
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// Main preview image with corners
            Padding(
              padding: const EdgeInsets.only(top: 15, bottom: 5),
              child: Stack(
                children: [
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width,
                    height: MediaQuery.sizeOf(context).height * 0.56,
                    child: ColorFiltered(
                      colorFilter:
                          _activeFilter ??
                          const ColorFilter.mode(
                            Colors.transparent,
                            BlendMode.multiply,
                          ),
                      child: Image.file(
                        File(selectedImg.path),
                        fit: BoxFit.cover,
                        cacheWidth: 800,
                      ),
                    ),
                  ),

                  /// Show index (e.g. 3/10) at top center

                  /// Four corners
                  Positioned(
                    top: 1,
                    left: 1,
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: const BoxDecoration(
                        border: Border(
                          top: BorderSide(color: Colors.white, width: 2),
                          left: BorderSide(color: Colors.white, width: 2),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 1,
                    right: 1,
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: const BoxDecoration(
                        border: Border(
                          top: BorderSide(color: Colors.white, width: 2),
                          right: BorderSide(color: Colors.white, width: 2),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 1,
                    left: 1,
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: Colors.white, width: 2),
                          left: BorderSide(color: Colors.white, width: 2),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 1,
                    right: 1,
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: Colors.white, width: 2),
                          right: BorderSide(color: Colors.white, width: 2),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  splashColor: Colors.transparent, // removes ripple color
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    setState(() {
                      filter = false;
                      tagItem = true;
                    });
                  },
                  child: Text(
                    'TAG ITEM',
                    style:
                        tagItem
                            ? AppTextTheme.bodyWhite13F10
                            : AppTextTheme.bodyGrey13F10,
                  ),
                ),
                SizedBox(width: 22),
                InkWell(
                  splashColor: Colors.transparent, // removes ripple color
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    setState(() {
                      filter = true;
                      tagItem = false;
                    });
                  },
                  child: Text(
                    'FILTER',
                    style:
                        filter
                            ? AppTextTheme.bodyWhite13F10
                            : AppTextTheme.bodyGrey13F10,
                  ),
                ),

                SizedBox(width: 7),
              ],
            ),
            if (tagItem)
              Padding(
                padding: const EdgeInsets.only(
                  top: 10.0,
                  bottom: 10,
                  left: 16,
                  right: 16,
                ),
                child: TextField(
                  textAlign: TextAlign.center,
                  // inputFormatters: [LengthLimitingTextInputFormatter(20)],
                  style: AppTextTheme.bodyWhite13Regular,
                  maxLines: 1,
                  cursorColor: AppColors.backgroundPrimary,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(top: 35, bottom: 35),
                    filled: true,
                    fillColor: Color.fromRGBO(34, 34, 34, 1),
                    focusColor: Color.fromRGBO(34, 34, 34, 1),
                    hint: Text(
                      'What did you order?',
                      textAlign: TextAlign.center,
                      style: AppTextTheme.bodyGrey13Regular,
                    ),

                    border: OutlineInputBorder(
                      // optional: adds border
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),

            if (filter)
              SizedBox(
                height: 100,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children:
                      filters.map((filterItem) {
                        final isSelected =
                            _selectedFilter == filterItem['name'];
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              _activeFilter =
                                  filterItem['filter'] as ColorFilter?;
                              _selectedFilter = filterItem['name'] as String;
                            });
                          },
                          child: Container(
                            clipBehavior: Clip.hardEdge,
                            margin: const EdgeInsets.symmetric(
                              horizontal: 6,
                              vertical: 12,
                            ),
                            width: 70,
                            height: 70,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border:
                                  isSelected
                                      ? Border.all(
                                        color: AppColors.primaryPink,
                                        width: 2,
                                      ) // red outline if selected
                                      : null,
                            ),
                            alignment: Alignment.center,
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                ClipOval(
                                  child: ColorFiltered(
                                    colorFilter:
                                        filterItem['filter'] as ColorFilter? ??
                                        const ColorFilter.mode(
                                          Colors.transparent,
                                          BlendMode.multiply,
                                        ),
                                    child: Image.file(
                                      width: 69,
                                      height: 67,
                                      File(
                                        selectedImg.path,
                                      ), // ✅ show selected image
                                      fit: BoxFit.cover,
                                      cacheWidth: 200,
                                    ),
                                  ),
                                ),
                                Text(
                                  filterItem['name'] as String,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 11,
                                    fontWeight: FontWeight.bold,
                                    shadows: [
                                      Shadow(
                                        blurRadius: 2,
                                        color: Colors.black,
                                        offset: Offset(1, 1),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }).toList(),
                ),
              ),

            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Text(
                "${currentIndex + 1}/${widget.all.length}",
                style: AppTextTheme.textGrey14,
              ),
            ),

            /// Thumbnails
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: SizedBox(
                height: 50,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: widget.all.length,
                  itemBuilder: (context, index) {
                    final img = widget.all[index];
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedImg = img;
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.all(4),
                        width: 44,
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(
                            color:
                                img.path == selectedImg.path
                                    ? AppColors.primaryPink
                                    : Colors.transparent,
                            width: 1,
                          ),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(4),

                          child: Image.file(
                            File(img.path),
                            fit: BoxFit.cover,
                            cacheWidth: 300,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
