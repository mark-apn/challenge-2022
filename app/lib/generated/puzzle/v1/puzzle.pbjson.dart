///
//  Generated code. Do not modify.
//  source: puzzle/v1/puzzle.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use keepAliveRequestDescriptor instead')
const KeepAliveRequest$json = const {
  '1': 'KeepAliveRequest',
  '2': const [
    const {'1': 'user_id', '3': 1, '4': 1, '5': 9, '10': 'userId'},
  ],
};

/// Descriptor for `KeepAliveRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List keepAliveRequestDescriptor = $convert.base64Decode('ChBLZWVwQWxpdmVSZXF1ZXN0EhcKB3VzZXJfaWQYASABKAlSBnVzZXJJZA==');
@$core.Deprecated('Use keepAliveResponseDescriptor instead')
const KeepAliveResponse$json = const {
  '1': 'KeepAliveResponse',
};

/// Descriptor for `KeepAliveResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List keepAliveResponseDescriptor = $convert.base64Decode('ChFLZWVwQWxpdmVSZXNwb25zZQ==');
@$core.Deprecated('Use subscribeToPuzzleRequestDescriptor instead')
const SubscribeToPuzzleRequest$json = const {
  '1': 'SubscribeToPuzzleRequest',
  '2': const [
    const {'1': 'user_id', '3': 1, '4': 1, '5': 9, '10': 'userId'},
  ],
};

/// Descriptor for `SubscribeToPuzzleRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List subscribeToPuzzleRequestDescriptor = $convert.base64Decode('ChhTdWJzY3JpYmVUb1B1enpsZVJlcXVlc3QSFwoHdXNlcl9pZBgBIAEoCVIGdXNlcklk');
@$core.Deprecated('Use subscribeToPuzzleResponseDescriptor instead')
const SubscribeToPuzzleResponse$json = const {
  '1': 'SubscribeToPuzzleResponse',
  '2': const [
    const {'1': 'puzzle', '3': 1, '4': 1, '5': 11, '6': '.puzzle.v1.PuzzleMessage', '10': 'puzzle'},
  ],
};

/// Descriptor for `SubscribeToPuzzleResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List subscribeToPuzzleResponseDescriptor = $convert.base64Decode('ChlTdWJzY3JpYmVUb1B1enpsZVJlc3BvbnNlEjAKBnB1enpsZRgBIAEoCzIYLnB1enpsZS52MS5QdXp6bGVNZXNzYWdlUgZwdXp6bGU=');
@$core.Deprecated('Use voteForTileRequestDescriptor instead')
const VoteForTileRequest$json = const {
  '1': 'VoteForTileRequest',
  '2': const [
    const {'1': 'user_id', '3': 1, '4': 1, '5': 9, '10': 'userId'},
    const {'1': 'tile_value', '3': 3, '4': 1, '5': 5, '10': 'tileValue'},
  ],
};

/// Descriptor for `VoteForTileRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List voteForTileRequestDescriptor = $convert.base64Decode('ChJWb3RlRm9yVGlsZVJlcXVlc3QSFwoHdXNlcl9pZBgBIAEoCVIGdXNlcklkEh0KCnRpbGVfdmFsdWUYAyABKAVSCXRpbGVWYWx1ZQ==');
@$core.Deprecated('Use voteForTileResponseDescriptor instead')
const VoteForTileResponse$json = const {
  '1': 'VoteForTileResponse',
};

/// Descriptor for `VoteForTileResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List voteForTileResponseDescriptor = $convert.base64Decode('ChNWb3RlRm9yVGlsZVJlc3BvbnNl');
@$core.Deprecated('Use puzzleMessageDescriptor instead')
const PuzzleMessage$json = const {
  '1': 'PuzzleMessage',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'created_at', '3': 2, '4': 1, '5': 3, '10': 'createdAt'},
    const {'1': 'updated_at', '3': 3, '4': 1, '5': 3, '10': 'updatedAt'},
    const {'1': 'tiles', '3': 4, '4': 3, '5': 11, '6': '.puzzle.v1.TileMessage', '10': 'tiles'},
    const {'1': 'status', '3': 5, '4': 1, '5': 14, '6': '.puzzle.v1.PuzzleMessage.PuzzleStatus', '10': 'status'},
    const {'1': 'num_moves', '3': 6, '4': 1, '5': 5, '10': 'numMoves'},
  ],
  '4': const [PuzzleMessage_PuzzleStatus$json],
};

