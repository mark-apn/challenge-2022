import 'package:flutter_challenge/client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared/shared.dart';

class PuzzleViewModel {
  final Reader read;

  PuzzleViewModel(this.read);

  void tileTapped(Tile tappedTile) {
    // * Send vote to server via client
    GrpcClient.instance.voteOnTile(tappedTile.value);
  }
}
