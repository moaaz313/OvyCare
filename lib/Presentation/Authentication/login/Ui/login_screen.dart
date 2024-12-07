import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ovacare/Core/Widgets/Custom_Button.dart';
import 'package:ovacare/Core/themes/Colors/ColorsStyle.dart';

import 'widgets/form_and_button.dart';
import 'widgets/text_header.dart';
import 'widgets/two_rich_text.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 35.h),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TextHeader(),
                SizedBox(height: 24.h),
                const FormAndButton(),
                SizedBox(height: 16.h),
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
                SizedBox(height: 10.h),
                CustomButton(
                  name: 'Sign in with Google',
                  ontap: () {},
                  backgroundColor: Colors.white,
                  width: double.infinity,
                  height: 56.h,
                  textColor: ColorStyle.black,
                  icon:Image.asset("assets/Google.png",scale: 2,),
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
                SizedBox(height: 55.h),
                const Center(child: TwoRichText())
              ],
            ),
          ),
        ),
      ),
    );
  }
}
