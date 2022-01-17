import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter_challenge_server/src/tasks.dart';

final tasks = <ScheduledTask>[];
StreamSubscription? listener;

Future<void> main(List<String> args) async {
  // * Listen to commands (e.g. `exit`)
  final stream = stdin.transform(utf8.decoder).transform(const LineSplitter()).asBroadcastStream();
  listener = stream.listen(commandParser);

  // * Schedule worker tasks
  schedule(Duration(seconds: 3), UpdatePuzzle());
}

void schedule(Duration duration, Task task) {
  final timer = Timer.periodic(duration, (_) => task.execute());
  tasks.add(ScheduledTask(timer, task));
}

void commandParser(String line) {
  if (line == 'exit') {
    print('Exiting worker...');
    // * Cleanup
    tasks.forEach((task) => task.timer.cancel());
    listener?.cancel();

    // * Exit
    exit(0);
  } else {
    print('Unknown command');
  }
}
