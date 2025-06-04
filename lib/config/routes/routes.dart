import 'package:go_router/go_router.dart';

import '/config/_config.dart';
import '/core/_core.dart';
import '/features/_features.dart' show NewsScreen;
import 'app_redirect.dart';
import 'app_routes/_app_routes.dart';
import 'error_builder.dart';

export 'config/navigate_transitions.dart';
export 'config/navigator_observer.dart';

final router = GoRouter(
  navigatorKey: navigatorKey,
  initialLocation: NewsScreen.routePath,
  debugLogDiagnostics: true,
  observers: [AppNavigatorObserver.routeObserver],
  errorBuilder: errorBuilder,
  redirect: appRedirectLogic,
  routes: appRoutes,
);
