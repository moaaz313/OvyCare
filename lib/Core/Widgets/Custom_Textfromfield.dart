import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/src/get_utils/get_utils.dart';
import '../themes/Colors/ColorsStyle.dart';
import '../themes/TextStyles/fontstyle.dart';

class CustomTextfromfield extends StatelessWidget {
  final String hintText;
  final bool isObscure;
  final TextEditingController Controller;
  final Widget? suffixIcon;

  CustomTextfromfield({
    Key? key,
    required this.hintText,
    this.isObscure = false, // Default value for isObscure
    required this.Controller,
    this.suffixIcon,
  }) : super(key: key);

  String? _validateInput(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field cannot be empty';
    }
    if (hintText == 'email' && !GetUtils.isEmail(value)) {
      return 'Please enter a valid email address';
    }
    if ((hintText == 'Password' ||
        hintText == 'Old Password' ||
        hintText == 'New Password') &&
        value.length < 6) {
      return 'Password must be at least 6 characters long';
    }
    if (hintText == 'Full name' && value.length < 2) {
      return 'Name must be at least 2 characters long';
    }
    return null;
  }
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isObscure,
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      controller: Controller,
      onChanged: (value) {

      },
      validator: _validateInput,
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xffFDFDFF),
        contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 17.h),
        hintText: hintText,
        hintStyle: FontStyles.font14w500gray,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorStyle.lightgray, width: 1.5.w),
          borderRadius: BorderRadius.all(Radius.circular(16.r)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorStyle.pink, width: 1.5.w),
          borderRadius: BorderRadius.all(Radius.circular(16.r)),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: ColorStyle.lightgray, width: 1.5.w),
          borderRadius: BorderRadius.all(Radius.circular(16.r)),
        ),
        suffixIcon: suffixIcon,
        isDense: true,
      ),
    );
  }
}
