import 'package:flutter/material.dart';
import 'package:phone_eats_first/src/core/services/routing_service/named_routes.dart';
import 'package:phone_eats_first/src/core/theme/app_colors.dart';
import 'package:phone_eats_first/src/core/theme/theme_styles.dart';
import 'package:phone_eats_first/src/core/utils/app_assets.dart';

class MessageThreadBottomsheet extends StatefulWidget {
  const MessageThreadBottomsheet({super.key});

  @override
  State<MessageThreadBottomsheet> createState() =>
      _NotificationsBottomsheet2State();
}

class _NotificationsBottomsheet2State extends State<MessageThreadBottomsheet> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: Container(
          color: AppColors.secondaryTextWhite,
          height: 720,
          padding: EdgeInsets.only(top: 8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Divider(
                indent: 155,
                endIndent: 155,
                color: AppColors.dividerColor,
                thickness: 6,
                radius: BorderRadius.circular(10),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(AppAssets.ProfilePic, scale: 2.5),
                    Text('Becca Tusk', style: AppTextTheme.headingBlack15),
                    IconButton(
                      visualDensity: VisualDensity(horizontal: -3),
                      iconSize: 20,
                      icon: Icon(Icons.close),
                      onPressed: () {
                        AppRouterGo.back();
                      },
                    ),
                  ],
                ),
              ),

              Divider(color: AppColors.lighterGrey),
              Padding(
                padding: const EdgeInsets.only(
                  left: 16.0,
                  right: 16,
                  top: 12,
                  bottom: 30,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Thu, Feb 10, ',
                          style: AppTextTheme.bodylightGrey11,
                        ),
                        Text('6:15pm', style: AppTextTheme.bodylightGrey11500),
                      ],
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Replied to your post',
                      style: AppTextTheme.bodylightGrey10,
                      textAlign: TextAlign.left,
                    ),
                    Container(
                      height: 280,
                      width: 250,
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        color: AppColors.lighterGrey,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(AppAssets.random, fit: BoxFit.cover),
                          SizedBox(height: 4),
                          Text(
                            '    OMG this looks so fun!',
                            style: AppTextTheme.bodyBlackMedium13,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Fri, Feb 11, ',
                          style: AppTextTheme.bodylightGrey11,
                        ),
                        Text('9:30am', style: AppTextTheme.bodylightGrey11500),
                      ],
                    ),
                    SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.only(left: 90, bottom: 10),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.primaryPink,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          'It was! We loved this place so much that we’re going back next week.',
                          style: AppTextTheme.bodyWhite13Regular,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 90, bottom: 10),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.lighterGrey,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          'Can I join? I would love to get some grub with your crew!',
                          style: AppTextTheme.bodyBlackMedium12,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 90),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.primaryPink,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          'Yeah definitely we’re going on Tuesday around dinner time.',
                          style: AppTextTheme.bodyWhite13Regular,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              MsgSection(),
            ],
          ),
        ),
      ),
    );
  }
}

Widget MsgSection() {
  final TextEditingController commentController = TextEditingController();
  return Container(
    decoration: const BoxDecoration(
      color: AppColors.secondaryTextWhite,
      boxShadow: [
        BoxShadow(
          color: Color.fromRGBO(0, 0, 0, 0.057), // shadow color
          spreadRadius: 0, // how wide the shadow spreads
          blurRadius: 30, // how soft the shadow is
          offset: Offset(0, -2),
        ),
      ],
    ),
    // padding: const EdgeInsets.only(bottom: 20),
    padding: const EdgeInsets.only(top: 13, bottom: 20, left: 16, right: 16),
    child: Row(
      children: [
        Container(
          height: 45,

          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.lighterGrey,
          ),
          child: Image.asset(AppAssets.camerapls, scale: 2),
        ),
        SizedBox(width: 6),
        Expanded(
          child: TextField(
            controller: commentController,
            decoration: InputDecoration(
              filled: true,
              contentPadding: EdgeInsets.only(top: 5, bottom: 5, left: 12),
              fillColor: AppColors.lighterGrey,
              label: Text('Message', style: AppTextTheme.textGrey14),

              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25.0),
                borderSide: BorderSide.none,
              ),
              suffixIcon: InkWell(
                child: Image.asset(AppAssets.ArrowUp, scale: 1.8),
                onTap: () {
                  String comment = commentController.text.trim();
                  if (comment.isNotEmpty) {
                    // TODO: Implement comment sending logic
                    commentController.clear();
                  }
                },
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
