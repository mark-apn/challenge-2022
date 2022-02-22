import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_challenge/firebase_options.dart';

class Tracker {
  static FirebaseOptions? get _options => DefaultFirebaseOptions.currentPlatform;

  static void trackEvent(String name) {
    if (_options != null) {
      FirebaseAnalytics.instance.logEvent(name: name);
    }
  }

  static Future<void> initialise() async {
    if (_options != null) {
      await Firebase.initializeApp(options: _options);
    }
  }
}
