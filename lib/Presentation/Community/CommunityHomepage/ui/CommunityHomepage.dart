import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';

import '../../../../Core/Routing/Routes.dart';
import '../../../../Core/themes/Colors/ColorsStyle.dart';
import '../../../Calendar/ui/LoadingScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ovacare/Core/Widgets/custom_app_bar.dart';
import 'package:table_calendar/table_calendar.dart';

class Communityhomepage extends StatelessWidget {
   Communityhomepage({super.key});
  final DateTime periodStartDate = DateTime(2025, 3, 18);
  final DateTime nextPeriodStartDate = DateTime(2025, 6, 9);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Cycle Tracking",
        useIconButton: false,
        // backgroundColor: ColorStyle.pink,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // WeekdaySelector(),
            CalendarTimeline(
              initialDate: DateTime(2020, 4, 20),
              firstDate: DateTime(2019, 1, 15),
              lastDate: DateTime(2020, 11, 20),
              onDateSelected: (date) => print(date),
              leftMargin: 20,
              monthColor: Colors.blueGrey,
              dayColor: Colors.teal[200],
              activeDayColor: Colors.white,
              activeBackgroundDayColor: Colors.redAccent[100],
              // dayColor: Color(0xFF333A47),
              selectableDayPredicate: (date) => date.day != 23,
              locale: 'en_ISO',
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Highlightes",
                    style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold,color: ColorStyle.purple),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, Routes.recommedDoc);
                    },
                    child: Text(
                      "Show All",
                      style: TextStyle(
                        color: ColorStyle.pink,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            PredictionSectionWidget(
              title: "Period Prediction",
              subtitle:
              "Your period is likely to start on or around\n${_formatDate(periodStartDate)}.",
              highlightedDates: _generatePeriodDates(periodStartDate),
              month: 'March',
            ),
            // CycleHistoryPage(),
            SizedBox(height: 10.h,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Your Cycles",
                    style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold,color: ColorStyle.purple),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, Routes.recommedDoc);
                    },
                    child: Text(
                      "Show All",
                      style: TextStyle(
                        color: ColorStyle.pink,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal:12.w ),
              child: Cycle(),
            )
          ]
        ),
      ),
    );
  }
}
Widget PredictionSectionWidget({
  required String title,
  required String subtitle,
  required List<DateTime> highlightedDates,
  required String month,
}) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 12.w,),
    child: Card(
      elevation: 5,
      shape:
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
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

class CycleHistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            cycleSection(
              title: "Current Cycle: Started 25 Dec (19 days)",
              subtitle: "5-day period",
              activeDays: 5,
              totalDays: 19,
            ),
            const SizedBox(height: 20),
            cycleSection(
              title: "83 Days: 3 Oct – 24 Dec",
              subtitle: "5-day period",
              activeDays: 5,
              totalDays: 83,
            ),
          ],
        ));
  }

  Widget cycleSection({
    required String title,
    required String subtitle,
    required int activeDays,
    required int totalDays,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
        ),
        const SizedBox(height: 4),
        Text(
          subtitle,
          style: const TextStyle(color: Colors.grey, fontSize: 14),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 4,
          runSpacing: 8,
          children: List.generate(totalDays, (index) {
            final isActive = index < activeDays;
            return Container(
              width: 12,
              height: 24,
              decoration: BoxDecoration(
                color: isActive ? Colors.red : Colors.white,
                borderRadius: BorderRadius.circular(6),
              ),
            );
          }),
        ),
      ],
    );
  }
}

Widget Cycle() {
  return Card(
    elevation: 4,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // _buildWeekSelector(),
        const SizedBox(height: 16),
        _buildCycleHistorySection(
          title: "Current Cycle: Started 25 Dec (19 days)",
          subtitle: "5-day period",
          activeDays: 5,
          totalDays: 19,
        ),
        const SizedBox(height: 16),
        _buildCycleHistorySection(
          title: "83 Days: 3 Oct – 24 Dec",
          subtitle: "5-day period",
          activeDays: 5,
          totalDays: 20,
        ),
      ],
    ),
  );
}

// Build Week Selector Widget
Widget _buildWeekSelector() {
  const days = ['T', 'F', 'S', 'S', 'M', 'T', 'W'];
  const selectedDayIndex = 2; // Highlighted day (Saturday)

  return Padding(
    padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(days.length, (index) {
        final isSelected = index == selectedDayIndex;
        return Column(
          children: [
            Container(
              height: isSelected ? 50.h : 40.h,
              width: isSelected ? 50.h : 40.h,
              decoration: BoxDecoration(
                color: isSelected ? Colors.white : Colors.grey.shade300,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  days[index],
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: isSelected ? Colors.black : Colors.grey.shade800,
                    fontSize: isSelected ? 18.sp : 16.sp,
                  ),
                ),
              ),
            ),
            if (isSelected)
              const Icon(Icons.arrow_drop_up, color: Colors.white),
          ],
        );
      }),
    ),
  );
}

// Build Cycle History Section
Widget _buildCycleHistorySection({
  required String title,
  required String subtitle,
  required int activeDays,
  required int totalDays,
}) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 16.w),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16.sp,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          subtitle,
          style: TextStyle(
            fontSize: 14.sp,
            color: Colors.grey.shade600,
          ),
        ),
        const SizedBox(height: 16),
        Wrap(
          spacing: 4,
          runSpacing: 8,
          children: List.generate(totalDays, (index) {
            final isActive = index < activeDays;
            return Container(
              width: 12,
              height: 24,
              decoration: BoxDecoration(
                color: isActive ? Colors.red : Colors.grey.shade300,
                borderRadius: BorderRadius.circular(6),
              ),
            );
          }),
        ),
        SizedBox(height: 10.h,),
        Divider()
      ],
    ),
  );
}