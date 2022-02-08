import 'package:get_it/get_it.dart';

final _sl = GetIt.instance;

class DI {
  static T inject<T extends Object>() => _sl();

  static void register<T extends Object>(T instance) => _sl.registerSingleton<T>(instance);
}
