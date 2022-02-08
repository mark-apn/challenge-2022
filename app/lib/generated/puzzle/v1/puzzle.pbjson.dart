///
//  Generated code. Do not modify.
//  source: puzzle/v1/puzzle.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use subscribeToPuzzleRequestDescriptor instead')
const SubscribeToPuzzleRequest$json = {
  '1': 'SubscribeToPuzzleRequest',
  '2': [
    {'1': 'user_id', '3': 1, '4': 1, '5': 9, '10': 'userId'},
  ],
};

/// Descriptor for `SubscribeToPuzzleRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List subscribeToPuzzleRequestDescriptor =
    $convert.base64Decode('ChhTdWJzY3JpYmVUb1B1enpsZVJlcXVlc3QSFwoHdXNlcl9pZBgBIAEoCVIGdXNlcklk');
@$core.Deprecated('Use subscribeToPuzzleResponseDescriptor instead')
const SubscribeToPuzzleResponse$json = {
  '1': 'SubscribeToPuzzleResponse',
  '2': [
    {'1': 'puzzle', '3': 1, '4': 1, '5': 11, '6': '.puzzle.v1.PuzzleMessage', '10': 'puzzle'},
  ],
};

/// Descriptor for `SubscribeToPuzzleResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List subscribeToPuzzleResponseDescriptor = $convert.base64Decode(
    'ChlTdWJzY3JpYmVUb1B1enpsZVJlc3BvbnNlEjAKBnB1enpsZRgBIAEoCzIYLnB1enpsZS52MS5QdXp6bGVNZXNzYWdlUgZwdXp6bGU=');
@$core.Deprecated('Use voteForTileRequestDescriptor instead')
const VoteForTileRequest$json = {
  '1': 'VoteForTileRequest',
  '2': [
    {'1': 'user_id', '3': 1, '4': 1, '5': 9, '10': 'userId'},
    {'1': 'tile_value', '3': 3, '4': 1, '5': 5, '10': 'tileValue'},
  ],
};

/// Descriptor for `VoteForTileRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List voteForTileRequestDescriptor = $convert.base64Decode(
    'ChJWb3RlRm9yVGlsZVJlcXVlc3QSFwoHdXNlcl9pZBgBIAEoCVIGdXNlcklkEh0KCnRpbGVfdmFsdWUYAyABKAVSCXRpbGVWYWx1ZQ==');
@$core.Deprecated('Use voteForTileResponseDescriptor instead')
const VoteForTileResponse$json = {
  '1': 'VoteForTileResponse',
};

/// Descriptor for `VoteForTileResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List voteForTileResponseDescriptor = $convert.base64Decode('ChNWb3RlRm9yVGlsZVJlc3BvbnNl');
@$core.Deprecated('Use updatePointerPositionRequestDescriptor instead')
const UpdatePointerPositionRequest$json = {
  '1': 'UpdatePointerPositionRequest',
  '2': [
    {'1': 'user_id', '3': 1, '4': 1, '5': 9, '10': 'userId'},
    {'1': 'position', '3': 2, '4': 1, '5': 11, '6': '.puzzle.v1.PointerPositionMessage', '10': 'position'},
  ],
};

/// Descriptor for `UpdatePointerPositionRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updatePointerPositionRequestDescriptor = $convert.base64Decode(
    'ChxVcGRhdGVQb2ludGVyUG9zaXRpb25SZXF1ZXN0EhcKB3VzZXJfaWQYASABKAlSBnVzZXJJZBI9Cghwb3NpdGlvbhgCIAEoCzIhLnB1enpsZS52MS5Qb2ludGVyUG9zaXRpb25NZXNzYWdlUghwb3NpdGlvbg==');
@$core.Deprecated('Use updatePointerPositionResponseDescriptor instead')
const UpdatePointerPositionResponse$json = {
  '1': 'UpdatePointerPositionResponse',
};

/// Descriptor for `UpdatePointerPositionResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updatePointerPositionResponseDescriptor =
    $convert.base64Decode('Ch1VcGRhdGVQb2ludGVyUG9zaXRpb25SZXNwb25zZQ==');
