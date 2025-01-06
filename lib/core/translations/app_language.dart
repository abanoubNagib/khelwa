import 'dart:ui';
import 'package:get/get.dart';
import 'package:khelwa/services/base_cache_service.dart';

class AppLanguage extends GetxController {
  final BaseCacheService _cacheService;
  AppLanguage(this._cacheService);

  static String languageCode = 'ar';
  static TextDirection currentTextDirection = TextDirection.rtl;
  static bool isArabic = true;

  @override
  Future<void> onInit() async {
    super.onInit();
    languageCode = (await _cacheService.loadLanguageApp()) ?? 'ar';
    isArabic = languageCode == 'ar' || languageCode == 'ku';
    currentTextDirection = isArabic ? TextDirection.rtl : TextDirection.ltr;
    Get.updateLocale(Locale(languageCode));
    update();
  }

  Future<void> changeLanguage(String value) async {
    languageCode = value;
    await _cacheService.saveLanguageApp(languageCode);
    if (languageCode == 'ar' || languageCode == 'ku') {
      currentTextDirection = TextDirection.rtl;
      isArabic = true;
    } else {
      currentTextDirection = TextDirection.ltr;
      isArabic = false;
    }
    Get.updateLocale(Locale(languageCode));
    update();
  }
}
