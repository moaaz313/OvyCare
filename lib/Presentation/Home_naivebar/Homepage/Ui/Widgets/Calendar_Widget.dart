import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../Core/themes/Colors/ColorsStyle.dart';

Widget Calendar() {
  return Stack(
    children: [
      Container(
          height: 150.h,
          width: double.infinity,
          decoration: BoxDecoration(
              color: ColorStyle.purplefav,
              borderRadius: BorderRadius.circular(15.r)),
          child: Row(children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20.h,
                  ),
                  const Text(
                    "Period in.",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                  Text(
                    "4 Day",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 40.spMin),
                  ),
                  const Spacer(),
                  Text(
                    'Stay prepared and plan ahead!',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 13.sp),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                ],
              ),
            ),
            const Spacer()
          ])),
      Align(
        alignment: Alignment.topRight,
        child: Container(
          alignment: Alignment.topRight,
          width: 150.w,
          height: 120.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(100.r),
                bottomRight: Radius.circular(0.r),
                topRight: Radius.circular(15.r)),
            color: ColorStyle.rose.withOpacity(0.4),
          ),
        ),
      ),
      Container(
        margin: EdgeInsets.fromLTRB(210.w, 10.h, 5.w, 5.h),
        child: Image.asset(
          'assets/calander1.png',
          fit: BoxFit.contain,
          height: 140.h,
        ),
      ),
    ],
  );
}
