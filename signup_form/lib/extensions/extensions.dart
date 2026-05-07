import 'package:flutter/material.dart';

extension StringUtils on String {
  bool isEmail() {
    return RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    ).hasMatch(this);
  }

  bool isNumeric() {
    return RegExp(r'^[0-9]+$').hasMatch(this);
  }

  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1)}";
  }

  String toUpper() {
    return "${this[0].toUpperCase()}${this[1].toUpperCase()}";
  }

  bool isUpper() {
    return this == this.toUpperCase();
  }

  bool isAscii() {
    return RegExp(r'^[\x00-\x7F]+$').hasMatch(this);
  }

  bool isValidUrl() {
    return RegExp(
      r'(http|https)://[\w-]+(\.[\w-]+)+([\w.,@?^=%&amp;:/~+#-]*[\w@?^=%&amp;/~+#-])?',
    ).hasMatch(this);
  }
}

extension ContextSnackBar on BuildContext {
  void showSnack(String message) {
    ScaffoldMessenger.of(this).showSnackBar(SnackBar(content: Text(message)));
  }

  double get screenWidth => MediaQuery.of(this).size.width;
}

extension DateTimeUtil on DateTime {
  int age() {
    DateTime current = DateTime.now();
    int age = current.year - this.year;
    if (current.month < this.month ||
        (current.month == this.month && current.day < this.day)) {
      age--;
    }
    return age;
  }

  bool isToday() {
    DateTime now = DateTime.now();
    return this.year == now.year &&
        this.month == now.month &&
        this.day == now.day;
  }

  String weekdays() {
    int day = this.weekday;
    switch (day) {
      case 1:
        return 'Monday';
      case 2:
        return 'Tuesday';
      case 3:
        return 'Wednesday';
      case 4:
        return 'Thursday';
      case 5:
        return 'Friday';
      case 6:
        return 'Saturday';
      case 7:
        return 'Sunday';
      default:
        return '';
    }
  }
}
