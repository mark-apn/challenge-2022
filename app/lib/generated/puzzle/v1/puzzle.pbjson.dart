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
@$core.Deprecated('Use updateMousePositionRequestDescriptor instead')
const UpdateMousePositionRequest$json = const {
  '1': 'UpdateMousePositionRequest',
  '2': const [
    const {'1': 'user_id', '3': 1, '4': 1, '5': 9, '10': 'userId'},
    const {'1': 'position', '3': 3, '4': 1, '5': 11, '6': '.puzzle.v1.MousePositionMessage', '10': 'position'},
  ],
};

/// Descriptor for `UpdateMousePositionRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateMousePositionRequestDescriptor = $convert.base64Decode('ChpVcGRhdGVNb3VzZVBvc2l0aW9uUmVxdWVzdBIXCgd1c2VyX2lkGAEgASgJUgZ1c2VySWQSOwoIcG9zaXRpb24YAyABKAsyHy5wdXp6bGUudjEuTW91c2VQb3NpdGlvbk1lc3NhZ2VSCHBvc2l0aW9u');
@$core.Deprecated('Use updateMousePositionResponseDescriptor instead')
const UpdateMousePositionResponse$json = const {
  '1': 'UpdateMousePositionResponse',
};

/// Descriptor for `UpdateMousePositionResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateMousePositionResponseDescriptor = $convert.base64Decode('ChtVcGRhdGVNb3VzZVBvc2l0aW9uUmVzcG9uc2U=');
@$core.Deprecated('Use puzzleMessageDescriptor instead')
const PuzzleMessage$json = const {
  '1': 'PuzzleMessage',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'created_at', '3': 2, '4': 1, '5': 3, '10': 'createdAt'},
    const {'1': 'updated_at', '3': 3, '4': 1, '5': 3, '10': 'updatedAt'},
    const {'1': 'ends_at', '3': 4, '4': 1, '5': 3, '10': 'endsAt'},
    const {'1': 'tiles', '3': 5, '4': 3, '5': 11, '6': '.puzzle.v1.TileMessage', '10': 'tiles'},
    const {'1': 'participants', '3': 6, '4': 3, '5': 11, '6': '.puzzle.v1.ParticipantMessage', '10': 'participants'},
    const {'1': 'status', '3': 7, '4': 1, '5': 14, '6': '.puzzle.v1.PuzzleMessage.PuzzleStatus', '10': 'status'},
    const {'1': 'num_moves', '3': 8, '4': 1, '5': 5, '10': 'numMoves'},
    const {'1': 'total_votes', '3': 9, '4': 1, '5': 5, '10': 'totalVotes'},
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
final $typed_data.Uint8List puzzleMessageDescriptor = $convert.base64Decode('Cg1QdXp6bGVNZXNzYWdlEg4KAmlkGAEgASgJUgJpZBIdCgpjcmVhdGVkX2F0GAIgASgDUgljcmVhdGVkQXQSHQoKdXBkYXRlZF9hdBgDIAEoA1IJdXBkYXRlZEF0EhcKB2VuZHNfYXQYBCABKANSBmVuZHNBdBIsCgV0aWxlcxgFIAMoCzIWLnB1enpsZS52MS5UaWxlTWVzc2FnZVIFdGlsZXMSQQoMcGFydGljaXBhbnRzGAYgAygLMh0ucHV6emxlLnYxLlBhcnRpY2lwYW50TWVzc2FnZVIMcGFydGljaXBhbnRzEj0KBnN0YXR1cxgHIAEoDjIlLnB1enpsZS52MS5QdXp6bGVNZXNzYWdlLlB1enpsZVN0YXR1c1IGc3RhdHVzEhsKCW51bV9tb3ZlcxgIIAEoBVIIbnVtTW92ZXMSHwoLdG90YWxfdm90ZXMYCSABKAVSCnRvdGFsVm90ZXMiaQoMUHV6emxlU3RhdHVzEh0KGVBVWlpMRV9TVEFUVVNfVU5TUEVDSUZJRUQQABIdChlQVVpaTEVfU1RBVFVTX0lOX1BST0dSRVNTEAESGwoXUFVaWkxFX1NUQVRVU19DT01QTEVURUQQAg==');
@$core.Deprecated('Use tileMessageDescriptor instead')
const TileMessage$json = const {
  '1': 'TileMessage',
  '2': const [
    const {'1': 'value', '3': 1, '4': 1, '5': 5, '10': 'value'},
    const {'1': 'num_votes', '3': 2, '4': 1, '5': 5, '10': 'numVotes'},
    const {'1': 'current_position', '3': 3, '4': 1, '5': 11, '6': '.puzzle.v1.PositionMessage', '10': 'currentPosition'},
    const {'1': 'correct_position', '3': 4, '4': 1, '5': 11, '6': '.puzzle.v1.PositionMessage', '10': 'correctPosition'},
    const {'1': 'is_whitespace', '3': 5, '4': 1, '5': 8, '10': 'isWhitespace'},
  ],
};