@$core.Deprecated('Use updatePointerSettingsRequestDescriptor instead')
const UpdatePointerSettingsRequest$json = {
  '1': 'UpdatePointerSettingsRequest',
  '2': [
    {'1': 'user_id', '3': 1, '4': 1, '5': 9, '10': 'userId'},
    {'1': 'settings', '3': 2, '4': 1, '5': 11, '6': '.puzzle.v1.PointerSettingsMessage', '10': 'settings'},
  ],
};

/// Descriptor for `UpdatePointerSettingsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updatePointerSettingsRequestDescriptor = $convert.base64Decode(
    'ChxVcGRhdGVQb2ludGVyU2V0dGluZ3NSZXF1ZXN0EhcKB3VzZXJfaWQYASABKAlSBnVzZXJJZBI9CghzZXR0aW5ncxgCIAEoCzIhLnB1enpsZS52MS5Qb2ludGVyU2V0dGluZ3NNZXNzYWdlUghzZXR0aW5ncw==');
@$core.Deprecated('Use updatePointerSettingsResponseDescriptor instead')
const UpdatePointerSettingsResponse$json = {
  '1': 'UpdatePointerSettingsResponse',
};

/// Descriptor for `UpdatePointerSettingsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updatePointerSettingsResponseDescriptor =
    $convert.base64Decode('Ch1VcGRhdGVQb2ludGVyU2V0dGluZ3NSZXNwb25zZQ==');
@$core.Deprecated('Use puzzleMessageDescriptor instead')
const PuzzleMessage$json = {
  '1': 'PuzzleMessage',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'created_at', '3': 2, '4': 1, '5': 3, '10': 'createdAt'},
    {'1': 'updated_at', '3': 3, '4': 1, '5': 3, '10': 'updatedAt'},
    {'1': 'ends_at', '3': 4, '4': 1, '5': 3, '10': 'endsAt'},
    {'1': 'tiles', '3': 5, '4': 3, '5': 11, '6': '.puzzle.v1.TileMessage', '10': 'tiles'},
    {'1': 'participants', '3': 6, '4': 3, '5': 11, '6': '.puzzle.v1.ParticipantMessage', '10': 'participants'},
    {'1': 'status', '3': 7, '4': 1, '5': 14, '6': '.puzzle.v1.PuzzleMessage.PuzzleStatus', '10': 'status'},
    {'1': 'num_moves', '3': 8, '4': 1, '5': 5, '10': 'numMoves'},
    {'1': 'total_votes', '3': 9, '4': 1, '5': 5, '10': 'totalVotes'},
  ],
  '4': [PuzzleMessage_PuzzleStatus$json],
};

@$core.Deprecated('Use puzzleMessageDescriptor instead')
const PuzzleMessage_PuzzleStatus$json = {
  '1': 'PuzzleStatus',
  '2': [
    {'1': 'PUZZLE_STATUS_UNSPECIFIED', '2': 0},
    {'1': 'PUZZLE_STATUS_IN_PROGRESS', '2': 1},
    {'1': 'PUZZLE_STATUS_COMPLETED', '2': 2},
  ],
};

/// Descriptor for `PuzzleMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List puzzleMessageDescriptor = $convert.base64Decode(
    'Cg1QdXp6bGVNZXNzYWdlEg4KAmlkGAEgASgJUgJpZBIdCgpjcmVhdGVkX2F0GAIgASgDUgljcmVhdGVkQXQSHQoKdXBkYXRlZF9hdBgDIAEoA1IJdXBkYXRlZEF0EhcKB2VuZHNfYXQYBCABKANSBmVuZHNBdBIsCgV0aWxlcxgFIAMoCzIWLnB1enpsZS52MS5UaWxlTWVzc2FnZVIFdGlsZXMSQQoMcGFydGljaXBhbnRzGAYgAygLMh0ucHV6emxlLnYxLlBhcnRpY2lwYW50TWVzc2FnZVIMcGFydGljaXBhbnRzEj0KBnN0YXR1cxgHIAEoDjIlLnB1enpsZS52MS5QdXp6bGVNZXNzYWdlLlB1enpsZVN0YXR1c1IGc3RhdHVzEhsKCW51bV9tb3ZlcxgIIAEoBVIIbnVtTW92ZXMSHwoLdG90YWxfdm90ZXMYCSABKAVSCnRvdGFsVm90ZXMiaQoMUHV6emxlU3RhdHVzEh0KGVBVWlpMRV9TVEFUVVNfVU5TUEVDSUZJRUQQABIdChlQVVpaTEVfU1RBVFVTX0lOX1BST0dSRVNTEAESGwoXUFVaWkxFX1NUQVRVU19DT01QTEVURUQQAg==');
