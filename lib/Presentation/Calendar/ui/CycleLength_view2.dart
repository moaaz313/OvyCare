import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ovacare/Core/themes/Colors/ColorsStyle.dart';

import '../../../Core/Widgets/Custom_Button.dart';
import '../../../Core/Widgets/custom_app_bar.dart';
import 'CalenderSelect_view3.dart';

class CycleLengthScreen extends StatefulWidget {
  @override
  _CycleLengthScreenState createState() => _CycleLengthScreenState();
}

class _CycleLengthScreenState extends State<CycleLengthScreen> {
  int _selectedCycleLength = 28; // Default cycle length

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          title: 'Cycle Tracking',
          useIconButton: true,
          backgroundColor: ColorStyle.pink),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal:10.w,vertical: 10.h
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Progress Bar
            LinearProgressIndicator(
              value: 2 / 4, // Example: Step 6 of 7
              backgroundColor: Colors.grey.shade300,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.pink),
            ),
            SizedBox(height: 30),

            // Title
            Text(
              "How long does your cycle\nusually last?",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 30.spMin, fontWeight: FontWeight.w600),
            ),
            // SizedBox(height: 40),
            Expanded(
              child: Container(
                // height: 400,
                child: CupertinoPicker(
                  magnification: 1.2,
                  selectionOverlay: Container(
                    color: ColorStyle.lightgray,
                    alignment: Alignment.center,
                    child:Text('$_selectedCycleLength days',style: TextStyle(fontSize:35.spMin,color: ColorStyle.pink,fontWeight: FontWeight.bold)),
                  ),
                  scrollController:FixedExtentScrollController(initialItem: _selectedCycleLength - 1),
                  itemExtent: 60.0,
                  onSelectedItemChanged: (int index) {
                    setState(() {
                      _selectedCycleLength = index + 1;
                    });
                  },
                  children: List<Widget>.generate(35, (int index) {
                    return Container(
                        alignment:Alignment.center,
                        child: Text('${index + 1} days',style: TextStyle(fontSize:21.spMin)));
                  }),
                ),
              ),
            ),
            CustomButton(
              ontap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CalenderSelectView()),
                );
              },
              width: double.infinity,
              height: 50.h,
              fontSize: 18.spMin,
              name: "Continue",
            ),
            // Continue Button
            SizedBox(height: 10.h,)
          ],
        ),
      ),
    );
  }
}