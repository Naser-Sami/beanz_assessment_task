import 'package:flutter/material.dart';

import '/config/_config.dart' show TSize, TRadius;
import '/core/_core.dart' show BuildContextExtensions;
import '/features/_features.dart' show Article;
import '/shared/_shared.dart'
    show CustomPadding, TextWidget, CachedNetWorkImageComponent;

class NewsDetailsScreen extends StatelessWidget {
  static const routePath = '/details/:id';
  static const String routeName = 'News Details';

  const NewsDetailsScreen({super.key, required this.article});
  final Article article;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("News Details")),
      body: CustomPadding(
        child: ListView(
          children: [
            TextWidget(article.title, style: context.textTheme.titleLarge),
            const SizedBox(height: TSize.s32),
            ClipRRect(
              borderRadius: const BorderRadius.all(
                Radius.circular(TRadius.r12),
              ),
              child: CachedNetWorkImageComponent(imageUrl: article.urlToImage),
            ),
          ],
        ),
      ),
    );
  }
}
