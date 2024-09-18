import 'package:cereal/cereal.dart';
import 'package:example/views/controls.dart';
import 'package:example/views/cards.dart';
import 'package:example/views/inputs.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final PageController controller = PageController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CerealPage(
      appBar: const AppBar(
        leading: LetterredAvatar(
          fullName: 'Marcus Felix',
        ),
        title: 'Cereal Design',
      ),
      body: PageView(
        controller: controller,
        children: [
          Cards(),
          Controls(),
          Inputs(),
        ],
      ),
      bottomBar: BottomTabBar(
        controller: controller,
        icons: [
          Icon(
            FeatherIcons.square,
            size: 24,
          ),
          Icon(
            FeatherIcons.sliders,
            size: 24,
          ),
          Icon(
            FeatherIcons.file,
            size: 24,
          ),
        ],
      ),
    );
  }
}
