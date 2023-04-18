import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:first_may/localization/app_localizations.dart';

extension ContextExtensions on BuildContext {
  AppLocalizations get localizations => AppLocalizations.of(this);

  void sendEvent<B extends Bloc>(dynamic event) {
    read<B>().add(event);
  }

  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  //AppColorSchemeExtension get colorSchemeExtension => Theme.of(this).extension<AppColorSchemeExtension>()!;

  bool isLightTheme() {
    final ThemeData theme = Theme.of(this);
    final bool isLight = theme.brightness == Brightness.light;
    return isLight;
  }

  bool isDarkTheme() {
    final ThemeData theme = Theme.of(this);
    final bool isDark = theme.brightness == Brightness.dark;
    return isDark;
  }

  MediaQueryData get mediaQuery => MediaQuery.of(this);
}
