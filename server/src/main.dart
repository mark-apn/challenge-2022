import 'dart:async';

import 'package:fixnum/fixnum.dart';
import 'package:grpc/grpc.dart';

import 'generated/puzzle/v1/puzzle.pbgrpc.dart';

Future<void> main(List<String> args) async {
  final server = Server(
    [PuzzleV1Service()],
    const <Interceptor>[],
    CodecRegistry(codecs: const [
      GzipCodec(),
      IdentityCodec(),
    ]),
  );
  await server.serve(port: 50051);
  print('Server listening on port ${server.port}...');
}

class PuzzleV1Service extends PuzzleV1ServiceBase {
  @override
  Stream<SubscribeToPuzzleResponse> subscribeToPuzzle(ServiceCall call, SubscribeToPuzzleRequest request) async* {
    print('User connected ${request.userId}');

    while (!call.isCanceled) {
      await Future.delayed(Duration(seconds: 1));
      yield SubscribeToPuzzleResponse()
        ..puzzle = Puzzle(
          lastUpdated: Int64(DateTime.now().millisecondsSinceEpoch),
          puzzle: 'ID',
          voters: ['user1', 'user2'],
        );
    }
  }

  @override
  Future<VoteForTileResponse> voteForTile(ServiceCall call, VoteForTileRequest request) {
    // TODO: implement voteForTile
    throw UnimplementedError();
  }
}
