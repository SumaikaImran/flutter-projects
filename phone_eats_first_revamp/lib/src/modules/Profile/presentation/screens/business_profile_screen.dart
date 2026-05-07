import 'package:flutter/material.dart';
import 'package:phone_eats_first/src/components/ratingitem.dart';
import 'package:phone_eats_first/src/core/services/routing_service/app_routes.dart';
import 'package:phone_eats_first/src/core/services/routing_service/named_routes.dart';
import 'package:phone_eats_first/src/core/theme/app_colors.dart';
import 'package:phone_eats_first/src/core/theme/theme_styles.dart';
import 'package:phone_eats_first/src/core/utils/app_assets.dart';
import 'package:phone_eats_first/src/core/utils/app_strings.dart';
import 'package:phone_eats_first/src/modules/Profile/presentation/screens/business_infobottomsheet.dart';

class BusinessProfileScreen extends StatefulWidget {
  const BusinessProfileScreen({super.key});

  @override
  State<BusinessProfileScreen> createState() => _BusinessProfileScreenState();
}

class _BusinessProfileScreenState extends State<BusinessProfileScreen> {
  bool isFollow = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: AppColors.secondaryTextWhite,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                AppRouterGo.back();
              },
              child: Image.asset(AppAssets.BackButton, scale: 2),
            ),

            Row(
              children: [
                Text('@barrio', style: AppTextTheme.headingBlack15),
                Image.asset(AppAssets.checkmark, scale: 2),
              ],
            ),

            Image.asset(AppAssets.Dots, scale: 2),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 0.0,
                ), // give left/right space
                child: SizedBox(
                  height: 137, // increased to avoid clipping
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Stack(
                        alignment: Alignment.center,
                        clipBehavior: Clip.none, // prevent clipping of badge
                        children: [
                          // Row with left and right images
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                AppAssets.pr1,
                                height: 90,
                                width: 85,
                                fit: BoxFit.cover,
                              ),
                              SizedBox(
                                width: 40,
                              ), // leave some space for center widget
                              Image.asset(
                                AppAssets.pr2,
                                height: 90,
                                width: 85,
                                fit: BoxFit.cover,
                              ),
                            ],
                          ),

                          // Center circular profile with progress
                          Positioned(
                            left: 26, // shift towards left pic
                            child:
                            // Circular progress border
                            // Profile Image
                            ClipOval(
                              child: Container(
                                height: 119,
                                clipBehavior: Clip.hardEdge,
                                decoration: BoxDecoration(
                                  color: AppColors.secondaryTextWhite,
                                  border: Border.all(
                                    width: 3,
                                    color: AppColors.secondaryTextWhite,
                                  ),
                                ),
                                child: Image.asset(
                                  AppAssets.p1,

                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 1.9),
                      Image.asset(
                        AppAssets.pr3,
                        height: 90,
                        width: 85,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(width: 1.9),
                      Image.asset(
                        AppAssets.pr4,
                        height: 90,
                        width: 85,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(width: 1.9),
                      Image.asset(
                        AppAssets.pr5,
                        height: 90,
                        width: 85,
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18.0, right: 18, bottom: 7),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Barrio', style: AppTextTheme.bigHeading),
                  SizedBox(height: 6),
                  Text(
                    'Rustic-industrial spot for creative Mexican fare with a variety of cocktails & large tequila menu.',
                    style: AppTextTheme.bodyBlackMedium13,
                  ),
                  SizedBox(height: 6),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(AppAssets.camplus, scale: 2),
                      Text(' 20 ', style: AppTextTheme.bodyBlack13),
                      Text('Posts   ', style: AppTextTheme.bodyBlackMedium13),

                      Image.asset(AppAssets.Followers, scale: 2),
                      Text(' 5.5k ', style: AppTextTheme.bodyBlack13),
                      Text('Foodies  ', style: AppTextTheme.bodyBlackMedium13),
                      Image.asset(AppAssets.starRounded, scale: 2),
                      Text(' 4.5 ', style: AppTextTheme.bodyBlack13),
                      Text('(350)', style: AppTextTheme.bodyBlackMedium13),
                    ],
                  ),
                  SizedBox(height: 6),
                  Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          splashColor:
                              Colors.transparent, // removes ripple color
                          highlightColor: Colors.transparent,
                          onTap: () {
                            setState(() {
                              isFollow = !isFollow;
                            });
                          },
                          child: Container(
                            height: 35,
                            width: 70,

                            decoration: BoxDecoration(
                              color:
                                  isFollow
                                      ? AppColors.secondaryTextRed
                                      : AppColors.lighterGrey,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text(
                                isFollow ? 'unfollow' : 'Follow',
                                style:
                                    isFollow
                                        ? AppTextTheme.buttonText
                                        : AppTextTheme.buttonTextB,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 3),
                      Expanded(
                        child: InkWell(
                          splashColor:
                              Colors.transparent, // removes ripple color
                          highlightColor: Colors.transparent,
                          onTap: () {
                            AppRouterGo.push(resturantMenuScreen);
                          },
                          child: Container(
                            height: 35,
                            width: 70,

                            decoration: BoxDecoration(
                              color: AppColors.lighterGrey,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Center(
                              child: Text(
                                'View Menu',
                                style: AppTextTheme.buttonTextB,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 3),
                      Expanded(
                        child: Container(
                          height: 35,
                          width: 70,

                          decoration: BoxDecoration(
                            color: AppColors.lighterGrey,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(
                            child: Text(
                              'Contact',
                              style: AppTextTheme.buttonTextB,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,

                      children: [
                        ratingItem(AppStrings.food, AppAssets.ForkKnife, '8'),
                        ratingItem(AppStrings.service, AppAssets.mpr, '10'),
                        ratingItem(AppStrings.vibes, AppAssets.SpaceStars, '8'),
                        ratingItem(AppStrings.value, AppAssets.DollarAtm, '9'),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 6.0),
                    child: Divider(color: AppColors.lighterGrey),
                  ),
                  ListTile(
                    onTap: () {
                      splashColor:
                      Colors.transparent; // removes ripple color
                      highlightColor:
                      Colors.transparent;

                      showModalBottomSheet<String>(
                        isScrollControlled: true,
                        backgroundColor: AppColors.secondaryTextWhite,
                        context: context,
                        builder: (_) => BusinessInfobottomsheet(),
                      );
                    },
                    visualDensity: VisualDensity(horizontal: 4, vertical: 0),
                    contentPadding: EdgeInsets.only(
                      top: 0,
                      bottom: 0,
                      left: 0,
                      right: 10,
                    ),
                    leading: Image.asset(AppAssets.map, scale: 2.2),
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset(AppAssets.b1, scale: 2),
                            Text(
                              ' 0.2 miles',
                              style: AppTextTheme.headingBlack12600b,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Image.asset(AppAssets.b2, scale: 2),
                            Text(
                              ' Not Too Busy         ',
                              style: AppTextTheme.headingBlack12600b,
                            ),
                          ],
                        ),
                      ],
                    ),
                    subtitle: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset(AppAssets.b3, scale: 2),
                            Text(
                              ' Average',
                              style: AppTextTheme.headingBlack12600b,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Image.asset(AppAssets.b4, scale: 2),
                            Text(
                              ' Open Now - 11pm',
                              style: AppTextTheme.headingBlack12600b,
                            ),
                          ],
                        ),
                      ],
                    ),
                    trailing: Image.asset(AppAssets.b5, scale: 2),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 6.0),
                    child: Divider(color: AppColors.lighterGrey),
                  ),
                  SizedBox(
                    height: 315, // adjust as needed
                    width: 320,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(
                        16,
                      ), // rounded corners
                      child: GridView.count(
                        crossAxisCount: 3, // 3 columns
                        crossAxisSpacing: 2,
                        mainAxisSpacing: 2,
                        physics:
                            NeverScrollableScrollPhysics(), // disable scroll
                        children: [
                          Image.asset(AppAssets.pr1, fit: BoxFit.cover),
                          Image.asset(AppAssets.pr2, fit: BoxFit.cover),
                          Image.asset(AppAssets.pr3, fit: BoxFit.cover),
                          Image.asset(AppAssets.pr4, fit: BoxFit.cover),
                          Image.asset(AppAssets.pr5, fit: BoxFit.cover),
                          Image.asset(AppAssets.pr1, fit: BoxFit.cover),
                          Image.asset(AppAssets.pr2, fit: BoxFit.cover),
                          Image.asset(AppAssets.pr3, fit: BoxFit.cover),
                          Image.asset(AppAssets.pr4, fit: BoxFit.cover),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
