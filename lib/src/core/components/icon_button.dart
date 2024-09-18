import 'package:flutter/widgets.dart';

import '../colors/colors.dart';
import '../utils/border_side.dart';

class IconButton extends StatefulWidget {
  const IconButton({
    super.key,
    required this.icon,
    this.color = Colors.transparent,
    required this.onPressed,
  });

  final IconData icon;
  final Color color;
  final void Function() onPressed;

  @override
  State<IconButton> createState() => _IconButtonState();
}

class _IconButtonState extends State<IconButton> {
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
        padding: const EdgeInsets.all(10),
        margin: EdgeInsets.only(top: isPressed ? 2 : 0),
        decoration: BoxDecoration(
          color: widget.color,
          border: Border(
            top: thinBorder,
            left: thinBorder,
            right: thinBorder,
            bottom: thicBorder,
          ),
          borderRadius: BorderRadius.circular(28),
        ),
        child: Icon(
          widget.icon,
          size: 26,
        ),
      ),
    );
  }
}
