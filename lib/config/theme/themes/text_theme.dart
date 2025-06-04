import 'package:flutter/material.dart';

import '/config/_config.dart' show SystemTextStyle;
import '/config/theme/_theme.dart';

class TTextTheme {
  TTextTheme._();

  static TextTheme lightTextTheme = TextTheme(
    displayLarge: SystemTextStyle.displayLarge().apply(
      color: LightThemeColors.onSurface,
    ),
    displayMedium: SystemTextStyle.displayMedium().apply(
      color: LightThemeColors.onSurface,
    ),
    displaySmall: SystemTextStyle.displaySmall().apply(
      color: LightThemeColors.onSurface,
    ),
    headlineLarge: SystemTextStyle.headlineLarge().apply(
      color: LightThemeColors.onSurface,
    ),
    headlineMedium: SystemTextStyle.headlineMedium().apply(
      color: LightThemeColors.onSurface,
    ),
    headlineSmall: SystemTextStyle.headlineSmall().apply(
      color: LightThemeColors.onSurface,
    ),
    titleLarge: SystemTextStyle.titleLarge().apply(
      color: LightThemeColors.onSurface,
    ),
    titleMedium: SystemTextStyle.titleMedium().apply(
      color: LightThemeColors.onSurface,
    ),
    titleSmall: SystemTextStyle.titleSmall().apply(
      color: LightThemeColors.onSurface,
    ),
    bodyLarge: SystemTextStyle.bodyLarge().apply(
      color: LightThemeColors.onSurface,
    ),
    bodyMedium: SystemTextStyle.bodyMedium().apply(
      color: LightThemeColors.onSurface.withValues(alpha: 0.60),
    ),
    bodySmall: SystemTextStyle.bodySmall().apply(
      color: LightThemeColors.onSurface.withValues(alpha: 0.60),
    ),
    labelLarge: SystemTextStyle.labelLarge().apply(
      color: LightThemeColors.onSurface.withValues(alpha: 0.60),
    ),
    labelMedium: SystemTextStyle.labelMedium().apply(
      color: LightThemeColors.onSurface.withValues(alpha: 0.60),
    ),
    labelSmall: SystemTextStyle.labelSmall().apply(
      color: LightThemeColors.onSurface.withValues(alpha: 0.60),
    ),
  );

  static TextTheme darkTextTheme = TextTheme(
    displayLarge: SystemTextStyle.displayLarge().apply(
      color: DarkThemeColors.onSurface,
    ),
    displayMedium: SystemTextStyle.displayMedium().apply(
      color: DarkThemeColors.onSurface,
    ),
    displaySmall: SystemTextStyle.displaySmall().apply(
      color: DarkThemeColors.onSurface,
    ),
    headlineLarge: SystemTextStyle.headlineLarge().apply(
      color: DarkThemeColors.onSurface,
    ),
    headlineMedium: SystemTextStyle.headlineMedium().apply(
      color: DarkThemeColors.onSurface,
    ),
    headlineSmall: SystemTextStyle.headlineSmall().apply(
      color: DarkThemeColors.onSurface,
    ),
    titleLarge: SystemTextStyle.titleLarge().apply(
      color: DarkThemeColors.onSurface,
    ),
    titleMedium: SystemTextStyle.titleMedium().apply(
      color: DarkThemeColors.onSurface,
    ),
    titleSmall: SystemTextStyle.titleSmall().apply(
      color: DarkThemeColors.onSurface,
    ),
    bodyLarge: SystemTextStyle.bodyLarge().apply(
      color: DarkThemeColors.onSurface,
    ),
    bodyMedium: SystemTextStyle.bodyMedium().apply(
      color: DarkThemeColors.onSurface.withValues(alpha: 0.60),
    ),
    bodySmall: SystemTextStyle.bodySmall().apply(
      color: DarkThemeColors.onSurface.withValues(alpha: 0.60),
    ),
    labelLarge: SystemTextStyle.labelLarge().apply(
      color: DarkThemeColors.onSurface.withValues(alpha: 0.60),
    ),
    labelMedium: SystemTextStyle.labelMedium().apply(
      color: DarkThemeColors.onSurface.withValues(alpha: 0.60),
    ),
    labelSmall: SystemTextStyle.labelSmall().apply(
      color: DarkThemeColors.onSurface.withValues(alpha: 0.60),
    ),
  );
}
