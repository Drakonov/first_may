import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:first_may/app/resources/app_color_scheme_extension.dart';
import 'package:first_may/app/resources/app_text_styles.dart';
import 'package:first_may/core/utils/context_extensions.dart';
import 'package:first_may/gen/assets.gen.dart';

class SearchInput extends StatefulWidget {
  const SearchInput({
    this.text,
    this.onCancelPressed,
    this.onPressed,
    this.hint,
    this.error,
    this.needShowError = false,
    this.controller,
    this.onChanged,
    this.onSubmitted,
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
  final VoidCallback? onPressed;
  final VoidCallback? onCancelPressed;
  final String? hint;
  final bool needShowError;
  final String? error;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final void Function(String text)? onSubmitted;
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
  State<SearchInput> createState() => _SearchInputState();
}

class _SearchInputState extends State<SearchInput> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController(text: widget.text);
  }

  @override
  void didUpdateWidget(covariant SearchInput oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.text != _controller.text) {
      _controller.text = widget.text ?? '';
    }
  }

  TextStyle get _defaultHintTextStyle => AppTextStyles.bodyMedium(context.colorScheme.onSurfaceSecondary);

  TextStyle get _defaultTextStyle => AppTextStyles.bodyMedium(context.colorScheme.onSurface);

  final InputBorder _border = OutlineInputBorder(
    borderSide: BorderSide.none,
    borderRadius: BorderRadius.circular(8),
  );

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            Expanded(
              child: _buildInput(),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: _buildCancelButton(),
            ),
          ],
        ),
      );

  Widget _buildInput() => TextField(
        style: widget.textStyle ?? _defaultTextStyle,
        maxLength: widget.maxLength,
        maxLines: widget.maxLines,
        autofocus: widget.autoFocus,
        inputFormatters: widget.inputFormatters,
        keyboardType: widget.keyboardType,
        onChanged: widget.onChanged,
        textAlign: widget.textAlign,
        controller: _controller,
        autofillHints: widget.autofillHints,
        focusNode: widget.focusNode,
        onSubmitted: (text) {
          widget.onSubmitted?.call(text);
        },
        onTap: () {
          widget.onPressed?.call();
        },
        decoration: InputDecoration(
          filled: true,
          fillColor: context.colorScheme.surfaceVariant,
          counterText: '',
          hintText: widget.hint ?? context.localizations.search,
          hintStyle: widget.hintStyle ?? _defaultHintTextStyle,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          errorBorder: _border,
          enabledBorder: _border,
          focusedBorder: _border,
          border: _border,
          contentPadding: const EdgeInsets.all(8),
          // prefixIconConstraints: const BoxConstraints(minHeight: 24, minWidth: 24),
          prefixIcon: UnconstrainedBox(
            child: SvgPicture.asset(
              Assets.images.search,
              width: 24,
              height: 24,
              color: context.colorScheme.onSurfaceSecondary,
            ),
          ),
        ),
      );

  Widget _buildCancelButton() => GestureDetector(
        onTap: () {
          widget.onCancelPressed?.call();
        },
        child: Text(
          context.localizations.cancel,
          style: AppTextStyles.bodyMedium(context.colorScheme.onBackgroundSecondary),
        ),
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
