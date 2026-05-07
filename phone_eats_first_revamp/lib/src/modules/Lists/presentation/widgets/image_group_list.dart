import 'package:flutter/material.dart';
import 'package:phone_eats_first/src/components/circle_clip_widget1.dart';
import 'package:phone_eats_first/src/core/theme/app_colors.dart';
import 'package:phone_eats_first/src/core/theme/theme_styles.dart';
import 'package:phone_eats_first/src/core/utils/app_assets.dart';

class ImageGroupList extends StatelessWidget {
  final List<List<String>> imageGroups;
  final List<String> textGroups;
  final double height;

  const ImageGroupList({
    super.key,
    required this.imageGroups,
    required this.textGroups,
    this.height = 164, // default height
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 7),
        itemCount: imageGroups.length,
        itemBuilder: (context, index) {
          final group = imageGroups[index];
          return Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Container(
              padding: const EdgeInsets.all(4),
              width: 108,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColors.lighterGrey),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Circle with overlay
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      ThreePartCircleTemplate(
                        size: 90,
                        gap: 2,
                        leftChild: Image.asset(
                          group[0],
                          fit: BoxFit.cover,
                          height: 90,
                        ),
                        topRightChild: Image.asset(
                          group[1],
                          fit: BoxFit.cover,
                          width: 90 / 2,
                        ),
                        bottomRightChild: Image.asset(
                          group[2],
                          fit: BoxFit.cover,
                          width: 90 / 2,
                        ),
                      ),
                      Positioned(
                        top: -1,
                        right: -3,
                        left: 79,
                        child: Image.asset(AppAssets.plusCircle, scale: 1.9),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    textGroups[index],
                    style: AppTextTheme.headingBlack12,
                    textAlign: TextAlign.center,
                  ),
                  Text('@username', style: AppTextTheme.bodyGrey11),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
