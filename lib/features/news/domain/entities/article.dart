import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

import 'source.dart';

part 'article.g.dart';

@HiveType(typeId: 1)
class Article extends Equatable {
  @HiveField(0)
  final String uuid;

  @HiveField(1)
  final Source source;

  @HiveField(2)
  final String author;

  @HiveField(3)
  final String title;

  @HiveField(4)
  final String description;

  @HiveField(5)
  final String url;

  @HiveField(6)
  final String urlToImage;

  @HiveField(7)
  final String publishedAt;

  @HiveField(8)
  final String content;

  const Article({
    required this.uuid,
    required this.source,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  static const empty = Article(
    uuid: '',
    source: Source.empty,
    author: '',
    title: '',
    description: '',
    url: '',
    urlToImage: '',
    publishedAt: '',
    content: '',
  );

  Article copyWith({
    String? uuid,
    Source? source,
    String? author,
    String? title,
    String? description,
    String? url,
    String? urlToImage,
    String? publishedAt,
    String? content,
  }) => Article(
    uuid: uuid ?? this.uuid,
    source: source ?? this.source,
    author: author ?? this.author,
    title: title ?? this.title,
    description: description ?? this.description,
    url: url ?? this.url,
    urlToImage: urlToImage ?? this.urlToImage,
    publishedAt: publishedAt ?? this.publishedAt,
    content: content ?? this.content,
  );

  @override
  List<Object> get props => [
    uuid,
    source,
    author,
    title,
    description,
    url,
    urlToImage,
    publishedAt,
    content,
  ];
}