@$core.Deprecated('Use tileMessageDescriptor instead')
const TileMessage$json = {
  '1': 'TileMessage',
  '2': [
    {'1': 'value', '3': 1, '4': 1, '5': 5, '10': 'value'},
    {'1': 'num_votes', '3': 2, '4': 1, '5': 5, '10': 'numVotes'},
    {'1': 'current_position', '3': 3, '4': 1, '5': 11, '6': '.puzzle.v1.PositionMessage', '10': 'currentPosition'},
    {'1': 'correct_position', '3': 4, '4': 1, '5': 11, '6': '.puzzle.v1.PositionMessage', '10': 'correctPosition'},
    {'1': 'is_whitespace', '3': 5, '4': 1, '5': 8, '10': 'isWhitespace'},
  ],
};

/// Descriptor for `TileMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List tileMessageDescriptor = $convert.base64Decode(
    'CgtUaWxlTWVzc2FnZRIUCgV2YWx1ZRgBIAEoBVIFdmFsdWUSGwoJbnVtX3ZvdGVzGAIgASgFUghudW1Wb3RlcxJFChBjdXJyZW50X3Bvc2l0aW9uGAMgASgLMhoucHV6emxlLnYxLlBvc2l0aW9uTWVzc2FnZVIPY3VycmVudFBvc2l0aW9uEkUKEGNvcnJlY3RfcG9zaXRpb24YBCABKAsyGi5wdXp6bGUudjEuUG9zaXRpb25NZXNzYWdlUg9jb3JyZWN0UG9zaXRpb24SIwoNaXNfd2hpdGVzcGFjZRgFIAEoCFIMaXNXaGl0ZXNwYWNl');
@$core.Deprecated('Use participantMessageDescriptor instead')
const ParticipantMessage$json = {
  '1': 'ParticipantMessage',
  '2': [
    {'1': 'user_id', '3': 1, '4': 1, '5': 9, '10': 'userId'},
    {'1': 'pointer', '3': 2, '4': 1, '5': 11, '6': '.puzzle.v1.PointerMessage', '10': 'pointer'},
    {'1': 'last_active', '3': 3, '4': 1, '5': 3, '10': 'lastActive'},
  ],
};

/// Descriptor for `ParticipantMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List participantMessageDescriptor = $convert.base64Decode(
    'ChJQYXJ0aWNpcGFudE1lc3NhZ2USFwoHdXNlcl9pZBgBIAEoCVIGdXNlcklkEjMKB3BvaW50ZXIYAiABKAsyGS5wdXp6bGUudjEuUG9pbnRlck1lc3NhZ2VSB3BvaW50ZXISHwoLbGFzdF9hY3RpdmUYAyABKANSCmxhc3RBY3RpdmU=');
@$core.Deprecated('Use positionMessageDescriptor instead')
const PositionMessage$json = {
  '1': 'PositionMessage',
  '2': [
    {'1': 'x', '3': 1, '4': 1, '5': 5, '10': 'x'},
    {'1': 'y', '3': 2, '4': 1, '5': 5, '10': 'y'},
  ],
};

/// Descriptor for `PositionMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List positionMessageDescriptor =
    $convert.base64Decode('Cg9Qb3NpdGlvbk1lc3NhZ2USDAoBeBgBIAEoBVIBeBIMCgF5GAIgASgFUgF5');
@$core.Deprecated('Use pointerMessageDescriptor instead')
const PointerMessage$json = {
  '1': 'PointerMessage',
  '2': [
    {'1': 'position', '3': 1, '4': 1, '5': 11, '6': '.puzzle.v1.PointerPositionMessage', '10': 'position'},
    {'1': 'settings', '3': 2, '4': 1, '5': 11, '6': '.puzzle.v1.PointerSettingsMessage', '10': 'settings'},
  ],
};

