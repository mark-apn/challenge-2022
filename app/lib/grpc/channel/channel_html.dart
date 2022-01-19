import 'package:grpc/grpc_connection_interface.dart';
import 'package:grpc/grpc_web.dart';

ClientChannelBase createNewGrpcChannel(bool secure, String host, int port) {
  return GrpcWebClientChannel.xhr(Uri.parse('${secure ? 'https' : 'http'}://$host'));
}
