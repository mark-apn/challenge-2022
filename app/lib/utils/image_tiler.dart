import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import "package:universal_html/html.dart" as html;

const cropImagemimeType = 'image/png';

class ImageTiler {
  late ui.Image _bitmap;
  late Size _bitmapSize;

  final int _rows;
  final int _columns;

  ImageTiler({
    required int rows,
    required int columns,
  })  : _rows = rows,
        _columns = columns;

  set image(ui.Image image) {
    _bitmap = image;
    _bitmapSize = Size(
      _bitmap.width.toDouble(),
      _bitmap.height.toDouble(),
    );
  }

  Future<List<Uint8List>> getTiles() async {
    final tiles = <Uint8List>[];

    html.ImageElement? element;
    if (kIsWeb) {
      final byteData = await _bitmap.toByteData(format: ui.ImageByteFormat.png);
      final uint8List = byteData!.buffer.asUint8List(byteData.offsetInBytes, byteData.lengthInBytes);

      final imageBase64 = base64Encode(uint8List);

      element = html.ImageElement();
      element.src = 'data:$cropImagemimeType;base64,$imageBase64';

      await element.onLoad.first; // allow time for browser to render
    }

    for (int row = 0; row < _rows; row++) {
      for (int column = 0; column < _columns; column++) {
        tiles.add(await croppedImage(row, column, element: element));
      }
    }

    return tiles;
  }

  Future<Uint8List> croppedImage(int rowIndex, int columnIndex, {html.ImageElement? element}) async {
    final offset = Offset(
      columnIndex * _bitmapSize.width / _columns,
      rowIndex * _bitmapSize.height / _rows,
    );

    final size = Size(
      _bitmapSize.width / _columns,
      _bitmapSize.height / _rows,
    );

    if (kIsWeb) {
      assert(element != null);

      // This is performant on web
      return _htmlCanvasCropping(offset, size, element!);
    } else {
      // This is performant on desktop and mobile
      return _croppedBitmap(offset, size);
    }
  }

  Future<Uint8List> _htmlCanvasCropping(Offset offset, Size size, html.ImageElement element) async {
    final width = size.width.round();
    final height = size.height.round();

    final canvasEl = html.CanvasElement(width: width, height: height);
    final canvas = canvasEl.context2D;

    canvas.drawImageToRect(
      element,
      html.Rectangle(0, 0, width, height),
      sourceRect: html.Rectangle(offset.dx, offset.dy, width, height),
    );

    return _getBlobData(await canvasEl.toBlob(cropImagemimeType));
  }

  Future<Uint8List> _getBlobData(html.Blob blob) {
    final completer = Completer<Uint8List>();
    final reader = html.FileReader();
    reader.readAsArrayBuffer(blob);
    reader.onLoad.listen((_) => completer.complete(reader.result as Uint8List));
    return completer.future;
  }

  Future<Uint8List> _croppedBitmap(Offset offset, Size size) async {
    final pictureRecorder = ui.PictureRecorder();
    Canvas(pictureRecorder).drawImageRect(
      _bitmap,
      offset & size,
      Offset.zero & size,
      Paint()..filterQuality = FilterQuality.high,
    );
    final image = await pictureRecorder.endRecording().toImage(
          size.width.round(),
          size.height.round(),
        );

    final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    final uint8List = byteData!.buffer.asUint8List(byteData.offsetInBytes, byteData.lengthInBytes);

    return uint8List;
  }

  Future<List<Uint8List>> tile(Image uiImage) async {
    final completer = Completer<List<Uint8List>>();
    final config = uiImage.image.resolve(const ImageConfiguration());

    config.addListener(
      ImageStreamListener(
        (ImageInfo info, __) {
          image = info.image;

          getTiles().then((tiles) {
            if (!completer.isCompleted) {
              completer.complete(tiles);
            }
          });
        },
        onError: completer.completeError,
      ),
    );

    return completer.future;
  }
}
