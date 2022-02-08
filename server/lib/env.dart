import 'package:args/args.dart';
import 'package:flutter_challenge_server/di.dart';
import 'package:flutter_challenge_server/src/dao/participant_dao.dart';
import 'package:flutter_challenge_server/src/dao/puzzle_dao.dart';
import 'package:flutter_challenge_server/src/repository/participant_repo.dart';
import 'package:flutter_challenge_server/src/repository/puzzle_repo.dart';

class Env {
  static final Env instance = Env._internal();

  Env._internal();

  late final ArgResults arguments;

  int get serverPort => int.parse(arguments['port'] as String);

  bool get isLocal => (arguments['env'] as String) == 'local';

  // * Parse options
  void init(
    List<String> args, {
    IPuzzleDao? puzzleDao,
    IParticipantDao? participantDao,
  }) {
    final parser = ArgParser();
    parser.addOption('port', abbr: 'p', defaultsTo: '80');
    parser.addOption('env', abbr: 'e', defaultsTo: 'production');
    arguments = parser.parse(args);

    // * Concrete implementations of an abstract class.
    // * Can be mocked duting testing
    DI.register<IPuzzleDao>(puzzleDao ?? PuzzleDao());
    DI.register<IParticipantDao>(participantDao ?? ParticipantDao());

    DI.register(PuzzleRepo());
    DI.register(ParticipantRepo());
  }
}
