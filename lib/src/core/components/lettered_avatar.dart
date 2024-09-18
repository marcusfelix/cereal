import 'package:flutter/widgets.dart';

import '../colors/colors.dart';
import '../theme/theme.dart';

class LetterredAvatar extends StatelessWidget {
  const LetterredAvatar({
    super.key,
    required this.fullName,
  });

  final String? fullName;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxWidth: 46,
        maxHeight: 46,
      ),
      child: AspectRatio(
        aspectRatio: 1 / 1,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: Colors.blue[100],
            shape: BoxShape.circle,
            border: Border.all(
              color: Theme.of(context).theme.onBackground,
              width: 2,
            ),
          ),
          child: Center(
            child: Text(
              fullName![0].toUpperCase(),
              style: Theme.of(context).theme.textStyle.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).theme.onBackground,
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
