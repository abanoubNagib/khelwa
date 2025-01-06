import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../theme/light_theme/light_colors.dart';
import '../utils/enums.dart';


SnackbarController customShowSnackBar(String message, {RequestState state = RequestState.success, String? title}) {
  Map<RequestState, Color> selectColor = {
    RequestState.success: LightColorsManager.primary,
    RequestState.warning: Colors.amber.shade900,
    RequestState.error: LightColorsManager.red,
    RequestState.other: Colors.grey,
  };
  Map<RequestState, String> selectMessage = {
    RequestState.success: 'success'.tr,
    RequestState.warning: 'warning'.tr,
    RequestState.error: 'error'.tr,
    RequestState.other: 'other'.tr,
  };
  title ??= selectMessage[state];
  return Get.snackbar(
    title!,
    message,
    backgroundColor: selectColor[state],
    colorText: Colors.white,
  );
}