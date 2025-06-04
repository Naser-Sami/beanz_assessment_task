import '/core/_core.dart' show sl;
import '/features/_features.dart'
    show INewsRepository, GetTopHeadlinesNewsUseCase, GetSearchedNewsUseCase;

void initUseCases() {
  _initializeNewsUseCase();
}

void _initializeNewsUseCase() {
  sl.registerLazySingleton(
    () => GetTopHeadlinesNewsUseCase(sl<INewsRepository>()),
  );

  sl.registerLazySingleton(() => GetSearchedNewsUseCase(sl<INewsRepository>()));
}
