import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:first_may/app/resources/app_color_scheme_extension.dart';
import 'package:first_may/app/resources/app_text_styles.dart';
import 'package:first_may/core/utils/context_extensions.dart';

class BaseListTile extends StatelessWidget {
  const BaseListTile({
    required this.title,
    required this.leadingSvgIconPath,
    this.trailingSvgIconPath,
    this.onPressed,
    this.padding,
    super.key,
  });

  final String leadingSvgIconPath;
  final String? trailingSvgIconPath;
  final String title;
  final VoidCallback? onPressed;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) => InkWell(
        hoverColor: context.colorScheme.onSurface,
        focusColor: context.colorScheme.onSurface,
        onTap: () {
          onPressed?.call();
        },
        child: Padding(
          padding: padding ?? const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
          child: Row(
            children: [
              _buildLeading(context),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: _buildTitle(context),
                ),
              ),
              if (trailingSvgIconPath != null)
                Padding(
                  padding: const EdgeInsets.only(left: 6),
                  child: _buildTrailing(context),
                ),
            ],
          ),
        ),
      );

  Widget _buildLeading(BuildContext context) => SvgPicture.asset(
        leadingSvgIconPath,
        width: 24,
        height: 24,
        color: context.colorScheme.onSurfaceTertiary,
      );

  Widget _buildTitle(BuildContext context) => Text(
        title,
        overflow: TextOverflow.ellipsis,
        style: AppTextStyles.bodyMedium(context.colorScheme.onSurface),
      );

  Widget _buildTrailing(BuildContext context) => SvgPicture.asset(
        trailingSvgIconPath!,
        width: 24,
        height: 24,
        color: context.colorScheme.onSurfaceTertiary,
      );
}
