import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ovacare/Core/themes/Colors/ColorsStyle.dart';

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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "$questionNumber: $questionText",
          style:  TextStyle(fontSize: 16.spMin, fontWeight: FontWeight.w600),
        ),
        Row(
          // mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // const Spacer(),
            SizedBox(width: 50.w,),
            Expanded(
              child: RadioListTile<String>(
                title: const Text('Yes'),
                value: 'Yes',
                groupValue: groupValue,
                activeColor: ColorStyle.pink,
                onChanged: onChanged,
              ),
            ),
            Expanded(
              child: RadioListTile<String>(
                title: const Text('No'),
                value: 'No',
                groupValue: groupValue,
                activeColor: ColorStyle.pink,
                onChanged: onChanged,
              ),
            ),
          ],
        ),
        // Divider(color: Colors.grey.shade300),
      ],
    );
  }
}
