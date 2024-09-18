import 'package:flutter/widgets.dart';

class RouteGenerator {
  static PageRouteBuilder<T> routePage<T>(
          RouteSettings settings, WidgetBuilder builder) =>
      PageRouteBuilder<T>(
        barrierColor: const Color.fromRGBO(0, 0, 0, 0.5),
        opaque: false,
        settings: settings,
        transitionDuration: const Duration(milliseconds: 360),
        reverseTransitionDuration: const Duration(milliseconds: 360 ~/ 2),
        pageBuilder: (BuildContext context, Animation<double> animation,
                Animation<double> secondaryAnimation) =>
            builder(context),
        transitionsBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation, Widget child) {
          final Animatable<double> scale = Tween<double>(begin: 1.3, end: 1)
              .chain(CurveTween(curve: Curves.ease));
          final Animatable<double> opacity = Tween<double>(begin: 0, end: 1)
              .chain(CurveTween(curve: Curves.ease));

          return ScaleTransition(
            scale: animation.drive(scale),
            child:
                FadeTransition(opacity: animation.drive(opacity), child: child),
          );
        },
      );
}
