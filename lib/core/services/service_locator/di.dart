import 'package:get_it/get_it.dart';

import 'init_controllers.dart';
import 'init_data_sources.dart';
import 'init_dio.dart';
import 'init_hive.dart';
import 'init_repositories.dart';
import 'init_use_cases.dart';

final sl = GetIt.I;

class DI {
  Future<void> init() async {
    initDio();
    await initializeHive();
    initDataSources();
    initRepositories();
    initUseCases();
    initControllers();
  }
}
