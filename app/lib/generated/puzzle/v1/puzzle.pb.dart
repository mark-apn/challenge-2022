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

class SubscribeToPuzzleRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SubscribeToPuzzleRequest',
      package: const $pb.PackageName($core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'puzzle.v1'),
      createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userId')
    ..hasRequiredFields = false;

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
  factory SubscribeToPuzzleRequest.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory SubscribeToPuzzleRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  SubscribeToPuzzleRequest clone() => SubscribeToPuzzleRequest()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  SubscribeToPuzzleRequest copyWith(void Function(SubscribeToPuzzleRequest) updates) =>
      super.copyWith((message) => updates(message as SubscribeToPuzzleRequest))
          as SubscribeToPuzzleRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SubscribeToPuzzleRequest create() => SubscribeToPuzzleRequest._();
  SubscribeToPuzzleRequest createEmptyInstance() => create();
  static $pb.PbList<SubscribeToPuzzleRequest> createRepeated() => $pb.PbList<SubscribeToPuzzleRequest>();
  @$core.pragma('dart2js:noInline')
  static SubscribeToPuzzleRequest getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SubscribeToPuzzleRequest>(create);
  static SubscribeToPuzzleRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => clearField(1);
}

class SubscribeToPuzzleResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SubscribeToPuzzleResponse',
      package: const $pb.PackageName($core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'puzzle.v1'),
      createEmptyInstance: create)
    ..aOM<PuzzleMessage>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'puzzle',
        subBuilder: PuzzleMessage.create)
    ..hasRequiredFields = false;

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
  factory SubscribeToPuzzleResponse.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory SubscribeToPuzzleResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  SubscribeToPuzzleResponse clone() => SubscribeToPuzzleResponse()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  SubscribeToPuzzleResponse copyWith(void Function(SubscribeToPuzzleResponse) updates) =>
      super.copyWith((message) => updates(message as SubscribeToPuzzleResponse))
          as SubscribeToPuzzleResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SubscribeToPuzzleResponse create() => SubscribeToPuzzleResponse._();
  SubscribeToPuzzleResponse createEmptyInstance() => create();
  static $pb.PbList<SubscribeToPuzzleResponse> createRepeated() => $pb.PbList<SubscribeToPuzzleResponse>();
  @$core.pragma('dart2js:noInline')
  static SubscribeToPuzzleResponse getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SubscribeToPuzzleResponse>(create);
  static SubscribeToPuzzleResponse? _defaultInstance;

  @$pb.TagNumber(1)
  PuzzleMessage get puzzle => $_getN(0);
  @$pb.TagNumber(1)
  set puzzle(PuzzleMessage v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasPuzzle() => $_has(0);
  @$pb.TagNumber(1)
  void clearPuzzle() => clearField(1);
  @$pb.TagNumber(1)
  PuzzleMessage ensurePuzzle() => $_ensure(0);
}

class VoteForTileRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'VoteForTileRequest',
      package: const $pb.PackageName($core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'puzzle.v1'),
      createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userId')
    ..a<$core.int>(
        3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'tileValue', $pb.PbFieldType.O3)
    ..hasRequiredFields = false;

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
  factory VoteForTileRequest.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory VoteForTileRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  VoteForTileRequest clone() => VoteForTileRequest()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  VoteForTileRequest copyWith(void Function(VoteForTileRequest) updates) =>
      super.copyWith((message) => updates(message as VoteForTileRequest))
          as VoteForTileRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static VoteForTileRequest create() => VoteForTileRequest._();
  VoteForTileRequest createEmptyInstance() => create();
  static $pb.PbList<VoteForTileRequest> createRepeated() => $pb.PbList<VoteForTileRequest>();
  @$core.pragma('dart2js:noInline')
  static VoteForTileRequest getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<VoteForTileRequest>(create);
  static VoteForTileRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => clearField(1);

  @$pb.TagNumber(3)
  $core.int get tileValue => $_getIZ(1);
  @$pb.TagNumber(3)
  set tileValue($core.int v) {
    $_setSignedInt32(1, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasTileValue() => $_has(1);
  @$pb.TagNumber(3)
  void clearTileValue() => clearField(3);
}

class VoteForTileResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'VoteForTileResponse',
      package: const $pb.PackageName($core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'puzzle.v1'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  VoteForTileResponse._() : super();
  factory VoteForTileResponse() => create();
  factory VoteForTileResponse.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory VoteForTileResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  VoteForTileResponse clone() => VoteForTileResponse()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  VoteForTileResponse copyWith(void Function(VoteForTileResponse) updates) =>
      super.copyWith((message) => updates(message as VoteForTileResponse))
          as VoteForTileResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static VoteForTileResponse create() => VoteForTileResponse._();
  VoteForTileResponse createEmptyInstance() => create();
  static $pb.PbList<VoteForTileResponse> createRepeated() => $pb.PbList<VoteForTileResponse>();
  @$core.pragma('dart2js:noInline')
  static VoteForTileResponse getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<VoteForTileResponse>(create);
  static VoteForTileResponse? _defaultInstance;
}

class UpdatePointerPositionRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UpdatePointerPositionRequest',
      package: const $pb.PackageName($core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'puzzle.v1'),
      createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userId')
    ..aOM<PointerPositionMessage>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'position',
        subBuilder: PointerPositionMessage.create)
    ..hasRequiredFields = false;

  UpdatePointerPositionRequest._() : super();
  factory UpdatePointerPositionRequest({
    $core.String? userId,
    PointerPositionMessage? position,
  }) {
    final _result = create();
    if (userId != null) {
      _result.userId = userId;
    }
    if (position != null) {
      _result.position = position;
    }
    return _result;
  }
  factory UpdatePointerPositionRequest.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory UpdatePointerPositionRequest.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  UpdatePointerPositionRequest clone() => UpdatePointerPositionRequest()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  UpdatePointerPositionRequest copyWith(void Function(UpdatePointerPositionRequest) updates) =>
      super.copyWith((message) => updates(message as UpdatePointerPositionRequest))
          as UpdatePointerPositionRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UpdatePointerPositionRequest create() => UpdatePointerPositionRequest._();
  UpdatePointerPositionRequest createEmptyInstance() => create();
  static $pb.PbList<UpdatePointerPositionRequest> createRepeated() => $pb.PbList<UpdatePointerPositionRequest>();
  @$core.pragma('dart2js:noInline')
  static UpdatePointerPositionRequest getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdatePointerPositionRequest>(create);
  static UpdatePointerPositionRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => clearField(1);

  @$pb.TagNumber(2)
  PointerPositionMessage get position => $_getN(1);
  @$pb.TagNumber(2)
  set position(PointerPositionMessage v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasPosition() => $_has(1);
  @$pb.TagNumber(2)
  void clearPosition() => clearField(2);
  @$pb.TagNumber(2)
  PointerPositionMessage ensurePosition() => $_ensure(1);
}

class UpdatePointerPositionResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UpdatePointerPositionResponse',
      package: const $pb.PackageName($core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'puzzle.v1'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  UpdatePointerPositionResponse._() : super();
  factory UpdatePointerPositionResponse() => create();
  factory UpdatePointerPositionResponse.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory UpdatePointerPositionResponse.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  UpdatePointerPositionResponse clone() => UpdatePointerPositionResponse()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  UpdatePointerPositionResponse copyWith(void Function(UpdatePointerPositionResponse) updates) =>
      super.copyWith((message) => updates(message as UpdatePointerPositionResponse))
          as UpdatePointerPositionResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UpdatePointerPositionResponse create() => UpdatePointerPositionResponse._();
  UpdatePointerPositionResponse createEmptyInstance() => create();
  static $pb.PbList<UpdatePointerPositionResponse> createRepeated() => $pb.PbList<UpdatePointerPositionResponse>();
  @$core.pragma('dart2js:noInline')
  static UpdatePointerPositionResponse getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdatePointerPositionResponse>(create);
  static UpdatePointerPositionResponse? _defaultInstance;
}

class UpdatePointerSettingsRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UpdatePointerSettingsRequest',
      package: const $pb.PackageName($core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'puzzle.v1'),
      createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userId')
    ..aOM<PointerSettingsMessage>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'settings',
        subBuilder: PointerSettingsMessage.create)
    ..hasRequiredFields = false;

  UpdatePointerSettingsRequest._() : super();
  factory UpdatePointerSettingsRequest({
    $core.String? userId,
    PointerSettingsMessage? settings,
  }) {
    final _result = create();
    if (userId != null) {
      _result.userId = userId;
    }
    if (settings != null) {
      _result.settings = settings;
    }
    return _result;
  }
  factory UpdatePointerSettingsRequest.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory UpdatePointerSettingsRequest.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  UpdatePointerSettingsRequest clone() => UpdatePointerSettingsRequest()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  UpdatePointerSettingsRequest copyWith(void Function(UpdatePointerSettingsRequest) updates) =>
      super.copyWith((message) => updates(message as UpdatePointerSettingsRequest))
          as UpdatePointerSettingsRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UpdatePointerSettingsRequest create() => UpdatePointerSettingsRequest._();
  UpdatePointerSettingsRequest createEmptyInstance() => create();
  static $pb.PbList<UpdatePointerSettingsRequest> createRepeated() => $pb.PbList<UpdatePointerSettingsRequest>();
  @$core.pragma('dart2js:noInline')
  static UpdatePointerSettingsRequest getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdatePointerSettingsRequest>(create);
  static UpdatePointerSettingsRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => clearField(1);

  @$pb.TagNumber(2)
  PointerSettingsMessage get settings => $_getN(1);
  @$pb.TagNumber(2)
  set settings(PointerSettingsMessage v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasSettings() => $_has(1);
  @$pb.TagNumber(2)
  void clearSettings() => clearField(2);
  @$pb.TagNumber(2)
  PointerSettingsMessage ensureSettings() => $_ensure(1);
}

class UpdatePointerSettingsResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UpdatePointerSettingsResponse',
      package: const $pb.PackageName($core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'puzzle.v1'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  UpdatePointerSettingsResponse._() : super();
  factory UpdatePointerSettingsResponse() => create();
  factory UpdatePointerSettingsResponse.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory UpdatePointerSettingsResponse.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  UpdatePointerSettingsResponse clone() => UpdatePointerSettingsResponse()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  UpdatePointerSettingsResponse copyWith(void Function(UpdatePointerSettingsResponse) updates) =>
      super.copyWith((message) => updates(message as UpdatePointerSettingsResponse))
          as UpdatePointerSettingsResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UpdatePointerSettingsResponse create() => UpdatePointerSettingsResponse._();
  UpdatePointerSettingsResponse createEmptyInstance() => create();
  static $pb.PbList<UpdatePointerSettingsResponse> createRepeated() => $pb.PbList<UpdatePointerSettingsResponse>();
  @$core.pragma('dart2js:noInline')
  static UpdatePointerSettingsResponse getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdatePointerSettingsResponse>(create);
  static UpdatePointerSettingsResponse? _defaultInstance;
}

