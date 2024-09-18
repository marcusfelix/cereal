import 'package:flutter/widgets.dart';
import 'theme_data.dart';

class Theme extends InheritedWidget {
  const Theme({
    super.key,
    required this.theme,
    required super.child,
  });

  final ThemeData theme;

  static Theme of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<Theme>()!;
  }

  @override
  bool updateShouldNotify(Theme oldWidget) {
    return theme != oldWidget.theme;
  }
}
