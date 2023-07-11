import 'package:flutter/material.dart';

import '../util/constants.dart';


class CustomElevatedButton extends StatelessWidget {
  String text;
  final Function() onPressed;
  FontWeight? fontWeight;
  Color? colorText;
  Color? bgColor;
  Color? bordercolor;
  double? fontSize;
  double? height;
  double? width;
  double? elevation;
  double? Radius;

  CustomElevatedButton({
    required this.text,
    required this.onPressed,
    this.fontWeight,
    this.colorText,
    this.bgColor,
    this.bordercolor,
    this.fontSize,
    this.height,
    this.width,
    this.elevation,
    this.Radius,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ??24,
      width: width ?? double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            color: colorText ,

            fontSize: fontSize ?? 14,
            fontWeight: fontWeight?? FontWeight.w500,
          ),
        ),
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.all(4),
          backgroundColor: bgColor ?? kSecondaryColor,
          elevation: elevation,
          side: BorderSide(color: bordercolor ?? Colors.transparent),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Radius ?? 8),
          ),
        ),
      ),
    );
  }
}