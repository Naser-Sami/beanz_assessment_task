import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '/core/_core.dart' show AppConstants, HiveService;
import '/features/_features.dart' show NewsScreen, NewsDetailsScreen, Article;

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
          final article = state.extra as Article?;

          return CupertinoPage(
            child: _NewsDetailsPageFromCache(
              fallbackId: state.pathParameters['id']!,
              article: article,
            ),
          );
        },
      ),
    ],
  ),
];

class _NewsDetailsPageFromCache extends StatelessWidget {
  final String fallbackId;
  final Article? article;

  const _NewsDetailsPageFromCache({required this.fallbackId, this.article});

  @override
  Widget build(BuildContext context) {
    if (article != null) {
      final service = HiveService<Article>(AppConstants.detailsNews);
      service.init().then((_) {
        service.put(AppConstants.lastViewedNews, article!);
      });
      return NewsDetailsScreen(article: article!);
    }

    final service = HiveService<Article>(AppConstants.detailsNews);

    return FutureBuilder(
      future: service.init(),
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        final cachedArticle = service.get(AppConstants.lastViewedNews);

        if (cachedArticle == null) {
          return const Scaffold(body: Center(child: Text("Article not found")));
        }

        return NewsDetailsScreen(article: cachedArticle);
      },
    );
  }
}
