import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'Widgets/Body_Widget.dart';
import 'Widgets/Calendar_Widget.dart';
import 'Widgets/Footer_Widget.dart';
import 'Widgets/Header_Widget.dart';

class HomepageView extends StatelessWidget {
  const HomepageView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
        child: Column(
          children: [
            Header(context),
            SizedBox(
              height: 10.h,
            ),
            Calendar(),
            SizedBox(
              height: 10.h,
            ),
            Body(context),
            SizedBox(
              height: 15.h,
            ),
            Footer(context),
          ],
        ),
      ),
    );
  }
}


