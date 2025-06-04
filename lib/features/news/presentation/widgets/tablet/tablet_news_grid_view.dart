import 'package:flutter/material.dart';

import '/config/_config.dart' show TPadding;
import '/core/_core.dart' show BuildContextExtensions;
import '/features/_features.dart' show Article;
import '/shared/_shared.dart' show ArticleCardComponent;

class TabletNewsGridView extends StatelessWidget {
  const TabletNewsGridView({super.key, required this.articles});
  final List<Article> articles;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        key: const ValueKey('tablet_news_grid_view'),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: context.width >= 1024 ? 3 : 2,
          mainAxisSpacing: TPadding.p20,
          crossAxisSpacing: TPadding.p20,
          mainAxisExtent: 396,
        ),
        padding: const EdgeInsets.symmetric(horizontal: TPadding.p80),
        itemCount: articles.length,
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
