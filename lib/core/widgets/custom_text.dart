import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String? text;
  final Color? color;
  final double? fontSize;
  final TextAlign? textAlign;
  final FontWeight? fontWeight;
  final TextDirection? textDirection;
  final String? fontFamily;
  final bool? underline;
  final TextOverflow? overflow;
  final EdgeInsetsGeometry? padding;
  final int? maxLines;

  const CustomText({
    super.key,
    this.text,
    this.color,
    this.fontSize,
    this.textAlign,
    this.fontWeight,
    this.textDirection,
    this.fontFamily,
    this.underline = false,
    this.overflow,
    this.padding,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.all(0),
      child: Text(
        text!,
        softWrap: true,
        textAlign: textAlign,
        textDirection: textDirection,
        style: TextStyle(
          overflow: TextOverflow.fade,
          color: color ?? Colors.black,
          decoration: underline == true ? TextDecoration.underline : TextDecoration.none,
          fontSize: fontSize ?? 12,
          fontWeight: fontWeight ?? FontWeight.normal,
          fontFamily: "NotoKufiArabic",
        ),
        overflow: overflow,
        maxLines: maxLines,
      ),
    );
  }
}
