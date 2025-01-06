import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:khelwa/core/routes/app_routes.dart';
import 'package:khelwa/core/routes/init_route.dart';
import 'package:khelwa/core/theme/khelwa_localization.dart';
import 'package:khelwa/core/theme/light_theme/light_colors.dart';
import 'package:khelwa/core/translations/app_language.dart';
import 'package:khelwa/core/translations/khelwa_translations.dart';

class KhelwaApp extends StatefulWidget {
  final AppRouter appRouter;

  const KhelwaApp({super.key, required this.appRouter});

  @override
  State<KhelwaApp> createState() => _KhelwaAppState();
}

class _KhelwaAppState extends State<KhelwaApp> {
  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: DefaultTextStyle(
        style: const TextStyle(fontFamily: 'NotoKufiArabic'),
        child: GetMaterialApp(
          localizationsDelegates: KhelwaLocalizationDelegates.delegates,
          supportedLocales: KhelwaLocalizationDelegates.locales,
          translations: KhelwaTranslations(),
          debugShowCheckedModeBanner: false,
          title: 'khelwa'.tr,
          theme: ThemeData(
            colorScheme:
                ColorScheme.fromSeed(seedColor: LightColorsManager.primary),
            useMaterial3: true,
            fontFamily: 'NotoKufiArabic',
            primaryColor: LightColorsManager.primary,
            scaffoldBackgroundColor: const Color.fromARGB(248, 255, 255, 255),
          ),
          onGenerateRoute: widget.appRouter.generateRoute,
          initialRoute: InitRoute.initialRoute,
          locale: Locale(AppLanguage.languageCode),
        ),
      ),
    );
  }
}
