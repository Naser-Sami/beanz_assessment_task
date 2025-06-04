import 'package:hive_flutter/hive_flutter.dart';

import '/features/_features.dart'
    show NewsAdapter, ArticleAdapter, SourceAdapter;

abstract class IHiveService<T> {
  Future<void> init();
  Future<void> put(dynamic key, T item);
  T? get(dynamic key);
  List<T> getAll();
  Future<void> delete(dynamic key);
  Future<void> clear();
  bool containsKey(dynamic key);
}

class HiveService<T> implements IHiveService<T> {
  final String boxName;
  late Box<T> _box;

  HiveService(this.boxName);

  @override
  Future<void> init() async {
    if (!Hive.isAdapterRegistered(0)) {
      Hive.registerAdapter(NewsAdapter());
      Hive.registerAdapter(ArticleAdapter());
      Hive.registerAdapter(SourceAdapter());

      // Register other adapters here if needed
    }

    if (!Hive.isBoxOpen(boxName)) {
      _box = await Hive.openBox<T>(boxName);
    } else {
      _box = Hive.box<T>(boxName);
    }
  }

  @override
  Future<void> put(dynamic key, T item) => _box.put(key, item);

  @override
  T? get(dynamic key) => _box.get(key);

  @override
  List<T> getAll() => _box.values.toList();

  @override
  Future<void> delete(dynamic key) => _box.delete(key);

  @override
  Future<void> clear() => _box.clear();

  @override
  bool containsKey(dynamic key) => _box.containsKey(key);
}
