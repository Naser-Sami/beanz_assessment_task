import 'package:flutter/material.dart';

import '/features/_features.dart' show Article;
import '../_widgets.dart';
import 'web_news_grid_view.dart';

class WebNewsScreen extends StatelessWidget {
  const WebNewsScreen({super.key, required this.articles});
  final List<Article> articles;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const HeaderTextTitle(),
        WebNewsGridView(articles: articles),
        const PagesButtons(),
      ],
    );
  }
}
