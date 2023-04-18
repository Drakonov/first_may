import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

abstract class BaseBloc<Event, State> extends Bloc<Event, State> {
  BaseBloc(State initialState) : super(initialState);

  List<StreamSubscription> subscriptions = [];

  @override
  Future<void> close() async {
    for (var subscription in subscriptions) {
      subscription.cancel();
    }
    return super.close();
  }
}
