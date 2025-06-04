import 'package:hive_flutter/hive_flutter.dart';

Future<void> initializeHive() async {
  await Hive.initFlutter();

  // Register all adapters before using Hive
  registerAllHiveAdapters();
}

void registerAllHiveAdapters() {
  // Register all adapters before using Hive
}
