// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ovacare/Core/themes/Colors/ColorsStyle.dart';

class AppTextFormField extends StatelessWidget {
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? focusBorder;
  final InputBorder? enabledBorder;
  final InputBorder? errorBorder;
  final TextStyle? inputTextStyle;
  final TextStyle? hintStyle;
  final String hintText;
  final bool? isObscureText;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final bool? readOnly;

  const AppTextFormField(
      {super.key,
      required this.hintText,
      this.contentPadding,
      this.enabledBorder,
      this.errorBorder,
      this.focusBorder,
      this.hintStyle,
      this.inputTextStyle,
      this.isObscureText,
      this.suffixIcon,
      this.validator,
      this.controller,
      this.readOnly});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
        readOnly: readOnly ?? false,
        controller: controller,
        validator: validator ??
            (value) {
              if (value?.isEmpty ?? true) {
                return 'Field is required';
              } else {
                return null;
              }
            },
        cursorColor: Colors.black,
        decoration: InputDecoration(
          filled: true,
          fillColor: ColorStyle.white,
          isDense: true,
          contentPadding: contentPadding ??
              EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
          hintText: hintText,
          hintStyle: hintStyle ??
              const TextStyle(
                color: ColorStyle.gray,
              ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.r)),
          errorBorder: buildBorder(Colors.red),
          enabledBorder: enabledBorder ?? buildBorder(),
          focusedBorder: focusBorder ??
              buildBorder(ColorStyle.purple), // when press to write in

          suffixIcon: suffixIcon,
        ),
        obscureText: isObscureText ?? false,
        style: inputTextStyle
        // ?? TextStyles.font14darkBlueMedium,
        );
  }

  OutlineInputBorder buildBorder([color]) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(16.r),
        borderSide: BorderSide(color: color ?? ColorStyle.gray, width: 1.3));
  }
}
