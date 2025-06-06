import 'package:hive/hive.dart';

import '/features/_features.dart' show News;

part 'cached_news.g.dart';

@HiveType(typeId: 100)
class CachedNews extends HiveObject {
  @HiveField(0)
  final News data;

  @HiveField(1)
  final DateTime cachedAt;

  CachedNews(this.data) : cachedAt = DateTime.now();

  bool isExpired(Duration duration) =>
      DateTime.now().difference(cachedAt) > duration;
}
