import 'package:flutter/material.dart';
import 'package:flutter_challenge/state/puzzle_providers.dart';
import 'package:flutter_challenge/widgets/puzzle_tile.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared/shared.dart';

class PuzzleBoardLoader extends HookConsumerWidget {
  const PuzzleBoardLoader({Key? key, this.fillPercentage = 0.8}) : super(key: key);

  final double fillPercentage;

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return ref.watch(tileImagesProvider).when(
          loading: () => const CircularProgressIndicator(color: Colors.amber),
          error: (error, _) => Text(error.toString()),
          data: (data) => LayoutBuilder(
            builder: (_, constraints) {
              final maxSize = constraints.biggest.shortestSide * fillPercentage;
              return _PuzzleBoard(boardSize: maxSize);
            },
          ),
        );
  }
}

class _PuzzleBoard extends ConsumerWidget {
  const _PuzzleBoard({
    Key? key,
    required this.boardSize,
  }) : super(key: key);

  final double boardSize;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = ref.watch(puzzleProvider.select((value) => value.isLoading));
    final isError = ref.watch(puzzleProvider.select((value) => value.isError));
    final tiles = ref.watch(puzzleProvider.select((value) => value.puzzle.tiles));
    final numDimensions = ref.watch(puzzleDimensionsProvider);

    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (isError) {
      return Center(
        child: TextButton(
          child: const Text('Reconnect'),
          onPressed: () => ref.refresh(remotePuzzleProvider),
        ),
      );
    }

    final tileSize = boardSize / numDimensions;

    final whiteSpaceTile = tiles.firstWhere((tile) => tile.isWhitespace);
    final children = List.generate(
      numDimensions * numDimensions,
      (index) {
        Widget builder(Tile tile) => PuzzleTile(
              tile,
              whiteSpaceTile,
              key: ValueKey(tile.value),
              size: tileSize,
            );

        final tile = tiles[index];

        if (tile.isWhitespace) return const SizedBox.shrink();
        return builder(tile);
      },
    );

    return Container(
      constraints: BoxConstraints.tight(Size(boardSize, boardSize)),
      child: Stack(children: children),
    );
  }
}
