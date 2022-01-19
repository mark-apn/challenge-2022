import 'package:grpc/grpc_connection_interface.dart';

import 'channel/channel_stub.dart'
    if (dart.library.html) 'channel/channel_html.dart'
    if (dart.library.io) 'channel/channel_io.dart';

// const _grpcHost = 'localhost';
// const _secure = false;

const _local = false;

const _grpcHost = _local ? 'localhost' : 'grpc.flutterdev.com';
const _secure = !_local;
const _grpcPort = 50000;

class GrpcChannelBuilder {
  ClientChannelBase get build => createNewGrpcChannel(_secure, _grpcHost, _grpcPort);
}
