import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ovacare/Core/Widgets/Custom_Button.dart';
import 'package:ovacare/Core/Widgets/custom_app_bar.dart';
import 'package:ovacare/Core/themes/Colors/ColorsStyle.dart';
import 'package:ovacare/Presentation/Tip_page/Ui/TipsView.dart';

class PCOSResultNormal extends StatelessWidget {


  PCOSResultNormal();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'PCOS Test Results',useIconButton: true,backgroundColor: ColorStyle.pink,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'Negative',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold,color: Colors.green),
                ),  Text(
                  ' Result Detected',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 8),
            Text('Your test results indicate no signs of PCOS ✅.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              "While no indicators of PCOS/PCOD were found, we encourage regular health checkups to stay proactive. Explore tips on maintaining a healthy lifestyle to prevent future risks.",
              style: TextStyle(fontSize: 14),
            ),
            SizedBox(height: 16),
            Text(
              'Recommendations',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              '1. Track your menstrual cycle for better insight into your health.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Center(
              child: CustomButton(
                ontap: () => (),
                name: 'Track My Cycle',
                width: 150.w,
                // width: ,
              ),
            ),
            SizedBox(height: 16),
            Text(
              '2. View tips for healthy food and exercise.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Center(
              child: CustomButton(
                ontap: () => TipsView(),
                name: 'View Tips',width: 150.w,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
