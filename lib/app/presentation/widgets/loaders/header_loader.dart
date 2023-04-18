import 'package:flutter/material.dart';
import 'package:first_may/app/presentation/widgets/loaders/fading_loader.dart';
import 'package:first_may/app/resources/app_color_scheme_extension.dart';
import 'package:first_may/core/utils/context_extensions.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HeaderLoader extends StatefulWidget {
  const HeaderLoader({
    required this.refreshController,
    super.key,
  });

  final RefreshController refreshController;

  @override
  State<HeaderLoader> createState() => _HeaderLoaderState();
}

class _HeaderLoaderState extends State<HeaderLoader> with TickerProviderStateMixin {
  late AnimationController _scaleController;

  @override
  void initState() {
    super.initState();
    _scaleController = AnimationController(value: 0.0, vsync: this);
    widget.refreshController.headerMode?.addListener(() {
      if (widget.refreshController.headerStatus == RefreshStatus.idle) {
        _scaleController.value = 0.0;
      }
    });
  }

  @override
  void dispose() {
    _scaleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => CustomHeader(
        refreshStyle: RefreshStyle.Behind,
        onOffsetChange: (offset) {
          if (widget.refreshController.headerMode?.value != RefreshStatus.refreshing) {
            _scaleController.value = offset / 60;
          }
        },
        builder: (context, status) => Center(
          child: FadeTransition(
            opacity: _scaleController,
            child: ScaleTransition(
              child: FadingLoader(
                size: 28,
                color: context.colorScheme.onBackgroundSecondary,
                strokeWidth: 3,
              ),
              scale: _scaleController,
            ),
          ),
        ),
      );
}
