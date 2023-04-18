import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:first_may/app/resources/app_color_scheme_extension.dart';
import 'package:first_may/app/resources/app_text_styles.dart';
import 'package:first_may/core/utils/context_extensions.dart';
import 'package:first_may/core/utils/date_time_utils.dart';
import 'package:first_may/gen/assets.gen.dart';
import 'package:intl/intl.dart';

class AppointmentsAppBar extends StatefulWidget {
  const AppointmentsAppBar({
    required this.scrollController,
    this.selectedDate,
    this.selectDatePressed,
    this.menuPressed,
    this.searchPressed,
    required this.needShowSearch,
    super.key,
  });

  final ScrollController scrollController;
  final DateTime? selectedDate;
  final VoidCallback? selectDatePressed;
  final VoidCallback? menuPressed;
  final VoidCallback? searchPressed;
  final bool needShowSearch;

  @override
  State<AppointmentsAppBar> createState() => _AppointmentsAppBarState();
}

class _AppointmentsAppBarState extends State<AppointmentsAppBar> {
  late VoidCallback _scrollListener;

  double _currentSmallTitleOpacity = 0;

  double get _newSmallTitleOpacity {
    if (!widget.scrollController.hasClients) {
      return 0;
    }
    double pixels = widget.scrollController.position.pixels;
    if (pixels == 0) {
      return 0;
    }

    /// Когда offset скролла достигает 40 пикселей, большой заголовок полностью скрывается под верхним баром.
    /// 96 - максимальный offset
    double opacity = ((pixels - 40) / (96 - 45));
    if (opacity > 0) {
      return 1;
    } else {
      return 0;
    }
  }

  @override
  void initState() {
    super.initState();
    _scrollListener = () {
      double newOpacity = _newSmallTitleOpacity;
      if (newOpacity != _currentSmallTitleOpacity) {
        _currentSmallTitleOpacity = newOpacity;
        setState(() {});
      }
    };
    widget.scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    super.dispose();
    widget.scrollController.removeListener(_scrollListener);
  }

  @override
  void didUpdateWidget(covariant AppointmentsAppBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.selectedDate != widget.selectedDate) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) => CupertinoSliverNavigationBar(
        backgroundColor: context.colorScheme.background,
        leading: GestureDetector(
          onTap: widget.menuPressed,
          child: SvgPicture.asset(
            Assets.images.menu,
            width: 24,
            height: 24,
          ),
        ),
        trailing: widget.needShowSearch
            ? GestureDetector(
                onTap: widget.searchPressed,
                child: SvgPicture.asset(
                  Assets.images.search,
                  width: 24,
                  height: 24,
                ),
              )
            : null,
        middle: AnimatedOpacity(
          opacity: _currentSmallTitleOpacity,
          duration:
              _currentSmallTitleOpacity == 1 ? const Duration(milliseconds: 250) : const Duration(milliseconds: 100),
          child: _buildAppBar(expanded: false),
        ),
        largeTitle: _buildAppBar(expanded: true),
        border: null,
      );

  Widget _buildAppBar({required bool expanded}) => Row(
        mainAxisAlignment: expanded ? MainAxisAlignment.start : MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: widget.selectDatePressed,
            child: RichText(
              text: TextSpan(
                style: expanded
                    ? AppTextStyles.headlineMedium(context.colorScheme.onBackground)
                    : AppTextStyles.titleLarge(context.colorScheme.onBackground),
                text: context.localizations.appointments,
                children: [
                  TextSpan(
                    style: expanded
                        ? AppTextStyles.headlineMedium(context.colorScheme.onBackgroundSecondary)
                        : AppTextStyles.titleLarge(context.colorScheme.onBackgroundSecondary),
                    text: ' ' +
                        _getDateString(
                          context,
                          widget.selectedDate ?? DateTime.now(),
                        ),
                  ),
                  WidgetSpan(
                    child: SvgPicture.asset(
                      Assets.images.keyboardArrowDown,
                      width: expanded ? 32 : 24,
                      height: expanded ? 32 : 24,
                      color: context.colorScheme.onBackgroundSecondary,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      );

  String _getDateString(BuildContext context, DateTime dateTime) {
    String dateString = DateFormat('MMMM d').format(dateTime);
    if (DateTimeUtils.isToday(dateTime)) {
      dateString = context.localizations.today;
    } else if (DateTimeUtils.isTomorrow(dateTime)) {
      dateString = context.localizations.tomorrow;
    } else if (DateTimeUtils.isYesterday(dateTime)) {
      dateString = context.localizations.yesterday;
    }
    return dateString;
  }
}
