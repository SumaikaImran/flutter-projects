import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

class FirebaseConfig {
  /// Initialize Firebase with platform-specific configuration
  static Future<void> initializeFirebase() async {
    try {
      if (kIsWeb) {
        // Web configuration
        await Firebase.initializeApp(
          options: const FirebaseOptions(
            apiKey: "your-api-key",
            authDomain: "phone-eats-first.firebaseapp.com",
            projectId: "phone-eats-first",
            storageBucket: "phone-eats-first.appspot.com",
            messagingSenderId: "your-sender-id",
            appId: "your-app-id",
          ),
        );
      } else {
        // Mobile configuration (iOS/Android)
        // Firebase will use the google-services.json (Android) and GoogleService-Info.plist (iOS) files
        await Firebase.initializeApp();
      }
    } catch (e) {
      throw Exception('Failed to initialize Firebase: $e');
    }
  }

  /// Get Firebase configuration for different environments
  static Map<String, dynamic> getFirebaseConfig() {
    if (kDebugMode) {
      // Development configuration
      return {
        'projectId': 'phone-eats-first-dev',
        'storageBucket': 'phone-eats-first-dev.appspot.com',
        'authDomain': 'phone-eats-first-dev.firebaseapp.com',
      };
    } else {
      // Production configuration
      return {
        'projectId': 'phone-eats-first',
        'storageBucket': 'phone-eats-first.appspot.com',
        'authDomain': 'phone-eats-first.firebaseapp.com',
      };
    }
  }

  /// Enable Firebase Analytics (optional)
  static Future<void> enableAnalytics() async {
    try {
      // Import and initialize Firebase Analytics if needed
      // await FirebaseAnalytics.instance.setAnalyticsCollectionEnabled(true);
    } catch (e) {
      // Analytics is optional, so we don't throw here
      print('Analytics initialization failed: $e');
    }
  }

  /// Enable Firebase Crashlytics (optional)
  static Future<void> enableCrashlytics() async {
    try {
      // Import and initialize Firebase Crashlytics if needed
      // await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
    } catch (e) {
      // Crashlytics is optional, so we don't throw here
      print('Crashlytics initialization failed: $e');
    }
  }
} 