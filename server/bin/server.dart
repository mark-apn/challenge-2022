import 'dart:async';

import 'package:flutter_challenge_server/env.dart';
import 'package:flutter_challenge_server/src/puzzle_service.dart';
import 'package:grpc/grpc.dart';

Future<void> main(List<String> args) async {
  // Instantiate environment variables from arguments.
  Env.instance.init(args);

  // * Setup gRPC server
  final server = Server(
    // * Services
    [PuzzleV1Service()],
    // * Interceptors
    const [],
    // * Codecs
    CodecRegistry(codecs: const [GzipCodec()]),
  );

  // * Serve
  await server.serve(port: Env.instance.serverPort);

  print('Server listening on port ${server.port}...');
}

FutureOr<GrpcError?> logInterceptor(ServiceCall call, ServiceMethod method) {
  print('Intercepted: ${call.clientMetadata}');
  return null;
}
