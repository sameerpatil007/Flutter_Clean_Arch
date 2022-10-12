import 'package:hive/hive.dart';

import '../../../core/utils/constants.dart';

class AppStorage {
  final Box _storage;

  AppStorage(this._storage);

  Stream<dynamic> watchValue({required String key}) {
    return _storage.watch(key: key).map((event) => event.value);
  }

  Future<dynamic> getValue({required String key}) async {
    return await _storage.get(key);
  }

  Future<void> putValue({required String key, required dynamic value}) async {
    await _storage.put(key, value);
  }

  Future<void> deleteValue({required String key}) async {
    await _storage.delete(key);
  }

  Future<void> deleteAllValues() async {
    await _storage.deleteAll([kFieldStaticData, kFieldUserData]);
  }

  Future<void> clearValues() async {
    await _storage.clear();
  }
}
