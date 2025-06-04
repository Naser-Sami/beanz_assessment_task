import 'package:flutter/material.dart' show TextStyle, FontWeight;

import 'font_family.dart';
import 'font_size.dart';

class SystemTextStyle {
  SystemTextStyle._();

  static TextStyle displayLarge() => const TextStyle().copyWith(
    fontSize: SystemFontSize.displayLarge,
    fontWeight: FontWeight.w900,
    fontFamily: SystemFontFamily.primaryFontFamily,
  );

  static TextStyle displayMedium() => const TextStyle().copyWith(
    fontSize: SystemFontSize.displayMedium,
    fontWeight: FontWeight.w800,
    fontFamily: SystemFontFamily.primaryFontFamily,
  );

  static TextStyle displaySmall() => const TextStyle().copyWith(
    fontSize: SystemFontSize.displaySmall,
    fontWeight: FontWeight.w700,
    fontFamily: SystemFontFamily.primaryFontFamily,
  );

  static TextStyle headlineLarge() => const TextStyle().copyWith(
    fontSize: SystemFontSize.headlineLarge,
    fontWeight: FontWeight.w600,
    fontFamily: SystemFontFamily.primaryFontFamily,
  );

  static TextStyle headlineMedium() => const TextStyle().copyWith(
    fontSize: SystemFontSize.headlineMedium,
    fontWeight: FontWeight.w500,
    fontFamily: SystemFontFamily.primaryFontFamily,
  );

  static TextStyle headlineSmall() => const TextStyle().copyWith(
    fontSize: SystemFontSize.headlineSmall,
    fontWeight: FontWeight.w400,
    fontFamily: SystemFontFamily.primaryFontFamily,
  );

  static TextStyle titleLarge() => const TextStyle().copyWith(
    fontSize: SystemFontSize.titleLarge,
    fontWeight: FontWeight.w600,
    fontFamily: SystemFontFamily.primaryFontFamily,
  );

  static TextStyle titleMedium() => const TextStyle().copyWith(
    fontSize: SystemFontSize.titleMedium,
    fontWeight: FontWeight.w500,
    fontFamily: SystemFontFamily.primaryFontFamily,
  );

  static TextStyle titleSmall() => const TextStyle().copyWith(
    fontSize: SystemFontSize.titleSmall,
    fontWeight: FontWeight.w400,
    fontFamily: SystemFontFamily.primaryFontFamily,
  );

  static TextStyle labelLarge() => const TextStyle().copyWith(
    fontSize: SystemFontSize.labelLarge,
    fontWeight: FontWeight.w400,
    fontFamily: SystemFontFamily.primaryFontFamily,
  );

  static TextStyle labelMedium() => const TextStyle().copyWith(
    fontSize: SystemFontSize.labelMedium,
    fontWeight: FontWeight.w400,
    fontFamily: SystemFontFamily.primaryFontFamily,
  );

  static TextStyle labelSmall() => const TextStyle().copyWith(
    fontSize: SystemFontSize.labelSmall,
    fontWeight: FontWeight.w400,
    fontFamily: SystemFontFamily.primaryFontFamily,
  );

  static TextStyle bodyLarge() => const TextStyle().copyWith(
    fontSize: SystemFontSize.bodyLarge,
    fontWeight: FontWeight.w400,
    fontFamily: SystemFontFamily.primaryFontFamily,
  );

  static TextStyle bodyMedium() => const TextStyle().copyWith(
    fontSize: SystemFontSize.bodyMedium,
    fontWeight: FontWeight.w400,
    fontFamily: SystemFontFamily.primaryFontFamily,
  );

  static TextStyle bodySmall() => const TextStyle().copyWith(
    fontSize: SystemFontSize.bodySmall,
    fontWeight: FontWeight.w400,
    fontFamily: SystemFontFamily.primaryFontFamily,
  );
}
