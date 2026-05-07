import 'package:flutter/material.dart';
import 'package:phone_eats_first/src/core/services/routing_service/named_routes.dart';
import 'package:phone_eats_first/src/core/theme/app_colors.dart';
import 'package:phone_eats_first/src/core/theme/theme_styles.dart';
import 'package:phone_eats_first/src/core/utils/app_assets.dart';
import 'package:phone_eats_first/src/core/utils/app_strings.dart';
import 'package:phone_eats_first/src/modules/discover/presentation/widgets/comment.dart';
import 'package:phone_eats_first/src/modules/discover/presentation/widgets/comment_widget.dart';

class CommentsScreen extends StatefulWidget {
  const CommentsScreen({super.key});

  @override
  State<CommentsScreen> createState() => _CommentsScreenState();
}

class _CommentsScreenState extends State<CommentsScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    bool isKeyboardVisible = MediaQuery.of(context).viewInsets.bottom > 0;
    if (isKeyboardVisible) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      });
    }

    return Scaffold(
      resizeToAvoidBottomInset: true,
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

            Text(
              '${AppStrings.comments}(3)',
              style: AppTextTheme.headingBlack15,
            ),
            Image.asset(AppAssets.Dots, scale: 2),
          ],
        ),
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            Image.asset(AppAssets.Food),
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
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 0,
                      vertical: 0,
                    ),
                    visualDensity: VisualDensity(horizontal: -3, vertical: -1),
                    leading: CircleAvatar(
                      radius: 22,

                      backgroundImage: AssetImage(AppAssets.ProfilePic),
                    ),
                    title: Text('Kelsey Ross', style: AppTextTheme.bodyBlack13),
                    subtitle: Text('Barrio', style: AppTextTheme.textBlackM),
                    trailing: Image.asset(AppAssets.Dots, scale: 2),
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
                            Image.asset(AppAssets.Heart, scale: 2),
                            Text('99', style: AppTextTheme.bodyBlack11),
                            Image.asset(AppAssets.Msg, scale: 2),
                            Text('3', style: AppTextTheme.bodyBlack11),
                            Image.asset(AppAssets.Plus, scale: 2),
                            Text('10', style: AppTextTheme.bodyBlack11),
                            Image.asset(AppAssets.Send, scale: 2),
                            Text('1', style: AppTextTheme.bodyBlack11),
                          ],
                        ),
                      ),
                      // Expanded(child: Container()),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              '${AppStrings.rating}: 3.5/4',
                              style: AppTextTheme.textBlacki,
                            ),
                            const SizedBox(width: 10),
                            Image.asset(AppAssets.ArrowDown, scale: 2),
                          ],
                        ),
                      ),
                    ],
                  ),
                  ListView.separated(
                    padding: const EdgeInsets.only(top: 10, bottom: 80),
                    shrinkWrap: true,

                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: mockComments.length,
                    itemBuilder: (context, index) {
                      final c = mockComments[index];
                      return CommentWidget(
                        username: c.username,
                        profileImageUrl: c.profileImageUrl,
                        text: c.text,
                        timeAgo: c.timeAgo,
                        liked: c.liked,
                      );
                    },
                    separatorBuilder:
                        (BuildContext context, int index) =>
                            const SizedBox.shrink(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      bottomSheet: CommentSection(),
    );
  }
}

Widget CommentSection() {
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
    child: TextField(
      controller: commentController,
      decoration: InputDecoration(
        filled: true,
        contentPadding: EdgeInsets.all(12),
        fillColor: AppColors.lighterGrey,
        label: Text(AppStrings.comment, style: AppTextTheme.textGrey14),

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
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
  );
}
