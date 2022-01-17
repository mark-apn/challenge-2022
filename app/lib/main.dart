import 'package:flutter/material.dart';
import 'package:flutter_challenge/generated/widgets/puzzle.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

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
        body: Column(
          children: const [
            SizedBox(height: 20),
            Text('Flutter Challenge'),
            Expanded(
              child: Center(
                child: FractionallySizedBox(
                  widthFactor: 0.8,
                  heightFactor: 0.8,
                  child: Center(child: ImagePuzzleLoader()),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
