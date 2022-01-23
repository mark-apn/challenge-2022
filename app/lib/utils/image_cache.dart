import 'dart:typed_data';

class ImageCache {
  static final ImageCache instance = ImageCache._internal();

  ImageCache._internal();

  // Stores the image in the memory cache converted to a String
  final memoryCache = <int, String>{};

  void store(int index, Uint8List? image) {
    if (image == null) {
      return;
    }
    final s = String.fromCharCodes(image);
    memoryCache[index] = s;
  }

  Uint8List? get(int index) {
    final s = memoryCache[index];
    if (s == null) {
      return null;
    }
    return Uint8List.fromList(s.codeUnits);
  }
}
