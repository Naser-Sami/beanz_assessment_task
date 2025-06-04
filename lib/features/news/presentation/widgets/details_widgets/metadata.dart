import 'package:flutter/material.dart';

import '/config/_config.dart' show TPadding, TSize;
import '/core/_core.dart' show BuildContextExtensions, DateFormatting;
import '/features/_features.dart' show Article;

class NewsDetailsMetadata extends StatelessWidget {
  const NewsDetailsMetadata({super.key, required this.article});

  final Article article;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: TPadding.p16, bottom: TPadding.p48),
      child: Wrap(
        spacing: TSize.s24,
        children: [
          RichText(
            text: TextSpan(
              style: context.textTheme.bodySmall,
              children: [
                const TextSpan(text: 'Author: '),
                TextSpan(text: article.author),
              ],
            ),
          ),
          RichText(
            text: TextSpan(
              style: context.textTheme.bodySmall,
              children: [
                const TextSpan(text: 'Published At: '),
                TextSpan(
                  text: DateTime.parse(
                    article.publishedAt,
                  ).formattedDateWithMonthName,
                ),
              ],
            ),
          ),
          RichText(
            text: TextSpan(
              style: context.textTheme.bodySmall,
              children: [
                const TextSpan(text: 'Source: '),
                TextSpan(text: article.source.name ?? ''),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
