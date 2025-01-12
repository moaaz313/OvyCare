import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ovacare/Core/Widgets/Custom_Button.dart';
import 'package:ovacare/Core/Widgets/custom_app_bar.dart';
import 'package:ovacare/Core/themes/Colors/ColorsStyle.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter/cupertino.dart';
import 'CycleLength_view2.dart';

class CycleLoggingScreen extends StatefulWidget {
  @override
  _CycleLoggingScreenState createState() => _CycleLoggingScreenState();
}

class _CycleLoggingScreenState extends State<CycleLoggingScreen> {
  DateTime? startDate;
  DateTime? endDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Log Your Cycle'),
        backgroundColor: ColorStyle.pink,
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          Text(
            'Select the start date of your cycle:',
            style: TextStyle(fontSize: 18),
          ),
          // TableCalendar(
          //   firstDay: DateTime.utc(2020, 1, 1),
          //   lastDay: DateTime.utc(2100, 12, 31),
          //   focusedDay: DateTime.now(),
          //   onDaySelected: (selected, focused) {
          //     setState(() {
          //       startDate = selected;
          //     });
          //   },
          // ),
          SizedBox(height: 20),
          Text(
            'Select the end date of your cycle:',
            style: TextStyle(fontSize: 18),
          ),
          TableCalendar(
            firstDay: DateTime.utc(2020, 1, 1),
            lastDay: DateTime.utc(2100, 12, 31),
            focusedDay: DateTime.now(),
            onDaySelected: (selected, focused) {
              setState(() {
                endDate = selected;
              });
            },
          ),
          Spacer(),
          // ElevatedButton(
          //   onPressed: () {
          //     // Save startDate and endDate
          //     Navigator.push(
          //         context,
          //         MaterialPageRoute(builder: (context) => WheelPickerScreen()
          //             //     SummaryInsightsScreen(
          //             //   startDate: startDate,
          //             //   endDate: endDate,
          //             // )
          //             ));
          //   },
          //   child: Text('Save & Proceed'),
          //   style: ElevatedButton.styleFrom(backgroundColor: ColorStyle.pink),
          // ),
        ],
      ),
    );
  }
}



