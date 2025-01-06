import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:khelwa/core/utils/dependency_injection.dart';
import 'package:khelwa/core/utils/setup_fcm.dart';
import 'package:logging/logging.dart';

class SetupKhelwaApp {
  SetupKhelwaApp._();

  static Future<void> setup() async {
    WidgetsFlutterBinding.ensureInitialized();
    Logger.root.level = Level.ALL;
    Logger.root.onRecord.listen((LogRecord rec) {
      debugPrint('[${rec.level.name}] ${rec.message}');
    });
    
    await Future.wait([
      // Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform),
      ServicesLocator.init(),
      ScreenUtil.ensureScreenSize(),
    ]);
    await FCMSetup.setupFCM();
  }
}
