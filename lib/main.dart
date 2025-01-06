import 'package:flutter/material.dart';
import 'package:khelwa/core/routes/app_routes.dart';
import 'package:khelwa/core/utils/setup_khelwa_app.dart';
import 'package:khelwa/khelwa_app.dart';

Future<void> main() async {
  await SetupKhelwaApp.setup();
  runApp(KhelwaApp(appRouter: AppRouter()));
}
