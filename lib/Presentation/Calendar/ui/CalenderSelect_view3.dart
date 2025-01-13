import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ovacare/Core/Widgets/custom_app_bar.dart';
import 'package:ovacare/Core/themes/Colors/ColorsStyle.dart';
import 'package:ovacare/Presentation/Calendar/ui/LoadingScreen.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../Core/Widgets/Custom_Button.dart';
import 'CycleLength_view.dart';
import 'CycleLogging_view.dart';
import 'EditPeriod_view.dart';

class CalenderSelectView extends StatefulWidget {
  @override
  _CalenderSelectView createState() =>
      _CalenderSelectView();
}

class _CalenderSelectView extends State<CalenderSelectView> {
  DateTime? selectedDate;
  DateTime focusedDay = DateTime.now();
  List<DateTime> selectedDays = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:CustomAppBar(
          title: 'Cycle Track',
          useIconButton: true,
          backgroundColor: ColorStyle.pink),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
      horizontal:10.w,vertical: 10.h
      ),
            child: LinearProgressIndicator(
              value: 3 / 4, // Example: Step 6 of 7
              backgroundColor: Colors.grey.shade300,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.pink),
            ),
          ),
          SizedBox(height:30.h),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "When did your last period\nstart?",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 30.spMin, fontWeight: FontWeight.w600),
            ),
          ),
          TableCalendar(
            firstDay: DateTime.utc(2020, 1, 1),
            lastDay: DateTime.utc(2100, 12, 31),
            focusedDay: focusedDay,
            calendarFormat: CalendarFormat.month,
            headerStyle: HeaderStyle(
              titleCentered: true,
              formatButtonVisible: false,
              titleTextStyle: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            calendarStyle: CalendarStyle(
              todayDecoration: BoxDecoration(
                color: Colors.pink.shade200,
                shape: BoxShape.circle,
              ),
              selectedDecoration: BoxDecoration(
                color: Colors.pink,
                shape: BoxShape.circle,
              ),
              defaultDecoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.grey.shade400),
              ),
              weekendDecoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.grey.shade400),
              ),
              outsideDecoration: BoxDecoration(shape: BoxShape.circle),
            ),
            selectedDayPredicate: (day) => selectedDays.contains(day),
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                this.focusedDay = focusedDay;
                if (selectedDays.contains(selectedDay)) {
                  selectedDays.remove(selectedDay);
                } else {
                  selectedDays.add(selectedDay);
                }
              });
            },
          ),     // SizedBox(height: 20),
        Spacer(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child:CustomButton(
              ontap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => LoadingScreen()),
                );
              },
              width: double.infinity,
              height: 50.h,
              fontSize: 18.spMin,
              name: "Finish",
            ),
          ),
        ],
      ),
    );
  }
}
