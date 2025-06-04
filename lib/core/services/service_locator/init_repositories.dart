import '/core/_core.dart' show sl;
import '/features/_features.dart' show INewsRepository, NewsRepository;

void initRepositories() {
  _initializeNewsRepository();
}

void _initializeNewsRepository() {
  sl.registerLazySingleton<INewsRepository>(() => NewsRepository(sl()));
}
