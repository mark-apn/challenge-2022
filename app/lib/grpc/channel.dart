import 'package:grpc/grpc_connection_interface.dart';

import 'channel/channel_stub.dart'
    if (dart.library.html) 'channel/channel_html.dart'
    if (dart.library.io) 'channel/channel_io.dart';

const _local = String.fromEnvironment('env', defaultValue: 'production') == 'local';
const _grpcHost = _local ? 'localhost' : 'grpc.nicepants.dev';
const _secure = !_local;
const _grpcPort = 50000;

class GrpcChannelBuilder {
  ClientChannelBase get build => createNewGrpcChannel(_local, _secure, _grpcHost, _grpcPort);
}

