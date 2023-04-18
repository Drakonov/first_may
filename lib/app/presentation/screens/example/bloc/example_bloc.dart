import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:first_may/app/navigation/app_router.dart';
import 'package:first_may/core/bloc/base_bloc_state.dart';
import 'package:first_may/core/bloc/bloc_action.dart';

part 'example_bloc.freezed.dart';
part 'example_event.dart';
part 'example_state.dart';

class ExampleBloc extends Bloc<ExampleEvent, ExampleState> {
  ExampleBloc(
    this._appRouter,
  ) : super(ExampleState()) {
    on<_Init>(_init);
    add(const ExampleEvent.init());
  }

  final AppRouter _appRouter;

  FutureOr<void> _init(
    _Init event,
    Emitter<ExampleState> emit,
  ) async {
    //todo add action
    //_appRouter.replace(const AuthorizationScreen());
  }
}
