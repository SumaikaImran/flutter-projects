import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:phone_eats_first/src/core/services/routing_service/app_routes.dart';
import 'package:phone_eats_first/src/modules/Profile/presentation/screens/business_profile_screen.dart';
import 'package:phone_eats_first/src/modules/discover/presentation/screens/comments_screen.dart';
import 'package:phone_eats_first/src/modules/Lists/presentation/screens/create_list_bottomsheet.dart';
import 'package:phone_eats_first/src/modules/Lists/presentation/screens/discover_lists_screen.dart';
import 'package:phone_eats_first/src/modules/Profile/presentation/screens/edit_profile_screen.dart';
import 'package:phone_eats_first/src/modules/Profile/presentation/screens/friends_screen.dart';
import 'package:phone_eats_first/src/modules/Profile/presentation/screens/guidlines_screen.dart';
import 'package:phone_eats_first/src/modules/discover/presentation/screens/home_screen.dart';
import 'package:phone_eats_first/src/modules/Lists/presentation/screens/listview_screen.dart';
import 'package:phone_eats_first/src/modules/Lists/presentation/screens/new_list.dart';
import 'package:phone_eats_first/src/modules/notifications&messaging/presentation/screens/notifications_screen.dart';
import 'package:phone_eats_first/src/modules/Camera/presentation/screens/photo_previw_screen.dart';
import 'package:phone_eats_first/src/modules/Profile/presentation/screens/privacy_screen.dart';
import 'package:phone_eats_first/src/modules/Profile/presentation/screens/profile_screen.dart';
import 'package:phone_eats_first/src/modules/Camera/presentation/screens/rate_screen.dart';
import 'package:phone_eats_first/src/modules/Profile/presentation/screens/resturant_menu_screen.dart';
import 'package:phone_eats_first/src/modules/discover/presentation/screens/root_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:phone_eats_first/src/modules/Profile/presentation/screens/settings_notifications.dart';

// This is also known as declerative routing
class AppRouterGo {
  static BuildContext get context =>
      appRouter.routerDelegate.navigatorKey.currentContext!;

  static final appRouter = GoRouter(
    routes: [
      GoRoute(
        path: rootScreen,
        builder: (context, state) {
          return const RootScreen();
          //return const SubmitExpenseScreen();
        },
      ),
      GoRoute(
        path: homeScreen,
        builder: (context, state) {
          return const HomeScreen();
          //return const SubmitExpenseScreen();
        },
      ),
      GoRoute(
        path: commentsScreen,
        builder: (context, state) {
          return const CommentsScreen();
          //return const SubmitExpenseScreen();
        },
      ),
      GoRoute(
        path: profileScreen,
        builder: (context, state) {
          return const ProfileScreen();
          //return const SubmitExpenseScreen();
        },
      ),
      GoRoute(
        path: notificationScreen,
        builder: (context, state) {
          return NotificationsScreen();
          //return const SubmitExpenseScreen();
        },
      ),
      GoRoute(
        path: newListScreen,
        builder: (context, state) {
          return const NewList();
          //return const SubmitExpenseScreen();
        },
      ),
      GoRoute(
        path: discoverListScreen,
        builder: (context, state) {
          return DiscoverListsScreen();
          //return const SubmitExpenseScreen();
        },
      ),
      GoRoute(
        path: businessProfileScreen,
        builder: (context, state) {
          return BusinessProfileScreen();
          //return const SubmitExpenseScreen();
        },
      ),
      GoRoute(
        path: createListScreen,
        builder: (context, state) {
          return const CreateListBottomsheet();
          //return const SubmitExpenseScreen();
        },
      ),
      GoRoute(
        path: resturantMenuScreen,
        builder: (context, state) {
          return const ResturantMenuScreen();
          //return const SubmitExpenseScreen();
        },
      ),
      GoRoute(
        path: listViewScreen,
        builder: (context, state) {
          return ListviewScreen();
          //return const SubmitExpenseScreen();
        },
      ),
      GoRoute(
        path: friendsScreen,
        builder: (context, state) {
          return FriendsScreen();
          //return const SubmitExpenseScreen();
        },
      ),
      GoRoute(
        path: guidelinesScreen,
        builder: (context, state) {
          return GuidlinesScreen();
          //return const SubmitExpenseScreen();
        },
      ),
      GoRoute(
        path: privacyScreen,
        builder: (context, state) {
          return PrivacyScreen();
          //return const SubmitExpenseScreen();
        },
      ),
      GoRoute(
        path: editProfileScreen,
        builder: (context, state) {
          return EditProfileScreen();
          //return const SubmitExpenseScreen();
        },
      ),
      GoRoute(
        path: settingNotifications,
        builder: (context, state) {
          return SettingsNotifications();
          //return const SubmitExpenseScreen();
        },
      ),
      GoRoute(
        path: rateScreen,
        builder: (context, state) {
          final extras = state.extra as Map<String, dynamic>?;

          final imagePath = extras?['imagePath'] as String?;
          final filter = extras?['filter'] as ColorFilter?;

          return RateScreen(imagePath: imagePath!, filter: filter);
        },
      ),

      GoRoute(
        path: photopreviewScreen,
        name: photopreviewScreen,
        pageBuilder: (context, state) {
          final extra = state.extra as Map<String, dynamic>;
          return MaterialPage(
            child: PhotoPreviewScreen(
              selected: extra['selected'] as XFile,
              all: (extra['all'] as List<XFile>),
            ),
          );
        },
      ),
    ],
  );

  // static void back() {
  //   if (context.canPop()) {
  //     context.pop();
  //   }
  // }
  static void back<T extends Object?>([T? result]) {
    if (context.canPop()) {
      context.pop(result);
    }
  }

  static push(
    location, {
    Map<String, dynamic>? extra,
    Future<void> Function()? onThen,
  }) {
    context.push(location, extra: extra).then((value) {
      onThen?.call();
    });
  }

  static pushRemoveUntil(location) {
    context.go(location);
  }

  static pushReplacement(location) {
    context.replace(location);
  }
}
