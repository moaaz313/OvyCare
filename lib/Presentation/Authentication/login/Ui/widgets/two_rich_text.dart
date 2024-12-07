// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ovacare/Core/Routing/Routes.dart';
import 'package:ovacare/Core/themes/Colors/ColorsStyle.dart';

class TwoRichText extends StatelessWidget {
  const TwoRichText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildTermsAndPrivacyText(),
        SizedBox(height: 15.h),
        _buildSignUp(context),
      ],
    );
  }

  Widget _buildTermsAndPrivacyText() {
    return RichText(
      textAlign: TextAlign.center,
      text: const TextSpan(
        children: [
          TextSpan(
            text: 'By logging, you agree to our Terms & Conditions ',
            style: TextStyle(color: ColorStyle.black),
          ),
          TextSpan(
            text: 'and\n',
            style: TextStyle(color: ColorStyle.black),
          ),
          TextSpan(
            text: 'PrivacyPolicy.',
            style: TextStyle(color: ColorStyle.black),
          ),
        ],
      ),
    );
  }

  Widget _buildSignUp(context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          const TextSpan(
            text: "Don't have an account? ",
            style: TextStyle(color: ColorStyle.black),
          ),
          TextSpan(
            text: 'Sign Up',
            style: const TextStyle(color: ColorStyle.pink),
            // Use a gesture recognizer for interactivity
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Navigator.pushNamed(context, Routes.signUp);
              },
          ),
        ],
      ),
    );
  }
}
