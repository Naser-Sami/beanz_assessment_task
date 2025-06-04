import '/core/_core.dart' show sl, DioService, ApiClient;

Future<void> initDio() async {
  sl.registerLazySingleton<DioService>(DioService.new);
  sl.registerLazySingleton<ApiClient>(
    () => ApiClient(dio: sl<DioService>().dio),
  );
}
