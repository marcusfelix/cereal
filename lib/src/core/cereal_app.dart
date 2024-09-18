import 'dart:ui';

import 'package:flutter/widgets.dart';

import 'router/route_generator.dart';
import 'theme/theme.dart';
import 'theme/theme_data.dart';
import 'theme/theme_mode.dart';

class CerealApp extends StatefulWidget {
  const CerealApp({
    super.key,
    this.lightTheme,
    this.darkTheme,
    this.initialRoute,
    this.routes = const <String, WidgetBuilder>{},
  });

  final ThemeData? lightTheme;
  final ThemeData? darkTheme;
  final String? initialRoute;
  final Map<String, WidgetBuilder> routes;

  @override
  State<CerealApp> createState() => _CerealAppState();
}

class _CerealAppState extends State<CerealApp> {
  PageRouteBuilder<T> _pageRouteBuilder<T>(
    RouteSettings settings,
    WidgetBuilder builder,
  ) =>
      RouteGenerator.routePage(settings, builder);

  Route<T> _onGenerateRoute<T>(RouteSettings settings) {
    final WidgetBuilder route = widget.routes[settings.name] ??
        (BuildContext context) => Container(
              color: const Color.fromRGBO(255, 0, 0, 1),
            );
    return _pageRouteBuilder(settings, route);
  }

  ThemeData get light => widget.lightTheme ?? ThemeData.light();

  ThemeData get dark => widget.darkTheme ?? ThemeData.dark();

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: ThemeModeNotifier(ThemeMode.system),
      builder: (BuildContext context, ThemeMode themeMode, Widget? child) {
        // Compute the theme based on the theme mode
        ThemeData theme = light;
        if (themeMode == ThemeMode.light) {
          theme = light;
        } else if (themeMode == ThemeMode.dark) {
          theme = dark;
        } else if (themeMode == ThemeMode.system) {
          theme = MediaQuery.of(context).platformBrightness == Brightness.dark
              ? dark
              : light;
        }

        return Theme(
          theme: theme,
          child: WidgetsApp(
            color: const Color.fromRGBO(0, 0, 0, 0),
            routes: widget.routes,
            initialRoute: widget.initialRoute ?? '/',
            pageRouteBuilder:
                <T>(RouteSettings settings, WidgetBuilder builder) =>
                    _pageRouteBuilder(settings, builder),
            onGenerateRoute: (RouteSettings settings) =>
                _onGenerateRoute(settings),
          ),
        );
      },
    );
  }
}
