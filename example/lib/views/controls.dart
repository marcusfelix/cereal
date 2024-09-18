import 'package:cereal/cereal.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class Controls extends StatefulWidget {
  const Controls({
    super.key,
  });

  @override
  State<Controls> createState() => _ControlsState();
}

class _ControlsState extends State<Controls> {
  bool _switch = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Align(
            alignment: Alignment.centerLeft,
            child: Heading(
              title: 'Controls',
            ),
          ),
          const SizedBox(height: 16),
          IconButton(
            onPressed: () => print('Icon button pressed'),
            color: Colors.purple[100]!,
            icon: FeatherIcons.save,
          ),
          const SizedBox(height: 16),
          TextButton(
            onPressed: () => print('Call to action button pressed'),
            color: Colors.blue[100]!,
            text: 'Call to action',
          ),
          const SizedBox(height: 16),
          SmallIconButton(
            onPressed: () => print('Add button pressed'),
            icon: FeatherIcons.plus,
          ),
          const SizedBox(height: 16),
          SmallTextButton(
            onPressed: () => print('Remove button pressed'),
            text: 'Call to action',
          ),
          const SizedBox(height: 16),
          Switch(
            onChanged: (value) => setState(() => _switch = !_switch),
            value: _switch,
            icon: FeatherIcons.circle,
          )
        ],
      ),
    );
  }
}
