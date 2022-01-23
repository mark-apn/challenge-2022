import 'package:flutter/material.dart';
import 'package:flutter_challenge/state/puzzle_providers.dart';
import 'package:flutter_challenge/state/timer_providers.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class InfoPanelRow extends StatelessWidget {
  const InfoPanelRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: const [
        ParticipantsInfoPanel(),
        SizedBox(width: 24),
        NumMovesInfoPanel(),
        SizedBox(width: 24),
        CreatedAtPanel(),
      ],
    );
  }
}

class NumMovesInfoPanel extends HookConsumerWidget {
  const NumMovesInfoPanel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // * Listen to the smallest piece of data that we care about.
    final count = ref.watch(puzzleProvider.select((value) => value.puzzle.numMoves));

    return _BaseInfoPanel(
      icon: Icons.swap_horiz,
      label: count.toString(),
      tooltip: "Number of moves",
    );
  }
}

class ParticipantsInfoPanel extends HookConsumerWidget {
  const ParticipantsInfoPanel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // * Listen to the smallest piece of data that we care about.
    final count = ref.watch(puzzleProvider.select((value) => value.puzzle.participants.length));

    return _BaseInfoPanel(
      icon: Icons.people,
      label: count.toString(),
      tooltip: "Participant count",
    );
  }
}

class CreatedAtPanel extends HookConsumerWidget {
  const CreatedAtPanel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // * Listen to the timer that will update the label value
    ref.watch(createdAtTimerProvider);
    final label = ref.watch(createdAtLabelProvider);

    return _BaseInfoPanel(
      icon: Icons.timer,
      label: label,
      tooltip: "Running time",
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
          Icon(icon, color: Colors.white),
          const SizedBox(width: 4),
          Text(label, style: const TextStyle(color: Colors.white)),
        ],
      ),
    );
  }
}