/// Descriptor for `TileMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List tileMessageDescriptor = $convert.base64Decode('CgtUaWxlTWVzc2FnZRIUCgV2YWx1ZRgBIAEoBVIFdmFsdWUSGwoJbnVtX3ZvdGVzGAIgASgFUghudW1Wb3RlcxJFChBjdXJyZW50X3Bvc2l0aW9uGAMgASgLMhoucHV6emxlLnYxLlBvc2l0aW9uTWVzc2FnZVIPY3VycmVudFBvc2l0aW9uEkUKEGNvcnJlY3RfcG9zaXRpb24YBCABKAsyGi5wdXp6bGUudjEuUG9zaXRpb25NZXNzYWdlUg9jb3JyZWN0UG9zaXRpb24SIwoNaXNfd2hpdGVzcGFjZRgFIAEoCFIMaXNXaGl0ZXNwYWNl');
@$core.Deprecated('Use participantMessageDescriptor instead')
const ParticipantMessage$json = const {
  '1': 'ParticipantMessage',
  '2': const [
    const {'1': 'user_id', '3': 1, '4': 1, '5': 9, '10': 'userId'},
    const {'1': 'mouse_position', '3': 2, '4': 1, '5': 11, '6': '.puzzle.v1.MousePositionMessage', '10': 'mousePosition'},
    const {'1': 'last_active', '3': 3, '4': 1, '5': 3, '10': 'lastActive'},
  ],
};

/// Descriptor for `ParticipantMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List participantMessageDescriptor = $convert.base64Decode('ChJQYXJ0aWNpcGFudE1lc3NhZ2USFwoHdXNlcl9pZBgBIAEoCVIGdXNlcklkEkYKDm1vdXNlX3Bvc2l0aW9uGAIgASgLMh8ucHV6emxlLnYxLk1vdXNlUG9zaXRpb25NZXNzYWdlUg1tb3VzZVBvc2l0aW9uEh8KC2xhc3RfYWN0aXZlGAMgASgDUgpsYXN0QWN0aXZl');
@$core.Deprecated('Use positionMessageDescriptor instead')
const PositionMessage$json = const {
  '1': 'PositionMessage',
  '2': const [
    const {'1': 'x', '3': 1, '4': 1, '5': 5, '10': 'x'},
    const {'1': 'y', '3': 2, '4': 1, '5': 5, '10': 'y'},
  ],
};

/// Descriptor for `PositionMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List positionMessageDescriptor = $convert.base64Decode('Cg9Qb3NpdGlvbk1lc3NhZ2USDAoBeBgBIAEoBVIBeBIMCgF5GAIgASgFUgF5');
@$core.Deprecated('Use mousePositionMessageDescriptor instead')
const MousePositionMessage$json = const {
  '1': 'MousePositionMessage',
  '2': const [
    const {'1': 'x', '3': 1, '4': 1, '5': 2, '10': 'x'},
    const {'1': 'y', '3': 2, '4': 1, '5': 2, '10': 'y'},
  ],
};

/// Descriptor for `MousePositionMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List mousePositionMessageDescriptor = $convert.base64Decode('ChRNb3VzZVBvc2l0aW9uTWVzc2FnZRIMCgF4GAEgASgCUgF4EgwKAXkYAiABKAJSAXk=');
