import 'article_model.dart';

class NewsModel {
  final String? status;
  final int? totalResults;
  final List<ArticleModel>? articles;

  NewsModel({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) => NewsModel(
    status: json["status"] ?? "",
    totalResults: json["totalResults"] ?? 0,
    articles: (json['articles'] as List<dynamic>?)
        ?.map((e) => ArticleModel.fromJson(e as Map<String, dynamic>))
        .toList(),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "totalResults": totalResults,
    "articles": articles?.map((e) => e.toJson()).toList(),
  };
}
