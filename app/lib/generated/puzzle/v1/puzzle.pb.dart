///
//  Generated code. Do not modify.
//  source: puzzle/v1/puzzle.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'puzzle.pbenum.dart';

export 'puzzle.pbenum.dart';

class KeepAliveRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'KeepAliveRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'puzzle.v1'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userId')
    ..hasRequiredFields = false
  ;

  KeepAliveRequest._() : super();
  factory KeepAliveRequest({
    $core.String? userId,
  }) {
    final _result = create();
    if (userId != null) {
      _result.userId = userId;
    }
    return _result;
  }
  factory KeepAliveRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory KeepAliveRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  KeepAliveRequest clone() => KeepAliveRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  KeepAliveRequest copyWith(void Function(KeepAliveRequest) updates) => super.copyWith((message) => updates(message as KeepAliveRequest)) as KeepAliveRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static KeepAliveRequest create() => KeepAliveRequest._();
  KeepAliveRequest createEmptyInstance() => create();
  static $pb.PbList<KeepAliveRequest> createRepeated() => $pb.PbList<KeepAliveRequest>();
  @$core.pragma('dart2js:noInline')
  static KeepAliveRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<KeepAliveRequest>(create);
  static KeepAliveRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => clearField(1);
}

class KeepAliveResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'KeepAliveResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'puzzle.v1'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  KeepAliveResponse._() : super();
  factory KeepAliveResponse() => create();
  factory KeepAliveResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory KeepAliveResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  KeepAliveResponse clone() => KeepAliveResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  KeepAliveResponse copyWith(void Function(KeepAliveResponse) updates) => super.copyWith((message) => updates(message as KeepAliveResponse)) as KeepAliveResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static KeepAliveResponse create() => KeepAliveResponse._();
  KeepAliveResponse createEmptyInstance() => create();
  static $pb.PbList<KeepAliveResponse> createRepeated() => $pb.PbList<KeepAliveResponse>();
  @$core.pragma('dart2js:noInline')
  static KeepAliveResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<KeepAliveResponse>(create);
  static KeepAliveResponse? _defaultInstance;
}

class SubscribeToPuzzleRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SubscribeToPuzzleRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'puzzle.v1'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userId')
    ..hasRequiredFields = false
  ;

  SubscribeToPuzzleRequest._() : super();
  factory SubscribeToPuzzleRequest({
    $core.String? userId,
  }) {
    final _result = create();
    if (userId != null) {
      _result.userId = userId;
    }
    return _result;
  }
  factory SubscribeToPuzzleRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SubscribeToPuzzleRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SubscribeToPuzzleRequest clone() => SubscribeToPuzzleRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SubscribeToPuzzleRequest copyWith(void Function(SubscribeToPuzzleRequest) updates) => super.copyWith((message) => updates(message as SubscribeToPuzzleRequest)) as SubscribeToPuzzleRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SubscribeToPuzzleRequest create() => SubscribeToPuzzleRequest._();
  SubscribeToPuzzleRequest createEmptyInstance() => create();
  static $pb.PbList<SubscribeToPuzzleRequest> createRepeated() => $pb.PbList<SubscribeToPuzzleRequest>();
  @$core.pragma('dart2js:noInline')
  static SubscribeToPuzzleRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SubscribeToPuzzleRequest>(create);
  static SubscribeToPuzzleRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => clearField(1);
}

class SubscribeToPuzzleResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SubscribeToPuzzleResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'puzzle.v1'), createEmptyInstance: create)
    ..aOM<PuzzleMessage>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'puzzle', subBuilder: PuzzleMessage.create)
    ..hasRequiredFields = false
  ;

  SubscribeToPuzzleResponse._() : super();
  factory SubscribeToPuzzleResponse({
    PuzzleMessage? puzzle,
  }) {
    final _result = create();
    if (puzzle != null) {
      _result.puzzle = puzzle;
    }
    return _result;
  }
  factory SubscribeToPuzzleResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SubscribeToPuzzleResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SubscribeToPuzzleResponse clone() => SubscribeToPuzzleResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SubscribeToPuzzleResponse copyWith(void Function(SubscribeToPuzzleResponse) updates) => super.copyWith((message) => updates(message as SubscribeToPuzzleResponse)) as SubscribeToPuzzleResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SubscribeToPuzzleResponse create() => SubscribeToPuzzleResponse._();
  SubscribeToPuzzleResponse createEmptyInstance() => create();
  static $pb.PbList<SubscribeToPuzzleResponse> createRepeated() => $pb.PbList<SubscribeToPuzzleResponse>();
  @$core.pragma('dart2js:noInline')
  static SubscribeToPuzzleResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SubscribeToPuzzleResponse>(create);
  static SubscribeToPuzzleResponse? _defaultInstance;

  @$pb.TagNumber(1)
  PuzzleMessage get puzzle => $_getN(0);
  @$pb.TagNumber(1)
  set puzzle(PuzzleMessage v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasPuzzle() => $_has(0);
  @$pb.TagNumber(1)
  void clearPuzzle() => clearField(1);
  @$pb.TagNumber(1)
  PuzzleMessage ensurePuzzle() => $_ensure(0);
}

class VoteForTileRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'VoteForTileRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'puzzle.v1'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userId')
    ..a<$core.int>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'tileValue', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  VoteForTileRequest._() : super();
  factory VoteForTileRequest({
    $core.String? userId,
    $core.int? tileValue,
  }) {
    final _result = create();
    if (userId != null) {
      _result.userId = userId;
    }
    if (tileValue != null) {
      _result.tileValue = tileValue;
    }
    return _result;
  }
  factory VoteForTileRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory VoteForTileRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  VoteForTileRequest clone() => VoteForTileRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  VoteForTileRequest copyWith(void Function(VoteForTileRequest) updates) => super.copyWith((message) => updates(message as VoteForTileRequest)) as VoteForTileRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static VoteForTileRequest create() => VoteForTileRequest._();
  VoteForTileRequest createEmptyInstance() => create();
  static $pb.PbList<VoteForTileRequest> createRepeated() => $pb.PbList<VoteForTileRequest>();
  @$core.pragma('dart2js:noInline')
  static VoteForTileRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<VoteForTileRequest>(create);
  static VoteForTileRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => clearField(1);

  @$pb.TagNumber(3)
  $core.int get tileValue => $_getIZ(1);
  @$pb.TagNumber(3)
  set tileValue($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(3)
  $core.bool hasTileValue() => $_has(1);
  @$pb.TagNumber(3)
  void clearTileValue() => clearField(3);
}

class VoteForTileResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'VoteForTileResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'puzzle.v1'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  VoteForTileResponse._() : super();
  factory VoteForTileResponse() => create();
  factory VoteForTileResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory VoteForTileResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  VoteForTileResponse clone() => VoteForTileResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  VoteForTileResponse copyWith(void Function(VoteForTileResponse) updates) => super.copyWith((message) => updates(message as VoteForTileResponse)) as VoteForTileResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static VoteForTileResponse create() => VoteForTileResponse._();
  VoteForTileResponse createEmptyInstance() => create();
  static $pb.PbList<VoteForTileResponse> createRepeated() => $pb.PbList<VoteForTileResponse>();
  @$core.pragma('dart2js:noInline')
  static VoteForTileResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<VoteForTileResponse>(create);
  static VoteForTileResponse? _defaultInstance;
}

