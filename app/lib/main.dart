import 'package:flutter/material.dart';
import 'package:flutter_challenge/widgets/puzzle.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:responsive_builder/responsive_builder.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Challenge 2022',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: OrientationLayoutBuilder(
          portrait: (_) => const PortraitLayout(),
          landscape: (_) => const LandScapeLayout(),
        ),
      ),
    );
  }
}

class PortraitLayout extends StatelessWidget {
  const PortraitLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Expanded(
          child: Center(child: PuzzleLoader()),
        ),
        Expanded(
          child: Container(),
        ),
      ],
    );
  }
}

class LandScapeLayout extends StatelessWidget {
  const LandScapeLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(),
        ),
        const Expanded(
          child: Center(child: PuzzleLoader()),
        ),
      ],
    );
  }
}
