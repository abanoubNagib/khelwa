import 'package:khelwa/core/routes/routes.dart';
import 'package:khelwa/services/base_cache_service.dart';

class InitRoute {
  static late final String initialRoute;

  InitRoute(BaseCacheService baseCacheService);

  Future<void> init() async {
    initialRoute = AppRoutes.onBoardingScreen;
    return;
  }
}
