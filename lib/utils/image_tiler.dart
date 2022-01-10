import 'dart:ui' as ui;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ImageTiler {
  late ui.Image _bitmap;
  late Size _bitmapSize;

  final int _rows;
  final int _columns;

  ImageTiler(this._rows, this._columns);

  set image(ui.Image image) {
    _bitmap = image;
    _bitmapSize = Size(
      _bitmap.width.toDouble(),
      _bitmap.height.toDouble(),
    );
  }

  Future<List<Image>> getTiles() async {
    final tiles = <Image>[];
    for (int row = 0; row < _rows; row++) {
      for (int column = 0; column < _columns; column++) {
        tiles.add(await croppedImage(row, column));
      }
    }

    return tiles;
  }

  Future<ui.Image> _croppedBitmap(Offset offset, Size size) async {
    final pictureRecorder = ui.PictureRecorder();
    Canvas(pictureRecorder).drawImageRect(
      _bitmap,
      offset & size,
      Offset.zero & size,
      Paint()..filterQuality = FilterQuality.high,
    );

    return await pictureRecorder.endRecording().toImage(
          size.width.round(),
          size.height.round(),
        );
  }

  Future<Image> croppedImage(int rowIndex, int columnIndex) async {
    final offset = Offset(
      columnIndex * _bitmapSize.width / _columns,
      rowIndex * _bitmapSize.height / _rows,
    );

    final size = Size(
      _bitmapSize.width / _columns,
      _bitmapSize.height / _rows,
    );

    return Image(
      image: UiImageProvider(await _croppedBitmap(offset, size)),
      fit: BoxFit.contain,
    );
  }
}

class UiImageProvider extends ImageProvider<UiImageProvider> {
  final ui.Image image;

  const UiImageProvider(this.image);

  @override
  Future<UiImageProvider> obtainKey(ImageConfiguration configuration) => SynchronousFuture<UiImageProvider>(this);

  @override
  ImageStreamCompleter load(UiImageProvider key, DecoderCallback decode) =>
      OneFrameImageStreamCompleter(_loadAsync(key));

  Future<ImageInfo> _loadAsync(UiImageProvider key) async {
    assert(key == this);
    return ImageInfo(image: image);
  }

  @override
  bool operator ==(dynamic other) {
    if (other.runtimeType != runtimeType) return false;
    final UiImageProvider typedOther = other;
    return image == typedOther.image;
  }

  @override
  int get hashCode => image.hashCode;
}