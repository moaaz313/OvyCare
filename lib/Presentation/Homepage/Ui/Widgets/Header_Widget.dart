import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../Core/themes/Colors/ColorsStyle.dart';
import '../../../../Core/themes/TextStyles/fontstyle.dart';
import '../../../notification/ui/notification_screen.dart';
Widget Header(context) {
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
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => NotificationScreen(),));
        },
        child: CircleAvatar(
          backgroundColor: ColorStyle.lightgray,
          child: Icon(
            Icons.notifications,
            size: 22.r,
          ),
        ),
      )
    ],
  );
}