

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:khelwa/core/theme/light_theme/light_colors.dart';

import '../utils/enums.dart';

Future<bool?> toastShow(
  String text, {
  bool translate = false,
  RequestState state = RequestState.success,
}) async {
  // Translation? translation;
  // if (translate) {
  //   translation = await GoogleTranslator().translate(text, to: 'ar');
  // }
  return Fluttertoast.showToast(
      msg: translate ? 'translation!.text' : text,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 5,
      backgroundColor: chooseToastColor(state),
      textColor: Colors.white,
      fontSize: 16.0);
}


chooseToastColor(RequestState state) {
  const Map<RequestState, Color> toastColors = {
    RequestState.success: LightColorsManager.primary,
    RequestState.warning: Colors.amber,
    RequestState.error: Colors.red,
    RequestState.other: Colors.black,
  };
  return toastColors[state];
}
