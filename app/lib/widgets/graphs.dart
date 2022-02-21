import 'package:flutter/material.dart';
import 'package:flutter_challenge/hooks/use_realtimegraph_controller.dart';
import 'package:flutter_challenge/state/puzzle_providers.dart';
import 'package:flutter_challenge/styles.dart';
import 'package:flutter_challenge/widgets/realtime_graph.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class VoteCountGraph extends HookConsumerWidget {
  const VoteCountGraph({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = useRealtimeGraphController();

    ref.listen<int>(puzzleProvider.select((state) => state.puzzle.totalVotes), (old, value) {
      if ((old ?? 0) < value) controller.addDataPoint();
    });

    return Container(
      height: 120,
      padding: const EdgeInsets.all(16),
      child: RealtimeGraph(
        controller: controller,
        labelStyle: appTextStyle(color: Colors.white, fontSize: 10),
        axisTextStyle: appTextStyle(color: Colors.white, fontSize: 8),
        verticalLabel: 'Votes',
        horizontalLabel: 'Time',
      ),
    );
  }
}

class PuzzleUpdateGraph extends HookConsumerWidget {
  const PuzzleUpdateGraph({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = useRealtimeGraphController();

    ref.listen(puzzleProvider.select((state) => state.puzzle), (old, value) {
      controller.addDataPoint();
    });

    return Container(
      height: 120,
      padding: const EdgeInsets.all(16),
      child: RealtimeGraph(
        controller: controller,
        labelStyle: appTextStyle(color: Colors.white, fontSize: 10),
        axisTextStyle: appTextStyle(color: Colors.white, fontSize: 8),
        verticalLabel: 'Updates',
        horizontalLabel: 'Time',
      ),
    );
  }
}
