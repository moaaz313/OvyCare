import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ovacare/Core/themes/Colors/ColorsStyle.dart';

import '../../../../Core/themes/TextStyles/fontstyle.dart';
import 'Widgets/Calendar_Widget.dart';
import 'Widgets/Footer_Widget.dart';
import 'Widgets/Header_Widget.dart';

class HomepageView extends StatelessWidget {
  const HomepageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.yellow,
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
      child: Column(
        children: [
          Header(),
          SizedBox(
            height: 15.h,
          ),
          Calendar(),
          SizedBox(
            height: 15.h,
          ),
          Body(),
          SizedBox(
            height: 15.h,
          ),
          Footer()
        ],
      ),
    );
  }
}

Widget Body() {
  return Column(
    children: [
      Container(
        height: 150.h,
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        alignment: Alignment.centerRight,
        decoration: BoxDecoration(
            color: ColorStyle.white,
            image: DecorationImage(
                image: AssetImage(
                  'assets/image (1).png',
                ),
                fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(15.r),
            border: Border.all(color: ColorStyle.purple, width: 2.w)),
        child: Column(
          children: [
            Spacer(),
            Text(
              'PCOS Diagnostic',
              style: TextStyle(
                  color: ColorStyle.purple,
                  fontWeight: FontWeight.bold,
                  fontSize:20.spMin),
            ),
            // Text(' helping you gain insights into\n your reproductive health with a \ndetailed visual analysis'),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorStyle.pink,
                ),
                onPressed: () {},
                child: Text(
                  "Test PCOS",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                )),
            Spacer(),
          ],
        ),
      ),
      SizedBox(
        height: 15.h,
      ),
      Container(
        height: 150.h,
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        alignment: Alignment.centerRight,
        decoration: BoxDecoration(
            color: ColorStyle.white,
            image: DecorationImage(
                image: AssetImage(
                  'assets/image (2).png',
                ),
                fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(15.r),
            border: Border.all(color: ColorStyle.purple, width: 2.w)),
        child: Column(
          children: [
            Spacer(),
            Text(
              'PCO Assessment',
              style: TextStyle(
                  color: ColorStyle.purple,
                  fontWeight: FontWeight.bold,
                  fontSize:20.spMin),
            ),
            // Text(' helping you gain insights into\n your reproductive health with a \ndetailed visual analysis'),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorStyle.pink,
                ),
                onPressed: () {},
                child: Text(
                  "Test PCO",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                )),
            Spacer(),
          ],
        ),
      ),
    ],
  );
}
