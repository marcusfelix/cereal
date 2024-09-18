import 'package:flutter/widgets.dart';

import '../colors/colors.dart';
import '../theme/theme.dart';
import '../utils/border_side.dart';

class TextButton extends StatefulWidget {
  const TextButton({
    super.key,
    required this.text,
    this.color = Colors.transparent,
    required this.onPressed,
  });

  final String text;
  final Color color;
  final void Function() onPressed;

  @override
  State<TextButton> createState() => _TextButtonState();
}

class _TextButtonState extends State<TextButton> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    final BorderSide thinBorder = borderSide(context);
    final BorderSide thicBorder = borderSide(context, width: isPressed ? 2 : 4);

    return GestureDetector(
      onTapDown: (_) => setState(() => isPressed = true),
      onTapUp: (_) {
        setState(() => isPressed = false);
        widget.onPressed();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
        margin: EdgeInsets.only(top: isPressed ? 2 : 0),
        decoration: BoxDecoration(
          color: widget.color,
          border: Border(
            top: thinBorder,
            left: thinBorder,
            right: thinBorder,
            bottom: thicBorder,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          widget.text,
          style: Theme.of(context).theme.textStyle.copyWith(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                letterSpacing: -0.5,
              ),
        ),
      ),
    );
  }
}
