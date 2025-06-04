import '/features/_features.dart' show News, NewsModel;
import 'article_mapper.dart';

class NewsMapper {
  NewsMapper._();

  /// Map a [NewsModel] instance to a [News] instance
  static News toDomain(NewsModel model) {
    return News(
      status: model.status ?? "",
      totalResults: model.totalResults ?? 0,
      articles: model.articles?.map(ArticleMapper.toDomain).toList() ?? [],
    );
  }

  /// Map a [News] instance to a [NewsModel] instance
  static NewsModel fromDomain(News entity) {
    return NewsModel(
      status: entity.status,
      totalResults: entity.totalResults,
      articles: entity.articles.map(ArticleMapper.fromDomain).toList(),
    );
  }
}
