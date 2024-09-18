import 'package:cereal/cereal.dart';
import 'package:flutter/widgets.dart';

class Inputs extends StatelessWidget {
  const Inputs({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16).copyWith(bottom: 120),
      children: <Widget>[
        InputText(),
        const SizedBox(height: 16),
        InputText(),
      ],
    );
  }
}
