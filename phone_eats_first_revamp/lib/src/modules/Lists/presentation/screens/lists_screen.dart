import 'package:flutter/material.dart';
import 'package:phone_eats_first/src/components/circle_clip_widget1.dart';
import 'package:phone_eats_first/src/core/services/routing_service/app_routes.dart';
import 'package:phone_eats_first/src/core/services/routing_service/named_routes.dart';
import 'package:phone_eats_first/src/core/theme/app_colors.dart';
import 'package:phone_eats_first/src/core/theme/theme_styles.dart';
import 'package:phone_eats_first/src/core/utils/app_assets.dart';
import 'package:phone_eats_first/src/core/utils/app_strings.dart';
import 'package:phone_eats_first/src/modules/Lists/presentation/screens/create_list_bottomsheet.dart';

class ListsScreen extends StatefulWidget {
  const ListsScreen({super.key});

  @override
  State<ListsScreen> createState() => _ListsScreenState();
}

class _ListsScreenState extends State<ListsScreen> {
  final List<List<String>> imageGroups = [
    [AppAssets.img1, AppAssets.img2, AppAssets.img3],
    [AppAssets.img11, AppAssets.img12, AppAssets.img13],
    [AppAssets.img21, AppAssets.img22, AppAssets.img23],
    [AppAssets.img31, AppAssets.img32, AppAssets.img33],
  ];

  final List<String> textGroups = [
    AppStrings.manlyMeats,
    AppStrings.greekGoodness,
    AppStrings.morningDelight,
    AppStrings.healthyTreats,
  ];
  bool isYellow = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 60,
            left: 20,
            right: 20,
            bottom: 10,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(AppStrings.lists, style: AppTextTheme.textBlack34),
                  InkWell(
                    child: Image.asset(AppAssets.HeartPlus, scale: 2),
                    onTap: () {
                      showModalBottomSheet(

                        isScrollControlled: true,
                        backgroundColor: AppColors.secondaryTextWhite,
                        context: context,
                        builder: (_) => CreateListBottomsheet(),
                      );
                    },
                  ),
                ],
              ),
              SearchSection(),
              Divider(color: AppColors.lighterGrey),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset(AppAssets.arrowUp, scale: 2),
                      Text(
                        "  ${AppStrings.suggestedLists}",
                        style: AppTextTheme.headingBlack15,
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      AppRouterGo.push(discoverListScreen);
                    },
                    child: Text(
                      AppStrings.discoverMore,
                      style: AppTextTheme.textGrey13,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 173,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 4,
                    vertical: 8,
                  ),
                  itemCount: imageGroups.length,
                  itemBuilder: (context, index) {
                    final group = imageGroups[index];
                    return Padding(
                      padding: const EdgeInsets.only(
                        right: 11,
                        bottom: 0,
                      ), // space between circles
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        width: 120,
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
                                  size: 95,
                                  gap: 2,
                                  leftChild: Image.asset(
                                    group[0],
                                    fit: BoxFit.cover,
                                    height: 95,
                                  ),
                                  topRightChild: Image.asset(
                                    group[1],
                                    fit: BoxFit.cover,
                                    width: 95 / 2,
                                  ),
                                  bottomRightChild: Image.asset(
                                    group[2],
                                    fit: BoxFit.cover,
                                    width: 95 / 2,
                                  ),
                                ),
                                Positioned(
                                  top: -5, // adjust overlap
                                  right: -9,
                                  left: 82,
                                  // adjust overlap
                                  child: Image.asset(
                                    AppAssets.plusCircle,
                                    scale: 1.9,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 8,
                            ), // spacing below the circle
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
              ),
              Divider(color: AppColors.lighterGrey),
              GridView.builder(
                padding: EdgeInsets.only(top: 8),

                shrinkWrap: true, // make GridView fit its content
                physics:
                    const NeverScrollableScrollPhysics(), // disable its own scrolling
                itemCount: imageGroups.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // 2 cards per row
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 0.8,
                ),
                itemBuilder: (context, index) {
                  final group = imageGroups[index];
                  return InkWell(
                    onTap: () {
                      if (0 == 0) {
                        AppRouterGo.push(listViewScreen);
                      }
                    },
                    child: Container(
                      // padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: AppColors.lighterGrey,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Circle with overlay star
                          Stack(
                            clipBehavior: Clip.none,
                            children: [
                              ThreePartCircleTemplate(
                                size: 120,
                                gap: 2,
                                leftChild: Image.asset(
                                  group[0],
                                  fit: BoxFit.cover,
                                  height: 120,
                                ),
                                topRightChild: Image.asset(
                                  group[1],
                                  fit: BoxFit.cover,
                                  width: 120 / 2,
                                ),
                                bottomRightChild: Image.asset(
                                  group[2],
                                  fit: BoxFit.cover,
                                  width: 120 / 2,
                                ),
                              ),
                              Positioned(
                                top: -4,
                                right: -4,

                                child: InkWell(
                                  borderRadius: BorderRadius.circular(50),
                                  child: Image.asset(
                                    isYellow
                                        ? AppAssets.star
                                        : AppAssets.yellowStar,
                                    scale: 2,
                                  ),
                                  onTap: () {
                                    setState(() {
                                      isYellow = !isYellow;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Text(
                            textGroups[index], // e.g. "Healthy Treats"
                            style: AppTextTheme.headingBlack15,
                            textAlign: TextAlign.center,
                          ),

                          Text(
                            '6 Saved Posts', // <-- fixed: removed quotes
                            style: AppTextTheme.bodyGrey11,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget SearchSection() {
  final TextEditingController searchController = TextEditingController();
  return Container(
    padding: const EdgeInsets.only(top: 13, bottom: 13),
    child: TextField(
      controller: searchController,
      decoration: InputDecoration(
        filled: true,
        contentPadding: EdgeInsets.all(9),
        fillColor: AppColors.lighterGrey,
        hint: Text(AppStrings.search, style: AppTextTheme.headingGrey16),

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
          borderSide: BorderSide.none,
        ),
        prefixIcon: InkWell(
          child: Image.asset(AppAssets.search1, scale: 1.8),
          onTap: () {
            String comment = searchController.text.trim();
            if (comment.isNotEmpty) {
              // TODO: Implement comment sending logic
              searchController.clear();
            }
          },
        ),
      ),
    ),
  );
}
