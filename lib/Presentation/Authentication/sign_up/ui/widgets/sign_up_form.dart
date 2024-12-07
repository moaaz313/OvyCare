// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ovacare/Core/Widgets/Custom_Button.dart';
import 'package:ovacare/Core/Widgets/app_text_form_field.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  bool isPasswordObscure = true;
  TextEditingController birthDateController = TextEditingController();

  String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Name is required';
    } else if (value.length < 3) {
      return 'Name must be at least 3 characters long';
    }
    return null;
  }

  String? validateEmail(String? value) {
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (value == null || value.isEmpty) {
      return 'Email is required';
    } else if (!emailRegex.hasMatch(value)) {
      return 'Enter a valid email address';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    } else if (value.length < 6) {
      return 'Password must be at least 6 characters long';
    }
    return null;
  }

  /// Opens the date picker
  Future<void> pickDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null) {
      birthDateController.text = "${pickedDate.toLocal()}".split(' ')[0];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 17.w),
      child: Form(
        key: formKey,
        autovalidateMode: autovalidateMode,
        child: Column(
          children: [
            AppTextFormField(
              hintText: 'Name',
              validator: validateName,
            ),
            SizedBox(height: 15.h),
            AppTextFormField(
              hintText: 'Email',
              validator: validateEmail,
            ),
            SizedBox(height: 15.h),
            AppTextFormField(
              hintText: 'Pasword',
              isObscureText: isPasswordObscure,
              validator: validatePassword,
              suffixIcon: GestureDetector(
                onTap: () {
                  isPasswordObscure = !isPasswordObscure;
                  setState(() {});
                },
                child: Icon(
                  isPasswordObscure ? Icons.visibility_off : Icons.visibility,
                ),
              ),
            ),
            SizedBox(height: 15.h),
           // Birth Date Field with Date Picker
            AppTextFormField(
              hintText: 'Birth Date',
              controller: birthDateController,
              readOnly: true, // Makes the field non-editable
              suffixIcon: GestureDetector(
                onTap: () => pickDate(context),
                child: const Icon(Icons.calendar_today),
              ),
            ),
            SizedBox(height: 30.h),
            CustomButton(
              name: 'Sign Up',
              ontap: () {
                if (formKey.currentState!.validate()) {
                  print("Sign-Up Successful!");
                } else {
                  setState(() {
                    autovalidateMode = AutovalidateMode.always;
                  });
                }
              },
              width: double.infinity,
              height: 40.h,
              fontSize: 16.sp,
            ),
          ],
        ),
      ),
    );
  }
}
