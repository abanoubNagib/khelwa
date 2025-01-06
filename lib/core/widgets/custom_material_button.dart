import 'package:flutter/material.dart';
import 'package:khelwa/core/theme/text_styles.dart';
import '../theme/light_theme/light_colors.dart';

class CustomMaterialButton extends StatelessWidget {
  final Color buttonColor;
  final Color? textColor;
  final Color borderColor;
  final bool withBorderColor;
  final double fontSize;
  final double elevation;
  final double? borderRadius;
  final double width;
  final double? height;
  final String? text;
  final TextStyle? textStyle;
  final Widget? widget;
  final bool isLoading;
  final void Function()? onTap;
  final bool isDisable;
  final bool isBoldText;
  final MaterialTapTargetSize materialTapTargetSize;

  const CustomMaterialButton({
    super.key,
    this.buttonColor = LightColorsManager.primary,
    this.textColor = LightColorsManager.white,
    this.borderColor = LightColorsManager.primary,
    this.withBorderColor = false,
    this.fontSize = 12,
    this.elevation = 0,
    this.borderRadius,
    this.width = double.maxFinite,
    this.height = 52,
    this.text,
    this.textStyle,
    this.widget,
    this.isLoading = false,
    required this.onTap,
    this.isDisable = false,
    this.isBoldText = false,
    this.materialTapTargetSize = MaterialTapTargetSize.shrinkWrap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: MaterialButton(
        elevation: elevation,
        highlightElevation: elevation,
        onPressed: (isLoading || isDisable) ? () {} : onTap,
        materialTapTargetSize: materialTapTargetSize,
        shape: RoundedRectangleBorder(
          side: withBorderColor ? BorderSide(color: borderColor) : BorderSide.none,
          borderRadius: BorderRadius.circular(borderRadius ?? 16.0),
        ),
        color: !isDisable ? buttonColor : Colors.grey[600],
        child: !isLoading
            ? widget ??
                Center(
                  child: Text(
                    text??'',
                    style: textStyle ?? TextStyles.white16semiBold.copyWith(
                      fontSize: fontSize,
                      color: textColor,
                    ),
                  ),
                )
            : const Center(
                child: CircularProgressIndicator(
                  color: LightColorsManager.white,
                ),
              ),
      ),
    );
  }
}
