import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:khelwa/core/widgets/custom_text.dart';
import '../theme/light_theme/light_colors.dart';
import '../utils/enums.dart';

void showScaffoldMessage(BuildContext context, String text, [RequestState state = RequestState.success]) {
  Map<RequestState, Color> selectColor = {
    RequestState.success: LightColorsManager.primary,
    RequestState.warning: Colors.amber.shade900,
    RequestState.error: LightColorsManager.red,
    RequestState.other: LightColorsManager.black,
  };

  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: CustomText(
        text: text,
        textAlign: TextAlign.center,
        color: Colors.white,
      ),
      duration: const Duration(seconds: 2),
      behavior: SnackBarBehavior.fixed,
      backgroundColor: selectColor[state],
    ),
  );
}

String constructFCMPayload({
  required data,
  required String? topic,
}) {
  return jsonEncode({
    "data": data,
    if (topic != null) "to": "/topics/$topic",
  });
}

Widget customSeparated() {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 15),
    child: Container(
      height: 1,
      color: Colors.grey[300],
    ),
  );
}
