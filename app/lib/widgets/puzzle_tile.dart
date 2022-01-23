

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_challenge/state/puzzle_providers.dart';
import 'package:flutter_challenge/state/puzzle_viewmodel.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared/models/models.dart';

class PuzzleTile extends ConsumerWidget {
  const PuzzleTile(
    this.tile,
    this.whiteSpaceTile, {
    Key? key,
    required this.size,
  }) : super(key: key);

  final Tile tile;
  final Tile whiteSpaceTile;
  final double size;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Widget child = SizedBox.square(
      dimension: size,
      child: _TileContent(
        tile: tile,
        whiteSpaceTile: whiteSpaceTile,
      ),
    );

    if (tile.isTileMovable(whiteSpaceTile)) {
      child = GestureDetector(
        onTap: () => PuzzleVm.instance.tileTapped(tile),
        child: _TileHover(child: child),
      );
    }
    return _AnimatedTile(
      position: tile.currentPosition,
      child: child,
    );
  }
}

class _TileContent extends StatelessWidget {
  const _TileContent({
    Key? key,
    required this.tile,
    required this.whiteSpaceTile,
  }) : super(key: key);

  final Tile tile;
  final Tile whiteSpaceTile;

  @override
  Widget build(BuildContext context) {
    Widget? child;
    if (tile.isTileMovable(whiteSpaceTile)) {
      child = Align(
        alignment: Alignment.topRight,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: FractionallySizedBox(
            widthFactor: 0.2,
            heightFactor: 0.2,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: AutoSizeText(
                  '${tile.numVotes}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 50,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    }

    return _TileBackground(
      tileValue: tile.value,
      child: child,
    );
  }
}

class _TileBackground extends HookConsumerWidget {
  const _TileBackground({
    Key? key,
    required this.child,
    required this.tileValue,
  }) : super(key: key);

  final Widget? child;
  final int tileValue;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final image = ref.watch(imageForTileByValueProvider(tileValue));
    return Container(
      margin: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(image: image.image, fit: BoxFit.cover),
      ),
      child: child,
    );
  }
}

class _AnimatedTile extends HookConsumerWidget {
  const _AnimatedTile({
    Key? key,
    required this.child,
    required this.position,
  }) : super(key: key);

  final Widget child;
  final Position position;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final numDimensions = ref.watch(puzzleDimensionsProvider);

    return AnimatedAlign(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOut,
      alignment: FractionalOffset(
        (position.x - 1) / (numDimensions - 1),
        (position.y - 1) / (numDimensions - 1),
      ),
      child: child,
    );
  }
}

class _TileHover extends HookWidget {
  const _TileHover({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final isHovering = useState(false);

    return MouseRegion(
      onEnter: (_) => isHovering.value = true,
      onExit: (_) => isHovering.value = false,
      child: AnimatedScale(
        duration: const Duration(milliseconds: 150),
        scale: isHovering.value ? 0.8 : 1,
        child: child,
      ),
    );
  }
}
