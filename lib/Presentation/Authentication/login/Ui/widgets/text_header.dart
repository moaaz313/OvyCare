// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextHeader extends StatelessWidget {
  final String? headertxt;
  final String? subtxt;

  const TextHeader({super.key, this.headertxt, this.subtxt});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            headertxt ?? "Welcome Back!",
            style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple),
          ),
          SizedBox(height: 8.h),
          Text(
            subtxt ??
                "We are excited to have you back, can't wait to see what you have been up to since you last logged in",
            style: const TextStyle(fontSize: 16, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
