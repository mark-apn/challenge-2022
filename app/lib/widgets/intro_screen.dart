import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_challenge/state/puzzle_providers.dart';
import 'package:flutter_challenge/styles.dart';
import 'package:flutter_challenge/widgets/info_panels.dart';
import 'package:flutter_challenge/widgets/pointer_settings.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class IntroScreen extends HookConsumerWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Load active puzzel data
    ref.watch(puzzleProvider);

    return Container(
      color: Colors.white,
      child: Row(
        children: [
          Expanded(
            flex: 45,
            child: DefaultTextStyle(
              style: appTextStyle(color: Colors.white),
              child: Container(
                color: kPrimaryColor,
                padding: const EdgeInsets.all(80),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AutoSizeText(
                      'Massive',
                      style: appTextStyle(fontSize: 76, fontWeight: FontWeight.w500, height: 0.9),
                      maxLines: 1,
                    ),
                    AutoSizeText(
                      'Multiplayer',
                      style: appTextStyle(fontSize: 76, fontWeight: FontWeight.w300, height: 0.9),
                      maxLines: 1,
                    ),
                    AutoSizeText(
                      'Puzzle',
                      style: appTextStyle(fontSize: 76, fontWeight: FontWeight.w300, height: 0.9),
                      maxLines: 1,
                    ),
                    const Gap(20),
                    Text(
                      'Join the fun on the Massive Multiplayer Puzzle. Puzzle together and set the best time on the leaderboard.',
                      style: appTextStyle(height: 1.5),
                    ),
                    // Push rest of the content down
                    const Expanded(child: SizedBox.shrink()),
                    const IntroInfoPanelRow(),
                  ],
                ),
              ),
            ),
          ),
          const Expanded(
            flex: 55,
            child: Center(child: PointerSettings()),
          ),
        ],
      ),
    );
  }
}
