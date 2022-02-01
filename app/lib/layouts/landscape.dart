import 'package:flutter/material.dart';
import 'package:flutter_challenge/widgets/info_panels.dart';
import 'package:flutter_challenge/widgets/puzzle_board.dart';
import 'package:gap/gap.dart';

class LandScapeLayout extends StatelessWidget {
  const LandScapeLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Gap(16),
        Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Gap(16),
               InfoPanelRow(),
              // const PointerSettings(),
              // ElevatedButton(
              //   onPressed: () => showWinDialog(context),
              //   child: const Text('Show win dialog'),
              // ),
            ],
          ),
        ),
        const Gap(16),
        const Expanded(
          child: Center(child: PuzzleBoardLoader()),
        ),
      ],
    );
  }
}
