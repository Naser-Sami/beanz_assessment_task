import 'dart:developer' show log;

import 'package:flutter/material.dart';

class AppNavigatorObserver extends NavigatorObserver {
  static final RouteObserver<PageRoute> routeObserver =
      RouteObserver<PageRoute>();

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    log(
      """On Did Push Route\nroute -> $route\npreviousRoute -> $previousRoute""",
    );
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    log(
      """On Did Pop Route\nroute -> $route\npreviousRoute -> $previousRoute""",
    );
  }
}
