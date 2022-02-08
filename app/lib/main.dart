import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_challenge/grpc/client.dart';
import 'package:flutter_challenge/l10n.dart';
import 'package:flutter_challenge/prefs.dart';
import 'package:flutter_challenge/screens/error_screen.dart';
import 'package:flutter_challenge/screens/intro_screen.dart';
import 'package:flutter_challenge/screens/puzzle_screen.dart';
import 'package:flutter_challenge/styles.dart';
import 'package:go_router/go_router.dart';
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
  runApp(ProviderScope(child: App()));

  if (isDesktop) {
    doWhenWindowReady(() {
      final win = appWindow;
      win.minSize = const Size(800, 700);
      win.size = const Size(1200, 900);
      win.alignment = Alignment.center;
      win.title = "SlideIt with friends";
      win.show();
    });
  }
}

class App extends StatelessWidget {
  App({Key? key}) : super(key: key);

  final _router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const IntroScreen(),
      ),
      GoRoute(
        path: '/active-puzzle',
        builder: (context, state) => const PuzzleScreen(),
      ),
    ],
    errorBuilder: (context, state) => const ErrorScreen(),
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      onGenerateTitle: (context) {
        L10n.init(context);
        return L10n.translate.appName;
      },
      theme: ThemeData(primarySwatch: Colors.blue, textTheme: appTextTheme()),
      localizationsDelegates: L10n.localizationsDelegates,
      supportedLocales: L10n.supportedLocales,
      routeInformationParser: _router.routeInformationParser,
      routerDelegate: _router.routerDelegate,
    );
  }
}
