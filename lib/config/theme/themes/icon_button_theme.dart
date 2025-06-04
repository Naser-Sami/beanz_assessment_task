import 'package:flutter/material.dart';

import '/config/_config.dart';

final iconButtonThemeDark = IconButtonThemeData(
  style: IconButton.styleFrom(
    foregroundColor: DarkThemeColors.onSurface,
    backgroundColor: Colors.transparent,
    shape: const CircleBorder(),
  ),
);

final iconButtonThemeLight = IconButtonThemeData(
  style: IconButton.styleFrom(
    foregroundColor: LightThemeColors.onSurface,
    backgroundColor: Colors.transparent,
    shape: const CircleBorder(),
  ),
);
