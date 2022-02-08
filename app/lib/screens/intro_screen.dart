import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_challenge/l10n.dart';
import 'package:flutter_challenge/screens/screen_base.dart';
import 'package:flutter_challenge/state/puzzle_providers.dart';
import 'package:flutter_challenge/styles.dart';
import 'package:flutter_challenge/widgets/info_panels.dart';
import 'package:flutter_challenge/widgets/pointer_settings.dart';
import 'package:flutter_challenge/widgets/screen_panel.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:responsive_builder/responsive_builder.dart';

class IntroScreen extends HookConsumerWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Load active puzzel data for pointer settings and info panels
    ref.watch(puzzleProvider);

    final orientation = MediaQuery.of(context).orientation;
    final isPortrait = orientation == Orientation.portrait;

    final body = isPortrait ? const _IntroScreenFlow() : const _IntroScreenDuoPane();

    return ScreenBase(child: body);
  }
}

class _IntroScreenFlow extends HookWidget {
  const _IntroScreenFlow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = usePageController();

    return PageView(
      controller: controller,
      children: [
        _ActivePuzzelInfoPanel(onNextClicked: () {
          controller.animateToPage(
            1,
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeInOut,
          );
        }),
        const _PointerSettingsPanel(),
      ],
    );
  }
}

class _IntroScreenDuoPane extends HookConsumerWidget {
  const _IntroScreenDuoPane({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      color: Colors.white,
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height,
      ),
      child: Row(
        children: const [
          Expanded(
            flex: 45,
            child: _ActivePuzzelInfoPanel(),
          ),
          Expanded(
            flex: 55,
            child: _PointerSettingsPanel(),
          ),
        ],
      ),
    );
  }
}

class _ActivePuzzelInfoPanel extends StatelessWidget {
  const _ActivePuzzelInfoPanel({
    Key? key,
    this.onNextClicked,
  }) : super(key: key);

  bool get showNext => onNextClicked != null;
  final VoidCallback? onNextClicked;

  @override
  Widget build(BuildContext context) {
    final totalHeight = MediaQuery.of(context).size.height;

    final headerFontSize = getValueForScreenType(
      context: context,
      mobile: 48.0,
      tablet: 76.0,
    );

    final gapSize = getValueForScreenType(
      context: context,
      mobile: totalHeight - 420,
      tablet: totalHeight - 550,
    );

    return ScreenPanel(
      color: kPrimaryColor,
      textStyle: appTextStyle(color: Colors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AutoSizeText(
            L10n.translate.massive,
            style: appTextStyle(fontSize: headerFontSize, fontWeight: FontWeight.w500, height: 0.9),
            maxLines: 1,
          ),
          AutoSizeText(
            L10n.translate.multiplayer,
            style: appTextStyle(fontSize: headerFontSize, fontWeight: FontWeight.w300, height: 0.9),
            maxLines: 1,
          ),
          AutoSizeText(
            L10n.translate.puzzle,
            style: appTextStyle(fontSize: headerFontSize, fontWeight: FontWeight.w300, height: 0.9),
            maxLines: 1,
          ),
          const Gap(20),
          Text(
            L10n.translate.introParagraph,
            style: appTextStyle(height: 1.5),
          ),

          // We try to position this info panel as close
          // to the bottom of the screen as possible
          Container(
            constraints: BoxConstraints(minHeight: max(0, gapSize)),
            padding: const EdgeInsets.all(16),
            child: showNext
                ? Align(
                    alignment: Alignment.centerRight,
                    child: ElevatedButton(
                      onPressed: onNextClicked,
                      child: Text(L10n.translate.nextButtonText),
                    ),
                  )
                : null,
          ),
          const IntroInfoPanelRow(),
        ],
      ),
    );
  }
}

class _PointerSettingsPanel extends StatelessWidget {
  const _PointerSettingsPanel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenPanel(
      color: Colors.white,
      textStyle: appTextStyle(color: kPrimaryColor),
      child: Center(
        child: PointerSettings(
          buttonLabel: L10n.translate.joinThePuzzle,
          onButtonTap: () => context.go('/active-puzzle'),
        ),
      ),
    );
  }
}
