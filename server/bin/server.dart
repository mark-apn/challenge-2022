import 'dart:async';

import 'package:args/args.dart';
import 'package:flutter_challenge_server/main.dart';
import 'package:grpc/grpc.dart';

Future<void> main(List<String> args) async {
  // * Parse options
  final parser = ArgParser();
  parser.addOption('port', abbr: 'p', defaultsTo: '80');
  final arguments = parser.parse(args);

  // * Setup gRPC server
  final server = Server(
    // * Services
    [
      PuzzleV1Service(),
    ],
    // * Interceptors
    [
      logInterceptor,
    ],
    CodecRegistry(codecs: const [GzipCodec()]),
  );

  // * Serve
  await server.serve(port: int.parse(arguments['port'] as String));

  print('Server listening on port ${server.port}...');
}

FutureOr<GrpcError?> logInterceptor(ServiceCall call, ServiceMethod method) {
  print('Intercepted: ${call.clientMetadata}');
  return null;
}
