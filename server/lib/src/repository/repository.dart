import 'package:flutter_challenge_server/di.dart';
import 'package:flutter_challenge_server/src/dao/dao.dart';

class Repository<T extends IDao> {
  // Fetch the dao from the DI container
  T get dao => DI.inject<T>();
}
