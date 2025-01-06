import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:khelwa/core/helpers/extensions.dart';
import 'package:khelwa/core/theme/text_styles.dart';
import '../theme/light_theme/light_colors.dart';
import '../translations/app_language.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String? labelText;
  final String? hintText;
  final void Function()? onEditingComplete;
  final void Function(String val)? onFieldSubmitted;
  final void Function(String val)? onChanged;
  final TextInputType keyboardType;
  final String? Function(String? val)? validator;
  final IconData? prefixIcon;
  final Widget? prefixWidget;
  final Color? labelColor;
  final IconData? suffixIcon;
  final Widget? suffixWidget;
  final void Function()? suffixIconOnPressed;
  final Color suffixIconColor;
  final TextDirection? textDirection;
  final TextInputAction textInputAction;
  final bool obscureText;
  final Function()? onTap;
  final bool readOnly;
  final int? maxLength;
  final int maxLines;
  final Color fillColor, focusedBorderColor;
  final double focusedBorderRadius;
  final double unFocusedBorderRadius;
  final double elevation;
  final TextCapitalization textCapitalization;
  final double padding;
  final double top;
  final List<TextInputFormatter>? inputFormatters;
  final EdgeInsets contentPadding;
  final FocusNode? focusNode;

  const CustomTextFormField({
    super.key,
    required this.controller,
    this.focusNode,
    this.labelText,
    this.hintText,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.onChanged,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.prefixIcon,
    this.prefixWidget,
    this.suffixWidget,
    this.labelColor,
    this.suffixIcon,
    this.suffixIconOnPressed,
    this.suffixIconColor = LightColorsManager.primary,
    this.textDirection,
    this.textInputAction = TextInputAction.next,
    this.obscureText = false,
    this.onTap,
    this.readOnly = false,
    this.maxLength,
    this.maxLines = 1,
    this.fillColor = LightColorsManager.light2Grey,
    this.focusedBorderRadius = 16,
    this.unFocusedBorderRadius = 16,
    this.elevation = 0,
    this.textCapitalization = TextCapitalization.none,
    this.padding = 0,
    this.top = 0,
    this.inputFormatters,
    this.focusedBorderColor = LightColorsManager.primary,
    this.contentPadding = const EdgeInsets.fromLTRB(12.0, 20.0, 12.0, 12.0),
  });

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData().copyWith(
        colorScheme: ThemeData()
            .colorScheme
            .copyWith(primary: LightColorsManager.primary),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: padding),
        child: Padding(
          padding: EdgeInsets.only(top: top),
          child: Material(
            shadowColor: Colors.black54,
            elevation: elevation,
            borderRadius: BorderRadius.circular(focusedBorderRadius),
            child: TextFormField(
              enableInteractiveSelection: true,
              inputFormatters: inputFormatters,
              onEditingComplete: onEditingComplete,
              textDirection: textDirection ?? AppLanguage.currentTextDirection,
              textCapitalization: textCapitalization,
              maxLength: maxLength,
              controller: controller,
              onTap: onTap,
              
              readOnly: readOnly,
              textInputAction: textInputAction,
              keyboardType: keyboardType,
              onFieldSubmitted: onFieldSubmitted,
              onChanged: onChanged,
              validator: validator,
              obscureText: obscureText,
              autocorrect: true,
              maxLines: maxLines,
              focusNode: focusNode,
              style: TextStyles.black14medium,
              decoration: InputDecoration(
                isDense: true,
                filled: true,
                fillColor: fillColor,
                contentPadding: contentPadding,
                labelText: labelText,
                hintText: hintText,
                hintStyle: TextStyles.black45_16regular,
                alignLabelWithHint: true,
                suffixIconColor: (focusNode?.hasFocus ?? false)
                    ? suffixIconColor
                    : LightColorsManager.grey,
                labelStyle: TextStyles.light1Grey14medium,
                prefixIcon: prefixIcon != null || prefixWidget != null
                    ? Builder(
                        builder: (context) {
                          if (prefixIcon != null) {
                            return Icon(prefixIcon);
                          }
                          return prefixWidget!;
                        },
                      )
                    : null,
                suffixIcon: suffixIcon != null || suffixWidget != null
                    ? Builder(builder: (context) {
                        if (suffixIcon != null) {
                          return IconButton(
                            splashRadius: .1,
                            onPressed: suffixIconOnPressed,
                            icon: Icon(suffixIcon),
                          );
                        }
                        return suffixWidget!;
                      })
                    : null,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(unFocusedBorderRadius),
                  borderSide: const BorderSide(
                      color: LightColorsManager.lightGrey, width: 1.3),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(unFocusedBorderRadius),
                  borderSide: const BorderSide(
                      color: LightColorsManager.lightGrey, width: 1.3),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(focusedBorderRadius),
                  borderSide: BorderSide(color: focusedBorderColor, width: 1.3),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(unFocusedBorderRadius),
                  borderSide: const BorderSide(
                      color: LightColorsManager.lightGrey, width: 1.3),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(unFocusedBorderRadius),
                  borderSide: const BorderSide(
                      color: LightColorsManager.red, width: 1.3),
                ),
                errorStyle: context.textTheme.bodyMedium!.copyWith(
                  color: LightColorsManager.black,
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(focusedBorderRadius),
                  borderSide: const BorderSide(
                      color: LightColorsManager.red2, width: 1.3),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
