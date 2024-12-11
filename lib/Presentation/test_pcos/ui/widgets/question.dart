import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final int questionNumber;
  final String questionText;
  final String? groupValue;
  final ValueChanged<String?> onChanged;

  const Question({
    super.key,
    required this.questionNumber,
    required this.questionText,
    required this.groupValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            questionText,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          Row(
            children: [
              Expanded(
                child: RadioListTile<String>(
                  title: const Text('Yes'),
                  value: 'Yes',
                  groupValue: groupValue,
                  activeColor: Colors.pink,
                  onChanged: onChanged,
                ),
              ),
              Expanded(
                child: RadioListTile<String>(
                  title: const Text('No'),
                  value: 'No',
                  groupValue: groupValue,
                  activeColor: Colors.pink,
                  onChanged: onChanged,
                ),
              ),
            ],
          ),
          Divider(color: Colors.grey.shade300),
        ],
      ),
    );
  }
}
