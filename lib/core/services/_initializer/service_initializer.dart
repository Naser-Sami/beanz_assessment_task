abstract class IServiceInitializer {
  Future<void> init();
  void initSplashScreen();
  void initPathUrlStrategy();
  Future<void> initializeDotEnv();
  void initGoRouter();
  Future<void> initHydratedBloc();
  Future<void> initServiceLocator();
  Future<void> initHiveDatabase();
  void removeSplashScreen();
}
