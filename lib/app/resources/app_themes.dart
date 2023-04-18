import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_text_styles.dart';

class AppThemes {
  static final ThemeData light = ThemeData(
    primaryColor: AppColors.primary,
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: AppColors.primary,
      onPrimary: AppColors.onPrimary,
      primaryContainer: AppColors.primaryContainer,
      onPrimaryContainer: AppColors.onPrimaryContainer,
      secondary: AppColors.secondary,
      onSecondary: AppColors.onSecondary,
      secondaryContainer: AppColors.secondaryContainer,
      onSecondaryContainer: AppColors.onSecondaryContainer,
      error: AppColors.error,
      onError: AppColors.onError,
      errorContainer: AppColors.errorContainer,
      onErrorContainer: AppColors.onErrorContainer,
      background: AppColors.background,
      onBackground: AppColors.onBackgroundPrimary,
      surface: AppColors.surface,
      onSurface: AppColors.onSurfacePrimary,
      outline: AppColors.outline,
      surfaceVariant: AppColors.surfaceVariant,
      onSurfaceVariant: AppColors.onSurfaceVariant,
    ),
    appBarTheme: const AppBarTheme(color: AppColors.primary),
    cupertinoOverrideTheme: const CupertinoThemeData(
      primaryColor: AppColors.primary,
      scaffoldBackgroundColor: AppColors.background,
    ),
    backgroundColor: AppColors.background,
    scaffoldBackgroundColor: AppColors.background,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: AppColors.secondary,
      selectionColor: AppColors.secondary,
      selectionHandleColor: AppColors.secondary,
    ),
    textTheme: textTheme,
    indicatorColor: AppColors.secondary,
  );

  static final TextTheme textTheme = TextTheme(
    displayLarge: AppTextStyles.displayLarge(),
    displayMedium: AppTextStyles.displayMedium(),
    displaySmall: AppTextStyles.displaySmall(),
    headlineLarge: AppTextStyles.headlineSmall(),
    headlineMedium: AppTextStyles.headlineMedium(),
    headlineSmall: AppTextStyles.headlineSmall(),
    titleLarge: AppTextStyles.titleLarge(),
    titleMedium: AppTextStyles.titleMedium(),
    titleSmall: AppTextStyles.titleSmall(),
    bodyLarge: AppTextStyles.bodyLarge(),
    bodyMedium: AppTextStyles.bodyMedium(),
    bodySmall: AppTextStyles.bodySmall(),
    labelLarge: AppTextStyles.labelLarge(),
    labelMedium: AppTextStyles.labelMedium(),
    labelSmall: AppTextStyles.labelSmall(),
  );
}
