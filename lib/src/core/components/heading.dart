import 'package:flutter/widgets.dart';

import '../theme/theme.dart';

class Heading extends StatelessWidget {
  const Heading({
    super.key,
    required this.title,
    this.subtitle,
  });

  final String title;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: Theme.of(context).theme.textStyle.copyWith(
                fontSize: 38,
                fontFamily: 'BebasKai',
                fontWeight: FontWeight.w500,
                letterSpacing: -0.8,
                color: Theme.of(context).theme.onBackground,
              ),
        ),
      ],
    );
  }
}
