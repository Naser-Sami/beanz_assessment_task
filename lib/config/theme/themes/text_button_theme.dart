import 'package:flutter/material.dart';

import '/config/_config.dart';

final darkTextButtonTheme = TextButtonThemeData(
  style: TextButton.styleFrom(
    elevation: 0,
    overlayColor: DarkThemeColors.onPrimary,
    foregroundColor: DarkThemeColors.primary,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(TRadius.r08),
    ),
    textStyle: SystemTextStyle.titleMedium().apply(
      color: DarkThemeColors.onSurface,
    ),
  ),
);

final lightTextButtonTheme = TextButtonThemeData(
  style: TextButton.styleFrom(
    elevation: 0,
    overlayColor: LightThemeColors.onPrimary,
    foregroundColor: LightThemeColors.primary,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(TRadius.r08),
    ),
    textStyle: SystemTextStyle.titleMedium().apply(
      color: LightThemeColors.onSurface,
    ),
  ),
);
