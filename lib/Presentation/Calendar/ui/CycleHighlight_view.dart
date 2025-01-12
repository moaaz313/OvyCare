import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ovacare/Core/Widgets/custom_app_bar.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../Core/themes/Colors/ColorsStyle.dart';
import 'LoadingScreen.dart';

class CycleHighlightsScreen extends StatelessWidget {
  final DateTime periodStartDate = DateTime(2025, 3, 18);
  final DateTime nextPeriodStartDate = DateTime(2025, 6, 9);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Cycle Tracking Highlights",
        useIconButton: true,
        backgroundColor: ColorStyle.pink,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // WeekdaySelector(),
              PredictionSectionWidget(
                title: "Period Prediction",
                subtitle:
                    "Your period is likely to start on or around\n${_formatDate(periodStartDate)}.",
                highlightedDates: _generatePeriodDates(periodStartDate),
                month: 'March',
              ),
              SizedBox(height: 5.h,),
              PredictionSectionWidget(
                title: "Period Prediction",
                subtitle:
                    "Your period is likely to start on or around\n${_formatDate(nextPeriodStartDate)}.",
                highlightedDates: _generatePeriodDates(nextPeriodStartDate),
                month: 'June',
              ),

            ],
          ),
        ),
      ),
    );
  }

  Widget PredictionSectionWidget({
    required String title,
    required String subtitle,
    required List<DateTime> highlightedDates,
    required String month,
  }) {
    return Card(
      elevation: 5,
      shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 0.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16.h,),
            Row(
              children: [
                Icon(Icons.brightness_5, color: ColorStyle.purple),
                SizedBox(width: 8.w),
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22.spMin,
                    color: ColorStyle.purple,
                  ),
                ),
              ],
            ),
            SizedBox(height: 8.h),
            Text(
              subtitle,
              style: TextStyle(
                fontSize: 16.spMin,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.h),

            // Calendar
            MiniCalendarWidget(highlightedDates, month),
          ],
        ),
      ),
    );
  }

  Widget MiniCalendarWidget(List<DateTime> highlightedDates, String month) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: ['Sat', 'Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri']
              .map((day) =>
                  Text(day, style: TextStyle(fontWeight: FontWeight.bold)))
              .toList(),
        ),
        SizedBox(height: 8.h),
        GridView.builder(
          shrinkWrap: true,
          itemCount: 31,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 7,
            crossAxisSpacing: 4,
            mainAxisSpacing: 4,
          ),
          itemBuilder: (context, index) {
            final date =
                DateTime(2025, highlightedDates.first.month, index + 1);
            final isHighlighted =
                highlightedDates.any((d) => d.day == date.day);

            return Container(
              decoration: BoxDecoration(
                color:
                    isHighlighted ? Colors.pink.shade200 : Colors.transparent,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  '${index + 1}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: isHighlighted ? Colors.white : Colors.black,
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  // Generate list of predicted period dates
  List<DateTime> _generatePeriodDates(DateTime startDate) {
    return List.generate(7, (index) => startDate.add(Duration(days: index)));
  }

  // Format date as "18 March"
  String _formatDate(DateTime date) {
    return "${date.day} ${_monthName(date.month)}";
  }

  // Get month name from month number
  String _monthName(int month) {
    const monthNames = [
      "January",
      "February",
      "March",
      "April",
      "May",
      "June",
      "July",
      "August",
      "September",
      "October",
      "November",
      "December"
    ];
    return monthNames[month - 1];
  }
}




