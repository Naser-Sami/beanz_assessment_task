import 'package:flutter/material.dart';

import '/config/_config.dart' show TPadding;
import '/features/_features.dart' show Article;
import '/shared/_shared.dart' show ArticleCardComponent;

class MobileNewsListView extends StatelessWidget {
  const MobileNewsListView({super.key, required this.articles});
  final List<Article> articles;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        key: const ValueKey('mobile_news_list_view'),
        padding: const EdgeInsets.symmetric(horizontal: TPadding.p16),
        itemCount: articles.length,
        separatorBuilder: (_, _) => const SizedBox(height: TPadding.p24),
        itemBuilder: (context, index) {
          final article = articles[index];

          return ArticleCardComponent(
            key: ValueKey(article.title + article.publishedAt),
            article: article,
          );
        },
      ),
    );
  }
}
