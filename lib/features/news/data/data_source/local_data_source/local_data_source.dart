import '/core/_core.dart' show HiveService;
import '/features/_features.dart' show News, CachedNews;

abstract class INewsLocalDataSource {
  Future<void> cacheNews(News news, int page);
  News? getCachedNews(int page);
  Future<void> cleanExpired();
}

class NewsLocalDataSource implements INewsLocalDataSource {
  final HiveService<CachedNews> _hiveService;

  NewsLocalDataSource(this._hiveService);

  Future<void> init() async {
    await _hiveService.init();
  }

  @override
  Future<void> cacheNews(News news, int page) async {
    await _hiveService.put('page_$page', CachedNews(news));
  }

  @override
  News? getCachedNews(int page) {
    final cached = _hiveService.get('page_$page');
    if (cached == null) return null;

    return cached.data;
  }

  @override
  Future<void> cleanExpired() async {
    final allItems = _hiveService.getAll();
    for (final entry in allItems) {
      await entry.delete();
    }
  }
}
