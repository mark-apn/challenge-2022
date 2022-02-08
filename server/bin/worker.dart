import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter_challenge_server/env.dart';
import 'package:flutter_challenge_server/src/tasks.dart';

final tasks = <ScheduledTask>[];
StreamSubscription? listener;

Future<void> main(List<String> args) async {
  // Instantiate environment variables from arguments.
  Env.instance.init(args);

  // * Listen to commands (e.g. `exit`)
  final stream = stdin.transform(utf8.decoder).transform(const LineSplitter()).asBroadcastStream();
  listener = stream.listen(commandParser);

  // * Schedule worker tasks
  schedule(const Duration(seconds: 3), UpdatePuzzle());
}

void schedule(Duration duration, Task task) {
  final timer = Timer.periodic(duration, (_) => task.execute());
  tasks.add(ScheduledTask(timer, task));
}

void commandParser(String line) {
  if (line == 'exit') {
    print('Exiting worker...');
    // * Cleanup
    for (var i = 0; i < tasks.length; i++) {
      tasks[i].timer.cancel();
    }
    listener?.cancel();

    // * Exit
    exit(0);
  } else {
    print('Unknown command');
  }
}
