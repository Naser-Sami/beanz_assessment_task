import 'package:flutter/material.dart';

import '/features/_features.dart' show Article;
import '../_widgets.dart';
import 'tablet_news_grid_view.dart';

class TabletNewsScreen extends StatelessWidget {
  const TabletNewsScreen({super.key, required this.articles});

  final List<Article> articles;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const HeaderTextTitle(),
        TabletNewsGridView(articles: articles),
        const PagesButtons(),
      ],
    );
  }
}
