import 'package:grpc/grpc_connection_interface.dart';

import 'channel/channel_stub.dart'
    if (dart.library.html) 'channel/channel_html.dart'
    if (dart.library.io) 'channel/channel_io.dart';

const _grpcHost = 'grpc.flutterdev.com';
const _grpcPort = 80;

class GrpcChannelBuilder {
  ClientChannelBase get build => createNewGrpcChannel(_grpcHost, _grpcPort);
}
