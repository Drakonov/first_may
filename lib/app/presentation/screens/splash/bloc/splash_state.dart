part of 'splash_bloc.dart';

@freezed
class SplashState extends BaseBlocState with _$SplashState {
  factory SplashState({
    BlocAction? action,
    @Default(true) bool isLoading,
    @Default(ErrorLaunch.none) ErrorLaunch errorLaunch,
  }) = _StartState;
}

class ShowNeedUpdateMessage extends BlocAction {}

class RegisterLocalization extends BlocAction {}
