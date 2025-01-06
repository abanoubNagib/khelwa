import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

/// Used to help Flutter determine the correct widgets direction for each locale
class KhelwaLocalizationDelegates {
  KhelwaLocalizationDelegates._();

  static const List<LocalizationsDelegate<dynamic>> delegates = [
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ];

  static const List<Locale> locales = [
    Locale('ar'),
    Locale('en'),
  ];

}
