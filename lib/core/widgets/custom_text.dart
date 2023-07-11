import 'package:flutter/material.dart';

import '../util/constants.dart';


class CustomText extends StatelessWidget {
  final String? text;
  final double? fontSize;
  final double? height;
  final TextAlign? textAlign;
  final Color? color;
  final bool? underline;
  final FontWeight? fontWeight;
  final int? maxLines;
  final String? fontFamily;
  final TextOverflow? overFlow;

  CustomText({ required this.text,
    this.fontSize,
    this.textAlign,
    this.color,
    this.height,
    this.fontWeight,
    this.underline = false,
    this.maxLines,
    this.fontFamily,
    this.overFlow,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      textAlign: textAlign ?? TextAlign.start,
      maxLines: maxLines,
      softWrap: maxLines == 1 ? false : true,
      style: TextStyle(
        fontWeight: fontWeight ??FontWeight.w400,
        fontSize: fontSize?? 14 ,
        color: color ?? kPrimaryColor,
        fontFamily: fontFamily ,
        decoration: underline! ? TextDecoration.underline : TextDecoration.none,
        overflow: overFlow,
        height: height,
      ),
    );
  }
}