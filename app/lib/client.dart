import 'package:flutter_challenge/generated/puzzle/v1/puzzle.pbgrpc.dart';
import 'package:grpc/grpc.dart';

class GrpcClient {
  final channel = ClientChannel(
    '127.0.0.1',
    port: 50051,
    options: const ChannelOptions(
      credentials: ChannelCredentials.insecure(),
    ),
  );

  Stream<Puzzle> subscribeToPuzzle() {
    final client = PuzzleV1ServiceClient(channel);
    final call = client.subscribeToPuzzle(SubscribeToPuzzleRequest(userId: 'user1'));
    return call.map((event) => event.puzzle);
  }

  void close() {
    channel.shutdown();
  }
}
