import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // For date formatting
import 'package:ovacare/Core/Widgets/custom_app_bar.dart';
import 'package:ovacare/Presentation/archive/ui/archive_screen.dart';
import 'widgets/slider_question.dart';

class SecondQuestionScreen extends StatefulWidget {
  final Map<int, String?> userAnswers;

  const SecondQuestionScreen({super.key, required this.userAnswers});

  @override
  _SecondQuestionScreenState createState() => _SecondQuestionScreenState();
}

class _SecondQuestionScreenState extends State<SecondQuestionScreen> {
  final Map<String, Map<String, dynamic>> sliderData = {
    'How old are you?': {'value': 20.0, 'min': 15.0, 'max': 60.0},
    'What is your weight in KG?': {'value': 55.0, 'min': 30.0, 'max': 110.0},
    'What is the length of your cycle?': {
      'value': 4.0,
      'min': 0.0,
      'max': 10.0
    },
    'How many years have you been married?': {
      'value': 0.0,
      'min': 0.0,
      'max': 5.0
    },
    'What is your waist measurement in inches?': {
      'value': 30.0,
      'min': 20.0,
      'max': 50.0
    },
    'What is your hip measurement in inches?': {
      'value': 36.0,
      'min': 30.0,
      'max': 60.0
    },
    'What is your height in CM?': {'value': 160.0, 'min': 150.0, 'max': 190.0},
  };

  final List<Map<String, dynamic>> archive = [];

  // This holds the combined answers
  Map<String, dynamic> combinedAnswers = {};

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // Merge the answers from the first screen and the second screen
    combinedAnswers = {
      ...widget.userAnswers.map((key, value) => MapEntry('Q$key', value)), 
      ...sliderData.map((key, value) => MapEntry(key, value['value'])), 
    };
  }

  void saveTest() {
    String formattedDate = DateFormat('dd-MM-yyyy').format(DateTime.now());

    // Combine answers into one entry
    final currentTest = {
      'date': formattedDate,
      'responses': combinedAnswers,
    };

    setState(() {
      archive.add(currentTest); // Add to the archive
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  const CustomAppBar(title: "PCOS Test",useIconButton: false,),
      // AppBar(
      //   title: Text("Test PCOS"),
      //   backgroundColor: Colors.pink,
      // ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            ...sliderData.entries.map(
              (entry) => SliderQuestion(
                questionText: entry.key,
                initialValue: entry.value['value'],
                min: entry.value['min'],
                max: entry.value['max'],
                onChanged: (value) {
                  setState(() {
                    sliderData[entry.key]!['value'] = value;
                  });
                },
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                saveTest(); // Save all answers to the archive
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ArchiveScreen(archive: archive), // Pass the archive to ArchiveScreen
                  ),
                );
              },
              child: const Text('Predict'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pink,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
