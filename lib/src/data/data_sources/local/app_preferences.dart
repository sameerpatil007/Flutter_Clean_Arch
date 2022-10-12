import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vehiclehub/src/core/utils/constants.dart';

class AppPreferences {
  AppPreferences(this._storage, this._sharedPreferences) {
    _checkAppStatus();
  }

  void _checkAppStatus() async {
    if (_sharedPreferences.getBool(kPrefFirstRun) ?? true) {
      await deleteAllValues();
      _sharedPreferences.setBool(kPrefFirstRun, false);
    }
  }

  final FlutterSecureStorage _storage;
  final SharedPreferences _sharedPreferences;

  Future<dynamic> readValue({required String key}) async {
    return await _storage.read(key: key);
  }

  Future<void> writeValue({required String key, required dynamic value}) async {
    await _storage.write(key: key, value: value);
  }

  Future<void> deleteAllValues() async {
    await _storage.deleteAll();
  }

  Future<void> deleteValue({required String key}) async {
    await _storage.delete(key: key);
  }
}
