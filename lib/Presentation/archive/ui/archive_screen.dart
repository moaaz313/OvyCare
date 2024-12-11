import 'package:flutter/material.dart';
import 'package:ovacare/Core/Widgets/custom_app_bar.dart';

class ArchiveScreen extends StatelessWidget {
  final List<Map<String, dynamic>> archive;

  const ArchiveScreen({super.key, required this.archive});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: " Archive"),
      body: ListView.builder(
        itemCount: archive.length,
        itemBuilder: (context, index) {
          final test = archive[index];
          final responses = test['responses'] as Map<String, dynamic>;
          
          return Card(
            margin: const EdgeInsets.all(8.0),
            child: ListTile(
              title: Text('Test on ${test['date']}'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: responses.entries.map((entry) {
                  return Text('${entry.key} = ${entry.value}');
                }).toList(),
              ),
              onTap: () => _showTestDetailsDialog(context, responses),
            ),
          );
        },
      ),
    );
  }

  void _showTestDetailsDialog(BuildContext context, Map<String, dynamic> responses) {
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
