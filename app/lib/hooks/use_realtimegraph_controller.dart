import 'package:flutter/material.dart';
import 'package:flutter_challenge/widgets/realtime_graph.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

RealtimeGraphController useRealtimeGraphController({
  Duration duration = const Duration(seconds: 10),
  bool autoPlay = true,
}) {
  return use(const _RealtimeGraphControllerHook());
}

class _RealtimeGraphControllerHook extends Hook<RealtimeGraphController> {
  const _RealtimeGraphControllerHook({
    List<Object?>? keys,
  }) : super(keys: keys);

  @override
  HookState<RealtimeGraphController, Hook<RealtimeGraphController>> createState() =>
      _RealtimeGraphControllerHookState();
}

class _RealtimeGraphControllerHookState extends HookState<RealtimeGraphController, _RealtimeGraphControllerHook> {
  late final controller = RealtimeGraphController();

  @override
  void initHook() {
    super.initHook();
  }

  @override
  RealtimeGraphController build(BuildContext context) => controller;

  @override
  void dispose() => controller.dispose();

  @override
  String get debugLabel => 'useRealtimeGraphController';
}
