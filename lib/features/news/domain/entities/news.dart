import 'package:equatable/equatable.dart';

import 'article.dart';

class News extends Equatable {
  final String status;
  final int totalResults;
  final List<Article> articles;

  const News({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  static const empty = News(status: '', totalResults: 0, articles: []);

  News copyWith({String? status, int? totalResults, List<Article>? articles}) =>
      News(
        status: status ?? this.status,
        totalResults: totalResults ?? this.totalResults,
        articles: articles ?? this.articles,
      );

  @override
  List<Object?> get props => [status, totalResults, articles];
}
