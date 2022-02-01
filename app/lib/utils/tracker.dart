import 'package:firebase_analytics/firebase_analytics.dart';

class Tracker {
  static void trackEvent(String name) => FirebaseAnalytics.instance.logEvent(name: name);
}
