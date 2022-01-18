
import 'package:grpc/grpc_connection_interface.dart';
import 'package:grpc/grpc_web.dart';

ClientChannelBase createNewGrpcChannel(String host, int port) {
  return GrpcWebClientChannel.xhr(Uri.parse('https://$host:$port'));
}