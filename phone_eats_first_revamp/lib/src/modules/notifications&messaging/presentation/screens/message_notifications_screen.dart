import 'package:flutter/material.dart';
import 'package:phone_eats_first/src/core/theme/app_colors.dart';
import 'package:phone_eats_first/src/core/theme/theme_styles.dart';
import 'package:phone_eats_first/src/core/utils/app_assets.dart';
import 'package:phone_eats_first/src/modules/Lists/presentation/screens/lists_screen.dart';
import 'package:phone_eats_first/src/modules/notifications&messaging/presentation/screens/message_thread_bottomsheet.dart';

class MessageNotifications extends StatelessWidget {
  MessageNotifications({super.key});
  final List<String> head = [
    "@beccat · ",
    "@dahling · ",
    "@casey8 · ",
    "@ghosta · ",
    "@tinkso · ",
    "@racheyy · ",
    "@mameta · ",
  ];
  final List<String> subhead = ["30min", "2h", "4h", "6h", "6h", "6h", "1d"];
  final List<String> text = [
    "Yeah definitely we’re going on Tuesday at...",
    "Sent a picture",
    "What did you think of that place?",
    "Did you try the cake?",
    "No for real you should try the cake",
    "Cake is pretty cool",
    "Hot sauce on dog ya clown",
  ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(left: 2),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 18, right: 18.0),
              child: SearchSection(),
            ),
            ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: head.length,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {
                    showModalBottomSheet(
                      isScrollControlled: true,
                      backgroundColor: AppColors.secondaryTextWhite,
                      context: context,
                      builder: (_) => MessageThreadBottomsheet(),
                    );
                  },
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 19,
                    vertical: 0,
                  ),
                  visualDensity: VisualDensity(horizontal: -3, vertical: -3),
                  leading: CircleAvatar(
                    // radius: 22,

                    // child: Image.asset(AppAssets.ProfilePic, scale: 2),
                    backgroundImage: AssetImage(AppAssets.pro2),
                  ),

                  title: Row(
                    children: [
                      Text(head[index], style: AppTextTheme.bodyBlack13),
                      Text(
                        subhead[index],
                        style: AppTextTheme.bodyGrey13Regular,
                      ),
                    ],
                  ),
                  subtitle: Text(
                    text[index],
                    style: AppTextTheme.bodyBlackMedium12,
                  ),
                  trailing: Image.asset(AppAssets.arrowRight, scale: 2),
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
            Divider(color: AppColors.lighterGrey),
            Text(
              'You’re all caught up!',
              style: AppTextTheme.bodyGrey13Regular,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            Text('🎉'),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
