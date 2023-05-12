import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:login_signup_demo/configs/AppConsts.dart';

import '../configs/AppColors.dart';

class TextFormFieldBorder extends StatelessWidget {
  TextFormFieldBorder(
      {Key? key,
      this.textSize,
      this.textColor,
      this.readOnly,
      this.hint_text,
      this.prefix_text,
      this.hintTextColor,
      this.input_type,
      this.InputFormatter,
      this.min_line,
      this.max_line,
      this.max_length,
      this.isPassword,
      this.input_action,
      this.textDirection,
      this.textAlign,
      this.fontWeight,
      this.suffix,
      this.textCapitalization,
      required this.controller,
      this.focusNode,
      this.textBoxLeftPadding,
      this.onChanged,
      this.onTap,
      this.validator})
      : super(key: key);

  final String? hint_text;
  final String? prefix_text;
  final TextInputType? input_type;
  final Widget? suffix;
  final List<FilteringTextInputFormatter>? InputFormatter;

  final TextInputAction? input_action;
  final bool? readOnly;
  final double? textSize;
  final Color? textColor;
  final Color? hintTextColor;
  final int? min_line;
  final int? max_line;
  final int? max_length;
  final bool? isPassword;
  final FontWeight? fontWeight;

  final Function? onChanged;
  final GestureTapCallback? onTap;
  final String? Function(String?)? validator;
  final TextEditingController controller;
  final FocusNode? focusNode;
  TextAlign? textAlign;
  final TextDirection? textDirection;
  final TextCapitalization? textCapitalization;

  final double? textBoxLeftPadding;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: AppColors().colorBlack,
      keyboardType: input_type,
      inputFormatters: InputFormatter ?? [],
      textCapitalization: textCapitalization ?? TextCapitalization.sentences,
      minLines: min_line ?? 1,
      maxLines: max_line ?? 1,
      // maxLength: max_length ?? TextField.noMaxLength,
      focusNode: focusNode,
      // textCapitalization: TextCapitalization.words,
      textInputAction: input_action ?? TextInputAction.next,
      obscureText: isPassword ?? false,
      readOnly: readOnly ?? false,
      controller: controller,
      autofocus: false,
      textDirection: textDirection ?? Directionality.of(context),
      textAlign: textAlign ?? TextAlign.start,
      onTap: onTap,
      onChanged: (value) {
        if (onChanged != null) {
          onChanged!(value);
        }
      },
      validator: validator,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(1.7.h),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: AppColors().colorGray.withOpacity(0.5), width: 0),
            borderRadius: BorderRadius.circular(9.0),
            gapPadding: 0),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: AppColors().colorGray.withOpacity(0.5), width: 0),
            borderRadius: BorderRadius.circular(9.0),
            gapPadding: 0),
        focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: AppColors().colorGray.withOpacity(0.5), width: 0),
            borderRadius: BorderRadius.circular(9.0),
            gapPadding: 0),
        filled: true,
        hintText: hint_text,
        suffixIcon: suffix ?? Container(),
        suffixIconConstraints: suffix == null
            ? BoxConstraints(maxWidth: 0)
            : BoxConstraints(
                maxWidth: 17.w,
              ),
        hintStyle: TextStyle(
          color: hintTextColor ?? AppColors().colorGray2,
        ),
        fillColor: AppColors().colorTextFormFieldTheme,
        errorMaxLines: 2,
        errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: AppColors().colorGray.withOpacity(0.5), width: 0),
            borderRadius: BorderRadius.circular(9.0),
            gapPadding: 0),
      ),
      style: TextStyle(
        fontSize: textSize ?? ContentTextSize.w,
        fontWeight: fontWeight ?? FontWeight.w400,
        color: textColor ?? AppColors().colorBlack,
      ),
    );
  }
}
