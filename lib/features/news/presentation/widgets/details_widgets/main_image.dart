import 'package:flutter/material.dart';

import '/config/_config.dart' show ResponsiveLayout, TRadius;
import '/features/_features.dart' show Article;
import '/shared/_shared.dart' show CachedNetWorkImageComponent;

class NewsDetailsMainImage extends StatelessWidget {
  const NewsDetailsMainImage({super.key, required this.article});

  final Article article;

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      smallLayout: SizedBox(height: 198, child: _buildBody()),
      mediumLayout: SizedBox(height: 336, child: _buildBody()),
      largeLayout: SizedBox(height: 600, child: _buildBody()),
    );
  }

  Widget _buildBody() {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(TRadius.r12)),
      child: CachedNetWorkImageComponent(imageUrl: article.urlToImage),
    );
  }
}