class PuzzleMessage extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'PuzzleMessage',
      package: const $pb.PackageName($core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'puzzle.v1'),
      createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aInt64(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'createdAt')
    ..aInt64(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'updatedAt')
    ..aInt64(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'endsAt')
    ..pc<TileMessage>(
        5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'tiles', $pb.PbFieldType.PM,
        subBuilder: TileMessage.create)
    ..pc<ParticipantMessage>(
        6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'participants', $pb.PbFieldType.PM,
        subBuilder: ParticipantMessage.create)
    ..e<PuzzleMessage_PuzzleStatus>(
        7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'status', $pb.PbFieldType.OE,
        defaultOrMaker: PuzzleMessage_PuzzleStatus.PUZZLE_STATUS_UNSPECIFIED,
        valueOf: PuzzleMessage_PuzzleStatus.valueOf,
        enumValues: PuzzleMessage_PuzzleStatus.values)
    ..a<$core.int>(
        8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'numMoves', $pb.PbFieldType.O3)
    ..a<$core.int>(
        9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'totalVotes', $pb.PbFieldType.O3)
    ..hasRequiredFields = false;

  PuzzleMessage._() : super();
  factory PuzzleMessage({
    $core.String? id,
    $fixnum.Int64? createdAt,
    $fixnum.Int64? updatedAt,
    $fixnum.Int64? endsAt,
    $core.Iterable<TileMessage>? tiles,
    $core.Iterable<ParticipantMessage>? participants,
    PuzzleMessage_PuzzleStatus? status,
    $core.int? numMoves,
    $core.int? totalVotes,
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
    if (endsAt != null) {
      _result.endsAt = endsAt;
    }
    if (tiles != null) {
      _result.tiles.addAll(tiles);
    }
    if (participants != null) {
      _result.participants.addAll(participants);
    }
    if (status != null) {
      _result.status = status;
    }
    if (numMoves != null) {
      _result.numMoves = numMoves;
    }
    if (totalVotes != null) {
      _result.totalVotes = totalVotes;
    }
    return _result;
  }
  factory PuzzleMessage.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory PuzzleMessage.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  PuzzleMessage clone() => PuzzleMessage()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  PuzzleMessage copyWith(void Function(PuzzleMessage) updates) =>
      super.copyWith((message) => updates(message as PuzzleMessage)) as PuzzleMessage; // ignore: deprecated_member_use
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
  set id($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get createdAt => $_getI64(1);
  @$pb.TagNumber(2)
  set createdAt($fixnum.Int64 v) {
    $_setInt64(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasCreatedAt() => $_has(1);
  @$pb.TagNumber(2)
  void clearCreatedAt() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get updatedAt => $_getI64(2);
  @$pb.TagNumber(3)
  set updatedAt($fixnum.Int64 v) {
    $_setInt64(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasUpdatedAt() => $_has(2);
  @$pb.TagNumber(3)
  void clearUpdatedAt() => clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get endsAt => $_getI64(3);
  @$pb.TagNumber(4)
  set endsAt($fixnum.Int64 v) {
    $_setInt64(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasEndsAt() => $_has(3);
  @$pb.TagNumber(4)
  void clearEndsAt() => clearField(4);

  @$pb.TagNumber(5)
  $core.List<TileMessage> get tiles => $_getList(4);

  @$pb.TagNumber(6)
  $core.List<ParticipantMessage> get participants => $_getList(5);

  @$pb.TagNumber(7)
  PuzzleMessage_PuzzleStatus get status => $_getN(6);
  @$pb.TagNumber(7)
  set status(PuzzleMessage_PuzzleStatus v) {
    setField(7, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasStatus() => $_has(6);
  @$pb.TagNumber(7)
  void clearStatus() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get numMoves => $_getIZ(7);
  @$pb.TagNumber(8)
  set numMoves($core.int v) {
    $_setSignedInt32(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasNumMoves() => $_has(7);
  @$pb.TagNumber(8)
  void clearNumMoves() => clearField(8);

  @$pb.TagNumber(9)
  $core.int get totalVotes => $_getIZ(8);
  @$pb.TagNumber(9)
  set totalVotes($core.int v) {
    $_setSignedInt32(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasTotalVotes() => $_has(8);
  @$pb.TagNumber(9)
  void clearTotalVotes() => clearField(9);
}

class TileMessage extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'TileMessage',
      package: const $pb.PackageName($core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'puzzle.v1'),
      createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'value', $pb.PbFieldType.O3)
    ..a<$core.int>(
        2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'numVotes', $pb.PbFieldType.O3)
    ..aOM<PositionMessage>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'currentPosition',
        subBuilder: PositionMessage.create)
    ..aOM<PositionMessage>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'correctPosition',
        subBuilder: PositionMessage.create)
    ..aOB(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'isWhitespace')
    ..hasRequiredFields = false;

  TileMessage._() : super();
  factory TileMessage({
    $core.int? value,
    $core.int? numVotes,
    PositionMessage? currentPosition,
    PositionMessage? correctPosition,
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
  factory TileMessage.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory TileMessage.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  TileMessage clone() => TileMessage()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  TileMessage copyWith(void Function(TileMessage) updates) =>
      super.copyWith((message) => updates(message as TileMessage)) as TileMessage; // ignore: deprecated_member_use
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
  set value($core.int v) {
    $_setSignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasValue() => $_has(0);
  @$pb.TagNumber(1)
  void clearValue() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get numVotes => $_getIZ(1);
  @$pb.TagNumber(2)
  set numVotes($core.int v) {
    $_setSignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasNumVotes() => $_has(1);
  @$pb.TagNumber(2)
  void clearNumVotes() => clearField(2);

  @$pb.TagNumber(3)
  PositionMessage get currentPosition => $_getN(2);
  @$pb.TagNumber(3)
  set currentPosition(PositionMessage v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasCurrentPosition() => $_has(2);
  @$pb.TagNumber(3)
  void clearCurrentPosition() => clearField(3);
  @$pb.TagNumber(3)
  PositionMessage ensureCurrentPosition() => $_ensure(2);

  @$pb.TagNumber(4)
  PositionMessage get correctPosition => $_getN(3);
  @$pb.TagNumber(4)
  set correctPosition(PositionMessage v) {
    setField(4, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasCorrectPosition() => $_has(3);
  @$pb.TagNumber(4)
  void clearCorrectPosition() => clearField(4);
  @$pb.TagNumber(4)
  PositionMessage ensureCorrectPosition() => $_ensure(3);

  @$pb.TagNumber(5)
  $core.bool get isWhitespace => $_getBF(4);
  @$pb.TagNumber(5)
  set isWhitespace($core.bool v) {
    $_setBool(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasIsWhitespace() => $_has(4);
  @$pb.TagNumber(5)
  void clearIsWhitespace() => clearField(5);
}

class ParticipantMessage extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ParticipantMessage',
      package: const $pb.PackageName($core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'puzzle.v1'),
      createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userId')
    ..aOM<PointerMessage>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'pointer',
        subBuilder: PointerMessage.create)
    ..aInt64(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'lastActive')
    ..hasRequiredFields = false;

  ParticipantMessage._() : super();
  factory ParticipantMessage({
    $core.String? userId,
    PointerMessage? pointer,
    $fixnum.Int64? lastActive,
  }) {
    final _result = create();
    if (userId != null) {
      _result.userId = userId;
    }
    if (pointer != null) {
      _result.pointer = pointer;
    }
    if (lastActive != null) {
      _result.lastActive = lastActive;
    }
    return _result;
  }
  factory ParticipantMessage.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ParticipantMessage.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ParticipantMessage clone() => ParticipantMessage()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ParticipantMessage copyWith(void Function(ParticipantMessage) updates) =>
      super.copyWith((message) => updates(message as ParticipantMessage))
          as ParticipantMessage; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ParticipantMessage create() => ParticipantMessage._();
  ParticipantMessage createEmptyInstance() => create();
  static $pb.PbList<ParticipantMessage> createRepeated() => $pb.PbList<ParticipantMessage>();
  @$core.pragma('dart2js:noInline')
  static ParticipantMessage getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ParticipantMessage>(create);
  static ParticipantMessage? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => clearField(1);

  @$pb.TagNumber(2)
  PointerMessage get pointer => $_getN(1);
  @$pb.TagNumber(2)
  set pointer(PointerMessage v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasPointer() => $_has(1);
  @$pb.TagNumber(2)
  void clearPointer() => clearField(2);
  @$pb.TagNumber(2)
  PointerMessage ensurePointer() => $_ensure(1);

  @$pb.TagNumber(3)
  $fixnum.Int64 get lastActive => $_getI64(2);
  @$pb.TagNumber(3)
  set lastActive($fixnum.Int64 v) {
    $_setInt64(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasLastActive() => $_has(2);
  @$pb.TagNumber(3)
  void clearLastActive() => clearField(3);
}

class PositionMessage extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'PositionMessage',
      package: const $pb.PackageName($core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'puzzle.v1'),
      createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'x', $pb.PbFieldType.O3)
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'y', $pb.PbFieldType.O3)
    ..hasRequiredFields = false;

  PositionMessage._() : super();
  factory PositionMessage({
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
  factory PositionMessage.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory PositionMessage.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  PositionMessage clone() => PositionMessage()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  PositionMessage copyWith(void Function(PositionMessage) updates) =>
      super.copyWith((message) => updates(message as PositionMessage))
          as PositionMessage; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PositionMessage create() => PositionMessage._();
  PositionMessage createEmptyInstance() => create();
  static $pb.PbList<PositionMessage> createRepeated() => $pb.PbList<PositionMessage>();
  @$core.pragma('dart2js:noInline')
  static PositionMessage getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PositionMessage>(create);
  static PositionMessage? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get x => $_getIZ(0);
  @$pb.TagNumber(1)
  set x($core.int v) {
    $_setSignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasX() => $_has(0);
  @$pb.TagNumber(1)
  void clearX() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get y => $_getIZ(1);
  @$pb.TagNumber(2)
  set y($core.int v) {
    $_setSignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasY() => $_has(1);
  @$pb.TagNumber(2)
  void clearY() => clearField(2);
}

class PointerMessage extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'PointerMessage',
      package: const $pb.PackageName($core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'puzzle.v1'),
      createEmptyInstance: create)
    ..aOM<PointerPositionMessage>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'position',
        subBuilder: PointerPositionMessage.create)
    ..aOM<PointerSettingsMessage>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'settings',
        subBuilder: PointerSettingsMessage.create)
    ..hasRequiredFields = false;

  PointerMessage._() : super();
  factory PointerMessage({
    PointerPositionMessage? position,
    PointerSettingsMessage? settings,
  }) {
    final _result = create();
    if (position != null) {
      _result.position = position;
    }
    if (settings != null) {
      _result.settings = settings;
    }
    return _result;
  }
  factory PointerMessage.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory PointerMessage.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  PointerMessage clone() => PointerMessage()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  PointerMessage copyWith(void Function(PointerMessage) updates) =>
      super.copyWith((message) => updates(message as PointerMessage))
          as PointerMessage; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PointerMessage create() => PointerMessage._();
  PointerMessage createEmptyInstance() => create();
  static $pb.PbList<PointerMessage> createRepeated() => $pb.PbList<PointerMessage>();
  @$core.pragma('dart2js:noInline')
  static PointerMessage getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PointerMessage>(create);
  static PointerMessage? _defaultInstance;

  @$pb.TagNumber(1)
  PointerPositionMessage get position => $_getN(0);
  @$pb.TagNumber(1)
  set position(PointerPositionMessage v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasPosition() => $_has(0);
  @$pb.TagNumber(1)
  void clearPosition() => clearField(1);
  @$pb.TagNumber(1)
  PointerPositionMessage ensurePosition() => $_ensure(0);

  @$pb.TagNumber(2)
  PointerSettingsMessage get settings => $_getN(1);
  @$pb.TagNumber(2)
  set settings(PointerSettingsMessage v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasSettings() => $_has(1);
  @$pb.TagNumber(2)
  void clearSettings() => clearField(2);
  @$pb.TagNumber(2)
  PointerSettingsMessage ensureSettings() => $_ensure(1);
}

class PointerPositionMessage extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'PointerPositionMessage',
      package: const $pb.PackageName($core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'puzzle.v1'),
      createEmptyInstance: create)
    ..a<$core.double>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'x', $pb.PbFieldType.OF)
    ..a<$core.double>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'y', $pb.PbFieldType.OF)
    ..hasRequiredFields = false;

  PointerPositionMessage._() : super();
  factory PointerPositionMessage({
    $core.double? x,
    $core.double? y,
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
  factory PointerPositionMessage.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory PointerPositionMessage.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  PointerPositionMessage clone() => PointerPositionMessage()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  PointerPositionMessage copyWith(void Function(PointerPositionMessage) updates) =>
      super.copyWith((message) => updates(message as PointerPositionMessage))
          as PointerPositionMessage; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PointerPositionMessage create() => PointerPositionMessage._();
  PointerPositionMessage createEmptyInstance() => create();
  static $pb.PbList<PointerPositionMessage> createRepeated() => $pb.PbList<PointerPositionMessage>();
  @$core.pragma('dart2js:noInline')
  static PointerPositionMessage getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PointerPositionMessage>(create);
  static PointerPositionMessage? _defaultInstance;

  @$pb.TagNumber(1)
  $core.double get x => $_getN(0);
  @$pb.TagNumber(1)
  set x($core.double v) {
    $_setFloat(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasX() => $_has(0);
  @$pb.TagNumber(1)
  void clearX() => clearField(1);

  @$pb.TagNumber(2)
  $core.double get y => $_getN(1);
  @$pb.TagNumber(2)
  set y($core.double v) {
    $_setFloat(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasY() => $_has(1);
  @$pb.TagNumber(2)
  void clearY() => clearField(2);
}

class PointerSettingsMessage extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'PointerSettingsMessage',
      package: const $pb.PackageName($core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'puzzle.v1'),
      createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'colorHex')
    ..a<$core.double>(
        2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'size', $pb.PbFieldType.OF)
    ..e<PointerSettingsMessage_PointerShape>(
        3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'shape', $pb.PbFieldType.OE,
        defaultOrMaker: PointerSettingsMessage_PointerShape.POINTER_SHAPE_UNSPECIFIED,
        valueOf: PointerSettingsMessage_PointerShape.valueOf,
        enumValues: PointerSettingsMessage_PointerShape.values)
    ..hasRequiredFields = false;

  PointerSettingsMessage._() : super();
  factory PointerSettingsMessage({
    $core.String? colorHex,
    $core.double? size,
    PointerSettingsMessage_PointerShape? shape,
  }) {
    final _result = create();
    if (colorHex != null) {
      _result.colorHex = colorHex;
    }
    if (size != null) {
      _result.size = size;
    }
    if (shape != null) {
      _result.shape = shape;
    }
    return _result;
  }
  factory PointerSettingsMessage.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory PointerSettingsMessage.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  PointerSettingsMessage clone() => PointerSettingsMessage()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  PointerSettingsMessage copyWith(void Function(PointerSettingsMessage) updates) =>
      super.copyWith((message) => updates(message as PointerSettingsMessage))
          as PointerSettingsMessage; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PointerSettingsMessage create() => PointerSettingsMessage._();
  PointerSettingsMessage createEmptyInstance() => create();
  static $pb.PbList<PointerSettingsMessage> createRepeated() => $pb.PbList<PointerSettingsMessage>();
  @$core.pragma('dart2js:noInline')
  static PointerSettingsMessage getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PointerSettingsMessage>(create);
  static PointerSettingsMessage? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get colorHex => $_getSZ(0);
  @$pb.TagNumber(1)
  set colorHex($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasColorHex() => $_has(0);
  @$pb.TagNumber(1)
  void clearColorHex() => clearField(1);

  @$pb.TagNumber(2)
  $core.double get size => $_getN(1);
  @$pb.TagNumber(2)
  set size($core.double v) {
    $_setFloat(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasSize() => $_has(1);
  @$pb.TagNumber(2)
  void clearSize() => clearField(2);

  @$pb.TagNumber(3)
  PointerSettingsMessage_PointerShape get shape => $_getN(2);
  @$pb.TagNumber(3)
  set shape(PointerSettingsMessage_PointerShape v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasShape() => $_has(2);
  @$pb.TagNumber(3)
  void clearShape() => clearField(3);
}
