import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

ConfettiController useConfettiController({
  Duration duration = const Duration(seconds: 10),
  bool autoPlay = true,
}) {
  return use(
    _ConfettiControllerHook(
      duration: duration,
      autoPlay: autoPlay,
    ),
  );
}

class _ConfettiControllerHook extends Hook<ConfettiController> {
  const _ConfettiControllerHook({
    required this.duration,
    required this.autoPlay,
    List<Object?>? keys,
  }) : super(keys: keys);

  final Duration duration;
  final bool autoPlay;

  @override
  HookState<ConfettiController, Hook<ConfettiController>> createState() => _ConfettiControllerHookState();
}

class _ConfettiControllerHookState extends HookState<ConfettiController, _ConfettiControllerHook> {
  late final controller = ConfettiController(duration: hook.duration);

  @override
  void initHook() {
    super.initHook();

    if (hook.autoPlay) {
      controller.play();
    }
  }

  @override
  ConfettiController build(BuildContext context) => controller;

  @override
  void dispose() => controller.dispose();

  @override
  String get debugLabel => 'useConfettiController';
}
