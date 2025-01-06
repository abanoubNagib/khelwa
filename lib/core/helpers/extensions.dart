import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/snackbar/snackbar_controller.dart';
import 'package:khelwa/core/functions/show_snackbar.dart';
import '../utils/enums.dart';

extension AddStringExt on String {
  int get toInt => int.parse(this);
  double get toDouble => double.parse(this);
}

extension Context on BuildContext {
  void pop<T extends Object?>([T? result]) => Navigator.pop(this, result);

  Future<dynamic> pushNamed(String routeName, {Object? arguments}) {
    return Navigator.of(this).pushNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushReplacementNamed(String routeName, {Object? arguments}) {
    return Navigator.of(this).pushReplacementNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushNamedAndRemoveUntil(String routeName, {Object? arguments}) {
    return Navigator.of(this).pushNamedAndRemoveUntil(routeName, (route) => false, arguments: arguments);
  }

  Size get sizeOf => MediaQuery.sizeOf(this);
  
  double get getHeight => MediaQuery.of(this).size.height;

  double get getWidth => MediaQuery.of(this).size.width;

  double get getTop => MediaQuery.of(this).padding.top;

  double get getBottom => MediaQuery.of(this).padding.bottom;

  TextTheme get textTheme => Theme.of(this).textTheme;

  SnackbarController showSnackBar(String message, {RequestState requestState = RequestState.success, String? title}) =>
      customShowSnackBar(message, state: requestState, title: title);
}
