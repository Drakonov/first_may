library range_slider_dialog;

import 'package:flutter/material.dart';

part 'range_slider_picker_widget.dart';

class RangeSliderDialog {
  static Future display<T>(
    context, {
    OnApplyButtonClick? onApplyButtonClick,
    double borderRadius = 20,
    bool barrierDismissible = true,
    bool useSafeArea = true,
    bool useRootNavigator = true,
    RouteSettings? routeSettings,
    RangeValues? selectedRangeValues,
    int minValue = 0,
    int maxValue = 40,
    int divisions = 1,
    bool? hideHeader,
    String? headerText,
    String? cancelButtonText,
    String? acceptButtonText,
  }) async {
    await showDialog(
        context: context,
        barrierDismissible: barrierDismissible,
        routeSettings: routeSettings,
        useRootNavigator: useRootNavigator,
        useSafeArea: useSafeArea,
        builder: (BuildContext context) {
          return AlertDialog(
            content: RangeSliderPicker(
              onApplyButtonClick: onApplyButtonClick,
              divisions: divisions,
              maxValue: maxValue,
              minValue: minValue,
              selectedRangeValues: selectedRangeValues,
              acceptButtonText: acceptButtonText,
              cancelButtonText: cancelButtonText,
              headerText: headerText,
              hideHeader: hideHeader,
            ),
          );
        });
  }
}
