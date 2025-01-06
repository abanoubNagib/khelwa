

import 'package:firebase_auth/firebase_auth.dart';

enum CacheServiceException {
  failedToGetKeyValue,
  failedToSetKeyValue,
  failedToSetOnboardingAsCompleted,
  failedToGetShouldRememberUser,
  failedToSetShouldRememberUser,
  unknownError,
}

abstract interface class BaseCacheService {
  Future<void> init();
  Future<T?> get<T>(String key);
  Future<void> set<T>(String key, T value);

  // user
  Future<void> saveUserId(int userId);
  Future<int?> loadUserId();
  Future<void> removeUserId();

  Future<void> saveUserAuth(String auth);
  Future<String?> loadUserAuth();
  Future<void> removeUserAuth();

  Future<void> saveUserPassword(String password);
  Future<String> loadUserPassword();
  Future<void> removeUserPassword();

  Future<void> saveUserPhone(String phone);
  Future<String> loadUserPhone();
  Future<void> removeUserPhone();

  Future<void> saveUserData(User user);
  Future<User?> loadUserData();
  Future<void> removeUserData();

  Future<void> saveIsCompleteProfile(bool state);
  Future<bool?> isCompleteProfile();
  Future<bool?> removeIsCompleteProfile();

  Future<bool> saveLanguageApp(String language);
  Future<String?> loadLanguageApp();

  Future<void> saveIsCompleteOnBoarding(bool state);
  Future<bool?> loadIsCompleteOnBoarding();


}
