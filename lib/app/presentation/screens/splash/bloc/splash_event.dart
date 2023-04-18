part of 'splash_bloc.dart';

@freezed
class SplashEvent with _$SplashEvent {
  const factory SplashEvent.init() = _Init;

  const factory SplashEvent.pressedUpdate() = _PressedUpdate;
}
