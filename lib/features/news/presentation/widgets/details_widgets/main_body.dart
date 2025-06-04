import 'package:flutter/material.dart';

import '/features/_features.dart' show Article;
import '_details_widgets.dart';

class NewsDetailsMainBody extends StatelessWidget {
  const NewsDetailsMainBody({super.key, required this.article});
  final Article article;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        NewsDetailsHeaderTitle(article: article),
        NewsDetailsMainImage(article: article),
        NewsDetailsMetadata(article: article),
        NewsDetailsDescription(article: article),
      ],
    );
  }
}
