import 'package:flutter/widgets.dart';

import '../theme/theme.dart';

class AppBar extends StatelessWidget {
  const AppBar({
    super.key,
    this.leading,
    this.trailing,
    this.title,
    this.bottom,
  });

  final Widget? leading;
  final Widget? trailing;
  final String? title;
  final Widget? bottom;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).padding.top + 8,
            left: MediaQuery.of(context).padding.left + 16,
            right: MediaQuery.of(context).padding.right + 16,
            bottom: 8,
          ),
          child: SizedBox(
            height: 42,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                if (leading != null) leading!,
                if (leading != null) const SizedBox(width: 8),
                if (title != null)
                  Expanded(
                    child: Text(
                      title!,
                      style: Theme.of(context).theme.textStyle.copyWith(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            letterSpacing: -0.8,
                            color: Theme.of(context).theme.onBackground,
                          ),
                    ),
                  ),
                if (trailing != null) trailing!,
              ],
            ),
          ),
        ),
        if (bottom != null) bottom!,
      ],
    );
  }
}
