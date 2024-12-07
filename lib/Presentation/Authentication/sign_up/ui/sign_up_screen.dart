import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ovacare/Core/Routing/Routes.dart';
import 'package:ovacare/Core/Widgets/Custom_Button.dart';
import 'package:ovacare/Core/themes/Colors/ColorsStyle.dart';
import 'package:ovacare/Presentation/Authentication/login/Ui/widgets/text_header.dart';

import 'widgets/sign_up_form.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController dobController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 40.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TextHeader(
              headertxt: 'Create Account',
              subtxt:
                  "Sign up now and start exploring all that our app has to offer. We're excited to welcome you to our community!",
            ),
            SizedBox(height: 20.h),
            const SignUpForm(),
            SizedBox(height: 30.h),
            Row(
              children: [
                const Expanded(child: Divider(thickness: 1)),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                  child: const Text("OR"),
                ),
                const Expanded(child: Divider(thickness: 1)),
              ],
            ),
            SizedBox(height: 20.h),
            CustomButton(
              name: 'Sign in with Google',
              ontap: () {},
              backgroundColor: Colors.white,
              width: double.infinity,
              height: 56.h,
              textColor: ColorStyle.black,
              icon: Image.asset(
                "assets/Google.png",
                scale: 2,
              ),
            ),
            SizedBox(height: 10.h),
            CustomButton(
              name: 'Sign in with Facebook',
              ontap: () {},
              backgroundColor: Colors.white,
              width: double.infinity,
              height: 56.h,
              textColor: ColorStyle.black,
              icon: const Icon(Icons.facebook, color: Colors.blue),
            ),
            SizedBox(height: 50.h),
            Center(
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    const TextSpan(
                      text: 'Already have an account yet? ',
                      style: TextStyle(color: ColorStyle.black),
                    ),
                    TextSpan(
                      text: 'Log In',
                      style: const TextStyle(color: ColorStyle.pink),
                      // Use a gesture recognizer for interactivity
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.pushNamed(context, Routes.login);
                        },
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
