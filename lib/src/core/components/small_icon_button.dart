import 'package:flutter/widgets.dart';

import '../colors/colors.dart';
import '../utils/border_side.dart';

class SmallIconButton extends StatelessWidget {
  const SmallIconButton({
    super.key,
    required this.icon,
    this.backgroundColor = Colors.transparent,
    required this.onPressed,
  });

  final IconData icon;
  final Color backgroundColor;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    final BorderSide thinBorder = borderSide(context);

    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 42,
        width: 42,
        decoration: BoxDecoration(
          border: Border.all(
            color: thinBorder.color,
            width: thinBorder.width,
          ),
          borderRadius: BorderRadius.circular(21),
          color: backgroundColor,
        ),
        child: Icon(
          icon,
          size: 24,
        ),
      ),
    );
  }
}
