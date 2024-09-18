import 'package:flutter/widgets.dart';

import '../theme/theme.dart';
import '../utils/border_side.dart';
import 'dashed_line.dart';

class BottomTabBar extends StatefulWidget {
  const BottomTabBar({
    super.key,
    required this.icons,
    required this.controller,
  });

  final List<Widget> icons;
  final PageController controller;

  @override
  State<BottomTabBar> createState() => _BottomTabBarState();
}

class _BottomTabBarState extends State<BottomTabBar> {
  int _index = 0;

  @override
  void initState() {
    widget.controller.addListener(() {
      final int newIndex = (widget.controller.page ?? 0).round();
      if (newIndex != _index) {
        setState(() {
          _index = newIndex;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    assert(widget.icons.isNotEmpty, 'Items cannot be empty');
    assert(widget.icons.length <= 6, 'Items cannot be more than 6');

    final BorderSide thinBorder = borderSide(context);
    final BorderSide thicBorder = borderSide(context, width: 4);

    final List<Widget> rowItems = <Widget>[];

    for (int i = 0; i < widget.icons.length; i++) {
      rowItems.add(widget.icons[i]);
      if (i < widget.icons.length - 1) {
        rowItems.add(
          DashedLine(
            direction: DashedLineDirection.vertical,
            color: Theme.of(context).theme.onBackground.withOpacity(0.2),
          ),
        );
      }
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          height: 56,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: Theme.of(context).theme.background,
            border: Border(
              top: thinBorder,
              left: thinBorder,
              right: thinBorder,
              bottom: thicBorder,
            ),
            borderRadius: BorderRadius.circular(28),
          ),
          child: Row(
            children: rowItems.map<Widget>((Widget item) {
              return AnimatedOpacity(
                opacity: item is Icon && _index == widget.icons.indexOf(item)
                    ? 1
                    : 0.3,
                duration: const Duration(milliseconds: 300),
                child: item is Icon
                    ? GestureDetector(
                        onTap: () {
                          widget.controller.animateToPage(
                            widget.icons.indexOf(item),
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: item,
                        ),
                      )
                    : item,
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
