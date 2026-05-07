import 'package:flutter/material.dart';
import 'package:phone_eats_first/src/core/services/routing_service/named_routes.dart';
import 'package:phone_eats_first/src/core/theme/app_colors.dart';
import 'package:phone_eats_first/src/core/theme/theme_styles.dart';
import 'package:phone_eats_first/src/core/utils/app_assets.dart';

class NotificationsBottomsheet2 extends StatefulWidget {
  const NotificationsBottomsheet2({super.key});

  @override
  State<NotificationsBottomsheet2> createState() =>
      _NotificationsBottomsheet2State();
}

class _NotificationsBottomsheet2State extends State<NotificationsBottomsheet2> {
  final List<String> texts = [
    "Becca Tusk",
    "Mike Gamsa",
    "Jordan Gosh",
    "Mikka T.",
    "Lex Hoxton",
    "Gia Dessontis",
  ];

  final List<String> subtexts = [
    "@beccat",
    "@mikegamsa3",
    "@j.gosh4",
    "@sheeats",
    "@lexxx",
    "@lexxx",
  ];
  List<bool> isRedList = [];
  List<String> selectedTitles = [];

  @override
  void initState() {
    super.initState();
    isRedList = List.filled(texts.length, false); // all start false
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: Container(
        height: 510,
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
                  Row(
                    children: [
                      Text('To: ', style: AppTextTheme.headingBlack15),
                      SizedBox(
                        width: 270,
                        child: Wrap(
                          spacing: 2,
                          runSpacing: 3,
                          children:
                              selectedTitles.map((title) {
                                return Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 4,
                                  ),
                                  decoration: BoxDecoration(
                                    color: AppColors.primaryPink,
                                    borderRadius: BorderRadius.circular(18),
                                  ),
                                  child: Text(
                                    title,
                                    style: AppTextTheme.buttonText,
                                  ),
                                );
                              }).toList(),
                        ),
                      ),
                    ],
                  ),
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
            Expanded(
              child: ListView.separated(
                // shrinkWrap: true,
                itemBuilder: (context, index) {
                  return ListTile(
                    splashColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    selectedTileColor: Colors.transparent,
                    tileColor: Colors.transparent,
                    onTap: () {
                      setState(() {
                        isRedList[index] = !isRedList[index];

                        if (isRedList[index]) {
                          // add the tapped title
                          selectedTitles.add(texts[index]);
                        } else {
                          // remove the tapped title
                          selectedTitles.remove(texts[index]);
                        }
                      });
                    },
                    visualDensity: VisualDensity(vertical: -4, horizontal: -3),
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: -3,
                    ),
                    leading: CircleAvatar(
                      radius: 24,
                      backgroundImage: AssetImage(AppAssets.ProfilePic),
                    ),
                    title: Text(texts[index], style: AppTextTheme.bodyBlack13),
                    subtitle: Text(
                      subtexts[index],
                      style: AppTextTheme.bodyBlackMedium11,
                    ),
                    trailing: InkWell(
                      splashColor: Colors.transparent, // removes ripple color
                      highlightColor: Colors.transparent,
                      onTap: () {
                        setState(() {
                          isRedList[index] = !isRedList[index];

                          if (isRedList[index]) {
                            // add the tapped title
                            selectedTitles.add(texts[index]);
                          } else {
                            // remove the tapped title
                            selectedTitles.remove(texts[index]);
                          }
                        });
                      },

                      child: Container(
                        width: 21,
                        decoration: BoxDecoration(
                          color:
                              isRedList[index] ? AppColors.primaryPink : null,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: AppColors.lighterGrey,
                            width: 2,
                          ),
                        ),
                      ),
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
                itemCount: texts.length,
              ),
            ),

            MsgSection(),
          ],
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
