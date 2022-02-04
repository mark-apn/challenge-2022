import 'package:auto_size_text/auto_size_text.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter_challenge/hooks/use_confetti_controller.dart';
import 'package:flutter_challenge/styles.dart';
import 'package:flutter_challenge/widgets/info_panels.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:vector_math/vector_math.dart' as math;

Future<void> showWinDialog(BuildContext context) => showGeneralDialog(
      context: context,
      pageBuilder: (_, __, ___) => const _WinDialog(),
      barrierDismissible: true,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      transitionDuration: const Duration(seconds: 1), // Dramatically slow on purpose :-)
      transitionBuilder: (_, animation, __, child) {
        return Transform.rotate(
          angle: math.radians(animation.value * 360),
          child: Transform.scale(scale: animation.value, child: child),
        );
      },
    );

class _WinDialog extends StatelessWidget {
  const _WinDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    final aspectRatio = orientation == Orientation.portrait ? 9 / 16 : 16 / 9;

    return FractionallySizedBox(
      widthFactor: 0.8,
      heightFactor: 0.8,
      child: Center(
        child: AspectRatio(
          aspectRatio: aspectRatio,
          child: Material(
            color: Colors.white,
            borderRadius: BorderRadius.circular(32),
            clipBehavior: Clip.hardEdge,
            child: Stack(
              children: [
                const _Background(),
                const _CloseButton(),
                OrientationBuilder(builder: (context, orientation) {
                  if (orientation == Orientation.landscape) {
                    return Row(children: const [
                      Expanded(flex: 4, child: SingleChildScrollView(child: _Content())),
                      // Empty space to not block the background
                      Expanded(flex: 2, child: SizedBox.expand()),
                    ]);
                  } else {
                    return SingleChildScrollView(
                      child: Column(children: const [_Content()]),
                    );
                  }
                }),
                const _ConfettiCannon(
                  align: Alignment.topLeft,
                  blastDirectionAngle: 0,
                ),
                const _ConfettiCannon(
                  align: Alignment.topRight,
                  blastDirectionAngle: 180,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _CloseButton extends ConsumerWidget {
  const _CloseButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const backgroundColor = Color(0xFFEFF4FA);
    final inkWellColor = kPrimaryColor.withOpacity(0.4);

    return Align(
      alignment: Alignment.topRight,
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Material(
          color: backgroundColor,
          shape: const CircleBorder(),
          child: InkWell(
            onTap: () => Navigator.of(context).pop(),
            highlightColor: inkWellColor,
            splashColor: inkWellColor,
            borderRadius: BorderRadius.circular(32),
            child: Container(
              decoration: const ShapeDecoration(
                shape: CircleBorder(),
              ),
              padding: const EdgeInsets.all(8),
              child: const Icon(
                Icons.close_rounded,
                color: kPrimaryColor,
                size: 32,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _Background extends ConsumerWidget {
  const _Background({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        image: const DecorationImage(
          alignment: Alignment.bottomRight,
          image: AssetImage(kImgAssetWinDash),
        ),
      ),
    );
  }
}

class _Content extends ConsumerWidget {
  const _Content({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(64),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AutoSizeText('Whoohoo!', style: kWinTitle, maxLines: 1),
          AutoSizeText('Solved the puzzle! Teamwork makes the dream work.', style: kWinSubTitle, maxLines: 3),
          const Gap(32),
          const FinishedPuzzleInfoPanelRow(),
        ],
      ),
    );
  }
}

class _ConfettiCannon extends HookWidget {
  const _ConfettiCannon({
    Key? key,
    required this.align,
    required this.blastDirectionAngle,
  }) : super(key: key);

  final Alignment align;
  final double blastDirectionAngle;

  @override
  Widget build(BuildContext context) {
    final controller = useConfettiController();
    return Align(
      alignment: align,
      child: ConfettiWidget(
        confettiController: controller,
        blastDirection: math.radians(blastDirectionAngle),
        emissionFrequency: 0.02,
        gravity: 0.1,
        minBlastForce: 10,
        maxBlastForce: 30,
        shouldLoop: true,
        colors: const [
          Color(0xFFBE00DD),
          Color(0xFF2CC633),
          Color(0xFFEB2F2F),
          Color(0xFF0084CE),
          Color(0xFFF6B73D),
        ],
      ),
    );
  }
}
