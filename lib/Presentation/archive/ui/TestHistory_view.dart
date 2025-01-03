import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ovacare/Core/Widgets/custom_app_bar.dart';
import 'package:ovacare/Core/themes/Colors/ColorsStyle.dart';
import 'package:fl_chart/fl_chart.dart';

class ArchivePage extends StatefulWidget {
  const ArchivePage({super.key});

  @override
  _ArchivePageState createState() => _ArchivePageState();
}

class _ArchivePageState extends State<ArchivePage> {
  final List<Map<String, String>> testHistory = [
    {
      "date": "December 10, 2024",
      "result": "Positive",
      "risk": "High",
      "notes": "Consult a specialist for further analysis."
    },
    {
      "date": "November 15, 2024",
      "result": "Negative",
      "risk": "Low",
      "notes": "Maintain a healthy lifestyle."
    },
    {
      "date": "October 5, 2024",
      "result": "Positive",
      "risk": "Moderate",
      "notes": "Follow up in 3 months."
    },
  ];

  List<Map<String, String>> filteredTests = [];
  String searchQuery = "";

  @override
  void initState() {
    super.initState();
    filteredTests = testHistory; // Initialize filtered list
  }

  void _filterTests(String query) {
    setState(() {
      searchQuery = query.toLowerCase();
      filteredTests = testHistory
          .where((test) =>
      test["date"]!.toLowerCase().contains(searchQuery) ||
          test["result"]!.toLowerCase().contains(searchQuery) ||
          test["risk"]!.toLowerCase().contains(searchQuery))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        useIconButton: true,
        backgroundColor: ColorStyle.pink,
        title: "PCOS Test History",
        // centerTitle: true, useIconButton: null,
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                // Search Bar
                TextField(
                  onTapOutside: (event) {
                    FocusManager.instance.primaryFocus?.unfocus();
                  },
                  onChanged: _filterTests,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search),
                    hintText: "Search by date, result, or risk level",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                // Line Chart
                Container(
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.blue[50],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: LineChart(
                    LineChartData(
                      titlesData: const FlTitlesData(show: false),
                      borderData: FlBorderData(show: false),
                      minX: 0,
                      maxX: testHistory.length.toDouble() - 1,
                      minY: 0,
                      maxY: 1,
                      lineBarsData: [
                        LineChartBarData(
                          spots: testHistory.asMap().entries.map((entry) {
                            double yValue;
                            switch (entry.value["result"]) {
                              case "Positive":
                                yValue = 1.0;
                                break;
                              case "Moderate":
                                yValue = 0.5;
                                break;
                              default:
                                yValue = 0.0;
                            }
                            return FlSpot(
                              entry.key.toDouble(),
                              yValue,
                            );
                          }).toList(),
                          isCurved: true,
                          color: Colors.blue,
                          belowBarData: BarAreaData(
                              show: true, color: Colors.blue.withOpacity(0.1)),
                          dotData: const FlDotData(show: true),
                          showingIndicators: [0, 1, 2],
                          aboveBarData: BarAreaData(
                              show: true, color: Colors.blue.withOpacity(0.1)),
                        ),
                      ],
                      lineTouchData: LineTouchData(
                        touchTooltipData: LineTouchTooltipData(
                          getTooltipColor: (touchedSpot) => Colors.white,
                          fitInsideHorizontally: true,
                          fitInsideVertically: true,
                          getTooltipItems: (touchedSpots) {
                            return touchedSpots.map((spot) {
                              return LineTooltipItem(
                                "${testHistory[spot.x.toInt()]["date"]}: ${testHistory[spot.x.toInt()]["result"]} - ${testHistory[spot.x.toInt()]["risk"]}",
                                const TextStyle(color: Colors.black, fontSize: 14),
                              );
                            }).toList();
                          },
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10.h),

                // List of Tests
                Expanded(
                  child: filteredTests.isNotEmpty
                      ? ListView.builder(
                    itemCount: filteredTests.length,
                    itemBuilder: (context, index) {
                      final test = filteredTests[index];
                      return Card(
                        margin: const EdgeInsets.symmetric(vertical: 8.0),
                        child: ListTile(
                          leading: const Icon(
                            Icons.calendar_today,
                            color: Colors.blue,
                          ),
                          title: Text(
                            test["date"]!,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Result: ${test["result"]}"),
                              Text("Risk Level: ${test["risk"]}"),
                              Text("Notes: ${test["notes"]}"),
                            ],
                          ),
                          trailing:
                          ElevatedButton(
                            style:ElevatedButton.styleFrom(
                              backgroundColor: ColorStyle.pink
                            ),
                            onPressed: () {
                              // Navigate to detailed test view
                            },
                            child: const Text("View Details",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
                          ),
                        ),
                      );
                    },
                  )
                      : Center(
                    child: Text(
                      "No results found for \"$searchQuery\".",
                      style: const TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                  ),
                ),

                // Footer Buttons
              ],
            ),
          ),
          // Positioned(
          //   left: 0, right: 0, bottom: 0,
          //   child: Container(
          //     color: ColorStyle.pink,
          //     padding: const EdgeInsets.all(8.0),
          //
          //     child: Row(
          //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //       children: [
          //         ElevatedButton(
          //           onPressed: () {
          //             // Retake test functionality
          //           },
          //           child: Text("Retake Test"),
          //         ),
          //         ElevatedButton(
          //           onPressed: () {
          //             // Download report functionality
          //           },
          //           child: Text("Download Report"),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
