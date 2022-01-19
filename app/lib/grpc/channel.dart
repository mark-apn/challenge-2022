import 'package:grpc/grpc_connection_interface.dart';

import 'channel/channel_stub.dart'
    if (dart.library.html) 'channel/channel_html.dart'
    if (dart.library.io) 'channel/channel_io.dart';

// const _grpcHost = 'localhost';
// const _secure = false;

const _local = false;

const _envoyContainerPort = 5000;
const _remotePort = 50000;

const _grpcHost = _local ? 'localhost' : 'app.flutterdev.com';
const _secure = !_local;
const _grpcPort = _local ? _envoyContainerPort : _remotePort;

class GrpcChannelBuilder {
  ClientChannelBase get build => createNewGrpcChannel(_secure, _grpcHost, _grpcPort);
}
