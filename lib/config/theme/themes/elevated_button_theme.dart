import 'package:flutter/material.dart';
import '/config/_config.dart';

final elevatedButtonThemeDark = ElevatedButtonThemeData(
  style: ElevatedButton.styleFrom(
    elevation: 0,
    fixedSize: const Size(double.maxFinite, TSize.s50),
    backgroundColor: DarkThemeColors.primary,
    foregroundColor: DarkThemeColors.onPrimary,
    disabledBackgroundColor: DarkThemeColors.primaryContainer,
    disabledForegroundColor: DarkThemeColors.onPrimary,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(TRadius.r08),
    ),
    textStyle: SystemTextStyle.titleMedium(),
  ),
);

final elevatedButtonThemeLight = ElevatedButtonThemeData(
  style: ElevatedButton.styleFrom(
    elevation: 0,
    fixedSize: const Size(double.maxFinite, TSize.s50),
    backgroundColor: LightThemeColors.primary,
    foregroundColor: LightThemeColors.onPrimary,
    disabledBackgroundColor: LightThemeColors.primaryContainer,
    disabledForegroundColor: LightThemeColors.onPrimary,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(TRadius.r08),
    ),
    textStyle: SystemTextStyle.titleMedium(),
  ),
);
