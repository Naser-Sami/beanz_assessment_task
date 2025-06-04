import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '/config/_config.dart';

final appBarThemeDark = AppBarTheme(
  backgroundColor: DarkThemeColors.surface,
  foregroundColor: DarkThemeColors.onSurface,
  elevation: 0,
  scrolledUnderElevation: 0.0,
  centerTitle: false,
  titleTextStyle: TTextTheme.darkTextTheme.titleLarge,
  toolbarTextStyle: TTextTheme.darkTextTheme.titleLarge,
  iconTheme: const IconThemeData(color: DarkThemeColors.onSurface),
  actionsIconTheme: const IconThemeData(color: DarkThemeColors.onSurface),
  systemOverlayStyle: SystemUiOverlayStyle.light,
);

final appBarThemeLight = AppBarTheme(
  backgroundColor: LightThemeColors.surface,
  foregroundColor: LightThemeColors.onSurface,
  elevation: 0,
  scrolledUnderElevation: 0.0,
  centerTitle: false,
  titleTextStyle: TTextTheme.lightTextTheme.titleLarge,
  toolbarTextStyle: TTextTheme.lightTextTheme.titleLarge,
  iconTheme: const IconThemeData(color: LightThemeColors.onSurface),
  actionsIconTheme: const IconThemeData(color: LightThemeColors.onSurface),
  systemOverlayStyle: SystemUiOverlayStyle.dark,
);
