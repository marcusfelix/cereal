import 'package:flutter/widgets.dart';

import '../../../cereal.dart';
import '../theme/theme.dart';

class CerealPage extends StatelessWidget {
  const CerealPage(
      {super.key, required this.body, this.appBar, this.bottomBar});

  final Widget body;
  final AppBar? appBar;
  final Widget? bottomBar;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Theme.of(context).theme.background,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Column(
            children: <Widget>[
              if (appBar != null) appBar!,
              Expanded(child: body),
            ],
          ),
          if (bottomBar != null)
            Positioned(
              left: MediaQuery.of(context).padding.left + 16,
              right: MediaQuery.of(context).padding.right + 16,
              bottom: MediaQuery.of(context).padding.bottom + 16,
              child: bottomBar!,
            ),
        ],
      ),
    );
  }
}
