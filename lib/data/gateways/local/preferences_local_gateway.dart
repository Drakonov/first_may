import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesLocalGateway {
  PreferencesLocalGateway({
    required this.flutterSecureStorage,
    required this.sharedPreferences,
  });

  static const _tokenKey = 'token';
  static const _userIdKey = 'userId';
  static const _exampleKey = 'exampleKey';

  FlutterSecureStorage flutterSecureStorage;
  SharedPreferences sharedPreferences;

  Future<String?> getToken() async {
    String? token = await flutterSecureStorage.read(key: _tokenKey);
    return token;
  }

  Future<void> setToken(String? apiToken) {
    return flutterSecureStorage.write(key: _tokenKey, value: apiToken);
  }

  Future<String?> getUserId() async {
    String? token = await flutterSecureStorage.read(key: _userIdKey);
    return token;
  }

  Future<void> setUserId(String? userId) {
    return flutterSecureStorage.write(key: _userIdKey, value: userId);
  }

  Future<bool> setExampleKeyValue(bool value) {
    return sharedPreferences.setBool(_exampleKey, value);
  }

  bool? getExampleKeyValue() {
    return sharedPreferences.getBool(_exampleKey);
  }

  Future<void> clear() async {
    flutterSecureStorage.deleteAll();
  }
}
