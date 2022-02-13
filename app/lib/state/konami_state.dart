import 'package:hooks_riverpod/hooks_riverpod.dart';

enum KonamiChar { up, down, left, right, a, b, invalid }

final _konami = [
  KonamiChar.up,
  KonamiChar.up,
  KonamiChar.down,
  KonamiChar.down,
  KonamiChar.left,
  KonamiChar.right,
  KonamiChar.left,
  KonamiChar.right,
  KonamiChar.b,
  KonamiChar.a
];

final konamiModeEnabledProvider = StateProvider((_) => false);

final konamiCodeProvider = StateProvider((_) => <KonamiChar>[]);

final konamiCodeCompleted = Provider((ref) {
  final code = ref.watch(konamiCodeProvider);
  return code.isValid && code.length == _konami.length;
});

extension KonamiChecker on List<KonamiChar> {
  bool get isValid {
    if (length > _konami.length) return false;

    for (int i = 0; i < length; i++) {
      final value = this[i];
      if (value != _konami[i]) {
        return false;
      }
    }
    return length <= _konami.length;
  }
}
