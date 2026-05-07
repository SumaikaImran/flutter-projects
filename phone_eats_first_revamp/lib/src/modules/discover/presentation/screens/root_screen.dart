import 'package:flutter/material.dart';
import 'package:phone_eats_first/src/components/bottom_navbar.dart';
import 'package:phone_eats_first/src/modules/Camera/presentation/screens/capture_food_screen.dart';
import 'package:phone_eats_first/src/modules/discover/presentation/screens/home_screen.dart';
import 'package:phone_eats_first/src/modules/Lists/presentation/screens/lists_screen.dart';
import 'package:phone_eats_first/src/modules/Profile/presentation/screens/profile_screen.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  late PageController _pageController;
  int pageIndex = 0;
  late List<Widget> pages;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);

    pages = [
      const HomeScreen(),
      ProfileScreen(),
      CaptureFoodScreen(
        onClose: () {
          setState(() {
            pageIndex = 0;
            _pageController.jumpToPage(0);
          });
        },
      ),
      ListsScreen(),
      ProfileScreen(),
    ];
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void onItemTapped(int index) {
    setState(() {
      pageIndex = index;
    });
    _pageController.jumpToPage(index); // 👈 instant change (no animation)
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: _pageController,
        itemCount: pages.length,
        onPageChanged: (index) {
          setState(() {
            pageIndex = index; // update active tab on swipe
          });
        },
        itemBuilder: (context, index) {
          return pages[index];
        },
      ),

      // 👇 Hide navbar on camera screen
      bottomNavigationBar:
          pageIndex == 2
              ? null
              : bottomnNavbar(pageIndex: pageIndex, onItemTapped: onItemTapped),
    );
  }
}
