import 'package:flutter/material.dart';
import 'package:first_may/app/resources/app_color_scheme_extension.dart';
import 'package:first_may/app/resources/app_text_styles.dart';
import 'package:first_may/core/utils/context_extensions.dart';

class BaseAppSlider extends StatefulWidget {
  const BaseAppSlider({
    Key? key,
    required this.value,
    required this.listItems,
    required this.sliderChangedValue,
  }) : super(key: key);

  final int value;
  final List<String> listItems;
  final void Function(int newValue) sliderChangedValue;

  @override
  State<BaseAppSlider> createState() => _BaseAppSliderState();
}

class _BaseAppSliderState extends State<BaseAppSlider> {
  double _value = 0;

  @override
  void initState() {
    super.initState();
    _value = widget.value / 1;
  }

  @override
  void didUpdateWidget(BaseAppSlider oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.value != widget.value) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    _value = widget.value / 1;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
              widget.listItems.length,
              (index) => Text(
                widget.listItems[index],
                style: AppTextStyles.labelMedium(context.colorScheme.onSurfaceTertiary),
              ),
            ),
          ),
        ),
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            trackHeight: 5.0,
            trackShape: const RoundedRectSliderTrackShape(),
            activeTrackColor: context.colorScheme.primary,
            inactiveTrackColor: context.colorScheme.outline,
            thumbShape: _CustomRoundSliderThumbShape(
              color: context.colorScheme.primary,
              fillColor: context.colorScheme.onPrimary,
              size: 20,
            ),
            overlayColor: Colors.green.withOpacity(0),
            overlayShape: const RoundSliderOverlayShape(overlayRadius: 32.0),
            tickMarkShape: const _SliderTickMarkShape(),
            activeTickMarkColor: context.colorScheme.primary,
            inactiveTickMarkColor: context.colorScheme.outline,
          ),
          child: Slider(
            max: widget.listItems.length - 1 / 1,
            value: _value,
            divisions: widget.listItems.length - 1,
            onChanged: (value) {
              int valueInt = value.toInt();
              widget.sliderChangedValue.call(valueInt);
              setState(() {
                _value = value;
              });
            },
          ),
        ),
      ],
    );
  }
}

class _SliderTickMarkShape extends SliderTickMarkShape {
  const _SliderTickMarkShape();

  @override
  Size getPreferredSize({
    required SliderThemeData sliderTheme,
    required bool isEnabled,
  }) {
    assert(sliderTheme.trackHeight != null);
    return Size.fromRadius(sliderTheme.trackHeight! / 4);
  }

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required Animation<double> enableAnimation,
    required TextDirection textDirection,
    required Offset thumbCenter,
    required bool isEnabled,
  }) {
    Color? begin;
    Color? end;

    final bool isTickMarkRightOfThumb = center.dx > thumbCenter.dx;
    begin =
        isTickMarkRightOfThumb ? sliderTheme.disabledInactiveTickMarkColor : sliderTheme.disabledActiveTickMarkColor;
    end = isTickMarkRightOfThumb ? sliderTheme.inactiveTickMarkColor : sliderTheme.activeTickMarkColor;

    final Paint paint = Paint()..color = ColorTween(begin: begin, end: end).evaluate(enableAnimation)!;

    final double tickMarkRadius = getPreferredSize(
          isEnabled: isEnabled,
          sliderTheme: sliderTheme,
        ).width /
        2;
    final newCenter = center.scale(1.01, 1);
    final Offset dotOffsetUp = Offset(newCenter.dx, newCenter.dy + 7.2);
    final Offset dotOffsetDown = Offset(newCenter.dx, newCenter.dy - 7.2);

    if (tickMarkRadius > 0) {
      context.canvas.drawCircle(dotOffsetUp, 3, paint);
      context.canvas.drawCircle(dotOffsetDown, 3, paint);
      context.canvas.drawRect(
        Rect.fromLTRB(
          newCenter.dx - 3,
          newCenter.dy + 8,
          newCenter.dx + 3,
          newCenter.dy - 8,
        ),
        paint,
      );
    }
  }
}

class _CustomRoundSliderThumbShape extends SliderComponentShape {
  _CustomRoundSliderThumbShape({
    required this.color,
    required this.fillColor,
    required this.size,
  });

  Color color;
  Color fillColor;
  double size = 15;

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    required Animation<double> activationAnimation,
    required Animation<double> enableAnimation,
    required bool isDiscrete,
    required TextPainter labelPainter,
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required TextDirection textDirection,
    required double value,
    required double textScaleFactor,
    required Size sizeWithOverflow,
  }) {
    final Paint paint = Paint()..color = color;
    final Paint paintA = Paint()..color = fillColor;
    context.canvas.drawCircle(center, size, paintA);
    context.canvas.drawCircle(center, size - 3, paint);
    context.canvas.drawCircle(center, size - 8, paintA);
  }

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) => Size.fromRadius(size);
}
