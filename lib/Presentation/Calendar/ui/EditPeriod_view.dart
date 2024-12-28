import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class EditPeriodScreen extends StatefulWidget {
  @override
  _EditPeriodScreenState createState() => _EditPeriodScreenState();
}

class _EditPeriodScreenState extends State<EditPeriodScreen> {
  DateTime focusedDay = DateTime.now();
  List<DateTime> selectedDays = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Period'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.calendar_today),
            onPressed: () {
              // Calendar-related action (if needed)
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: TableCalendar(
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
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                // Save the selected days
                print("Selected days: $selectedDays");
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pink,
                minimumSize: Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              child: Text(
                'Save',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
