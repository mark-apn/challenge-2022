import 'package:flutter/material.dart';
import 'package:flutter_challenge/widgets/info_panels.dart';
import 'package:flutter_challenge/widgets/puzzle_board.dart';

class PortraitLayout extends StatelessWidget {
  const PortraitLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Expanded(
          child: Center(child: PuzzleBoardLoader()),
        ),
        Expanded(
          child: Center(child: InfoPanelRow()),
        ),
      ],
    );
  }
}
