import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ovacare/Core/themes/Colors/ColorsStyle.dart';
import '../second_question_screen.dart';
import 'question.dart';

class QuestionList extends StatefulWidget {
  const QuestionList({super.key});

  @override
  _QuestionListState createState() => _QuestionListState();
}

class _QuestionListState extends State<QuestionList> {
  final Map<int, String?> answers = {}; // Stores answers from the first screen

  @override
  Widget build(BuildContext context) {
    final questions = [
      'Have you experienced recent weight gain?',
      'Have you noticed abnormal hair growth?',
      'Have you noticed any skin darkening?',
      'Are you currently dealing with pimples?',
      'Are you experiencing hair loss?',
      'Do you frequently consume fast food?',
      'Do you engage in regular exercise?',
      'Is your menstrual cycle regular?',
    ];

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Generate all questions in one Column
              for (int index = 0; index < questions.length; index++)
                Question(
                  questionNumber: index + 1,
                  questionText: questions[index],
                  groupValue: answers[index + 1], // Track answer for each question
                  onChanged: (value) {
                    setState(() {
                      answers[index + 1] = value;
                    });
                  },
                ),

              // Bottom row with navigation
              // const Spacer(),
            ],
          ),
        ),
        Spacer(),
        Container(
          color: ColorStyle.pink,
          height: 60.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text('1 of 2', style: TextStyle(fontSize:20.spMin,color: Colors.white)),
              ), // Question indicator
              IconButton(
                onPressed: () {
                  // Pass the answers to the second screen
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SecondQuestionScreen(
                        userAnswers: answers, // Pass the answers
                      ),
                    ),
                  );
                },
                icon:  CircleAvatar(
                  radius: 30.r,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.arrow_forward)),
                color: Colors.pink, // Forward navigation icon
              ),
            ],
          ),
        )
      ],
    );
  }
}
