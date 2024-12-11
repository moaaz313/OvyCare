// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ovacare/Core/Routing/Routes.dart';
import 'package:ovacare/Core/Widgets/Custom_Button.dart';
import 'package:ovacare/Core/Widgets/app_text_form_field.dart';

class FormAndButton extends StatefulWidget {
  const FormAndButton({super.key});

  @override
  State<FormAndButton> createState() => _FormAndButton();
}

class _FormAndButton extends State<FormAndButton> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  bool isObscureText = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 17.w),
      child: Form(
        key: formKey,
        autovalidateMode: autovalidateMode,
        child: Column(
          children: [
            const AppTextFormField(
              hintText: 'Email',
            ),
            SizedBox(height: 15.h),
            AppTextFormField(
              hintText: 'Password',
              isObscureText: isObscureText,
              suffixIcon: GestureDetector(
                  onTap: () {
                    isObscureText = !isObscureText;
                    setState(() {});
                  },
                  child: Icon(
                      isObscureText ? Icons.visibility_off : Icons.visibility)),
            ),
            SizedBox(height: 1.h),
            Align(
              alignment: AlignmentDirectional.centerEnd,
              child: TextButton(
                  onPressed: () {},
                  // ignore: prefer_const_constructors
                  child: Text(
                    ' Forget Password ?',
                  )),
            ),
            SizedBox(height: 20.h),
            CustomButton(
              name: 'Login',
              ontap: () {
                if (formKey.currentState!.validate()) {
                  print("Doneeeeeeeeee");
                  Navigator.pushNamed(context, Routes.home);
                } else {
                  autovalidateMode = AutovalidateMode.always;
                }
                setState(() {});
              },
              width: double.infinity,
              height: 40.h,
              fontSize: 16.sp,
            )
          ],
        ),
      ),
    );
  }
}
