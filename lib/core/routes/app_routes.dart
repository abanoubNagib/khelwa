import 'package:flutter/material.dart';
import 'package:khelwa/core/routes/routes.dart';
import 'package:khelwa/screens/login/view/login_screen.dart';
import 'package:khelwa/screens/splash/view/on_boarding_screen.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    // final Object? arguments = settings.arguments;

    switch (settings.name) {
      case AppRoutes.onBoardingScreen:
        return MaterialPageRoute(
          builder: (_) => const OnBoardingScreen(),
        );

      case AppRoutes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(),
        );
    }

    return null;
  }
}
