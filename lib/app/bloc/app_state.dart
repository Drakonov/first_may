part of 'app_bloc.dart';

@freezed
class AppState extends BaseBlocState with _$AppState {
  factory AppState({
    BlocAction? action,
    Locale? locale,
    @Default(false) bool learningMode,
    @Default(ColorSchemeMode.auto) ColorSchemeMode colorSchemeMode,
  }) = _AppState;
}