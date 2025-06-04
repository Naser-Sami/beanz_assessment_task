import 'package:flutter/material.dart';

import '/config/_config.dart' show ResponsiveLayout;
import '/features/_features.dart' show Article, DetailsAppBar;
import '/features/news/_news.dart' show NewsDetailsMainBody;
import '/shared/_shared.dart' show CustomPadding;

class NewsDetailsScreen extends StatelessWidget {
  static const routePath = '/details/:id';
  static const String routeName = 'News Details';

  const NewsDetailsScreen({super.key, required this.article});
  final Article article;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DetailsAppBar(),
      body: CustomPadding(
        child: ResponsiveLayout(
          smallLayout: NewsDetailsMainBody(article: article),
          mediumLayout: Row(
            children: [
              Expanded(flex: 80, child: NewsDetailsMainBody(article: article)),
              const Expanded(flex: 20, child: SizedBox()),
            ],
          ),
          largeLayout: Row(
            children: [
              Expanded(flex: 60, child: NewsDetailsMainBody(article: article)),
              const Expanded(flex: 40, child: SizedBox()),
            ],
          ),
        ),
      ),
    );
  }
}
