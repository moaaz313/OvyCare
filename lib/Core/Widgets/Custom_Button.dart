import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../themes/Colors/ColorsStyle.dart';

class CustomButton extends StatelessWidget {
  final String name;
  final double? width;
  final double? height;
  final double? FontSize;
  final void Function()? ontap;
  final Color? backgroundColor;
  const CustomButton(
      {super.key,
      required this.name,
      required this.ontap,
      this.backgroundColor,
      this.width,
      this.FontSize,
      this.height});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: ontap,
        child: Text(
          name,
          style: TextStyle(fontSize: FontSize?.spMin, color: Colors.white),
        ),
        style: ElevatedButton.styleFrom(
          minimumSize: Size(width??64.w,height?? 36.h),
          maximumSize: Size.infinite,
          // fixedSize: Size(width??64.w,height??36.h),
          // padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
          backgroundColor: backgroundColor ?? ColorStyle.pink,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.r))),
        ));
  }
}
