import 'package:flutter/material.dart';
import 'package:flutter_challenge/state/providers.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared/shared.dart';

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
          children: const [
            SizedBox(height: 20),
            Text('Flutter Challenge'),
            Expanded(
              child: Center(
                child: FractionallySizedBox(
                  widthFactor: 0.8,
                  heightFactor: 0.8,
                  child: Center(child: _PuzzleView()),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PuzzleView extends ConsumerWidget {
  const _PuzzleView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final puzzleState = ref.watch(puzzleProvider);

    if (puzzleState.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (puzzleState.isError) {
      return const Center(child: Text('Error'));
    }

    return GridView.count(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: puzzleState.puzzle.getDimension(),
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      children: puzzleState.puzzle.tiles.map((e) => _Tile(e)).toList(),
    );
  }
}

class _Tile extends StatelessWidget {
  const _Tile(this.tile, {Key? key}) : super(key: key);

  final Tile tile;

  @override
  Widget build(BuildContext context) {
    return tile.isWhitespace ? Center(child: Text(tile.currentPosition.toString())) : _TappableTile(tile);
  }
}

class _TappableTile extends ConsumerWidget {
  const _TappableTile(this.tile, {Key? key}) : super(key: key);

  final Tile tile;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () => ref.read(puzzleVM).tileTapped(tile),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.orange,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Column(children: [
            Text("${tile.value}"),
            Text("${tile.numVotes} votes"),
            Text(tile.currentPosition.toString()),
          ]),
        ),
      ),
    );
  }
}
