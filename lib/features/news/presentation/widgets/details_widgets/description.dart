import 'package:flutter/material.dart';

import '/features/_features.dart' show Article;
import '/shared/_shared.dart' show TextWidget;

class NewsDetailsDescription extends StatelessWidget {
  const NewsDetailsDescription({super.key, required this.article});

  final Article article;

  @override
  Widget build(BuildContext context) {
    return TextWidget(
      article.description,
      maxLines: null,
      overflow: TextOverflow.visible,
    );
  }
}
