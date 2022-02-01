import 'package:flutter/material.dart';
import 'package:flutter_challenge/extensions.dart';
import 'package:flutter_challenge/l10n.dart';
import 'package:flutter_challenge/state/puzzle_providers.dart';
import 'package:flutter_challenge/state/timer_providers.dart';
import 'package:flutter_challenge/styles.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:responsive_builder/responsive_builder.dart';

class FinishedPuzzleInfoPanelRow extends ConsumerWidget {
  const FinishedPuzzleInfoPanelRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Read instead of watch, so we dont update this widget when the puzzle changes
    final puzzle = ref.read(puzzleProvider).puzzle;
    final numMoves = puzzle.numMoves;
    final numParticipants = puzzle.participants.length;

    final timeToFinish = DateTime.now().difference(puzzle.createdAt);

    final asColumn = MediaQuery.of(context).orientation == Orientation.portrait;

    final gap = getValueForScreenType<double>(
      context: context,
      mobile: asColumn ? 4 : 16,
      tablet: asColumn ? 4 : 32,
      desktop: asColumn ? 4 : 40,
    );

    final children = [
      ParticipantsInfoPanel(numParticipants: numParticipants),
      Gap(gap),
      NumMovesInfoPanel(numMoves: numMoves),
      Gap(gap),
      TimeToFinishPanel(duration: timeToFinish),
    ];

    final Widget child;
    if (asColumn) {
      child = Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: children,
      );
    } else {
      child = Row(
        mainAxisSize: MainAxisSize.min,
        children: children,
      );
    }

    return DefaultTextStyle(
      style: const TextStyle(color: kPrimaryLightColor),
      child: IconTheme(
        data: const IconThemeData(color: kPrimaryLightColor),
        child: child,
      ),
    );
  }
}

class InfoPanelRow extends HookConsumerWidget {
  const InfoPanelRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final numMoves = ref.watch(puzzleProvider.select((value) => value.puzzle.numMoves));
    final numParticipants = ref.watch(puzzleProvider.select((value) => value.puzzle.participants.length));

    return DefaultTextStyle(
      style: const TextStyle(color: Colors.white),
      child: IconTheme(
        data: const IconThemeData(color: Colors.white),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            ParticipantsInfoPanel(numParticipants: numParticipants),
            const Gap(40),
            NumMovesInfoPanel(numMoves: numMoves),
            const Gap(40),
            const ActiveCreatedAtPanel(),
          ],
        ),
      ),
    );
  }
}

class NumMovesInfoPanel extends StatelessWidget {
  const NumMovesInfoPanel({
    Key? key,
    required this.numMoves,
  }) : super(key: key);

  final int numMoves;
  @override
  Widget build(BuildContext context) => _BaseInfoPanel(
        icon: Icons.swap_horiz,
        label: numMoves.toString(),
        tooltip: L10n.translate.numMovesTooltip,
      );
}

class ParticipantsInfoPanel extends StatelessWidget {
  const ParticipantsInfoPanel({
    Key? key,
    required this.numParticipants,
  }) : super(key: key);

  final int numParticipants;
  @override
  Widget build(BuildContext context) {
    return _BaseInfoPanel(
      icon: Icons.people,
      label: numParticipants.toString(),
      tooltip: L10n.translate.numParticipantsTooltip,
    );
  }
}

class TimeToFinishPanel extends StatelessWidget {
  const TimeToFinishPanel({Key? key, required this.duration}) : super(key: key);

  final Duration duration;

  @override
  Widget build(BuildContext context) {
    return _BaseInfoPanel(
      icon: Icons.timer,
      label: duration.toTimeString(),
      tooltip: L10n.translate.numTimeWinTooltip,
    );
  }
}

class ActiveCreatedAtPanel extends HookConsumerWidget {
  const ActiveCreatedAtPanel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // * Listen to the timer that will update the label value
    // * When this widget is disposed, the timer wil also be disposed
    ref.watch(createdAtTimerProvider);

    // * The actual label that is displayed
    final label = ref.watch(createdAtLabelProvider);

    return _BaseInfoPanel(
      icon: Icons.timer,
      label: label,
      tooltip: L10n.translate.numTimeRunningTooltip,
    );
  }
}

class _BaseInfoPanel extends StatelessWidget {
  const _BaseInfoPanel({
    Key? key,
    required this.icon,
    required this.label,
    required this.tooltip,
  }) : super(key: key);

  final IconData icon;
  final String label;
  final String tooltip;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: tooltip,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon),
          const Gap(4),
          Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}
