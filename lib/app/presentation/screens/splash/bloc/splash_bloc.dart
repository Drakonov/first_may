import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:first_may/app/navigation/app_router.dart';
import 'package:first_may/app/navigation/app_router.gr.dart';
import 'package:first_may/core/bloc/base_bloc_state.dart';
import 'package:first_may/core/bloc/bloc_action.dart';
import 'package:first_may/di/app_locator.dart';
import 'package:first_may/domain/enums/error_launch.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'splash_bloc.freezed.dart';

part 'splash_event.dart';

part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc(
    this._appRouter,
  ) : super(SplashState()) {
    on<_Init>(_init);
    add(const SplashEvent.init());
  }

  final AppRouter _appRouter;

  FutureOr<void> _init(
    _Init event,
    Emitter<SplashState> emit,
  ) async {
    await Locator.initAfterAppLaunch();
    _appRouter.replace(const TableScreen());

    //await Future.delayed(const Duration(seconds: 2)).whenComplete(() => emit(state.copyWith(isLoading: false)));
  }
}
