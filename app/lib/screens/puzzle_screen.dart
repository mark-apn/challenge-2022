import 'package:flutter/material.dart';
import 'package:flutter_challenge/styles.dart';
import 'package:flutter_challenge/widgets/info_panels.dart';
import 'package:flutter_challenge/widgets/puzzle_board.dart';
import 'package:gap/gap.dart';

class PuzzleScreen extends StatelessWidget {
  const PuzzleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Column(
        children: const [
          Gap(32),
          InfoPanelRow(),
          Gap(16),
          Expanded(
            child: Center(child: PuzzleBoardLoader()),
          ),
        ],
      ),
    );
  }
}
