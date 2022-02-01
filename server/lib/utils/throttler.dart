import 'dart:async';

typedef VoidCallback = void Function();

// A simple class for throttling functions execution
class Throttler {
  final Duration duration;
  Timer? timer;

  DateTime? lastRun;
  VoidCallback? actionToRun;

  Throttler({this.duration = const Duration(milliseconds: 40)});

  void run(VoidCallback action) {
    actionToRun = action;

    // * Timer active - cancelling, but update action to execute to the latest action.
    if (timer?.isActive ?? false) {
      return;
    }

    // * Last update was more than duration ago - execute action immediately.
    if (lastRun == null || DateTime.now().difference(lastRun!) > duration) {
      lastRun = DateTime.now();
      actionToRun?.call();
      return;
    }

    // * Queue the timer to be executed after given duration.
    timer?.cancel();
    timer = Timer(duration, () {
      lastRun = DateTime.now();
      actionToRun?.call();
    });
  }
}
