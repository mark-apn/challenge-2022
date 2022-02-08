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
  static const PuzzleMessage_PuzzleStatus PUZZLE_STATUS_UNSPECIFIED = PuzzleMessage_PuzzleStatus._(
      0, $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'PUZZLE_STATUS_UNSPECIFIED');
  static const PuzzleMessage_PuzzleStatus PUZZLE_STATUS_IN_PROGRESS = PuzzleMessage_PuzzleStatus._(
      1, $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'PUZZLE_STATUS_IN_PROGRESS');
  static const PuzzleMessage_PuzzleStatus PUZZLE_STATUS_COMPLETED = PuzzleMessage_PuzzleStatus._(
      2, $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'PUZZLE_STATUS_COMPLETED');

  static const $core.List<PuzzleMessage_PuzzleStatus> values = <PuzzleMessage_PuzzleStatus>[
    PUZZLE_STATUS_UNSPECIFIED,
    PUZZLE_STATUS_IN_PROGRESS,
    PUZZLE_STATUS_COMPLETED,
  ];

  static final $core.Map<$core.int, PuzzleMessage_PuzzleStatus> _byValue = $pb.ProtobufEnum.initByValue(values);
  static PuzzleMessage_PuzzleStatus? valueOf($core.int value) => _byValue[value];

  const PuzzleMessage_PuzzleStatus._($core.int v, $core.String n) : super(v, n);
}

class PointerSettingsMessage_PointerShape extends $pb.ProtobufEnum {
  static const PointerSettingsMessage_PointerShape POINTER_SHAPE_UNSPECIFIED = PointerSettingsMessage_PointerShape._(
      0, $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'POINTER_SHAPE_UNSPECIFIED');
  static const PointerSettingsMessage_PointerShape POINTER_SHAPE_CIRCLE = PointerSettingsMessage_PointerShape._(
      1, $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'POINTER_SHAPE_CIRCLE');
  static const PointerSettingsMessage_PointerShape POINTER_SHAPE_ARROW = PointerSettingsMessage_PointerShape._(
      2, $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'POINTER_SHAPE_ARROW');
  static const PointerSettingsMessage_PointerShape POINTER_SHAPE_PEACE = PointerSettingsMessage_PointerShape._(
      3, $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'POINTER_SHAPE_PEACE');
  static const PointerSettingsMessage_PointerShape POINTER_SHAPE_WAVE = PointerSettingsMessage_PointerShape._(
      4, $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'POINTER_SHAPE_WAVE');
  static const PointerSettingsMessage_PointerShape POINTER_SHAPE_ANDROID = PointerSettingsMessage_PointerShape._(
      5, $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'POINTER_SHAPE_ANDROID');
  static const PointerSettingsMessage_PointerShape POINTER_SHAPE_FLUTTER = PointerSettingsMessage_PointerShape._(
      6, $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'POINTER_SHAPE_FLUTTER');
  static const PointerSettingsMessage_PointerShape POINTER_SHAPE_AMONGUS = PointerSettingsMessage_PointerShape._(
      7, $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'POINTER_SHAPE_AMONGUS');

  static const $core.List<PointerSettingsMessage_PointerShape> values = <PointerSettingsMessage_PointerShape>[
    POINTER_SHAPE_UNSPECIFIED,
    POINTER_SHAPE_CIRCLE,
    POINTER_SHAPE_ARROW,
    POINTER_SHAPE_PEACE,
    POINTER_SHAPE_WAVE,
    POINTER_SHAPE_ANDROID,
    POINTER_SHAPE_FLUTTER,
    POINTER_SHAPE_AMONGUS,
  ];

  static final $core.Map<$core.int, PointerSettingsMessage_PointerShape> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static PointerSettingsMessage_PointerShape? valueOf($core.int value) => _byValue[value];

  const PointerSettingsMessage_PointerShape._($core.int v, $core.String n) : super(v, n);
}
