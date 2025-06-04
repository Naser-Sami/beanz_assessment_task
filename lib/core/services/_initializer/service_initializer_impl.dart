import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart'
    show WidgetsBinding, WidgetsFlutterBinding;
import 'package:flutter_dotenv/flutter_dotenv.dart' show dotenv;
import 'package:flutter_native_splash/flutter_native_splash.dart'
    show FlutterNativeSplash;
import 'package:go_router/go_router.dart' show GoRouter;
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart'
    show HydratedBloc, HydratedStorage, HydratedStorageDirectory;
import 'package:path_provider/path_provider.dart' show getTemporaryDirectory;
import 'package:url_strategy/url_strategy.dart' show setPathUrlStrategy;

import '/core/_core.dart' show DI;
import 'service_initializer.dart';

class ServiceInitializer implements IServiceInitializer {
  ServiceInitializer();

  @override
  Future<void> init() async {
    widgetsBinding;

    initSplashScreen();

    initPathUrlStrategy();
    await initializeDotEnv();
    initGoRouter();

    await Future.wait([
      initHydratedBloc(),
      initServiceLocator(),
      initHiveDatabase(),
    ]);

    removeSplashScreen();
  }

  WidgetsBinding get widgetsBinding =>
      WidgetsFlutterBinding.ensureInitialized();

  @override
  void initSplashScreen() {
    FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  }

  @override
  void initPathUrlStrategy() {
    setPathUrlStrategy();
  }

  @override
  Future<void> initializeDotEnv() async {
    await dotenv.load(fileName: "assets/.env");
  }

  @override
  void initGoRouter() {
    GoRouter.optionURLReflectsImperativeAPIs = true;
  }

  @override
  Future<void> initHydratedBloc() async {
    HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: kIsWeb
          ? HydratedStorageDirectory.web
          : HydratedStorageDirectory((await getTemporaryDirectory()).path),
    );
  }

  @override
  Future<void> initServiceLocator() async {
    await DI().init();
  }

  @override
  Future<void> initHiveDatabase() async {
    await Hive.initFlutter();
  }

  @override
  void removeSplashScreen() {
    FlutterNativeSplash.remove();
  }
}
