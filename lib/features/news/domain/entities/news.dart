import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

import 'article.dart';

part 'news.g.dart';

@HiveType(typeId: 0)
class News extends Equatable {
  @HiveField(0)
  final String status;

  @HiveField(1)
  final int totalResults;

  @HiveField(2)
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
