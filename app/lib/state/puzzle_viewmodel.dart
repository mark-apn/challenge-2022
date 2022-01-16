import 'package:flutter_challenge/client.dart';
import 'package:shared/shared.dart';

class PuzzleVm {
  static final PuzzleVm instance = PuzzleVm._internal();

  PuzzleVm._internal();

  // * Send vote to server via client
  Future<void> tileTapped(Tile tappedTile) async {
    await GrpcClient.instance.voteOnTile(tappedTile.value);
  }
}
