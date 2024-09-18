import 'package:flutter/widgets.dart';

import '../theme/theme.dart';

BorderSide borderSide(BuildContext context, {double width = 2, Color? color}) =>
    BorderSide(
      color: color ?? Theme.of(context).theme.onBackground,
      width: width,
    );
