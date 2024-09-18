import 'package:flutter/widgets.dart';

import '../theme/theme.dart';
import '../utils/border_side.dart';

class InputText extends StatefulWidget {
  const InputText({
    super.key,
    this.inputType = TextInputType.text,
  });

  final TextInputType inputType;

  @override
  State<InputText> createState() => _InputTextState();
}

class _InputTextState extends State<InputText> {
  bool _isFocused = false;
  final FocusNode _focusNode = FocusNode();
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    _focusNode.addListener(() {
      setState(() {
        _isFocused = _focusNode.hasFocus;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final BorderSide thinBorder = borderSide(context);
    final BorderSide thicBorder =
        borderSide(context, width: _isFocused ? 4 : 2);

    return GestureDetector(
      onTap: () {
        _focusNode.requestFocus();
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        margin: EdgeInsets.only(bottom: _isFocused ? 0 : 2),
        decoration: BoxDecoration(
          color: Theme.of(context).theme.background,
          border: Border(
            top: thinBorder,
            left: thinBorder,
            right: thinBorder,
            bottom: thicBorder,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: EditableText(
          controller: _controller,
          focusNode: _focusNode,
          cursorColor: Theme.of(context).theme.onBackground,
          backgroundCursorColor:
              Theme.of(context).theme.onBackground.withOpacity(0.3),
          style: Theme.of(context).theme.textStyle.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Theme.of(context).theme.onBackground,
              ),
          keyboardType: widget.inputType,
        ),
      ),
    );
  }
}
