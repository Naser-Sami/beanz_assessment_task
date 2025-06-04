import 'package:flutter/material.dart';

import '/config/_config.dart' show TPadding;
import '/core/_core.dart' show BuildContextExtensions;
import '/features/_features.dart' show Article;
import '/shared/_shared.dart' show TextWidget;

class NewsDetailsHeaderTitle extends StatelessWidget {
  const NewsDetailsHeaderTitle({super.key, required this.article});

  final Article article;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: TPadding.p32),
      child: TextWidget(
        article.title,
        style: context.textTheme.titleLarge,
        maxLines: 2,
      ),
    );
  }
}
