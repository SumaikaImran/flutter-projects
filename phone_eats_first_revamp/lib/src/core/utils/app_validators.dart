import 'package:flutter/material.dart';

class AppValidators {
  // static String? validateEmail(String? email) {
  //   final bool emailValid = RegExp(
  //           r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
  //       .hasMatch(email);

  //   if (email.isEmpty) {
  //     return 'Email is required';
  //   }
  //   if (!emailValid) {
  //     return 'Please enter a valid email';
  //   }
  //   return null;
  // }

  static String? validateEmail(String? value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-z\-0-9]+\.)+[a-z]{2,}))$';
    RegExp regex = RegExp(pattern.toString());

    var matches = !regex.hasMatch(value ?? "");

    if (matches) {
      return 'Invalid Email';
    }
    return null;
  }

  // static String? validatePassword(String value) {
  //   if (value.isEmpty) {
  //     return 'Password is required';
  //   }
  //   if (value.length < 6) {
  //     return 'Password must be at least 6 characters';
  //   }
  //   return null;
  // }

  // static String? validateOtp(String? value) {
  //   if (value!.length < 6) {
  //     return 'Enter OTP to continue';
  //   }

  //   return null;
  // }

  static String? validateOtp(String? value) {
    if (value == null || value.isEmpty) {
      return 'OTP cannot be empty';
    }
    if (value.length < 5) {
      return 'Please enter a valid 5-digit OTP';
    }
    return null;
  }

  static String? validatePass(String? value,[String? message ]) {
    int length = value?.length ?? 0;
    if (length <= 0) {
      return message ?? 'Please enter your password';
    } else {
      return null;
    }
  }

  static String? confirmPass(String? value, TextEditingController newPass) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    if (value != newPass.text) {
      return 'Passwords do not match';
    }
    return null;
  }

  // static String? validatePass(String? value) {
  //   // Check if value is null or empty
  //   if (value == null || value.isEmpty) {
  //     return 'Please enter your password';
  //   }

  //   // Check for length of at least 8 characters
  //   if (value.length < 8) {
  //     return 'Password must be at least 8 characters long';
  //   }

  //   // Check if the password contains at least one uppercase letter
  //   if (!RegExp(r'[A-Z]').hasMatch(value)) {
  //     return 'Password must contain at least one uppercase letter';
  //   }

  //   // Check if the password contains at least one lowercase letter
  //   if (!RegExp(r'[a-z]').hasMatch(value)) {
  //     return 'Password must contain at least one lowercase letter';
  //   }

  //   // Check if the password contains at least one number
  //   if (!RegExp(r'[0-9]').hasMatch(value)) {
  //     return 'Password must contain at least one number';
  //   }

  //   // Check if the password contains at least one special character
  //   if (!RegExp(r'[!@#\$&*~]').hasMatch(value)) {
  //      return 'Password must contain at least one special character';
  //   }

  //   // If all conditions are met, return null (no error)
  //   return null;
  // }

  // static String? validatePass(String? value) {
  //   // Check if value is null or empty
  //   if (value == null || value.isEmpty) {
  //     return 'Please enter your password';
  //   }

  //   // Define the regex pattern for password validation
  //   final RegExp passwordRegex = RegExp(
  //     r'^(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,30}$',
  //   );

  //   // Check if the password matches the regex pattern
  //   if (!passwordRegex.hasMatch(value)) {
  //     return 'Password must be 8-30 characters long, contain at least one uppercase letter, one number, and one special character';
  //   }

  //   // If all conditions are met, return null (no error)
  //   return null;
  // }

  static String? validateName(String value) {
    if (value.isEmpty) {
      return 'Please input some data';
    }
    return null;
  }

  static String? validateEmpty(String? value, String message) {
    if (value!.isEmpty) {
      return message;
    }
    return null;
  }

  static String? validatePhone(String value) {
    if (value.isEmpty) {
      return 'Phone is required';
    }
    if (value.length < 8) {
      return 'Phone must be at least 8 characters';
    }
    if (value.length > 8) {
      return 'Phone cannot be greater than 8 characters';
    }
    return null;
  }

  static bool validateTextFields(List<TextEditingController> controllers) {
    bool isValid = false;

    for (var controller in controllers) {
      if (controller.text.isEmpty) {
        isValid = true;
        break;
      }
    }

    return isValid;
  }
}
