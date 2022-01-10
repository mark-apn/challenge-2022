import 'package:flutter/material.dart';
import 'package:flutter_challenge/models/models.dart';
import 'package:flutter_challenge/state/providers.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Challenge 2022',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: Column(
          children: [
            const SizedBox(height: 20),
            const Text('Flutter Challenge'),
            Expanded(
              child: LayoutBuilder(builder: (_, constraints) {
                final maxBoardSize =
                    constraints.maxWidth < constraints.maxHeight ? constraints.maxWidth : constraints.maxHeight;
                return _PuzzleView(boardSize: maxBoardSize);
              }),
            ),
          ],
        ),
      ),
    );
  }
}

class _PuzzleView extends ConsumerWidget {
  const _PuzzleView({Key? key, required this.boardSize}) : super(key: key);

  final double boardSize;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // * Only listen to num dimensions, not the board or tiles itself
    final numDimensions = ref.watch(puzzleProvider.select((value) => value.puzzle.getDimension()));
    final tileSize = (boardSize - 64) / numDimensions;

    return Center(
      child: Container(
        constraints: BoxConstraints(maxWidth: boardSize, maxHeight: boardSize),
        margin: const EdgeInsets.all(32.0),
        child: Stack(
          fit: StackFit.expand,
          children: List.generate(numDimensions * numDimensions, (index) => _Tile(index, tileSize)),
        ),
      ),
    );
  }
}

class _Tile extends ConsumerWidget {
  const _Tile(this.tileIndex, this.size);

  final int tileIndex;
  final double size;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tile = ref.watch(puzzleProvider.select((value) => value.puzzle.tiles.elementAt(tileIndex)));
    return tile.isWhitespace ? const SizedBox.shrink() : _TappableTile(tile, size);
  }
}

class _TappableTile extends HookConsumerWidget {
  const _TappableTile(this.tile, this.size, {Key? key}) : super(key: key);

  final Tile tile;
  final double size;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = useAnimationController(duration: const Duration(milliseconds: 200));
    final animation = useAnimation(controller);

    useEffect(
      () {
        controller.forward();
      },
      [tile.currentPosition],
    );

    return Positioned.fromRect(
      rect: _animateRect(animation),
      child: GestureDetector(
        onTap: () => ref.read(puzzleViewModel).tileTapped(tile),
        child: _BaseTile(value: tile.value),
      ),
    );
  }

  Rect _animateRect(double animation) {
    final previousRect = tile.previousPosition?.getRect(tileSize: size);
    final currentRect = tile.currentPosition.getRect(tileSize: size);
    return Rect.lerp(previousRect, currentRect, animation) ?? currentRect;
  }
}

class _BaseTile extends StatelessWidget {
  const _BaseTile({Key? key, required this.value}) : super(key: key);

  final int value;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.orange,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text("$value"),
      ),
    );
  }
}
