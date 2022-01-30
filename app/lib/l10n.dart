import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart' as intl;

// ignore: avoid_classes_with_only_static_members
class L10n {
  static late AppLocalizations _instance;
  static AppLocalizations get translate => _instance;

  static String get currentLocale => _instance.localeName;

  static void init(BuildContext context) {
    _instance = AppLocalizations.of(context)!;

    intl.Intl.defaultLocale = currentLocale;
  }

  static List<LocalizationsDelegate<dynamic>> get localizationsDelegates => AppLocalizations.localizationsDelegates;

  static List<Locale> get supportedLocales => AppLocalizations.supportedLocales;
}
