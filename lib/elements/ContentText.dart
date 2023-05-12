import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../configs/AppColors.dart';
import '../configs/AppConsts.dart';

class ContentText extends StatelessWidget {
  const ContentText({
    Key? key,
    this.textSize,
    this.color,
    required this.text,
    this.maxLine,
    this.decoration,
    this.alignment,
    this.fontWeight,
  }) : super(key: key);

  final double? textSize;
  final Color? color;
  final String text;
  final int? maxLine;
  final TextAlign? alignment;
  final FontWeight? fontWeight;
  final TextDecoration? decoration;

  @override
  Widget build(BuildContext context) {
    if (maxLine != null) {
      return Text(text.tr,
          maxLines: maxLine,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: color ?? AppColors().colorGray,
            fontSize: textSize ?? ContentMediumTextSize.w,
            fontWeight: fontWeight ?? FontWeight.normal,
            decoration: decoration ?? TextDecoration.none,
          ),
          textAlign: alignment ?? TextAlign.start);
    } else {
      return Text(text.tr,
          style: TextStyle(
            color: color ?? AppColors().colorGray,
            fontSize: textSize ?? ContentMediumTextSize.w,
            fontWeight: fontWeight ?? FontWeight.normal,
            decoration: decoration ?? TextDecoration.none,
          ),
          textAlign: alignment ?? TextAlign.start);
    }
  }
}
