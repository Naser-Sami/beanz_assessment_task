import 'package:flutter/material.dart';

import '/config/_config.dart';
import '/core/_core.dart' show AppColorsExtension, CustomBoxDecorationTheme;

/// ------------------------------
/// Custom Extensions -Light Theme
/// ------------------------------

Iterable<ThemeExtension<dynamic>>? lightExtensions = <ThemeExtension<dynamic>>[
  AppColorsExtension(skeleton: LightThemeColors.secondaryContainer),
  CustomBoxDecorationTheme(
    customBoxDecoration: const BoxDecoration(
      color: LightThemeColors.primaryContainer,
      borderRadius: BorderRadius.all(Radius.circular(TRadius.r08)),
    ),
    customBoxDecorationGradient: BoxDecoration(
      borderRadius: const BorderRadius.all(Radius.circular(TRadius.r30)),
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          for (int x = 0; x < 105; x += 5)
            LightThemeColors.primaryContainer.withValues(alpha: x / 100),
        ],
      ),
    ),
  ),
];

/// ------------------------------
/// Custom Extensions - Dark Theme
/// ------------------------------

Iterable<ThemeExtension<dynamic>>? darkExtensions = <ThemeExtension<dynamic>>[
  AppColorsExtension(skeleton: DarkThemeColors.secondaryContainer),
  CustomBoxDecorationTheme(
    customBoxDecoration: const BoxDecoration(
      color: DarkThemeColors.primaryContainer,
      borderRadius: BorderRadius.all(Radius.circular(TRadius.r08)),
    ),
    customBoxDecorationGradient: BoxDecoration(
      borderRadius: const BorderRadius.all(Radius.circular(TRadius.r30)),
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          for (int x = 0; x < 105; x += 5)
            DarkThemeColors.primaryContainer.withValues(alpha: x / 100),
        ],
      ),
    ),
  ),
];
