import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:khelwa/services/base_cache_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesCacheService implements BaseCacheService {
  late final SharedPreferences _sharedPreferences;
  late final FlutterSecureStorage _secureStorage;

  @override
  Future<void> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
    _secureStorage = const FlutterSecureStorage();
  }

  @override
  Future<T?> get<T>(String key) async {
    late final Function function;
    if (T is String) {
      function = _sharedPreferences.getString;
    } else if (T is bool) {
      function = _sharedPreferences.getBool;
    } else if (T is int) {
      function = _sharedPreferences.getInt;
    } else if (T is double) {
      function = _sharedPreferences.getDouble;
    } else if (T is List<String>) {
      function = _sharedPreferences.getStringList;
    } else {
      function = _sharedPreferences.get;
    }
    return function(key);
  }

  @override
  Future<void> set<T>(String key, T value) async {
    Function? function;
    if (T is String) {
      function = _sharedPreferences.setString;
    } else if (T is bool) {
      function = _sharedPreferences.setBool;
    } else if (T is int) {
      function = _sharedPreferences.setInt;
    } else if (T is double) {
      function = _sharedPreferences.setDouble;
    } else if (T is List<String>) {
      function = _sharedPreferences.setStringList;
    }
    if (function != null) await function(key, value);
  }

  // @override
  // Future<void> saveUserData(User user) async {
  //   await saveUserAuth(user.token!);
  //   await saveUserPhone(user.phone!);
  //   ApiConstante.token = user.token;
  //   user.token = 'encrypted ;)';
  //   String encodeJsonData = json.encode(user.toJson());
  //   await _sharedPreferences.setString('userData', encodeJsonData);
  // }

  // @override
  // Future<User?> loadUserData() async {
  //   final String cachedUserData =
  //       _sharedPreferences.getString('userData') ?? '';
  //   User? user;
  //   try {
  //     user = User.fromJson(json.decode(cachedUserData));
  //   } catch (e) {
  //     debugPrint("""
  //     // Error while decoding user data: $e
  //     // First time user login or user data is empty
  //     """);
  //   }

  //   user?.token = await loadUserAuth();
  //   ApiConstante.token = user?.token;
  //   return user;
  // }

  @override
  Future<String> loadUserPhone() async =>
      _sharedPreferences.getString('phone') ?? '';

  @override
  Future<void> saveUserPhone(String phone) async =>
      await _sharedPreferences.setString('phone', phone);

  @override
  Future<void> saveIsCompleteProfile(bool state) async =>
      await _sharedPreferences.setBool('isCompleteProfile', state);

  @override
  Future<bool?> isCompleteProfile() async =>
      _sharedPreferences.getBool('isCompleteProfile');

  @override
  Future<void> saveUserAuth(String token) async =>
      await _secureStorage.write(key: 'token', value: token);

  @override
  Future<void> saveUserPassword(String password) async =>
      await _secureStorage.write(key: 'password', value: password);

  @override
  Future<String?> loadUserAuth() async =>
      await _secureStorage.read(key: 'token');

  @override
  Future<String> loadUserPassword() async =>
      await _secureStorage.read(key: 'password') ?? '';

  @override
  Future<bool> saveLanguageApp(String language) async =>
      await _sharedPreferences.setString('lang', language);

  @override
  Future<String?> loadLanguageApp() async =>
      _sharedPreferences.getString('lang');

  @override
  Future<void> saveUserId(int userId) async =>
      _sharedPreferences.setInt('userId', userId);

  @override
  Future<int?> loadUserId() async => _sharedPreferences.getInt('userId');

  @override
  Future<void> removeUserData() async => await Future.wait([
        _sharedPreferences.remove('userData'),
        _sharedPreferences.remove('isCompleteProfile'),
        _secureStorage.delete(key: 'token'),
        _secureStorage.delete(key: 'password'),
      ]);

  @override
  Future<bool?> removeIsCompleteProfile() async =>
      _sharedPreferences.remove('isCompleteProfile');

  @override
  Future<void> removeUserAuth() async =>
      await _secureStorage.delete(key: 'token');

  @override 
  Future<void> removeUserId() async =>
      await _sharedPreferences.remove('userId');

  @override
  Future<void> removeUserPassword() async =>
      await _secureStorage.delete(key: 'password');

  @override
  Future<void> removeUserPhone() async =>
      await _sharedPreferences.remove('phone');

  @override
  Future<void> saveIsCompleteOnBoarding(bool state) async =>
      await _sharedPreferences.setBool('isCompleteOnBoarding', state);

  @override
  Future<bool?> loadIsCompleteOnBoarding() async =>
      _sharedPreferences.getBool('isCompleteOnBoarding');

  @override
  Future<User?> loadUserData() {
    throw UnimplementedError();
  }

  @override
  Future<void> saveUserData(User user) {
    throw UnimplementedError();
  }



}