@$core.Deprecated('Use puzzleMessageDescriptor instead')
const PuzzleMessage_PuzzleStatus$json = const {
  '1': 'PuzzleStatus',
  '2': const [
    const {'1': 'PUZZLE_STATUS_UNSPECIFIED', '2': 0},
    const {'1': 'PUZZLE_STATUS_IN_PROGRESS', '2': 1},
    const {'1': 'PUZZLE_STATUS_COMPLETED', '2': 2},
  ],
};

/// Descriptor for `PuzzleMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List puzzleMessageDescriptor = $convert.base64Decode('Cg1QdXp6bGVNZXNzYWdlEg4KAmlkGAEgASgJUgJpZBIdCgpjcmVhdGVkX2F0GAIgASgDUgljcmVhdGVkQXQSHQoKdXBkYXRlZF9hdBgDIAEoA1IJdXBkYXRlZEF0EiwKBXRpbGVzGAQgAygLMhYucHV6emxlLnYxLlRpbGVNZXNzYWdlUgV0aWxlcxI9CgZzdGF0dXMYBSABKA4yJS5wdXp6bGUudjEuUHV6emxlTWVzc2FnZS5QdXp6bGVTdGF0dXNSBnN0YXR1cxIbCgludW1fbW92ZXMYBiABKAVSCG51bU1vdmVzImkKDFB1enpsZVN0YXR1cxIdChlQVVpaTEVfU1RBVFVTX1VOU1BFQ0lGSUVEEAASHQoZUFVaWkxFX1NUQVRVU19JTl9QUk9HUkVTUxABEhsKF1BVWlpMRV9TVEFUVVNfQ09NUExFVEVEEAI=');
@$core.Deprecated('Use tileMessageDescriptor instead')
const TileMessage$json = const {
  '1': 'TileMessage',
  '2': const [
    const {'1': 'value', '3': 1, '4': 1, '5': 5, '10': 'value'},
    const {'1': 'num_votes', '3': 2, '4': 1, '5': 5, '10': 'numVotes'},
    const {'1': 'current_position', '3': 3, '4': 1, '5': 11, '6': '.puzzle.v1.TilePosition', '10': 'currentPosition'},
    const {'1': 'correct_position', '3': 4, '4': 1, '5': 11, '6': '.puzzle.v1.TilePosition', '10': 'correctPosition'},
    const {'1': 'is_whitespace', '3': 5, '4': 1, '5': 8, '10': 'isWhitespace'},
  ],
};

/// Descriptor for `TileMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List tileMessageDescriptor = $convert.base64Decode('CgtUaWxlTWVzc2FnZRIUCgV2YWx1ZRgBIAEoBVIFdmFsdWUSGwoJbnVtX3ZvdGVzGAIgASgFUghudW1Wb3RlcxJCChBjdXJyZW50X3Bvc2l0aW9uGAMgASgLMhcucHV6emxlLnYxLlRpbGVQb3NpdGlvblIPY3VycmVudFBvc2l0aW9uEkIKEGNvcnJlY3RfcG9zaXRpb24YBCABKAsyFy5wdXp6bGUudjEuVGlsZVBvc2l0aW9uUg9jb3JyZWN0UG9zaXRpb24SIwoNaXNfd2hpdGVzcGFjZRgFIAEoCFIMaXNXaGl0ZXNwYWNl');
@$core.Deprecated('Use tilePositionDescriptor instead')
const TilePosition$json = const {
  '1': 'TilePosition',
  '2': const [
    const {'1': 'x', '3': 1, '4': 1, '5': 5, '10': 'x'},
    const {'1': 'y', '3': 2, '4': 1, '5': 5, '10': 'y'},
  ],
};

/// Descriptor for `TilePosition`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List tilePositionDescriptor = $convert.base64Decode('CgxUaWxlUG9zaXRpb24SDAoBeBgBIAEoBVIBeBIMCgF5GAIgASgFUgF5');
