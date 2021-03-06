///
//  Generated code. Do not modify.
//  source: puzzle/v1/puzzle.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'puzzle.pb.dart' as $0;
export 'puzzle.pb.dart';

class PuzzleV1ServiceClient extends $grpc.Client {
  static final _$subscribeToPuzzle = $grpc.ClientMethod<$0.SubscribeToPuzzleRequest, $0.SubscribeToPuzzleResponse>(
      '/puzzle.v1.PuzzleV1Service/SubscribeToPuzzle',
      ($0.SubscribeToPuzzleRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.SubscribeToPuzzleResponse.fromBuffer(value));
  static final _$voteForTile = $grpc.ClientMethod<$0.VoteForTileRequest, $0.VoteForTileResponse>(
      '/puzzle.v1.PuzzleV1Service/VoteForTile',
      ($0.VoteForTileRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.VoteForTileResponse.fromBuffer(value));
  static final _$updatePointerPosition =
      $grpc.ClientMethod<$0.UpdatePointerPositionRequest, $0.UpdatePointerPositionResponse>(
          '/puzzle.v1.PuzzleV1Service/UpdatePointerPosition',
          ($0.UpdatePointerPositionRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.UpdatePointerPositionResponse.fromBuffer(value));
  static final _$updatePointerSettings =
      $grpc.ClientMethod<$0.UpdatePointerSettingsRequest, $0.UpdatePointerSettingsResponse>(
          '/puzzle.v1.PuzzleV1Service/UpdatePointerSettings',
          ($0.UpdatePointerSettingsRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.UpdatePointerSettingsResponse.fromBuffer(value));

  PuzzleV1ServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options, $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseStream<$0.SubscribeToPuzzleResponse> subscribeToPuzzle($0.SubscribeToPuzzleRequest request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$subscribeToPuzzle, $async.Stream.fromIterable([request]), options: options);
  }

  $grpc.ResponseFuture<$0.VoteForTileResponse> voteForTile($0.VoteForTileRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$voteForTile, request, options: options);
  }

  $grpc.ResponseFuture<$0.UpdatePointerPositionResponse> updatePointerPosition($0.UpdatePointerPositionRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updatePointerPosition, request, options: options);
  }

  $grpc.ResponseFuture<$0.UpdatePointerSettingsResponse> updatePointerSettings($0.UpdatePointerSettingsRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updatePointerSettings, request, options: options);
  }
}

abstract class PuzzleV1ServiceBase extends $grpc.Service {
  $core.String get $name => 'puzzle.v1.PuzzleV1Service';

  PuzzleV1ServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.SubscribeToPuzzleRequest, $0.SubscribeToPuzzleResponse>(
        'SubscribeToPuzzle',
        subscribeToPuzzle_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $0.SubscribeToPuzzleRequest.fromBuffer(value),
        ($0.SubscribeToPuzzleResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.VoteForTileRequest, $0.VoteForTileResponse>(
        'VoteForTile',
        voteForTile_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.VoteForTileRequest.fromBuffer(value),
        ($0.VoteForTileResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.UpdatePointerPositionRequest, $0.UpdatePointerPositionResponse>(
        'UpdatePointerPosition',
        updatePointerPosition_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.UpdatePointerPositionRequest.fromBuffer(value),
        ($0.UpdatePointerPositionResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.UpdatePointerSettingsRequest, $0.UpdatePointerSettingsResponse>(
        'UpdatePointerSettings',
        updatePointerSettings_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.UpdatePointerSettingsRequest.fromBuffer(value),
        ($0.UpdatePointerSettingsResponse value) => value.writeToBuffer()));
  }

  $async.Stream<$0.SubscribeToPuzzleResponse> subscribeToPuzzle_Pre(
      $grpc.ServiceCall call, $async.Future<$0.SubscribeToPuzzleRequest> request) async* {
    yield* subscribeToPuzzle(call, await request);
  }

  $async.Future<$0.VoteForTileResponse> voteForTile_Pre(
      $grpc.ServiceCall call, $async.Future<$0.VoteForTileRequest> request) async {
    return voteForTile(call, await request);
  }

  $async.Future<$0.UpdatePointerPositionResponse> updatePointerPosition_Pre(
      $grpc.ServiceCall call, $async.Future<$0.UpdatePointerPositionRequest> request) async {
    return updatePointerPosition(call, await request);
  }

  $async.Future<$0.UpdatePointerSettingsResponse> updatePointerSettings_Pre(
      $grpc.ServiceCall call, $async.Future<$0.UpdatePointerSettingsRequest> request) async {
    return updatePointerSettings(call, await request);
  }

  $async.Stream<$0.SubscribeToPuzzleResponse> subscribeToPuzzle(
      $grpc.ServiceCall call, $0.SubscribeToPuzzleRequest request);
  $async.Future<$0.VoteForTileResponse> voteForTile($grpc.ServiceCall call, $0.VoteForTileRequest request);
  $async.Future<$0.UpdatePointerPositionResponse> updatePointerPosition(
      $grpc.ServiceCall call, $0.UpdatePointerPositionRequest request);
  $async.Future<$0.UpdatePointerSettingsResponse> updatePointerSettings(
      $grpc.ServiceCall call, $0.UpdatePointerSettingsRequest request);
}
