import 'package:flutter/material.dart';
import 'package:first_may/app/resources/app_colors.dart';

extension AppColorSchemeExtension on ColorScheme {
  Color get onSecondaryContainerVariant => AppColors.onSecondaryContainerVariant;

  Color get onBackgroundSecondary => AppColors.onBackgroundSecondary;

  Color get onBackgroundTertiary => AppColors.onBackgroundTertiary;

  Color get onBackgroundDisabled => AppColors.onBackgroundDisabled;

  Color get onSurfaceSecondary => AppColors.onSurfaceSecondary;

  Color get onSurfaceTertiary => AppColors.onSurfaceTertiary;

  Color get onSurfaceDisabled => AppColors.onSurfaceDisabled;

  Color get outlineVariant => AppColors.outlineVariant;

  Color get info => AppColors.info;

  Color get onInfo => AppColors.onInfo;

  Color get infoContainer => AppColors.infoContainer;

  Color get onInfoContainer => AppColors.onInfoContainer;

  Color get attention => AppColors.attention;

  Color get onAttention => AppColors.onAttention;

  Color get attentionContainer => AppColors.attentionContainer;

  Color get systemTest => AppColors.systemTest;

  Color get onSystemTest => AppColors.onSystemTest;
}
