import 'package:flutter/material.dart';

import '/config/_config.dart' show TPadding;
import '/features/_features.dart' show Article;
import '/shared/_shared.dart' show ArticleCardComponent;

class WebNewsGridView extends StatelessWidget {
  const WebNewsGridView({super.key, required this.articles});
  final List<Article> articles;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      key: const ValueKey('web_news_grid_view'),
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        mainAxisSpacing: TPadding.p24,
        crossAxisSpacing: TPadding.p24,
        mainAxisExtent: 396,
      ),
      padding: const EdgeInsets.symmetric(horizontal: TPadding.p160),
      itemCount: articles.length,
      itemBuilder: (context, index) {
        final article = articles[index];

        return ArticleCardComponent(
          key: ValueKey(article.uuid),
          article: article,
        );
      },
    );
  }
}
