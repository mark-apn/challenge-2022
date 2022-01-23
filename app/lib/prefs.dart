import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

const kUserId = 'userId';

class Prefs {
  static final Prefs instance = Prefs._internal();

  Prefs._internal();

  SharedPreferences? localPrefs;

  final cache = <String, String?>{};

  Future<void> init() async {
    localPrefs = await SharedPreferences.getInstance();
  }

  String? getString(String key, {bool useCache = true}) {
    final hasCache = cache.containsKey(key);

    // Secure keys are always loaded from cache (see init and set)
    if (hasCache && useCache == true) {
      return cache[key];
    } else {
      if (localPrefs == null) return null;
      String? value = localPrefs?.getString(key);

      cache[key] = value;
      return value;
    }
  }

  Future<void> set(String key, dynamic value) async {
    if (value == null) {
      cache.remove(key);
      if (localPrefs == null) return;
      await localPrefs?.remove(key);
    } else {
      cache[key] = value.toString();
      if (localPrefs == null) return;
      await localPrefs?.setString(key, value.toString());
    }
  }

  bool getBoolean(String key, {bool defaultValue = false}) {
    final value = getString(key);
    if (value == null) return defaultValue;
    final boolValue = value.toLowerCase() == 'true';
    return boolValue;
  }

  int getInt(String key, {int defaultValue = 0}) {
    final value = getString(key);
    if (value == null) return defaultValue;
    return int.parse(value);
  }

  Future<void> clear() async {
    cache.clear();
    await localPrefs?.clear();
  }
}
