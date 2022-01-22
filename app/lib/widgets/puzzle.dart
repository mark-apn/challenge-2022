import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_challenge/state/providers.dart';
import 'package:flutter_challenge/state/puzzle_viewmodel.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared/shared.dart';

class ImagePuzzleLoader extends HookConsumerWidget {
  const ImagePuzzleLoader({Key? key, this.fillPercentage = 0.8}) : super(key: key);

  final double fillPercentage;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(tiledImagesProvider).when(
          loading: () => const CircularProgressIndicator(color: Colors.amber),
          error: (error, _) => Text(error.toString()),
          data: (data) => LayoutBuilder(
            builder: (_, constraints) {
              double maxBoardSize = constraints.maxHeight;

              if (constraints.maxWidth < constraints.maxHeight) {
                maxBoardSize = constraints.maxWidth;
              }

              return _ImagePuzzle(
                images: data,
                boardSize: maxBoardSize * fillPercentage,
              );
            },
          ),
        );
  }
}

class _ImagePuzzle extends ConsumerWidget {
  const _ImagePuzzle({
    Key? key,
    required this.images,
    required this.boardSize,
  }) : super(key: key);

  final List<Image> images;
  final double boardSize;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = ref.watch(puzzleProvider.select((value) => value.isLoading));
    final isError = ref.watch(puzzleProvider.select((value) => value.isError));

    // * Only listen to num dimensions, not the board or tiles itself
    final numDimensions = ref.watch(puzzleDimensionsProvider);

    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (isError) {
      return Center(
        child: TextButton(
          child: const Text('Reconnect'),
          onPressed: () => ref.refresh(puzzleProvider),
        ),
      );
    }

    final tileSize = boardSize / numDimensions;

    final tiles = ref.watch(puzzleProvider.select((value) => value.puzzle.tiles));
    final children = List.generate(
      numDimensions * numDimensions,
      (index) {
        Widget builder(Tile tile) => _Tile(
              tile,
              key: ValueKey(tile.value),
              image: images[tile.value - 1],
              size: tileSize,
            );

        final tile = tiles[index];

        if (tile.isWhitespace) return const SizedBox.shrink();
        return builder(tile);

        // TODO(mark): Why doesnt this work :-(
        return _TileBuilder(index, builder: builder);
      },
    );

    return Container(
      constraints: BoxConstraints.tight(Size(boardSize, boardSize)),
      child: Stack(children: children),
    );
  }
}

class _Tile extends ConsumerWidget {
  const _Tile(
    this.tile, {
    Key? key,
    required this.image,
    required this.size,
  }) : super(key: key);

  final Tile tile;
  final Image image;
  final double size;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return _AnimatedTile(
      position: tile.currentPosition,
      child: GestureDetector(
        onTap: () {
          debugPrint('Tile tapped: ${tile.value}');
          PuzzleVm.instance.tileTapped(tile);
        },
        child: SizedBox.square(
          dimension: size,
          child: _TileContent(
            image: image,
            tile: tile,
          ),
        ),
      ),
    );
  }
}

class _TileContent extends StatelessWidget {
  const _TileContent({
    Key? key,
    required this.image,
    required this.tile,
  }) : super(key: key);

  final Image image;
  final Tile tile;

  @override
  Widget build(BuildContext context) {
    debugPrint('Tile: ${tile.value} - rebuild');
    return Container(
      margin: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(image: image.image, fit: BoxFit.cover),
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '${tile.numVotes}',
              style: const TextStyle(
                fontSize: 50,
                shadows: [
                  Shadow(
                    color: Colors.white,
                    blurRadius: 4,
                    offset: Offset(0, 1),
                  ),
                ],
              ),
            ),
            const Text('votes'),
          ],
        ),
      ),
    );
  }
}

class _TileBuilder extends ConsumerWidget {
  const _TileBuilder(
    this.index, {
    Key? key,
    required this.builder,
  }) : super(key: key);

  final int index;
  final Widget Function(Tile) builder;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tile = ref.watch(tileProvider(index));

    if (tile.isWhitespace) {
      return const SizedBox.shrink();
    }

    return builder(tile);
  }
}

class _AnimatedTile extends HookWidget {
  const _AnimatedTile({
    Key? key,
    required this.child,
    required this.position,
  }) : super(key: key);

  final Widget child;
  final Position position;

  @override
  Widget build(BuildContext context) {
    return AnimatedAlign(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOut,
      alignment: FractionalOffset(
        (position.x - 1) / (3 - 1),
        (position.y - 1) / (3 - 1),
      ),
      child: child,
    );
  }
}
