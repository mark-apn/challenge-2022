import 'package:flutter/material.dart';
import 'package:flutter_challenge/models/tile.dart';
import 'package:flutter_challenge/state/providers.dart';
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
        backgroundColor: Colors.black87,
        body: Column(
          children: const [
            SizedBox(height: 20),
            Text(
              'Flutter Challenge',
              style: TextStyle(color: Colors.amber),
            ),
            Expanded(
              child: Center(
                child: FractionallySizedBox(
                  widthFactor: 0.8,
                  heightFactor: 0.8,
                  child: Center(
                    child: _ImagePuzzleLoader(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ImagePuzzleLoader extends HookConsumerWidget {
  const _ImagePuzzleLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(imagesProvider).when(
          loading: () => const Center(
            child: CircularProgressIndicator(
              color: Colors.amber,
            ),
          ),
          error: (error, _) => Center(child: Text(error.toString())),
          data: (data) => _ImagePuzzle(images: data),
        );
  }
}

class _ImagePuzzle extends ConsumerWidget {
  const _ImagePuzzle({
    Key? key,
    required this.images,
  }) : super(key: key);

  final List<Image> images;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final puzzleState = ref.watch(puzzleProvider);
    return GridView.count(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: puzzleState.puzzle.getDimension(),
      mainAxisSpacing: 2,
      crossAxisSpacing: 2,
      children: puzzleState.puzzle.tiles.map((e) => _Tile(e, image: images[e.value - 1])).toList(),
    );
  }
}

class _Tile extends StatelessWidget {
  const _Tile(this.tile, {Key? key, this.image}) : super(key: key);

  final Tile tile;
  final Image? image;

  @override
  Widget build(BuildContext context) {
    return tile.isWhitespace ? const SizedBox.shrink() : _TappableTile(tile, image: image);
  }
}

class _TappableTile extends ConsumerWidget {
  const _TappableTile(this.tile, {Key? key, this.image}) : super(key: key);

  final Tile tile;
  final Image? image;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () => ref.read(puzzleViewModel).tileTapped(tile),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: image != null ? DecorationImage(image: image!.image, fit: BoxFit.cover) : null,
        ),
        // child: Center(
        //   child: Text("${tile.value}"),
        // ),
      ),
    );
  }
}
