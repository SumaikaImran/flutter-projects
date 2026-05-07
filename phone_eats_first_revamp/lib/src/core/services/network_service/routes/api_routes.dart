
import 'package:flutter_dotenv/flutter_dotenv.dart';
class ApiRoutes {
  ///
  /// Serving url
  ///

  static String get baseUrl => dotenv.get('BASE_URL');

  ///
  static const String signIn = 'login';
  static const String signUp = 'signup';
  static const String logout = 'logout/';


  static Object? getAttendanceSummary;
}
