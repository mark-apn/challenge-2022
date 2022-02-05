import 'package:args/args.dart';

class Env {
  static final Env instance = Env._internal();

  Env._internal();

  late final ArgResults arguments;

  int get serverPort => int.parse(arguments['port'] as String);

  bool get isLocal => (arguments['env'] as String) == 'local';

  // * Parse options
  void init(List<String> args) {
    final parser = ArgParser();
    parser.addOption('port', abbr: 'p', defaultsTo: '80');
    parser.addOption('env', abbr: 'e', defaultsTo: 'production');
    arguments = parser.parse(args);
  }
}
