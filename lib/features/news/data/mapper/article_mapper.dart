import 'package:uuid/uuid.dart';

import '/features/_features.dart' show Article, ArticleModel, SourceModel;
import 'source_mapper.dart';

class ArticleMapper {
  ArticleMapper._();

  /// Map a [ArticleModel] instance to a [Article] instance
  static Article toDomain(ArticleModel model) {
    return Article(
      uuid: const Uuid().v4(),
      title: model.title ?? "",
      description: model.description ?? "",
      url: model.url ?? "",
      urlToImage: model.urlToImage ?? "",
      publishedAt: model.publishedAt ?? "",
      content: model.content ?? "",
      author: model.author ?? "",
      source: SourceMapper.toDomain(
        model.source ?? SourceModel(id: '', name: ''),
      ),
    );
  }

  /// Map a [Article] instance to a [ArticleModel] instance
  static ArticleModel fromDomain(Article entity) {
    return ArticleModel(
      title: entity.title,
      description: entity.description,
      url: entity.url,
      urlToImage: entity.urlToImage,
      publishedAt: entity.publishedAt,
      content: entity.content,
      author: entity.author,
      source: SourceMapper.fromDomain(entity.source),
    );
  }
}
