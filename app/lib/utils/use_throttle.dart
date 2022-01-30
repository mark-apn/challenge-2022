import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

void useThrottle({
  required VoidCallback callback,
  required ValueNotifier<bool> isActive,
  Duration duration = const Duration(milliseconds: 100),
}) {
  Timer? throttleTimer;
  useEffect(() {
    throttleTimer = Timer.periodic(duration, (_) {
      if (isActive.value) {
        callback();
      }
    });

    return () => throttleTimer?.cancel();
  }, const []);
}
