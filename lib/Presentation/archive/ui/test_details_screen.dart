import 'package:flutter/material.dart';

class TestDetailsScreen extends StatelessWidget {
  final Map<String, dynamic> test;

  const TestDetailsScreen({super.key, required this.test});

  @override
  Widget build(BuildContext context) {
    // Assuming 'responses' contains both 'sliderResponses' and 'yesNoResponses'
    final sliderResponses = test['responses']['sliderResponses'];
    final yesNoResponses = test['responses']['yesNoResponses'];

    return Scaffold(
      appBar: AppBar(title: const Text("Test Details")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const Text('Slider Responses:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            if (sliderResponses.isNotEmpty)
              ...sliderResponses.entries.map(
                (entry) => ListTile(
                  title: Text(entry.key),
                  trailing: Text(entry.value.toString()),
                ),
              ),
            const SizedBox(height: 16),
            const Text('Yes/No Responses:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            if (yesNoResponses.isNotEmpty)
              ...yesNoResponses.entries.map(
                (entry) => ListTile(
                  title: Text(entry.key),
                  trailing: Text(entry.value ? 'Yes' : 'No'),
                ),
              ),
            // You can add more sections here if needed
          ],
        ),
      ),
    );
  }
}
