import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../themes/Colors/ColorsStyle.dart';

class CustomButton extends StatelessWidget {
  final String name;
  final double? width;
  final double? height;
  final double? fontSize;
  final void Function()? ontap;
  final Color? backgroundColor;
  final Color? textColor;
  final Widget? icon ;

  const CustomButton(
      {super.key,
      required this.name,
      required this.ontap,
      this.backgroundColor,
      this.width,
      this.fontSize,
      this.height,
      this.textColor,
      this.icon,
      });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: ontap,
        child: Row(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // icon ?? Container(),
            // SizedBox(width: 10.w,),
            Text(
              name,
              style: TextStyle(
                  fontSize: fontSize?.spMin, color: textColor ?? Colors.white),
            ),
          ],
        ),
        style: ElevatedButton.styleFrom(
          // minimumSize: const Size(64, 36),
          // maximumSize: Size.infinite,
          fixedSize:  Size(width ?? 80.w, height ?? 36.h),
          // minimumSize: Size(width ?? 64.w, height ?? 36.h),
          maximumSize: Size.infinite,
          backgroundColor: backgroundColor ?? ColorStyle.pink,
          shape: RoundedRectangleBorder(
              side: const BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.all(Radius.circular(12.r))),
        ));
  }
}
