import 'dart:developer';

import 'package:flutter/foundation.dart';

appPrint(message) {
  if (kDebugMode) {
    print("[PRINT] [PAKISTAN-CABLES] => $message");
  }
}

appLog(message) {
  if (kDebugMode) {
    log("[LOG] [PAKISTAN-CABLES] => $message");
  }
}
