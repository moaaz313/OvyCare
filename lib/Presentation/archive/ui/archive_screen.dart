import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ovacare/Core/Widgets/custom_app_bar.dart';

import '../../../Core/themes/Colors/ColorsStyle.dart';

class ArchiveScreen extends StatelessWidget {
  final List<Map<String, dynamic>> archive;

  const ArchiveScreen({super.key, required this.archive});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  CustomAppBar(
        title: "PCOS Test History",
        backgroundColor: ColorStyle.pink,
        useIconButton: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('View your past test results and track your progress over time.',style: TextStyle(
              fontWeight: FontWeight.w500,
              color:ColorStyle.darkgray,
              fontSize: 16.spMin
            ),),
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: archive.length,
            itemBuilder: (context, index) {
              // final test = archive[index];
              // final responses = test['responses'] as Map<String, dynamic>;
          
              return Card(
                margin: const EdgeInsets.all(8.0),
                child: ListTile(
                  // title: Text('Test on ${test['date']}'),
                  title: Text('Test on 22/2/2023'),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  Text('🗓️ December 10, 2024'),
                  Text('✅ Result: Positive'),
                  Text('🔴 Risk Level: High'),
                  Text('Notes: "Consult a specialist for further analysis."'),



                  ],
                    // children: responses.entries.map((entry) {
                      // return Text('${entry.key} = ${entry.value}');
                      // return Text('{entry.key} = {entry.value}');
                    // }).toList(),
                  ),
                  // onTap: () => _showTestDetailsDialog(context, responses),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  void _showTestDetailsDialog(
      BuildContext context, Map<String, dynamic> responses) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Test Details"),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: responses.entries.map((entry) {
                return Text('${entry.key}: ${entry.value}');
              }).toList(),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text("Close"),
            ),
          ],
        );
      },
    );
  }
}
