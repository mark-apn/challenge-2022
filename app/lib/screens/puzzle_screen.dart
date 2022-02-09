import 'package:flutter/material.dart';
import 'package:flutter_challenge/l10n.dart';
import 'package:flutter_challenge/screens/screen_base.dart';
import 'package:flutter_challenge/state/puzzle_providers.dart';
import 'package:flutter_challenge/styles.dart';
import 'package:flutter_challenge/widgets/info_panels.dart';
import 'package:flutter_challenge/widgets/pointer_settings.dart';
import 'package:flutter_challenge/widgets/puzzle_board.dart';
import 'package:flutter_challenge/widgets/screen_panel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

class PuzzleScreen extends StatelessWidget {
  const PuzzleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenBase(
      color: kPrimaryColor,
      endDrawer: Drawer(
        elevation: 8,
        child: ScreenPanel(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 32,
          ),
          textStyle: appTextStyle(color: kPrimaryColor),
          child: Builder(
            builder: (context) {
              return PointerSettings(
                buttonLabel: L10n.translate.close,
                onButtonTap: () => Navigator.of(context).pop(),
              );
            },
          ),
        ),
      ),
      child: SafeArea(
        child: Builder(builder: (context) {
          return Stack(
            children: [
              Column(
                children: const [
                  Gap(32),
                  InfoPanelRow(),
                  Gap(16),
                  Expanded(
                    child: Center(child: PuzzleBoardLoader()),
                  ),
                  Gap(16),
                  _CompletedTilesIndicator(),
                  Gap(32),
                ],
              ),
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: IconButton(
                    onPressed: () => Scaffold.of(context).openEndDrawer(),
                    icon: const Icon(
                      Icons.settings,
                      size: 32,
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          );
        }),
      ),
    );
  }
}

class _CompletedTilesIndicator extends ConsumerWidget {
  const _CompletedTilesIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final completedPercentage = ref.watch(
      puzzleProvider.select((value) => 1.0 / (value.puzzle.tiles.length - 1) * value.numberOfCorrectTiles),
    );

    const padding = 16.0;
    final maxWidth = MediaQuery.of(context).size.width - (padding * 2);
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: padding),
      height: 4,
      decoration: BoxDecoration(
        color: kIndicatorTrackColor,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: AnimatedContainer(
          width: maxWidth * completedPercentage,
          duration: const Duration(milliseconds: 500),
          decoration: BoxDecoration(
            color: kIndicatorLineColor,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
      ),
    );
  }
}
