import 'package:flutter/material.dart';
import 'package:flutter_challenge/widgets/info_panels.dart';
import 'package:flutter_challenge/widgets/puzzle_board.dart';

class LandScapeLayout extends StatelessWidget {
  const LandScapeLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Expanded(
          child: Center(child: InfoPanelRow()),
        ),
        Expanded(
          child: Center(child: PuzzleBoardLoader()),
        ),
      ],
    );
  }
}
