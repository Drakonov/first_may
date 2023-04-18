import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_scale_tap/flutter_scale_tap.dart';
import 'package:first_may/app/presentation/widgets/loaders/base_loader.dart';
import 'package:first_may/app/resources/app_color_scheme_extension.dart';
import 'package:first_may/app/resources/app_text_styles.dart';
import 'package:first_may/core/utils/context_extensions.dart';

class BaseButton extends StatelessWidget {
  const BaseButton({
    this.text,
    this.onPressed,
    this.enabled = true,
    this.color,
    this.textStyle,
    this.borderColor,
    this.prefixImage,
    this.height = 48,
    this.width,
    this.expanded = true,
    this.padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    this.borderRadius = const BorderRadius.all(
      Radius.circular(8),
    ),
    this.elevation = 0,
    this.isLoading = false,
    this.disabledColor,
    this.disabledTextStyle,
    super.key,
  });

  final String? text;
  final VoidCallback? onPressed;
  final bool enabled;
  final bool expanded;
  final bool isLoading;

  final Color? color;
  final Color? disabledColor;
  final TextStyle? textStyle;
  final TextStyle? disabledTextStyle;
  final Color? borderColor;
  final Widget? prefixImage;
  final double height;
  final double? width;
  final EdgeInsets padding;
  final BorderRadius borderRadius;
  final double elevation;

  Color _defaultColor(BuildContext context) => context.colorScheme.secondaryContainer;

  Color _defaultDisabledColor(BuildContext context) => context.colorScheme.background;

  TextStyle _defaultTextStyle(BuildContext context) => AppTextStyles.titleMedium(
        context.colorScheme.onSecondaryContainerVariant,
      );

  TextStyle _defaultDisabledTextStyle(BuildContext context) => AppTextStyles.titleMedium(
        context.colorScheme.onBackgroundDisabled,
      );

  @override
  Widget build(BuildContext context) => IgnorePointer(
        ignoring: !enabled,
        child: ScaleTap(
          duration: const Duration(milliseconds: 300),
          onPressed: () {
            if (enabled) {
              onPressed?.call();
            }
          },
          child: Material(
            borderRadius: borderRadius,
            elevation: elevation,
            child: SizedBox(
              height: height,
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: borderRadius,
                  border: borderColor != null ? Border.all(color: borderColor!) : null,
                  color: enabled ? color ?? _defaultColor(context) : disabledColor ?? _defaultDisabledColor(context),
                ),
                height: height,
                padding: padding,
                width: expanded ? double.maxFinite : width,
                child: text != null
                    ? isLoading
                        ? Center(
                            child: _buildLoader(context),
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              if (prefixImage != null)
                                Padding(
                                  padding: const EdgeInsets.only(right: 9),
                                  child: prefixImage,
                                ),
                              AutoSizeText(
                                text!,
                                textAlign: TextAlign.center,
                                style: enabled
                                    ? textStyle ?? _defaultTextStyle(context)
                                    : disabledTextStyle ?? _defaultDisabledTextStyle(context),
                              ),
                            ],
                          )
                    : const SizedBox(),
              ),
            ),
          ),
        ),
      );

  Widget _buildLoader(BuildContext context) => BaseLoader(
        size: 25,
        color: context.colorScheme.onPrimary,
      );
}
