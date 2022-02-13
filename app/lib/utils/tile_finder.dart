import 'package:shared/models/models.dart';

class TileFinder {
  TileFinder(this.tiles) : whiteSpaceTile = tiles.firstWhere((element) => element.isWhitespace);

  final List<Tile> tiles;
  final Tile whiteSpaceTile;

  // Return the tile if its above the whitespace tile on the same x axis.
  Tile? votableAboveWhitespace() {
    return _findOrNull((element) {
      final sameX = element.currentPosition.x == whiteSpaceTile.currentPosition.x;
      final above = element.currentPosition.y + 1 == whiteSpaceTile.currentPosition.y;

      return sameX && above;
    });
  }

  // Return the tile if its below the whitespace tile on the same x axis.
  Tile? votableBelowWhitespace() {
    return _findOrNull((element) {
      final sameX = element.currentPosition.x == whiteSpaceTile.currentPosition.x;
      final below = element.currentPosition.y - 1 == whiteSpaceTile.currentPosition.y;

      return sameX && below;
    });
  }

  // Return the tile if its to the right of the whitespace tile on the same y axis.
  Tile? votableRightFromWhitespace() {
    return _findOrNull((element) {
      final sameY = element.currentPosition.y == whiteSpaceTile.currentPosition.y;
      final right = element.currentPosition.x - 1 == whiteSpaceTile.currentPosition.x;

      return sameY && right;
    });
  }

  // Return the tile if its to the left of the whitespace tile on the same y axis.
  Tile? votableLeftFromWhitespace() {
    return _findOrNull((element) {
      final sameY = element.currentPosition.y == whiteSpaceTile.currentPosition.y;
      final left = element.currentPosition.x + 1 == whiteSpaceTile.currentPosition.x;

      return sameY && left;
    });
  }

  Tile? _findOrNull(bool Function(Tile) predicate) {
    final index = tiles.indexWhere(predicate);
    return index == -1 ? null : tiles[index];
  }
}
