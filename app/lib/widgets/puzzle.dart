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
    final puzzleState = ref.watch(puzzleProvider);
    // * Only listen to num dimensions, not the board or tiles itself
    final numDimensions = ref.watch(puzzleProvider.select((value) => value.puzzle.getDimension()));

    if (puzzleState.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (puzzleState.isError) {
      return Center(
        child: TextButton(
          child: const Text('Reconnect'),
          onPressed: () => ref.refresh(puzzleProvider),
        ),
      );
    }

    final tileSize = boardSize / numDimensions;

    final tiles = List.generate(numDimensions * numDimensions, (index) {
      final tile = puzzleState.puzzle.tiles[index];
      return _Tile(
        tile,
        key: ValueKey(tile.value),
        image: images[tile.value - 1],
        tileSize: tileSize,
      );
    });

    return Container(
      constraints: BoxConstraints(
        maxWidth: boardSize,
        maxHeight: boardSize,
      ),
      child: Stack(
        children: tiles,
      ),
    );
  }
}

class _Tile extends StatelessWidget {
  const _Tile(
    this.tile, {
    Key? key,
    required this.image,
    required this.tileSize,
  }) : super(key: key);

  final Tile tile;
  final Image? image;
  final double tileSize;

  @override
  Widget build(BuildContext context) {
    return tile.isWhitespace
        ? const SizedBox.shrink()
        : _TappableTile(
            tile,
            image: image,
            size: tileSize,
          );
  }
}

class _TappableTile extends ConsumerWidget {
  const _TappableTile(
    this.tile, {
    Key? key,
    required this.image,
    required this.size,
  }) : super(key: key);

  final Tile tile;
  final Image? image;
  final double size;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return _AnimatedTile(
      tile: tile,
      size: size,
      child: GestureDetector(
        onTap: () {
          PuzzleVm.instance.tileTapped(tile);
        },
        child: Stack(
          children: [
            Container(
              margin: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: image != null ? DecorationImage(image: image!.image, fit: BoxFit.cover) : null,
              ),
            ),
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '${tile.numVotes}',
                    style: const TextStyle(
                      fontSize: 50,
                      shadows: [
                        Shadow(color: Colors.white, blurRadius: 4, offset: Offset(0, 1)),
                      ],
                    ),
                  ),
                  const Text('votes'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AnimatedTile extends HookWidget {
  const _AnimatedTile({
    Key? key,
    required this.child,
    required this.tile,
    required this.size,
  }) : super(key: key);

  final Widget child;
  final Tile tile;
  final double size;

  @override
  Widget build(BuildContext context) {
    return AnimatedAlign(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOut,
      alignment: FractionalOffset(
        (tile.currentPosition.x - 1) / (3 - 1),
        (tile.currentPosition.y - 1) / (3 - 1),
      ),
      child: SizedBox.fromSize(
        size: Size(size, size),
        child: child,
      ),
    );
  }
}
