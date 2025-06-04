import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/config/_config.dart'
    show ThemeCubit, lightTheme, darkTheme, scrollBehavior, router;
import 'core/_core.dart' show AppConfig;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const ThemeWrapper();
  }
}

class ThemeWrapper extends StatelessWidget {
  const ThemeWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeMode>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () => unfocusKeyboard(context),
          child: MaterialApp.router(
            title: AppConfig.appName,
            debugShowCheckedModeBanner: false,
            themeMode: state,
            theme: lightTheme,
            darkTheme: darkTheme,
            scrollBehavior: scrollBehavior,
            routerConfig: router,
          ),
        );
      },
    );
  }

  void unfocusKeyboard(BuildContext context) {
    final currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }
}
