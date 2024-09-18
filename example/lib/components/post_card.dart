import 'package:cereal/cereal.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class PostCard extends StatelessWidget {
  const PostCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          const SizedBox(height: 10),
          Container(
            height: 38,
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            child: Row(
              children: [
                const LetterredAvatar(
                  fullName: 'John Doe',
                ),
                const SizedBox(width: 8),
                Text(
                  'John Doe',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).theme.onBackground,
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 8),
          Container(
            height: 240,
            margin: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            decoration: BoxDecoration(
              color: Colors.purple[100]!,
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    const Icon(
                      FeatherIcons.thumbsUp,
                      size: 16,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '12',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context).theme.onBackground,
                      ),
                    )
                  ],
                ),
                const SizedBox(width: 16),
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    const Icon(
                      FeatherIcons.messageCircle,
                      size: 18,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '3',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context).theme.onBackground,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
