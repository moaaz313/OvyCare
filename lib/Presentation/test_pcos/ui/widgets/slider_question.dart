import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SliderQuestion extends StatelessWidget {
  final String questionText;
  final double initialValue;
  final double min;
  final double max;
  final Function(double) onChanged;

  const SliderQuestion({
    super.key,
    required this.questionText,
    required this.initialValue,
    required this.min,
    required this.max,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal:0.w,vertical: 10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                questionText,
                style:  TextStyle(fontSize: 16.spMin, fontWeight: FontWeight.w600),
              ),
              Text(
                initialValue.toInt().toString(),
                style:  TextStyle(
                  fontSize: 16.spMin,
                  fontWeight: FontWeight.bold,
                  color: Colors.pink,
                ),
              ),
            ],
          ),
          // const SizedBox(height: 10),
          Stack(
            alignment: Alignment.center,
            children: [
              Slider(
                value: initialValue,
                min: min,
                max: max,
                divisions: (max - min).toInt(),
                label: initialValue.toInt().toString(),
                activeColor: Colors.pink,
                onChanged: onChanged,
                // secondaryTrackValue: 2,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
