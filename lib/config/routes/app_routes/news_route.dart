import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '/features/_features.dart' show NewsScreen, NewsDetailsScreen, NewsCubit;

final newsScreenRoutes = [
  GoRoute(
    path: NewsScreen.routePath,
    name: NewsScreen.routeName,
    pageBuilder: (context, state) => const CupertinoPage(child: NewsScreen()),
    routes: [
      GoRoute(
        path: NewsDetailsScreen.routePath,
        name: NewsDetailsScreen.routeName,
        pageBuilder: (context, state) {
          final id = state.pathParameters['id']!;
          final article = context.read<NewsCubit>().findArticleById(id);

          // store the article in the local database
          // and then use it here

          return CupertinoPage(child: NewsDetailsScreen(article: article));
        },
      ),
    ],
  ),
];
