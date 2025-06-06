import '/core/_core.dart' show HiveService, AppConstants;
import '/features/_features.dart'
    show
        IRemoteDataSource,
        RemoteDataSource,
        INewsLocalDataSource,
        NewsLocalDataSource,
        CachedNews;
import 'di.dart';

Future<void> initDataSources() async {
  _initializeRemoteDataSource();
  await _initializeLocalDataSource();
}

void _initializeRemoteDataSource() {
  sl.registerLazySingleton<IRemoteDataSource>(() => RemoteDataSource());
}

Future<void> _initializeLocalDataSource() async {
  final newsHiveService = HiveService<CachedNews>(AppConstants.newsCache);
  await newsHiveService.init();

  sl.registerLazySingleton<INewsLocalDataSource>(
    () => NewsLocalDataSource(newsHiveService),
  );
}
