import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class Custom_Text_Field extends StatelessWidget {
  const Custom_Text_Field({super.key,
    required this.title,
    this.onTap,
    this.textAlign,
    this.decoration,
    this.color,
    this.fontWeight,
    this.customStyle,
    this.fontFamily,
    this.fontSize,
    this.fontStyle,
  });
  final String title;
  final String? fontFamily;
  final FontStyle? fontStyle;
  final double? fontSize;
  final Color? color;
  final TextDecoration? decoration;
  final TextStyle? customStyle;
  final FontWeight? fontWeight;
  final Function? onTap;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap!();
      },
      child: Text(
        title,
        textAlign: textAlign ?? TextAlign.start,
        style: customStyle ?? TextStyle(
          fontSize: fontSize ?? 16,
          color: color ?? Theme.of(context).colorScheme.primary,
          fontWeight: fontWeight ?? FontWeight.w500,
          decoration: decoration ?? TextDecoration.none,
          fontFamily: fontFamily ?? 'Helvetica-Font',
          fontStyle: fontStyle ?? FontStyle.normal,
        ),
      ),
    );
  }
}
