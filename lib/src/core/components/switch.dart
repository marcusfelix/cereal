import 'package:flutter/widgets.dart';

import '../colors/colors.dart';
import '../theme/theme.dart';
import '../utils/border_side.dart';

class Switch extends StatelessWidget {
  const Switch({
    super.key,
    this.value = false,
    this.backgroundColor,
    required this.icon,
    this.onChanged,
  });

  final bool value;
  final Color? backgroundColor;
  final IconData icon;
  final ValueChanged<bool>? onChanged;

  @override
  Widget build(BuildContext context) {
    final BorderSide thinBorder = borderSide(context);
    final BorderSide thicBorder = borderSide(context, width: 4);

    return SizedBox(
      height: 42,
      width: 68,
      child: GestureDetector(
        onTap: () => onChanged?.call(!value),
        child: Stack(
          alignment: Alignment.center,
          children: [
            AnimatedContainer(
              height: 34,
              duration: const Duration(milliseconds: 300),
              decoration: BoxDecoration(
                color: value
                    ? backgroundColor ?? Colors.yellow[100]
                    : Theme.of(context).theme.background,
                border: Border(
                  top: thinBorder,
                  left: thinBorder,
                  right: thinBorder,
                  bottom: thicBorder,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Container(),
            ),
            AnimatedPositioned(
              duration: const Duration(milliseconds: 100),
              left: value ? 26 : 0,
              child: Container(
                width: 42,
                height: 42,
                decoration: BoxDecoration(
                  color: Theme.of(context).theme.background,
                  borderRadius: BorderRadius.circular(23),
                  border: Border.all(
                    color: Theme.of(context).theme.onBackground,
                    width: 2,
                  ),
                ),
                child: Icon(
                  icon,
                  size: 24,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
