import 'package:flutter/foundation.dart';

class ThemeModeNotifier extends ValueNotifier<ThemeMode> {
  ThemeModeNotifier(super.value);

  @override
  set value(ThemeMode newValue) {
    super.value = newValue;
    notifyListeners();
  }
}

enum ThemeMode { system, light, dark }
