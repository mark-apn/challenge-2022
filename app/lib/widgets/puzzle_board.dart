import 'package:flutter/material.dart';
import 'package:flutter_challenge/state/puzzle_providers.dart';
import 'package:flutter_challenge/styles.dart';
import 'package:flutter_challenge/widgets/puzzle_tile.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared/shared.dart';
import 'package:shimmer/shimmer.dart';

import 'mouse_pointers.dart';

class PuzzleBoardLoader extends StatelessWidget {
  const PuzzleBoardLoader({Key? key, this.fillPercentage = 0.8}) : super(key: key);

  final double fillPercentage;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (_, constraints) {
      final maxSize = constraints.biggest.shortestSide * fillPercentage;
      return HookConsumer(
        builder: (context, ref, _) {
          return ref.watch(tileImagesProvider).when(
                loading: () => _PuzzleShimmer(boardSize: maxSize),
                error: (error, _) => Text(error.toString()),
                data: (data) => _PuzzleBoard(boardSize: maxSize),
              );
        },
      );
    });
  }
}

class _PuzzleShimmer extends ConsumerWidget {
  const _PuzzleShimmer({
    Key? key,
    required this.boardSize,
  }) : super(key: key);

  final double boardSize;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      constraints: BoxConstraints.tight(Size(boardSize, boardSize)),
      padding: const EdgeInsets.all(4),
      child: Shimmer.fromColors(
        baseColor: kPrimaryColor,
        highlightColor: HSLColor.fromColor(kPrimaryColor).withLightness(0.5).toColor(),
        child: GridView.count(
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 3,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          children: List.generate(9, (index) {
            return Container(
              decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.circular(16),
              ),
            );
          }),
        ),
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
      return _PuzzleShimmer(boardSize: boardSize);
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

    children.add( MousePointers(boardSize: boardSize));

    return Container(
      constraints: BoxConstraints.tight(Size(boardSize, boardSize)),
      child: Stack(children: children),
    );
  }
}
