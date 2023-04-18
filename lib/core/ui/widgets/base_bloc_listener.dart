import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:first_may/app/presentation/widgets/others/message.dart';
import 'package:overlay_support/overlay_support.dart';

import '../../bloc/base_bloc_state.dart';
import '../../bloc/bloc_action.dart';
import 'dialogs.dart';

class BaseBlocListener<B extends BlocBase<S>, S extends BaseBlocState> extends BlocListener<B, S> {
  BaseBlocListener({
    BlocListenerCondition<S>? listenWhen,
    Future<void> Function(BuildContext context, S state, BlocAction? action)? listener,
    required Widget child,
    super.key,
  }) : super(
          listenWhen: (previous, current) {
            return previous.action != current.action || listenWhen?.call(previous, current) == true;
          },
          listener: getBaseListener(listener),
          child: child,
        );

  static BlocWidgetListener<S> getBaseListener<S extends BaseBlocState>(
          Future<void> Function(BuildContext context, S state, BlocAction? action)? listener) =>
      (BuildContext context, S state) async {
        BlocAction? action = state.action;
        await listener?.call(context, state, action);
        if (action is NavigateBack) {
          Navigator.of(context, rootNavigator: action.rootNavigator).pop(action.returnedValue);
        }
        if (action is ShowSnackBarMessage) {
          showSnackBarMessage(context, action);
        }
        if (action is ShowMessage) {
          showSimpleNotification(
            Message(action.message),
            elevation: 0,
            foreground: Colors.transparent,
            background: Colors.transparent,
            slideDismissDirection: DismissDirection.up,
          );
        }
        if (action is ShowLoader) {
          // LoaderDialog.show(context: context);
        }
        if (action is HideLoader) {
          // Navigator.of(context).pop(context);
        }
      };
}
