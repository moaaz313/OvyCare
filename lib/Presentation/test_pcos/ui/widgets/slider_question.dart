import 'package:flutter/material.dart';

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
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                questionText,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              Text(
                initialValue.toInt().toString(),
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.pink,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Stack(
            alignment: Alignment.center,
            children: [
              // Background text displaying the selected value
              Positioned(
                left: 0,
                right: 0,
                child: Opacity(
                  opacity: 0.3,
                  child: Text(
                    initialValue.toInt().toString(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade400,
                    ),
                  ),
                ),
              ),
              // Slider on top
              Slider(
                value: initialValue,
                min: min,
                max: max,
                divisions: (max - min).toInt(),
                label: initialValue.toInt().toString(),
                activeColor: Colors.pink,
                onChanged: onChanged,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
