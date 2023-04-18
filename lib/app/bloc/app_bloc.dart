import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:first_may/domain/enums/color_scheme_type.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get_storage/get_storage.dart';
import 'package:first_may/app/bloc_actions.dart';
import 'package:first_may/core/bloc/base_bloc_state.dart';
import 'package:first_may/core/bloc/bloc_action.dart';
import 'package:rxdart/subjects.dart';

part 'app_bloc.freezed.dart';
part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(AppState()) {
    on<Init>(_init);
    on<AppLifecycleStateChanged>(_appLifecycleStateChanged);
    on<LearningModeChanged>(_learningModeChanged);
    on<ChangeLearningModePressed>(_changeLearningModePressed);
    on<MenuPressed>(_menuPressed);
    on<MemoryUsagePressed>(_memoryUsagePressed);
    on<LogsPressed>(_logsPressed);
    on<SwitchColorScheme>(_switchColorScheme);
    add(const AppEvent.init());
  }

  final BehaviorSubject<AppLifecycleState?> _appLifecycleStateSubject = BehaviorSubject.seeded(null);

  Stream<AppLifecycleState?> get appLifecycleStateStream => _appLifecycleStateSubject.stream;

  FutureOr<void> _init(Init event, Emitter<AppState> emit) async {
  }

  FutureOr<void> _appLifecycleStateChanged(
    AppLifecycleStateChanged event,
    Emitter<AppState> emit,
  ) {
    _appLifecycleStateSubject.add(event.state);
  }

  @override
  Future<void> close() async {
    await _appLifecycleStateSubject.close();
    log('AppBloc closed', name: 'Info');
    return super.close();
  }

  FutureOr<void> _learningModeChanged(
    LearningModeChanged event,
    Emitter<AppState> emit,
  ) {
    emit(
      state.copyWith(learningMode: event.learningMode),
    );
  }

  FutureOr<void> _changeLearningModePressed(
    ChangeLearningModePressed event,
    Emitter<AppState> emit,
  ) {
    emit(
      state.copyWith(learningMode: !state.learningMode),
    );
  }

  FutureOr<void> _menuPressed(
    MenuPressed event,
    Emitter<AppState> emit,
  ) {
    emit(
      state.copyWith(
        action: ShowLearningModeModal(learningModeEnabled: state.learningMode),
      ),
    );
  }

  FutureOr<void> _memoryUsagePressed(
    MemoryUsagePressed event,
    Emitter<AppState> emit,
  ) {}

  FutureOr<void> _logsPressed(
    LogsPressed event,
    Emitter<AppState> emit,
  ) {}

  FutureOr<void> _switchColorScheme(SwitchColorScheme event, Emitter<AppState> emit) {
    emit(state.copyWith(action: null));
    ColorSchemeMode nextColorScheme = state.colorSchemeMode;
    switch (state.colorSchemeMode) {
      case ColorSchemeMode.auto:
        nextColorScheme = ColorSchemeMode.dark;
        break;
      case ColorSchemeMode.dark:
        nextColorScheme = ColorSchemeMode.light;
        break;
      case ColorSchemeMode.light:
        nextColorScheme = ColorSchemeMode.auto;
        break;
    }
    GetStorage().write(
      'brightness',
      nextColorScheme.toString(),
    );
    emit(
      state.copyWith(colorSchemeMode: nextColorScheme),
    );
  }
}
