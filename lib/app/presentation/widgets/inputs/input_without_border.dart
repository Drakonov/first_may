import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:first_may/app/resources/app_color_scheme_extension.dart';
import 'package:first_may/app/resources/app_text_styles.dart';
import 'package:first_may/core/utils/context_extensions.dart';

class InputWithoutBorder extends StatefulWidget {
  const InputWithoutBorder({
    this.text,
    this.label,
    this.hint,
    this.error,
    this.needShowError = false,
    this.controller,
    this.onChanged,
    this.autoFocus = false,
    this.maxLength,
    this.inputFormatters,
    this.keyboardType,
    this.autofillHints,
    this.needCounter = false,
    this.textAlign = TextAlign.start,
    this.maxLines = 1,
    this.minLines,
    this.focusNode,
    this.textStyle,
    this.hintStyle,
    super.key,
  });

  final String? text;
  final String? label;
  final String? hint;
  final bool needShowError;
  final String? error;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final bool autoFocus;
  final int? maxLength;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final Iterable<String>? autofillHints;
  final bool needCounter;
  final TextAlign textAlign;
  final int maxLines;
  final int? minLines;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;
  final FocusNode? focusNode;

  @override
  _InputWithoutBorderState createState() => _InputWithoutBorderState();
}

class _InputWithoutBorderState extends State<InputWithoutBorder> {
  late TextEditingController _controller;

  TextStyle get _defaultTextStyle => AppTextStyles.headlineMedium(context.colorScheme.onSurface);

  TextStyle get _defaultErrorTextStyle => AppTextStyles.headlineMedium(context.colorScheme.error);

  TextStyle get _defaultHintTextStyle => AppTextStyles.headlineMedium(context.colorScheme.onSurfaceDisabled);

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController(text: widget.text);
  }

  @override
  void didUpdateWidget(covariant InputWithoutBorder oldWidget) {
    super.didUpdateWidget(oldWidget);
    String newText = widget.text ?? '';
    if (newText != _controller.text && widget.controller == null) {
      _updateText(newText);
    }
    if (widget.error != oldWidget.error) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _controller,
            maxLength: widget.maxLength,
            maxLines: widget.maxLines,
            autofocus: widget.autoFocus,
            style: widget.error != null ? _defaultErrorTextStyle : widget.textStyle ?? _defaultTextStyle,
            inputFormatters: widget.inputFormatters,
            keyboardType: widget.keyboardType,
            onChanged: widget.onChanged,
            textAlign: widget.textAlign,
            autofillHints: widget.autofillHints,
            focusNode: widget.focusNode,
            decoration: InputDecoration(
              counterText: widget.needCounter ? null : '',
              hintText: widget.hint,
              hintStyle: widget.hintStyle ?? _defaultHintTextStyle,
              floatingLabelBehavior: FloatingLabelBehavior.always,
              errorBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(vertical: 7),
            ),
          ),
          if (widget.error != null && widget.needShowError)
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text(
                widget.error!,
                textAlign: TextAlign.center,
                style: AppTextStyles.bodySmall(context.colorScheme.error),
              ),
            )
        ],
      );

  void _updateText(String newText) {
    String currentText = _controller.text;
    int offset = -1;
    List<String> newTextChars = currentText.split('');
    if (newText.isEmpty) {
      offset = 0;
    } else {
      for (var char in newTextChars) {
        var index = newTextChars.indexOf(char);
        if (index >= currentText.length) {
          offset = newText.length;
          break;
        }
        String startNewText = newText.substring(0, index);
        String startCurrentText = currentText.substring(0, index);
        if (startNewText != startCurrentText) {
          offset = index;
          break;
        }
      }
      if (offset == -1) {
        offset = newText.length;
      }
    }

    _controller.value = TextEditingValue(
      text: newText,
      selection: TextSelection.fromPosition(
        TextPosition(offset: offset),
      ),
    );
  }
}
