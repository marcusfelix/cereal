import 'package:flutter/widgets.dart';

import '../colors/colors.dart';
import '../theme/theme.dart';
import '../utils/border_side.dart';

class SmallTextButton extends StatelessWidget {
  const SmallTextButton({
    super.key,
    required this.text,
    this.backgroundColor = Colors.transparent,
    required this.onPressed,
  });

  final String text;
  final Color backgroundColor;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    final BorderSide thinBorder = borderSide(context);

    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 6,
          horizontal: 16,
        ),
        decoration: BoxDecoration(
          border: Border.all(
            color: thinBorder.color,
            width: thinBorder.width,
          ),
          borderRadius: BorderRadius.circular(18),
          color: backgroundColor,
        ),
        child: Text(
          text,
          style: Theme.of(context).theme.textStyle.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                letterSpacing: -0.5,
              ),
        ),
      ),
    );
  }
}
