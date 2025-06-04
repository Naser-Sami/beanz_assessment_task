import 'package:flutter/material.dart';

import '/features/_features.dart' show Article;
import '../_widgets.dart';
import 'mobile_news_list_view.dart';

class MobileNewsScreen extends StatelessWidget {
  const MobileNewsScreen({super.key, required this.articles});

  final List<Article> articles;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const HeaderTextTitle(),
          MobileNewsListView(articles: articles),
        ],
      ),
    );
  }
}
