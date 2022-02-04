
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_challenge/grpc/client.dart';
import 'package:flutter_challenge/l10n.dart';
import 'package:flutter_challenge/prefs.dart';
import 'package:flutter_challenge/screens/intro_screen.dart';
import 'package:flutter_challenge/screens/puzzle_screen.dart';
import 'package:flutter_challenge/styles.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:uuid/uuid.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final options = DefaultFirebaseOptions.currentPlatform;
  if (options != null) {
    await Firebase.initializeApp(options: options);
  }

  // Fetch saved values before first paint
  await Prefs.instance.init();

  // Initialize gRPC client with saved or new user id
  String? savedUserId = Prefs.instance.getString(kUserId);
  if (savedUserId == null) {
    savedUserId = const Uuid().v4();
    Prefs.instance.set(kUserId, savedUserId);
  }
  GrpcClient.instance.init(savedUserId);

  // Run the app
  runApp(const ProviderScope(child: App()));
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateTitle: (context) {
        L10n.init(context);
        return L10n.translate.appName;
      },
      theme: ThemeData(primarySwatch: Colors.blue, textTheme: appTextTheme()),
      localizationsDelegates: L10n.localizationsDelegates,
      supportedLocales: L10n.supportedLocales,
      routes: {
        '/': (_) => const IntroScreen(),
        '/active-puzzle': (_) => const PuzzleScreen(),
      },
    );
  }
}
