import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_challenge/l10n.dart';
import 'package:flutter_challenge/screens/screen_base.dart';
import 'package:flutter_challenge/state/konami_state.dart';
import 'package:flutter_challenge/state/puzzle_providers.dart';
import 'package:flutter_challenge/state/puzzle_viewmodel.dart';
import 'package:flutter_challenge/styles.dart';
import 'package:flutter_challenge/utils/tracker.dart';
import 'package:flutter_challenge/widgets/graphs.dart';
import 'package:flutter_challenge/widgets/info_panels.dart';
import 'package:flutter_challenge/widgets/pointer_settings.dart';
import 'package:flutter_challenge/widgets/puzzle_board.dart';
import 'package:flutter_challenge/widgets/screen_panel.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PuzzleScreen extends HookConsumerWidget {
  const PuzzleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final godModeEnabled = ref.watch(konamiModeEnabledProvider);

    ref.listen<bool>(konamiCodeCompleted, (_, completed) {
      if (completed) {
        Tracker.trackEvent('konami_entered');
        ref.read(konamiCodeProvider.state).update((_) => []);
        ref.read(konamiModeEnabledProvider.state).update((_) => true);
      }
    });

    return ScreenBase(
      color: godModeEnabled ? kGoldColor : kPrimaryColor,
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
      child: _KeyboardListener(
        child: SafeArea(
          child: Builder(builder: (context) {
            return Stack(
              children: const [
                _PuzzleContent(),
                _SettingsButton(),
                _KonamiCodeLetters(),
              ],
            );
          }),
        ),
      ),
    );
  }
}

class _PuzzleContent extends StatelessWidget {
  const _PuzzleContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Gap(32),
        const InfoPanelRow(),
        const Gap(16),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:  [
              SizedBox(
                width: 200,
                child: Column(
                  children: const [
                    VoteCountGraph(),
                    PuzzleUpdateGraph(),
                  ],
                ),
              ),
              const Center(child: PuzzleBoardLoader()),
              const SizedBox(width: 200),
            ],
          ),
        ),
        const Gap(16),
        const _CompletedTilesIndicator(),
        const Gap(32),
      ],
    );
  }
}

class _SettingsButton extends StatelessWidget {
  const _SettingsButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
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

class _KeyboardListener extends HookConsumerWidget {
  const _KeyboardListener({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final focusNode = useFocusNode();

    return KeyboardListener(
      focusNode: focusNode,
      onKeyEvent: (event) {
        if (event is KeyDownEvent) {
          PuzzleVm.instance.onKeyPressed(ref.read, event.logicalKey);
        }
      },
      child: child,
    );
  }
}

class _KonamiCodeLetters extends HookConsumerWidget {
  const _KonamiCodeLetters({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final konamiCode = ref.watch(konamiCodeProvider);
    return Align(
      alignment: Alignment.bottomLeft,
      child: Row(
        children: konamiCode.map((e) => _KonamiCodeLetter(char: e)).toList(),
      ),
    );
  }
}

class _KonamiCodeLetter extends StatelessWidget {
  const _KonamiCodeLetter({Key? key, required this.char}) : super(key: key);

  final KonamiChar char;

  String get _label {
    switch (char) {
      case KonamiChar.up:
        return 'up';
      case KonamiChar.down:
        return 'down';
      case KonamiChar.left:
        return 'left';
      case KonamiChar.right:
        return 'right';
      case KonamiChar.a:
        return 'a';
      case KonamiChar.b:
        return 'b';
      case KonamiChar.invalid:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      color: Colors.white,
      child: Text(_label),
    );
  }
}
