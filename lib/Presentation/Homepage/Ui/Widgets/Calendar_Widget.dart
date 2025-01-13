import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../Core/themes/Colors/ColorsStyle.dart';
import '../../../Calendar/ui/CycleHighlight_view.dart';
import '../../../Calendar/ui/WelcomeCalendar.dart';

Widget Calendar(context) {
  return InkWell(
    onTap: () {
      // Navigator.of(context).push(MaterialPageRoute(builder: (context) => PeriodLengthScreen(),));
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => CycleTrackStartScreen(),));
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
                     Text(
                      "Period in 4 Days.",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.spMin),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    // Text(
                    //   "4 Day",
                    //   style: TextStyle(
                    //       color: Colors.white,
                    //       fontWeight: FontWeight.bold,
                    //       fontSize: 40.spMin),
                    // ),
                    //
                    Text(
                      'Stay prepared and plan ahead!',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 13.sp),
                    ),const Spacer(),
                    ElevatedButton(onPressed: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => CycleHighlightsScreen(),));
                    }, child: Text("Period logs")),
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
