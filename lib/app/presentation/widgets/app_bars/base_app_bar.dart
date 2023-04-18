import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:first_may/app/resources/app_color_scheme_extension.dart';
import 'package:first_may/app/resources/app_text_styles.dart';
import 'package:first_may/core/utils/context_extensions.dart';
import 'package:first_may/gen/assets.gen.dart';

class BaseAppBar extends StatelessWidget {
  const BaseAppBar({
    this.onBackPressed,
    this.title,
    this.subtitle,
    this.svgIconPath,
    this.needBorder = true,
    Key? key,
  }) : super(key: key);

  final VoidCallback? onBackPressed;
  final String? title;
  final String? subtitle;
  final String? svgIconPath;
  final bool needBorder;

  @override
  Widget build(BuildContext context) => Container(
        height: 58,
        decoration: BoxDecoration(
          color: context.colorScheme.surface,
          border: needBorder
              ? Border(
                  bottom: BorderSide(color: context.colorScheme.outline),
                )
              : null,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: _buildBackButton(),
              ),
              Center(
                child: _buildTitles(context),
              ),
            ],
          ),
        ),
      );

  Widget _buildBackButton() => GestureDetector(
        onTap: () {
          onBackPressed?.call();
        },
        child: SvgPicture.asset(
          Assets.images.arrowBack,
          width: 24,
          height: 24,
        ),
      );

  Widget _buildTitles(BuildContext context) => Padding(
        padding: const EdgeInsets.only(left: 50, right: 30),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (title != null)
              Text(
                title!,
                style: AppTextStyles.titleLarge(context.colorScheme.onBackground)
                    .copyWith(overflow: TextOverflow.ellipsis),
              ),
            if (subtitle != null)
              Text(
                subtitle!,
                style: AppTextStyles.labelMedium(context.colorScheme.onBackgroundSecondary)
                    .copyWith(overflow: TextOverflow.ellipsis),
              )
          ],
        ),
      );
}
