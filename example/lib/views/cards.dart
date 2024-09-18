import 'package:example/components/post_card.dart';
import 'package:flutter/widgets.dart';
import 'package:cereal/cereal.dart';

class Cards extends StatelessWidget {
  const Cards({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16).copyWith(bottom: 120),
      children: <Widget>[
        const Align(
          alignment: Alignment.centerLeft,
          child: Heading(
            title: 'Cards',
          ),
        ),
        const SizedBox(height: 16),
        PostCard(),
      ],
    );
  }
}
