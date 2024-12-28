import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ovacare/Presentation/Calendar/ui/PeriodLength_view.dart';

import '../../../../Core/themes/Colors/ColorsStyle.dart';
import '../../../Calendar/ui/CycleLogging_view.dart';
import '../../../Calendar/ui/CalenderSelectView.dart';
import '../../../Calendar/ui/PeriodDuration_view.dart';

Widget Calendar(context) {
  return InkWell(
    onTap: () {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => PeriodLengthScreen(),));
    },
    child: Stack(
      children: [
        Container(
            height: 150.h,
            width: double.infinity,
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.9), // Shadow color with opacity
                    spreadRadius: 5, // Spread radius
                    blurRadius: 5, // Blur radius
                    offset: const Offset(-2, 7),
                    // Offset in x and y direction
                  ),
                ],
                color: ColorStyle.darkpurple,
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
    ),
  );
}
