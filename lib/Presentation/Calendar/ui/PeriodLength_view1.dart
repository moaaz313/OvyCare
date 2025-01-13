import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Core/Widgets/Custom_Button.dart';
import '../../../Core/Widgets/custom_app_bar.dart';
import '../../../Core/themes/Colors/ColorsStyle.dart';
import 'CycleLength_view2.dart';

class PeriodLengthScreen extends StatefulWidget {
  @override
  _PeriodLengthScreen createState() => _PeriodLengthScreen();
}

class _PeriodLengthScreen extends State<PeriodLengthScreen> {
  int selectedValue = 4;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          title: 'Cycle Track',
          useIconButton: true,
          backgroundColor: ColorStyle.pink),
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal:10.w,vertical: 10.h
        ),
        child: Column(
          children: [
            LinearProgressIndicator(
              value: 1 / 4, // Example: Step 6 of 7
              backgroundColor: Colors.grey.shade300,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.pink),
            ),
            SizedBox(height: 50.h,),
            Text(
              'How long does your\nperiod usually last?',
              style: TextStyle(fontSize: 30.spMin, fontWeight: FontWeight.w600),
            ),
            // SizedBox(height: 20.h),
            Expanded(
              child: Container(
                height: 300,
                child: CupertinoPicker(
                  scrollController:FixedExtentScrollController(initialItem: selectedValue - 1),
                  itemExtent: 60.0,
                  onSelectedItemChanged: (int index) {
                    setState(() {
                      selectedValue = index + 1;
                    });
                  },
                  children: List<Widget>.generate(7, (int index) {
                    return Container(
                        alignment:Alignment.center,
                        child: Text('${index + 1} days',style: TextStyle(fontSize:30.spMin),));
                  }),
                ),
              ),
            ),
            // SizedBox(height: 20), ,
            // Spacer(),
            CustomButton(
              ontap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CycleLengthScreen()),
                );
              },
              width: double.infinity,
              height: 50.h,
              fontSize: 18.spMin,
              name: "Continue",
            ),
            SizedBox(height: 10.h,)
          ],
        ),
      ),
    );
  }
}
