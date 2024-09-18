import 'package:flutter/widgets.dart';

import '../colors/colors.dart';
import '../utils/border_side.dart';

class Card extends StatelessWidget {
  const Card({
    super.key,
    required this.child,
    this.backgroundColor = Colors.transparent,
  });

  final Widget child;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    final BorderSide thinBorder = borderSide(context);
    final BorderSide thicBorder = borderSide(context, width: 4);

    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        border: Border(
          top: thinBorder,
          left: thinBorder,
          right: thinBorder,
          bottom: thicBorder,
        ),
        borderRadius: BorderRadius.circular(22),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: child,
      ),
    );
  }
}
