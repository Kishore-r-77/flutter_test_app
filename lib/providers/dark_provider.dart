import 'package:flutter_riverpod/flutter_riverpod.dart';

class DarkNotifier extends StateNotifier<bool> {
  DarkNotifier() : super(true);

  void toggleTheme(value) {
    state = value;
  }
}

final darkProvider = StateNotifierProvider<DarkNotifier, bool>(
  (ref) => DarkNotifier(),
);
