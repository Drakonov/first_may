import 'package:flutter/widgets.dart';

const _kDefaultAnimationDuration = Duration(milliseconds: 300);
const _kDefaultAnimationCurve = Curves.ease;

/// Controls a scrollable widget.
///
/// This class extends [ScrollController] and adds functionality to it.
/// A ScrollPosController allow you to place an item on a specific area
/// of the screen.
class ScrollPositionController extends ScrollController {
  int itemCount;
  bool animate;
  Duration animationDuration;
  Curve animationCurve;

  ScrollPositionController({
    this.itemCount = 0,
    this.animate = true,
    this.animationDuration = _kDefaultAnimationDuration,
    this.animationCurve = _kDefaultAnimationCurve,
    double initialScrollOffset = 0.0,
    bool keepScrollOffset = true,
    String? debugLabel,
  }) : super(
          initialScrollOffset: initialScrollOffset,
          keepScrollOffset: keepScrollOffset,
          debugLabel: debugLabel,
        );

  @visibleForTesting
  double get inside => positions.isNotEmpty ? position.extentInside : 0;

  @visibleForTesting
  double get max => positions.isNotEmpty ? position.maxScrollExtent : 0;

  /// total returns the total of the inside part and the scrollable part.
  double get total => inside + max;

  /// scrollPerItem returns the quantity of scroll needed for travel
  /// the height of one item.
  double get scrollPerItem => total / itemCount;

  /// visibleItems returns the quantity of items visible in the screen.
  double get visibleItems => inside / scrollPerItem;

  /// canScroll indicate if this widget has scrollable content
  bool get canScroll => max > 0;

  /// canForward indicate if the scrollbar is at the end position.
  bool get canForward => positions.isNotEmpty ? offset == max : false;

  /// canBackward indicate if the scrollbar is at the start position.
  bool get canBackward => positions.isNotEmpty ? offset == 0 : false;

  /// scrollTop will move the scrollbar to the top (first item).
  void scrollToStart({bool? animate}) {
    _scrollToPos(0, animate: animate);
  }

  /// scrollBottom will move the scrollbar to the bottom (last item).
  void scrollToEnd({bool? animate}) {
    _scrollToPos(max, animate: animate);
  }

  /// scrollToItem will move the scrollbar to make the item
  /// (defined by its index) visible on the screen.
  /// If the item is already fully visible in the screen, the scrollbar
  /// is not moved.
  void scrollToItem(int index, {bool? animate, bool center = false}) {
    _scrollOffItem(index, animate: animate, center: center);
  }

  /// backward will move the scrollbar with a distance of one item in
  /// the bottom direction.
  /// If value of align is `true`, the last visible item will be aligned.
  void forward({bool align = true, bool? animate}) {
    if (align) {
      final lastIdx = ((offset + inside) / scrollPerItem - 1).floor() + 1;
      if (lastIdx >= itemCount) {
        return;
      }
      scrollToItem(lastIdx, animate: animate);
    } else {
      _scrollToPos(offset + scrollPerItem, animate: animate);
    }
  }

  /// backward will move the scrollbar with a distance of one item in
  /// the top direction.
  /// If value of align is `true`, the first visible item will be aligned.
  void backward({bool align = true, bool? animate}) {
    if (align) {
      final firstIdx = (offset / scrollPerItem - 1).ceil();
      if (firstIdx < 0) {
        return;
      }
      scrollToItem(firstIdx, animate: animate);
    } else {
      _scrollToPos(offset - scrollPerItem, animate: animate);
    }
  }

  /// scrollOffItemCenter return the offset when the item is placed at
  /// the center of the screen.
  double scrollOffItemCenter(int index) {
    return (index + 1) * scrollPerItem - inside / 2;
  }

  /// scrollOfItemBottom return the offset when the item is placed at
  /// the bottom of the screen.
  double scrollOffItemEnd(int index) {
    return (index + 1) * scrollPerItem - inside;
  }

  /// scrollOffItemTop return the offset when the item is placed at
  /// the top of the screen.
  double scrollOffItemStart(int index) {
    return index * scrollPerItem;
  }

  void _scrollToPos(double offset, {bool? animate}) {
    if (((animate != null && animate) || (animate == null && this.animate)) && animationDuration != Duration.zero) {
      animateTo(
        offset.clamp(0, max),
        duration: animationDuration,
        curve: animationCurve,
      );
    } else {
      jumpTo(
        offset.clamp(0, max),
      );
    }
  }

  void _scrollOffItem(int index, {bool? animate, bool center = false}) {
    final centerVal = scrollOffItemCenter(index);
    final endVal = scrollOffItemEnd(index);
    final startVal = scrollOffItemStart(index);

    if (center) {
      _scrollToPos(centerVal, animate: animate);
    } else if (offset < endVal) {
      _scrollToPos(endVal, animate: animate);
    } else if (offset > startVal) {
      _scrollToPos(startVal, animate: animate);
    }
  }
}
