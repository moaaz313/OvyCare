import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../Core/themes/Colors/ColorsStyle.dart';
import '../../../../../Core/themes/TextStyles/fontstyle.dart';
Widget Footer() {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Recommentation Doctor",
            style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
          ),
          Text(
            "See All",
            style: TextStyle(
                color: Colors.blue,
                fontSize: 15.sp,
                fontWeight: FontWeight.w500),
          )
        ],
      ),
    ],
  );
}