/// Descriptor for `PointerMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List pointerMessageDescriptor = $convert.base64Decode(
    'Cg5Qb2ludGVyTWVzc2FnZRI9Cghwb3NpdGlvbhgBIAEoCzIhLnB1enpsZS52MS5Qb2ludGVyUG9zaXRpb25NZXNzYWdlUghwb3NpdGlvbhI9CghzZXR0aW5ncxgCIAEoCzIhLnB1enpsZS52MS5Qb2ludGVyU2V0dGluZ3NNZXNzYWdlUghzZXR0aW5ncw==');
@$core.Deprecated('Use pointerPositionMessageDescriptor instead')
const PointerPositionMessage$json = {
  '1': 'PointerPositionMessage',
  '2': [
    {'1': 'x', '3': 1, '4': 1, '5': 2, '10': 'x'},
    {'1': 'y', '3': 2, '4': 1, '5': 2, '10': 'y'},
  ],
};

/// Descriptor for `PointerPositionMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List pointerPositionMessageDescriptor =
    $convert.base64Decode('ChZQb2ludGVyUG9zaXRpb25NZXNzYWdlEgwKAXgYASABKAJSAXgSDAoBeRgCIAEoAlIBeQ==');
@$core.Deprecated('Use pointerSettingsMessageDescriptor instead')
const PointerSettingsMessage$json = {
  '1': 'PointerSettingsMessage',
  '2': [
    {'1': 'color_hex', '3': 1, '4': 1, '5': 9, '10': 'colorHex'},
    {'1': 'size', '3': 2, '4': 1, '5': 2, '10': 'size'},
    {'1': 'shape', '3': 3, '4': 1, '5': 14, '6': '.puzzle.v1.PointerSettingsMessage.PointerShape', '10': 'shape'},
  ],
  '4': [PointerSettingsMessage_PointerShape$json],
};

@$core.Deprecated('Use pointerSettingsMessageDescriptor instead')
const PointerSettingsMessage_PointerShape$json = {
  '1': 'PointerShape',
  '2': [
    {'1': 'POINTER_SHAPE_UNSPECIFIED', '2': 0},
    {'1': 'POINTER_SHAPE_CIRCLE', '2': 1},
    {'1': 'POINTER_SHAPE_ARROW', '2': 2},
    {'1': 'POINTER_SHAPE_PEACE', '2': 3},
    {'1': 'POINTER_SHAPE_WAVE', '2': 4},
    {'1': 'POINTER_SHAPE_ANDROID', '2': 5},
    {'1': 'POINTER_SHAPE_FLUTTER', '2': 6},
    {'1': 'POINTER_SHAPE_AMONGUS', '2': 7},
  ],
};

/// Descriptor for `PointerSettingsMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List pointerSettingsMessageDescriptor = $convert.base64Decode(
    'ChZQb2ludGVyU2V0dGluZ3NNZXNzYWdlEhsKCWNvbG9yX2hleBgBIAEoCVIIY29sb3JIZXgSEgoEc2l6ZRgCIAEoAlIEc2l6ZRJECgVzaGFwZRgDIAEoDjIuLnB1enpsZS52MS5Qb2ludGVyU2V0dGluZ3NNZXNzYWdlLlBvaW50ZXJTaGFwZVIFc2hhcGUi4gEKDFBvaW50ZXJTaGFwZRIdChlQT0lOVEVSX1NIQVBFX1VOU1BFQ0lGSUVEEAASGAoUUE9JTlRFUl9TSEFQRV9DSVJDTEUQARIXChNQT0lOVEVSX1NIQVBFX0FSUk9XEAISFwoTUE9JTlRFUl9TSEFQRV9QRUFDRRADEhYKElBPSU5URVJfU0hBUEVfV0FWRRAEEhkKFVBPSU5URVJfU0hBUEVfQU5EUk9JRBAFEhkKFVBPSU5URVJfU0hBUEVfRkxVVFRFUhAGEhkKFVBPSU5URVJfU0hBUEVfQU1PTkdVUxAH');
