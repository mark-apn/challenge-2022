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
      style: appTextStyle(color: kPrimaryLightColor),
      child: IconTheme(
        data: const IconThemeData(color: kPrimaryLightColor),
        child: child,
      ),
    );
  }
}

class IntroInfoPanelRow extends StatelessWidget {
  const IntroInfoPanelRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InfoPanelRow(
      showToolTipAsLabel: true,
      direction: Axis.vertical,
      panelGap: 20,
      textStyle: appTextStyle(fontSize: 30),
      iconThemeData: const IconThemeData(size: 36),
    );
  }
}

class InfoPanelRow extends HookConsumerWidget {
  const InfoPanelRow({
    Key? key,
    this.showToolTipAsLabel = false,
    this.direction = Axis.horizontal,
    this.panelGap = 40,
    this.textStyle,
    this.iconThemeData,
  }) : super(key: key);

  final bool showToolTipAsLabel;
  final Axis direction;
  final double panelGap;
  final TextStyle? textStyle;
  final IconThemeData? iconThemeData;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final numMoves = ref.watch(puzzleProvider.select((value) => value.puzzle.numMoves));
    final numParticipants = ref.watch(puzzleProvider.select((value) => value.puzzle.participants.length));

    return DefaultTextStyle(
      style: appTextStyle(color: Colors.white).merge(textStyle),
      child: IconTheme(
        data: const IconThemeData(color: Colors.white).merge(iconThemeData),
        child: Flex(
          direction: direction,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ParticipantsInfoPanel(
              numParticipants: numParticipants,
              showToolTipAsLabel: showToolTipAsLabel,
            ),
            Gap(panelGap),
            NumMovesInfoPanel(
              numMoves: numMoves,
              showToolTipAsLabel: showToolTipAsLabel,
            ),
            Gap(panelGap),
            ActiveCreatedAtPanel(
              showToolTipAsLabel: showToolTipAsLabel,
            ),
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
    this.showToolTipAsLabel = false,
  }) : super(key: key);

  final int numMoves;
  final bool showToolTipAsLabel;
  @override
  Widget build(BuildContext context) => _BaseInfoPanel(
        icon: Icons.swap_horiz,
        label: numMoves.toString(),
        tooltip: L10n.translate.numMovesTooltip,
        showToolTipAsLabel: showToolTipAsLabel,
      );
}

class ParticipantsInfoPanel extends StatelessWidget {
  const ParticipantsInfoPanel({
    Key? key,
    required this.numParticipants,
    this.showToolTipAsLabel = false,
  }) : super(key: key);

  final int numParticipants;
  final bool showToolTipAsLabel;

  @override
  Widget build(BuildContext context) => _BaseInfoPanel(
        icon: Icons.people,
        label: numParticipants.toString(),
        tooltip: L10n.translate.numParticipantsTooltip,
        showToolTipAsLabel: showToolTipAsLabel,
      );
}

class TimeToFinishPanel extends StatelessWidget {
  const TimeToFinishPanel({
    Key? key,
    required this.duration,
    this.showToolTipAsLabel = false,
  }) : super(key: key);

  final Duration duration;
  final bool showToolTipAsLabel;

  @override
  Widget build(BuildContext context) => _BaseInfoPanel(
        icon: Icons.timer,
        label: duration.toTimeString(),
        tooltip: L10n.translate.numTimeWinTooltip,
        showToolTipAsLabel: showToolTipAsLabel,
      );
}

class ActiveCreatedAtPanel extends HookConsumerWidget {
  const ActiveCreatedAtPanel({
    Key? key,
    this.showToolTipAsLabel = false,
  }) : super(key: key);

  final bool showToolTipAsLabel;

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
      showToolTipAsLabel: showToolTipAsLabel,
    );
  }
}

class _BaseInfoPanel extends StatelessWidget {
  const _BaseInfoPanel({
    Key? key,
    required this.icon,
    required this.label,
    required this.tooltip,
    this.showToolTipAsLabel = false,
  }) : super(key: key);

  final IconData icon;
  final String label;
  final String tooltip;
  final bool showToolTipAsLabel;

  @override
  Widget build(BuildContext context) {
    final child = Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(icon),
        const Gap(8),
        Text(
          label,
        ),
        if (showToolTipAsLabel) ...[
          const Gap(8),
          Expanded(
            child: Opacity(
              opacity: 0.4,
              child: Text(
                tooltip,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ]
      ],
    );

    if (showToolTipAsLabel) {
      return child;
    } else {
      return Tooltip(
        message: tooltip,
        child: child,
      );
    }
  }
}
