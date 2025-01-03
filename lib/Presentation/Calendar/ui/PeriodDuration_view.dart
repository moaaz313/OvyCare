import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PeriodDurationScreen extends StatefulWidget {
  @override
  _PeriodDurationScreenState createState() => _PeriodDurationScreenState();
}

class _PeriodDurationScreenState extends State<PeriodDurationScreen> {
  int selectedDuration = 4;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "How long does your period\n usually last?",
            style: TextStyle(fontSize: 22.spMin, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),
          Expanded(
            child: ListWheelScrollView(
              itemExtent: 50,
              diameterRatio: 1.5,
              useMagnifier: true,
              magnification: 1.2,
              onSelectedItemChanged: (index) {
                setState(() {
                  selectedDuration = index + 1;
                });
              },
              children: List.generate(7, (index) {
                return Text(
                  "${index + 1}",
                  style: TextStyle(fontSize: 24),
                  textAlign: TextAlign.center,
                );
              }),
            ),
          ),
          Text(
            "$selectedDuration days",
            style: TextStyle(fontSize: 18, color: Colors.pink),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CycleLengthScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pink,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                minimumSize: Size(double.infinity, 50),
              ),
              child: Text(
                "Continue",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
class CycleLengthScreen extends StatefulWidget {
  @override
  _CycleLengthScreenState createState() => _CycleLengthScreenState();
}

class _CycleLengthScreenState extends State<CycleLengthScreen> {
  String cycleType = "Regular";
  int minCycleLength = 26;
  int maxCycleLength = 28;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "How long does your cycle usually last?",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ChoiceChip(
                label: Text("Regular"),
                selected: cycleType == "Regular",
                onSelected: (selected) {
                  setState(() {
                    cycleType = "Regular";
                  });
                },
                selectedColor: Colors.pink,
                backgroundColor: Colors.grey.shade200,
              ),
              SizedBox(width: 10),
              ChoiceChip(
                label: Text("Irregular"),
                selected: cycleType == "Irregular",
                onSelected: (selected) {
                  setState(() {
                    cycleType = "Irregular";
                  });
                },
                selectedColor: Colors.pink,
                backgroundColor: Colors.grey.shade200,
              ),
            ],
          ),
          SizedBox(height: 20),
          Text(
            "$minCycleLength - $maxCycleLength days",
            style: TextStyle(fontSize: 18, color: Colors.pink),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: ElevatedButton(
              onPressed: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //       builder: (context) => LastPeriodStartScreen()),
                // );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pink,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                minimumSize: Size(double.infinity, 50),
              ),
              child: Text(
                "Continue",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
class LoadingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.pink),
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
