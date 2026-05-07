import 'package:flutter/material.dart';
import 'package:phone_eats_first/src/components/ratingitem.dart';
import 'package:phone_eats_first/src/core/services/routing_service/app_routes.dart';
import 'package:phone_eats_first/src/core/services/routing_service/named_routes.dart';
import 'package:phone_eats_first/src/core/theme/app_colors.dart';
import 'package:phone_eats_first/src/core/theme/theme_styles.dart';
import 'package:phone_eats_first/src/core/utils/app_assets.dart';
import 'package:phone_eats_first/src/core/utils/app_strings.dart';
import 'package:phone_eats_first/src/modules/Lists/presentation/screens/save_to_list_bottomsheet.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLiked = false;
  int likes = 99;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(AppAssets.Wallet, scale: 4.5),
            Image.asset(AppAssets.Logo, scale: 1.5),
            InkWell(
              splashColor: Colors.transparent, // removes ripple color
              highlightColor: Colors.transparent,
              onTap: () {
                AppRouterGo.push(notificationScreen);
              },
              child: Image.asset(AppAssets.Activity, scale: 2),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          InkWell(
            onDoubleTap: () {
              setState(() {
                isLiked = !isLiked;
                likes = isLiked ? likes + 1 : likes - 1;
              });
            },
            child: Image.asset(AppAssets.Food),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 0,
              bottom: 0,
              left: 17,
              right: 17,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  onTap: () {
                    AppRouterGo.push(businessProfileScreen);
                  },
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 0,
                    vertical: 0,
                  ),
                  visualDensity: VisualDensity(horizontal: -3, vertical: -1),
                  leading: CircleAvatar(
                    radius: 22,
                    // child: Image.asset(AppAssets.ProfilePic, scale: 2),
                    backgroundImage: AssetImage(AppAssets.ProfilePic),
                  ),
                  title: Text('Kelsey Ross', style: AppTextTheme.bodyBlack13),
                  subtitle: Text('Barrio', style: AppTextTheme.textBlackM),
                  trailing: InkWell(
                    splashColor: Colors.transparent, // removes ripple color
                    highlightColor: Colors.transparent,
                    onTap: () {
                      showModalBottomSheet(
                        isScrollControlled: true,
                        backgroundColor: AppColors.secondaryTextWhite,
                        context: context,
                        builder: (_) => SaveToListBottomsheet(),
                      );
                    },
                    child: Image.asset(AppAssets.Plus, scale: 2),
                  ),
                ),

                RichText(
                  text: TextSpan(
                    style: AppTextTheme.bodyBlack13,
                    children: <TextSpan>[
                      TextSpan(text: '@kelsey '),
                      TextSpan(
                        text:
                            'spicy margs with tacos to pair from the best spot in River North 😋',
                        style: AppTextTheme.bodyMediumBlack13,
                      ),
                    ],
                  ),
                ),
                Text('3 Hours ago', style: AppTextTheme.textDarkGrey8),
                Row(
                  children: [
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            splashColor:
                                Colors.transparent, // removes ripple color
                            highlightColor: Colors.transparent,
                            child: Image.asset(
                              isLiked ? AppAssets.RedHeart : AppAssets.Heart,
                              scale: 2,
                            ),
                            onTap: () {
                              setState(() {
                                isLiked = !isLiked;
                                likes = isLiked ? likes + 1 : likes - 1;
                              });
                            },
                          ),
                          Text('$likes', style: AppTextTheme.bodyBlack11),

                          InkWell(
                            child: Image.asset(AppAssets.Msg, scale: 2),
                            onTap: () => AppRouterGo.push(commentsScreen),
                          ),
                          Text('3', style: AppTextTheme.bodyBlack11),
                          Image.asset(AppAssets.Send, scale: 2),
                        ],
                      ),
                    ),
                    Expanded(child: Container()),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            '${AppStrings.rating}: 8/10',
                            style: AppTextTheme.textBlacki,
                          ),
                          const SizedBox(width: 10),
                          Image.asset(AppAssets.ArrowDown, scale: 2),
                        ],
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
              ],
            ),
          ),

          //
          //
        ],
      ),
    );
  }
}
