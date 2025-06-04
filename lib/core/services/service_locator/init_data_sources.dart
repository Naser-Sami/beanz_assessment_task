import '/features/_features.dart' show IRemoteDataSource, RemoteDataSource;
import 'di.dart';

void initDataSources() {
  _initializeRemoteDataSource();
}

void _initializeRemoteDataSource() {
  sl.registerLazySingleton<IRemoteDataSource>(() => RemoteDataSource());
}
