import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:first_may/app/presentation/widgets/inputs/input_without_border.dart';
import 'package:first_may/app/resources/app_color_scheme_extension.dart';
import 'package:first_may/app/resources/app_text_styles.dart';
import 'package:first_may/core/utils/context_extensions.dart';

class CodeInput extends StatefulWidget {
  const CodeInput({
    this.code,
    this.error,
    this.onChanged,
    this.autoFocus = false,
    this.focusNode,
    super.key,
  });

  final String? code;
  final String? error;
  final ValueChanged<String>? onChanged;
  final bool autoFocus;
  final FocusNode? focusNode;

  @override
  _CodeInputState createState() => _CodeInputState();
}

class _CodeInputState extends State<CodeInput> {
  static const String _defaultHint = '0000 ';

  late TextEditingController _controller;
  String? _hint;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.code ?? '');
    _updateHint();
  }

  @override
  void didUpdateWidget(covariant CodeInput oldWidget) {
    super.didUpdateWidget(oldWidget);

    String currentText = _controller.text;
    String newText = widget.code ?? '';
    if (newText != currentText) {
      _controller.value = TextEditingValue(
        text: newText,
        selection: TextSelection.fromPosition(
          TextPosition(offset: newText.length),
        ),
      );
    }
    _updateHint();
    if (widget.error != oldWidget.error) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget input = Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildInput(),
        if (widget.error != null) _buildError(),
      ],
    );
    if (widget.focusNode != null) {
      return GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          widget.focusNode!.requestFocus();
        },
        child: IgnorePointer(child: input),
      );
    } else {
      return input;
    }
  }

  void _updateHint() {
    String currentText = _controller.text;
    _hint = currentText + _defaultHint.substring(currentText.length, _defaultHint.length);
    setState(() {});
  }

  Widget _buildInput() => IntrinsicWidth(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 7),
              child: Text(
                _hint ?? '',
                style: AppTextStyles.headlineMedium(context.colorScheme.onSurfaceDisabled),
              ),
            ),
            InputWithoutBorder(
              maxLength: 5,
              controller: _controller,
              error: widget.error,
              focusNode: widget.focusNode,
              autoFocus: widget.autoFocus,
              keyboardType: TextInputType.number,
              onChanged: widget.onChanged,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            ),
          ],
        ),
      );

  Widget _buildError() => Padding(
        padding: const EdgeInsets.only(top: 8),
        child: Text(
          widget.error!,
          textAlign: TextAlign.center,
          style: AppTextStyles.bodySmall(context.colorScheme.error),
        ),
      );
}
