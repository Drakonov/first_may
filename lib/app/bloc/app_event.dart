part of 'app_bloc.dart';

@freezed
class AppEvent with _$AppEvent {
  const factory AppEvent.init() = Init;

  const factory AppEvent.appLifecycleStateChanged(AppLifecycleState state) = AppLifecycleStateChanged;

  const factory AppEvent.learningModeChanged(bool learningMode) = LearningModeChanged;

  const factory AppEvent.changeLearningModePressed() = ChangeLearningModePressed;

  const factory AppEvent.menuPressed() = MenuPressed;

  const factory AppEvent.memoryUsagePressed() = MemoryUsagePressed;

  const factory AppEvent.logsPressed() = LogsPressed;

  const factory AppEvent.switchColorScheme() = SwitchColorScheme;
}
