import 'package:flutter/widgets.dart';

class ThemeData {
  ThemeData({
    required this.background,
    required this.onBackground,
    required this.textStyle,
    required this.headingTextStyle,
  });

  factory ThemeData.light({
    Color background = const Color.fromARGB(255, 255, 255, 255),
    Color onBackground = const Color.fromARGB(255, 0, 0, 0),
  }) =>
      ThemeData(
        background: background,
        onBackground: onBackground,
        textStyle: defaultTextStyle.copyWith(color: onBackground),
        headingTextStyle: defaultHeadingTextStyle.copyWith(color: onBackground),
      );

  factory ThemeData.dark({
    Color background = const Color.fromARGB(255, 0, 0, 0),
    Color onBackground = const Color.fromARGB(255, 255, 255, 255),
  }) =>
      ThemeData(
        background: background,
        onBackground: onBackground,
        textStyle: defaultTextStyle.copyWith(color: onBackground),
        headingTextStyle: defaultHeadingTextStyle.copyWith(color: onBackground),
      );

  static TextStyle defaultTextStyle = const TextStyle(
    fontFamily: 'Public Sans Thin',
    package: 'cereal',
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );

  static TextStyle defaultHeadingTextStyle = const TextStyle(
    fontFamily: 'BebasKai',
    package: 'cereal',
    fontSize: 20,
    fontWeight: FontWeight.w500,
  );

  late final Color background;
  late final Color onBackground;
  late final Color error;
  late final Color onError;
  late final Color errorContainer;
  late final Color onErrorContainer;
  late final Color success;
  late final Color onSuccess;
  late final Color successContainer;
  late final Color onSuccessContainer;
  late final TextStyle textStyle;
  late final TextStyle headingTextStyle;
}
