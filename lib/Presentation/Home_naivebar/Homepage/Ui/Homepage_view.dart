import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ovacare/Core/themes/Colors/ColorsStyle.dart';

import '../../../../Core/themes/TextStyles/fontstyle.dart';

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
            height: 20.h,
          ),
          Body(),
          SizedBox(
            height: 20.h,
          ),
          Footer()
        ],
      ),
    );
  }
}

Widget Header() {
  return Row(
    children: [
      CircleAvatar(
        radius: 22.r,
        backgroundImage: AssetImage('assets/logo1.jpg'),

      ),
      SizedBox(
        width: 15.w,
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Hi, User!", style: FontStyles.font24boldpurple),
          Text("How are you,today?", style: FontStyles.font11w400gray),
        ],
      ),
      Spacer(),
      InkWell(
        onTap: () {},
        child: CircleAvatar(
          backgroundColor: ColorStyle.lightgray,
          child: Icon(Icons.notifications,size: 22.r,),
        ),
      )
    ],
  );
}

Widget Calendar(){
  return CalendarTimeline(
    initialDate: DateTime(2020, 4, 20),
    firstDate: DateTime(2019, 1, 15),
    lastDate: DateTime(2020, 11, 20),
    onDateSelected: (date) => print(date),
    leftMargin: 20,
    monthColor: Colors.blueGrey,
    dayColor: Colors.teal[200],
    activeDayColor: Colors.white,
    activeBackgroundDayColor: ColorStyle.pink,
    // dayColor: Color(0xFF333A47),
    selectableDayPredicate: (date) => date.day != 23,
    locale: 'en_ISO',
  );
}
Widget Body() {
  return Column(
    children: [
      Container(
        height: 150.h,
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        alignment: Alignment.centerRight,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  'assets/background1.jpg',
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
                  fontSize: 20),
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
        height: 20.h,
      ),
      Container(
        height: 150.h,
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal:10.w, vertical: 10.h),
        alignment: Alignment.centerRight,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  'assets/background2.jpg',
                ),
                fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(15.r),
            border: Border.all(color: ColorStyle.purple, width: 4.w)),
        child: Column(
          children: [
            Spacer(),
            Text(
              'PCO Assessment',
              style: TextStyle(
                  color: ColorStyle.purple,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
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
      // SizedBox(
      //   height: 20.h,
      // ),
      // Container(
      //   height: 150.h,
      //   width: double.infinity,
      //   // padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 10.h),
      //   alignment: Alignment.centerRight,
      //   decoration: BoxDecoration(
      //     color: Color(0xffFFCFC8),
      //       borderRadius: BorderRadius.circular(15.r),
      //       border: Border.all(color: ColorStyle.purple, width: 4.w)),
      //   child: Row(
      //     children: [
      //       Image.asset('assets/ovary1.jpg',fit: BoxFit.fitHeight,),
      //       Column(
      //         children: [
      //           Spacer(),
      //           Text(
      //             'PCO Assessment',
      //             style: TextStyle(
      //                 color: ColorStyle.purple,
      //                 fontWeight: FontWeight.bold,
      //                 fontSize: 20),
      //           ),
      //           Text(' helping you gain insights into\n your reproductive health with a \ndetailed visual analysis'),
      //           ElevatedButton(
      //               style: ElevatedButton.styleFrom(
      //                 backgroundColor: ColorStyle.pink,
      //               ),
      //               onPressed: () {},
      //               child: Text(
      //                 "Test PCO",
      //                 style: TextStyle(
      //                     color: Colors.white, fontWeight: FontWeight.bold),
      //               )),
      //           Spacer(),
      //         ],
      //       ),
      //     ],
      //   ),
      // ),
    ],
  );
}

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
