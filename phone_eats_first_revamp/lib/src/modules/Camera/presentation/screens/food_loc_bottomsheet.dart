import 'package:flutter/material.dart';
import 'package:phone_eats_first/src/core/services/routing_service/named_routes.dart';
import 'package:phone_eats_first/src/core/theme/app_colors.dart';
import 'package:phone_eats_first/src/core/theme/theme_styles.dart';
import 'package:phone_eats_first/src/core/utils/app_assets.dart';
import 'package:phone_eats_first/src/modules/Lists/presentation/screens/lists_screen.dart';

class FoodLocBottomsheet extends StatefulWidget {
  const FoodLocBottomsheet({super.key});

  @override
  State<FoodLocBottomsheet> createState() => _FoodRatingBottomsheetState();
}

class _FoodRatingBottomsheetState extends State<FoodLocBottomsheet> {
  final List<String> head = [
    "Barrio",
    "Bub City",
    "House of Blues Restaurant & Bar",
    "Zombie Taco",
    "Shake Shack",
    "Arabella",
  ];
  final List<String> text = [
    "0.1 miles · 65 W Kinzie St, Chicago, IL 60654",
    "0.2 miles · 435 N Clark St, Chicago, IL 60654",
    "0.3 miles · 329 N Dearborn St, Chicago, IL 60654",
    "0.4 miles · 530 N LaSalle Dr, Chicago, IL 60654",
    "0.5 miles · 66 E Ohio St, Chicago, IL 60611",
    "0.6 miles · 112 W Grand Ave, Chicago, IL 60654",
  ];
  final List<String> img = [
    AppAssets.p1,
    AppAssets.p2,
    AppAssets.p3,
    AppAssets.p4,
    AppAssets.p5,
    AppAssets.p6,
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 450,
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
              Text('Where did you eat?', style: AppTextTheme.headingBlack15),
              SizedBox(width: 60),
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
            padding: const EdgeInsets.only(left: 18.0, right: 18),
            child: SearchSection(),
          ),
          Expanded(
            child: ListView.separated(
              itemCount: head.length,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {
                    // Send the selected title back
                    Navigator.pop(context, head[index]);
                  },
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 0,
                  ),
                  visualDensity: VisualDensity(horizontal: -2, vertical: -3),
                  leading: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: AppColors.backgroundPrimary,
                        width: 2.0,
                      ),
                    ),
                    child: CircleAvatar(
                      // radius: 22,

                      // child: Image.asset(AppAssets.ProfilePic, scale: 2),
                      backgroundImage: AssetImage(img[index]),
                    ),
                  ),
                  title: Text(head[index], style: AppTextTheme.bodyBlack13),
                  subtitle: Row(
                    children: [
                      Image.asset(AppAssets.discovery, scale: 2.5),
                      Text(' '),
                      Text(text[index], style: AppTextTheme.headingBlack12600),
                    ],
                  ),
                );
              },
              separatorBuilder:
                  (context, index) => const Divider(
                    thickness: 1, // line thickness
                    color: AppColors.lighterGrey, // line color
                    indent: 10, // left padding
                    endIndent: 2, // right padding
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
