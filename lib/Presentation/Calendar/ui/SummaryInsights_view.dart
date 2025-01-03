import 'package:flutter/material.dart';

import 'PeriodDuration_view.dart';
class SummaryInsightsScreen extends StatelessWidget {
  final DateTime? startDate;
  final DateTime? endDate;

  SummaryInsightsScreen({this.startDate, this.endDate});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cycle Summary & Insights'),
        backgroundColor: Colors.pinkAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Cycle Summary:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            if (startDate != null)
              Text('Cycle Start Date: ${startDate.toString().split(' ')[0]}'),
            if (endDate != null)
              Text('Cycle End Date: ${endDate.toString().split(' ')[0]}'),
            SizedBox(height: 20),
            Text(
              'Insights:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
                'Your cycle length is ${endDate != null && startDate != null ? endDate!.difference(startDate!).inDays : 'N/A'} days.'),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context) => CycleHistoryScreen()));
              },
              child: Text('View Cycle History'),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.pinkAccent),
            ),
          ],
        ),
      ),
    );
  }
}
