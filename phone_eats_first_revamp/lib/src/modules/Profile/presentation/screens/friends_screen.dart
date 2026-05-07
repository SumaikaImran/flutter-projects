import 'package:flutter/material.dart';
import 'package:phone_eats_first/src/core/services/routing_service/named_routes.dart';
import 'package:phone_eats_first/src/core/theme/app_colors.dart';
import 'package:phone_eats_first/src/core/theme/theme_styles.dart';
import 'package:phone_eats_first/src/core/utils/app_assets.dart';
import 'package:phone_eats_first/src/modules/Profile/presentation/screens/resturant_menu_screen.dart';

class FriendsScreen extends StatefulWidget {
  const FriendsScreen({super.key});

  @override
  State<FriendsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<FriendsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);

    _tabController.addListener(() {
      setState(() {
        // triggers rebuild when tab changes
      });
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: AppColors.secondaryTextWhite,
        automaticallyImplyLeading: false,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () {
                    AppRouterGo.back();
                  },
                  child: Image.asset(AppAssets.BackButton, scale: 2),
                ),
                Text('Kelsey Ross', style: AppTextTheme.headingBlack15),

                // Change icon based on selected tab
                Image.asset(AppAssets.logout, scale: 2),
                // Recent tab
                // Messages tab
              ],
            ),
          ],
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(35),
          child: Column(
            children: [
              Container(height: 1, color: AppColors.lighterGrey),
              TabBar(
                controller: _tabController,
                splashFactory: NoSplash.splashFactory,
                overlayColor: WidgetStateProperty.all(Colors.transparent),
                padding: EdgeInsets.only(top: 12),
                indicatorColor: Colors.black,
                indicator: UnderlineTabIndicator(
                  borderSide: BorderSide(color: Colors.black, width: 2),
                ),
                indicatorPadding: EdgeInsets.only(top: 5),
                labelPadding: EdgeInsets.only(top: 5, bottom: 12),
                labelColor: Colors.black,
                unselectedLabelColor: Colors.black,
                tabs: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Text('600 followers')],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Text('80 following')],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [Followers(), Following()],
      ),
    );
  }
}

class Followers extends StatefulWidget {
  const Followers({super.key});

  @override
  State<Followers> createState() => _FollowersState();
}

class _FollowersState extends State<Followers> {
  final List<String> titles = [
    "@john",
    "@matt",
    "@katerina",
    "@ashley",
    "@jordan",
    "@andrew",
    "@Ross",
  ];

  // Track follow state for each index
  late List<bool> isFollowed;

  @override
  void initState() {
    super.initState();
    isFollowed = List.filled(
      titles.length,
      false,
    ); // all start as "not followed"
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SearchSection(),
          ListView.builder(
            itemCount: titles.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              final followed = isFollowed[index];
              return ListTile(
                contentPadding: const EdgeInsets.only(left: 4, bottom: 9),
                leading: CircleAvatar(
                  radius: 21,
                  backgroundImage: AssetImage(AppAssets.pro2),
                ),
                title: Text(titles[index], style: AppTextTheme.subtitle),
                trailing: GestureDetector(
                  onTap: () {
                    setState(() {
                      isFollowed[index] = !isFollowed[index]; // toggle
                    });
                  },
                  child: Container(
                    height: 33,
                    width: 90,
                    decoration: BoxDecoration(
                      color:
                          followed
                              ? AppColors
                                  .secondaryTextGrey // when unfollow
                              : AppColors.secondaryTextRed, // when follow
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        followed ? 'Unfollow' : 'Follow',
                        style: AppTextTheme.buttonText,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class Following extends StatefulWidget {
  const Following({super.key});

  @override
  State<Following> createState() => _FollowingState();
}

class _FollowingState extends State<Following> {
  final List<String> titles1 = [
    "@jordan",
    "@Ross",
    "@andrew",
    "@matt",
    "@ashley",

    "@john",
    "@katerina",
  ];

  // Track follow state for each index
  late List<bool> isFollowed;

  @override
  void initState() {
    super.initState();
    isFollowed = List.filled(
      titles1.length,
      true,
    ); // all start as "not followed"
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SearchSection(),
          ListView.builder(
            itemCount: titles1.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              final followed = isFollowed[index];
              return ListTile(
                contentPadding: const EdgeInsets.only(left: 4, bottom: 9),
                leading: CircleAvatar(
                  radius: 21,
                  backgroundImage: AssetImage(AppAssets.pro2),
                ),
                title: Text(titles1[index], style: AppTextTheme.subtitle),
                trailing: GestureDetector(
                  onTap: () {
                    setState(() {
                      isFollowed[index] = !isFollowed[index]; // toggle
                    });
                  },
                  child: Container(
                    height: 33,
                    width: 90,
                    decoration: BoxDecoration(
                      color:
                          followed
                              ? AppColors
                                  .secondaryTextGrey // when unfollow
                              : AppColors.secondaryTextRed, // when follow
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        followed ? 'Unfollow' : 'Follow',
                        style: AppTextTheme.buttonText,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
