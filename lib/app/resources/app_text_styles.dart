import 'package:flutter/material.dart';

class AppTextStyles {
  /// Display

  static TextStyle displayLarge([Color? color]) => TextStyle(
        fontSize: 56,
        height: 64 / 56,
        letterSpacing: 0,
        color: color,
        fontWeight: FontWeight.w500,
      );

  static TextStyle displayMedium([Color? color]) => TextStyle(
        fontSize: 48,
        height: 56 / 48,
        letterSpacing: 0,
        color: color,
        fontWeight: FontWeight.w500,
      );

  static TextStyle displaySmall([Color? color]) => TextStyle(
        fontSize: 40,
        height: 48 / 40,
        letterSpacing: 0,
        color: color,
        fontWeight: FontWeight.w500,
      );

  /// Headline

  static TextStyle headlineLarge([Color? color]) => TextStyle(
        fontSize: 30,
        height: 36 / 30,
        letterSpacing: 0,
        color: color,
        fontWeight: FontWeight.w500,
      );

  static TextStyle headlineMedium([Color? color]) => TextStyle(
        fontSize: 26,
        height: 32 / 26,
        letterSpacing: 0,
        color: color,
        fontWeight: FontWeight.w500,
      );

  static TextStyle headlineSmall([Color? color]) => TextStyle(
        fontSize: 20,
        height: 28 / 20,
        letterSpacing: 0.15,
        color: color,
        fontWeight: FontWeight.w500,
      );

  /// Title

  static TextStyle titleLarge([Color? color]) => TextStyle(
        fontSize: 18,
        height: 24 / 18,
        letterSpacing: 0.15,
        color: color,
        fontWeight: FontWeight.w500,
      );

  static TextStyle titleMedium([Color? color]) => TextStyle(
        fontSize: 16,
        height: 24 / 16,
        letterSpacing: 0.15,
        color: color,
        fontWeight: FontWeight.w500,
      );

  static TextStyle titleSmall([Color? color]) => TextStyle(
        fontSize: 14,
        height: 20 / 14,
        letterSpacing: 0.25,
        color: color,
        fontWeight: FontWeight.w500,
      );

  /// Body

  static TextStyle bodyLarge([Color? color]) => TextStyle(
        fontSize: 18,
        height: 24 / 18,
        letterSpacing: 0.15,
        color: color,
        fontWeight: FontWeight.w400,
      );

  static TextStyle bodyMedium([Color? color]) => TextStyle(
        fontSize: 16,
        height: 24 / 16,
        letterSpacing: 0.15,
        color: color,
        fontWeight: FontWeight.w400,
      );

  static TextStyle bodySmall([Color? color]) => TextStyle(
        fontSize: 14,
        height: 20 / 14,
        letterSpacing: 0.25,
        color: color,
        fontWeight: FontWeight.w400,
      );

  /// Label

  static TextStyle labelLarge([Color? color]) => TextStyle(
        fontSize: 13,
        height: 20 / 13,
        letterSpacing: 0.25,
        color: color,
        fontWeight: FontWeight.w400,
      );

  static TextStyle labelMedium([Color? color]) => TextStyle(
        fontSize: 12,
        height: 16 / 12,
        letterSpacing: 0.25,
        color: color,
        fontWeight: FontWeight.w400,
      );

  static TextStyle labelSmall([Color? color]) => TextStyle(
        fontSize: 11,
        height: 16 / 11,
        letterSpacing: 0.25,
        color: color,
        fontWeight: FontWeight.w400,
      );
}
