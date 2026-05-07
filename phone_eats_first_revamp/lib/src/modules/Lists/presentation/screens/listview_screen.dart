import 'package:flutter/material.dart';
import 'package:phone_eats_first/src/core/services/routing_service/named_routes.dart';
import 'package:phone_eats_first/src/core/theme/app_colors.dart';
import 'package:phone_eats_first/src/core/theme/theme_styles.dart';
import 'package:phone_eats_first/src/core/utils/app_assets.dart';

class ListviewScreen extends StatelessWidget {
  ListviewScreen({super.key});
  final List<String> images = [
    AppAssets.img1,
    AppAssets.img2,
    AppAssets.img3,
    AppAssets.imgF1,
    AppAssets.imgF2,
    AppAssets.imgF3,
  ];

  final List<String> texts = [
    'Green Street Smok...',
    'Mr. Chicken & Co',
    'The Roost',
    'Oatman',
    'Gourmet Burger Ki...',
    'Mayfield',
  ];
  final List<String> textsS = [
    'Posted by @kelsey',
    'Posted by @samm43',
    'Posted by @marcus3d',
    'Posted by @johntsintis',
    'Posted by @ralpheee',
    'Posted by @meateater',
  ];
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
              splashColor: Colors.transparent, // removes ripple color
              highlightColor: Colors.transparent,
              onTap: () {
                AppRouterGo.back();
              },
              child: Image.asset(AppAssets.BackButton, scale: 2),
            ),

            Text('Manly Meats', style: AppTextTheme.headingBlack15),
            Image.asset(AppAssets.Dots, scale: 2),
          ],
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1), // height of the line
          child: Container(
            color: Colors.grey.shade300, // line color
            height: 1,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            bottom: 15.0,
            left: 15,
            right: 15,
            top: 10,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: AppColors.lighterGrey),
                ),
                child: ListTile(
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 0,
                  ),
                  visualDensity: VisualDensity(horizontal: -3, vertical: -1),
                  leading: CircleAvatar(
                    radius: 22,
                    // child: Image.asset(AppAssets.ProfilePic, scale: 2),
                    backgroundImage: AssetImage(AppAssets.pro2),
                  ),
                  title: Text(
                    'Created by John Tsintis',
                    style: AppTextTheme.bodyBlack13,
                  ),
                  subtitle: Text(
                    '6 Resturants · 20 Followers ',
                    style: AppTextTheme.headingBlack12600,
                  ),
                  trailing: InkWell(
                    splashColor: Colors.transparent, // removes ripple color
                    highlightColor: Colors.transparent,

                    child: Container(
                      padding: EdgeInsets.only(
                        top: 8,
                        bottom: 8,
                        left: 12,
                        right: 12,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: AppColors.lighterGrey),
                      ),
                      child: Text(
                        'Following',
                        style: AppTextTheme.bodylightGrey11,
                      ),
                    ),
                  ),
                ),
              ),

              GridView.builder(
                padding: EdgeInsets.only(top: 12),

                shrinkWrap: true, // make GridView fit its content
                physics:
                    const NeverScrollableScrollPhysics(), // disable its own scrolling
                itemCount: images.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // 2 cards per row
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 0,
                  childAspectRatio: 0.68,
                ),
                itemBuilder: (context, index) {
                  final group = images[index];
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        height: 180,
                        width: 180,
                        clipBehavior:
                            Clip.hardEdge, // optional, if you want square
                        child: Image.asset(
                          group,
                          fit: BoxFit.cover, // fills container, may crop
                        ),
                      ),

                      // Circle with overlay star
                      // SizedBox(height: 10),
                      ListTile(
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 0,
                          vertical: 0,
                        ),
                        visualDensity: VisualDensity(
                          horizontal: -4,
                          vertical: -4,
                        ),
                        leading: CircleAvatar(
                          radius: 18,
                          // child: Image.asset(AppAssets.ProfilePic, scale: 2),
                          backgroundImage: AssetImage(AppAssets.ProfilePic),
                        ),
                        title: Text(
                          texts[index],
                          style: AppTextTheme.headingBlack12,
                        ),
                        subtitle: Text(
                          textsS[index],
                          style: AppTextTheme.bodyGrey11,
                        ),
                      ),
                    ],
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
