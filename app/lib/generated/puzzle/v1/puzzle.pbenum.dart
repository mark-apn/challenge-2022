///
//  Generated code. Do not modify.
//  source: puzzle/v1/puzzle.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

// ignore_for_file: UNDEFINED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class PuzzleMessage_PuzzleStatus extends $pb.ProtobufEnum {
  static const PuzzleMessage_PuzzleStatus PUZZLE_STATUS_UNSPECIFIED = PuzzleMessage_PuzzleStatus._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'PUZZLE_STATUS_UNSPECIFIED');
  static const PuzzleMessage_PuzzleStatus PUZZLE_STATUS_IN_PROGRESS = PuzzleMessage_PuzzleStatus._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'PUZZLE_STATUS_IN_PROGRESS');
  static const PuzzleMessage_PuzzleStatus PUZZLE_STATUS_COMPLETED = PuzzleMessage_PuzzleStatus._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'PUZZLE_STATUS_COMPLETED');

  static const $core.List<PuzzleMessage_PuzzleStatus> values = <PuzzleMessage_PuzzleStatus> [
    PUZZLE_STATUS_UNSPECIFIED,
    PUZZLE_STATUS_IN_PROGRESS,
    PUZZLE_STATUS_COMPLETED,
  ];

  static final $core.Map<$core.int, PuzzleMessage_PuzzleStatus> _byValue = $pb.ProtobufEnum.initByValue(values);
  static PuzzleMessage_PuzzleStatus? valueOf($core.int value) => _byValue[value];

  const PuzzleMessage_PuzzleStatus._($core.int v, $core.String n) : super(v, n);
}

