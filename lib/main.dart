import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/app.dart';
import '/core/_core.dart'
    show IServiceInitializer, ServiceInitializer, providers;

Future<void> main() async {
  IServiceInitializer serviceInitializer = ServiceInitializer();
  await serviceInitializer.init();

  runApp(MultiBlocProvider(providers: providers, child: const MyApp()));
}
