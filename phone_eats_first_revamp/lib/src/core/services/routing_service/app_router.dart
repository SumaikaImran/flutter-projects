import 'package:flutter/material.dart';
import 'package:phone_eats_first/src/core/services/routing_service/named_routes.dart';


// This is known as anonymous routing 
class AppRouter {
  static void back() {
    if (Navigator.canPop(AppRouterGo.context)) {
      Navigator.pop(AppRouterGo.context);
    }
  }

  static push(page) async {
    await Navigator.push(
      AppRouterGo.context,
      MaterialPageRoute(builder: (context) => page),
    );
  }

  static pushReplacement(page) async {
    await Navigator.pushReplacement(
      AppRouterGo.context,
      MaterialPageRoute(builder: (context) => page),
    );
  }

  static pushAndRemoveUntil(page) async {
    await Navigator.pushAndRemoveUntil(
      AppRouterGo.context,
      MaterialPageRoute(builder: (context) => page),
      (Route<dynamic> route) => false,
    );
  }
}
