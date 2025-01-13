import 'package:flutter/material.dart';

import '../../../Core/themes/Colors/ColorsStyle.dart';

class LoadingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(ColorStyle.pink),
              strokeWidth: 6,
            ),
            SizedBox(height: 20),
            Text(
              "We’re setting up your personalized calendar...",
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class WeekdaySelector extends StatefulWidget {
  @override
  _WeekdaySelectorState createState() => _WeekdaySelectorState();
}

class _WeekdaySelectorState extends State<WeekdaySelector> {
  int selectedDayIndex = 6; // Default selected day (e.g., Saturday)

  final List<String> days = ['T', 'F', 'S', 'S', 'M', 'T', 'W'];

  @override
  Widget build(BuildContext context) {
    return Column(
          children: [
            const SizedBox(height: 20),
            const Center(
              child: Text(
                "Today, 12 January",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              height: 80,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: days.length,
                itemBuilder: (context, index) {
                  final isSelected = index == selectedDayIndex;

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedDayIndex = index;
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      width: 50,
                      decoration: BoxDecoration(
                        color: isSelected ? Colors.white : Colors.grey[800],
                        borderRadius: BorderRadius.circular(25),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        days[index],
                        style: TextStyle(
                          color: isSelected ? Colors.black : Colors.white,
                          fontSize: isSelected ? 18 : 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        );
  }
}