class PuzzleMessage extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'PuzzleMessage', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'puzzle.v1'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aInt64(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'createdAt')
    ..aInt64(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'updatedAt')
    ..pc<TileMessage>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'tiles', $pb.PbFieldType.PM, subBuilder: TileMessage.create)
    ..e<PuzzleMessage_PuzzleStatus>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'status', $pb.PbFieldType.OE, defaultOrMaker: PuzzleMessage_PuzzleStatus.PUZZLE_STATUS_UNSPECIFIED, valueOf: PuzzleMessage_PuzzleStatus.valueOf, enumValues: PuzzleMessage_PuzzleStatus.values)
    ..a<$core.int>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'numMoves', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  PuzzleMessage._() : super();
  factory PuzzleMessage({
    $core.String? id,
    $fixnum.Int64? createdAt,
    $fixnum.Int64? updatedAt,
    $core.Iterable<TileMessage>? tiles,
    PuzzleMessage_PuzzleStatus? status,
    $core.int? numMoves,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (createdAt != null) {
      _result.createdAt = createdAt;
    }
    if (updatedAt != null) {
      _result.updatedAt = updatedAt;
    }
    if (tiles != null) {
      _result.tiles.addAll(tiles);
    }
    if (status != null) {
      _result.status = status;
    }
    if (numMoves != null) {
      _result.numMoves = numMoves;
    }
    return _result;
  }
  factory PuzzleMessage.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PuzzleMessage.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PuzzleMessage clone() => PuzzleMessage()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PuzzleMessage copyWith(void Function(PuzzleMessage) updates) => super.copyWith((message) => updates(message as PuzzleMessage)) as PuzzleMessage; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PuzzleMessage create() => PuzzleMessage._();
  PuzzleMessage createEmptyInstance() => create();
  static $pb.PbList<PuzzleMessage> createRepeated() => $pb.PbList<PuzzleMessage>();
  @$core.pragma('dart2js:noInline')
  static PuzzleMessage getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PuzzleMessage>(create);
  static PuzzleMessage? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get createdAt => $_getI64(1);
  @$pb.TagNumber(2)
  set createdAt($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasCreatedAt() => $_has(1);
  @$pb.TagNumber(2)
  void clearCreatedAt() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get updatedAt => $_getI64(2);
  @$pb.TagNumber(3)
  set updatedAt($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasUpdatedAt() => $_has(2);
  @$pb.TagNumber(3)
  void clearUpdatedAt() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<TileMessage> get tiles => $_getList(3);

  @$pb.TagNumber(5)
  PuzzleMessage_PuzzleStatus get status => $_getN(4);
  @$pb.TagNumber(5)
  set status(PuzzleMessage_PuzzleStatus v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasStatus() => $_has(4);
  @$pb.TagNumber(5)
  void clearStatus() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get numMoves => $_getIZ(5);
  @$pb.TagNumber(6)
  set numMoves($core.int v) { $_setSignedInt32(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasNumMoves() => $_has(5);
  @$pb.TagNumber(6)
  void clearNumMoves() => clearField(6);
}

class TileMessage extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'TileMessage', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'puzzle.v1'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'value', $pb.PbFieldType.O3)
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'numVotes', $pb.PbFieldType.O3)
    ..aOM<TilePosition>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'currentPosition', subBuilder: TilePosition.create)
    ..aOM<TilePosition>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'correctPosition', subBuilder: TilePosition.create)
    ..aOB(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'isWhitespace')
    ..hasRequiredFields = false
  ;

  TileMessage._() : super();
  factory TileMessage({
    $core.int? value,
    $core.int? numVotes,
    TilePosition? currentPosition,
    TilePosition? correctPosition,
    $core.bool? isWhitespace,
  }) {
    final _result = create();
    if (value != null) {
      _result.value = value;
    }
    if (numVotes != null) {
      _result.numVotes = numVotes;
    }
    if (currentPosition != null) {
      _result.currentPosition = currentPosition;
    }
    if (correctPosition != null) {
      _result.correctPosition = correctPosition;
    }
    if (isWhitespace != null) {
      _result.isWhitespace = isWhitespace;
    }
    return _result;
  }
  factory TileMessage.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TileMessage.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TileMessage clone() => TileMessage()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TileMessage copyWith(void Function(TileMessage) updates) => super.copyWith((message) => updates(message as TileMessage)) as TileMessage; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TileMessage create() => TileMessage._();
  TileMessage createEmptyInstance() => create();
  static $pb.PbList<TileMessage> createRepeated() => $pb.PbList<TileMessage>();
  @$core.pragma('dart2js:noInline')
  static TileMessage getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TileMessage>(create);
  static TileMessage? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get value => $_getIZ(0);
  @$pb.TagNumber(1)
  set value($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasValue() => $_has(0);
  @$pb.TagNumber(1)
  void clearValue() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get numVotes => $_getIZ(1);
  @$pb.TagNumber(2)
  set numVotes($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasNumVotes() => $_has(1);
  @$pb.TagNumber(2)
  void clearNumVotes() => clearField(2);

  @$pb.TagNumber(3)
  TilePosition get currentPosition => $_getN(2);
  @$pb.TagNumber(3)
  set currentPosition(TilePosition v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasCurrentPosition() => $_has(2);
  @$pb.TagNumber(3)
  void clearCurrentPosition() => clearField(3);
  @$pb.TagNumber(3)
  TilePosition ensureCurrentPosition() => $_ensure(2);

  @$pb.TagNumber(4)
  TilePosition get correctPosition => $_getN(3);
  @$pb.TagNumber(4)
  set correctPosition(TilePosition v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasCorrectPosition() => $_has(3);
  @$pb.TagNumber(4)
  void clearCorrectPosition() => clearField(4);
  @$pb.TagNumber(4)
  TilePosition ensureCorrectPosition() => $_ensure(3);

  @$pb.TagNumber(5)
  $core.bool get isWhitespace => $_getBF(4);
  @$pb.TagNumber(5)
  set isWhitespace($core.bool v) { $_setBool(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasIsWhitespace() => $_has(4);
  @$pb.TagNumber(5)
  void clearIsWhitespace() => clearField(5);
}

class TilePosition extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'TilePosition', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'puzzle.v1'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'x', $pb.PbFieldType.O3)
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'y', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  TilePosition._() : super();
  factory TilePosition({
    $core.int? x,
    $core.int? y,
  }) {
    final _result = create();
    if (x != null) {
      _result.x = x;
    }
    if (y != null) {
      _result.y = y;
    }
    return _result;
  }
  factory TilePosition.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TilePosition.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TilePosition clone() => TilePosition()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TilePosition copyWith(void Function(TilePosition) updates) => super.copyWith((message) => updates(message as TilePosition)) as TilePosition; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TilePosition create() => TilePosition._();
  TilePosition createEmptyInstance() => create();
  static $pb.PbList<TilePosition> createRepeated() => $pb.PbList<TilePosition>();
  @$core.pragma('dart2js:noInline')
  static TilePosition getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TilePosition>(create);
  static TilePosition? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get x => $_getIZ(0);
  @$pb.TagNumber(1)
  set x($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasX() => $_has(0);
  @$pb.TagNumber(1)
  void clearX() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get y => $_getIZ(1);
  @$pb.TagNumber(2)
  set y($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasY() => $_has(1);
  @$pb.TagNumber(2)
  void clearY() => clearField(2);
}

