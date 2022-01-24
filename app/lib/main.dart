import 'package:flutter/material.dart';
import 'package:flutter_challenge/grpc/client.dart';
import 'package:flutter_challenge/layouts/landscape.dart';
import 'package:flutter_challenge/layouts/portrait.dart';
import 'package:flutter_challenge/prefs.dart';
import 'package:flutter_challenge/styles.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:uuid/uuid.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

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
      title: 'SlideIt',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.spaceGroteskTextTheme(),
      ),
      home: Scaffold(
        backgroundColor: kPrimaryColor,
        body: OrientationLayoutBuilder(
          portrait: (_) => const PortraitLayout(),
          landscape: (_) => const LandScapeLayout(),
        ),
      ),
    );
  }
}
