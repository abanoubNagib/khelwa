import 'package:flutter/material.dart';
import '../theme/light_theme/light_colors.dart';

void showBanner(BuildContext context, Widget content, String? text) {
  ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
  ScaffoldMessenger.of(context).showMaterialBanner(
    MaterialBanner(
      content: content,
      actions: [
        Container(),
        if (text != null)
          TextButton(
            style: ButtonStyle(backgroundColor: WidgetStateProperty.all(Colors.white)),
            onPressed: () {
              ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
            },
            child: Text(text, style: Theme.of(context).textTheme.titleMedium),
          )
      ],
      backgroundColor: LightColorsManager.primary,
      elevation: 5,
      contentTextStyle: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.white),
    ),
  );
  Future.delayed(const Duration(seconds: 2)).then(
    (value) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
      }
    },
  );
}
