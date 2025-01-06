import 'package:get_it/get_it.dart';
import 'package:khelwa/core/routes/init_route.dart';
import 'package:khelwa/core/translations/app_language.dart';
import 'package:khelwa/services/api_service.dart';
import 'package:khelwa/services/base_api_service.dart';
import 'package:khelwa/services/base_cache_service.dart';
import 'package:khelwa/services/cache_service.dart';

final GetIt sl = GetIt.instance;

class ServicesLocator {
  ServicesLocator._();
  static Future<void> init() async {
    // shared preferences
    final BaseCacheService cacheService = SharedPreferencesCacheService();
    sl.registerLazySingleton<BaseCacheService>(() => cacheService);
    // init route
    final InitRoute initRoute = InitRoute(sl<BaseCacheService>());

    sl.registerLazySingleton<InitRoute>(() => initRoute);
    // backend api service
    final ApiService backendApiService = ApiService();
    sl.registerLazySingleton<BaseApiService>(() => backendApiService);
    // sql service
    // final BaseSqlService sqlService = SqlService();
    // sl.registerLazySingleton<BaseSqlService>(() => sqlService);
    // app language
    await cacheService.init();
    final AppLanguage appLanguage = AppLanguage(sl<BaseCacheService>());

    await Future.wait([
      initRoute.init(),
      backendApiService.initBaseApiService(),
      // sqlService.initializeSqlService(),
      appLanguage.onInit(),
    ]);
  }
}
