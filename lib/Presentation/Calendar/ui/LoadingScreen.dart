import 'package:flutter/material.dart';

import '../../../Core/themes/Colors/ColorsStyle.dart';

class LoadingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(ColorStyle.pink),
              strokeWidth: 6,
            ),
            SizedBox(height: 20),
            Text(
              "We’re setting up your personalized calendar...",
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}