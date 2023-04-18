import 'package:flutter/cupertino.dart';
import 'package:first_may/app/resources/app_colors.dart';

abstract class BlocAction {
  DateTime dateTime = DateTime.now();
}

class ShowMessage extends BlocAction {
  ShowMessage(
    this.message, {
    this.isError = false,
  });

  String message;
  bool isError;
}

class HideKeyboard extends BlocAction {}

class ShowLoader extends BlocAction {}

class HideLoader extends BlocAction {}

class NavigateBack extends BlocAction {
  NavigateBack({
    this.rootNavigator = false,
    this.returnedValue,
  });

  final dynamic returnedValue;
  final bool rootNavigator;
}

class ShowSnackBarMessage extends BlocAction {
  ShowSnackBarMessage({
    required this.message,
    this.color = AppColors.secondary,
  });

  String message;
  Color? color;
}

class ShowNewItems<I> extends BlocAction {
  ShowNewItems({
    required this.items,
    required this.totalItemsCount,
  });

  List<I> items;
  int totalItemsCount;
}

class ShowLastItems<I> extends BlocAction {
  ShowLastItems({
    required this.items,
  });

  List<I> items;
}

class ClearItems extends BlocAction {}

class UpdateItems<I> extends BlocAction {
  UpdateItems({
    required this.items,
  });

  List<I> items;
}

class ShowSubscriptionModal extends BlocAction {}

class ShowModerator extends BlocAction {}
