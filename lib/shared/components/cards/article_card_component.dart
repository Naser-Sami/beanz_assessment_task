import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '/config/_config.dart' show TPadding, TRadius;
import '/core/_core.dart' show BuildContextExtensions, DateFormatting;
import '/features/_features.dart' show Article, NewsDetailsScreen;
import '/shared/_shared.dart' show CachedNetWorkImageComponent, TextWidget;

class ArticleCardComponent extends StatelessWidget {
  const ArticleCardComponent({super.key, required this.article});

  final Article article;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.goNamed(
          NewsDetailsScreen.routeName,
          pathParameters: {'id': article.uuid},
          extra: article,
        );
      },
      child: Container(
        padding: const EdgeInsets.all(TPadding.p10),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(TRadius.r12)),
          color: context.colorScheme.surface,
          boxShadow: [
            BoxShadow(
              color: context.colorScheme.shadow.withValues(alpha: 0.1),
              blurRadius: 2,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          spacing: TPadding.p16,
          children: [
            SizedBox(
              width: context.width,
              height: 190,
              child: ClipRRect(
                borderRadius: const BorderRadius.all(
                  Radius.circular(TRadius.r12),
                ),
                child: CachedNetWorkImageComponent(
                  imageUrl: article.urlToImage,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: TPadding.p06),
              child: TextWidget(
                article.title,
                style: context.textTheme.titleMedium,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: TPadding.p06),
              child: TextWidget(
                article.description,
                maxLines: 2,
                style: context.textTheme.bodyMedium,
              ),
            ),
            SizedBox(
              height: 72,
              width: context.width,
              child: ClipRRect(
                borderRadius: const BorderRadius.all(
                  Radius.circular(TRadius.r12),
                ),
                child: ColoredBox(
                  color: context.colorScheme.outlineVariant,
                  child: ListTile(
                    onTap: null,
                    title: TextWidget(
                      article.author,
                      style: context.textTheme.bodySmall,
                    ),
                    subtitle: TextWidget(
                      DateTime.parse(
                        article.publishedAt,
                      ).formattedDateWithMonthName,
                      style: context.textTheme.bodySmall,
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 16,
                      color: context.colorScheme.onSurface,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
