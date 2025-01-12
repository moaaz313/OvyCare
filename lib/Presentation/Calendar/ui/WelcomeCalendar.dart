import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ovacare/Presentation/Calendar/ui/PeriodLength_view1.dart';

import '../../../Core/Widgets/custom_app_bar.dart';
import '../../../Core/themes/Colors/ColorsStyle.dart';

class CycleTrackStartScreen extends StatefulWidget {
  @override
  _CycleTrackStartScreenState createState() => _CycleTrackStartScreenState();
}

class _CycleTrackStartScreenState extends State<CycleTrackStartScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _buttonScale;

  bool _trackingStarted = false;

  @override
  void initState() {
    super.initState();
    _trackingStarted=true;
    // Initialize animation controller
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    Future.delayed(Duration(milliseconds: 200), () {
      setState(() {
        _trackingStarted = !_trackingStarted;
      });
      // Replace with your desired navigation or functionality
      print("Cycle Tracking Started!");
    });
    // Scale animation for the button
    _buttonScale = Tween<double>(begin: 1.0, end: 1.2).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    // Start animation loop
    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _startCycleTracking() {



    // Example action: Navigate to another screen or perform logic
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
      _trackingStarted = true;
    });
      // Replace with your desired navigation or functionality
      print("Cycle Tracking Started!");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: 'Cycle Tracking',
        useIconButton: true,
        backgroundColor: ColorStyle.pink),
      body: Padding(
        padding:  EdgeInsets.symmetric(vertical: 10.h,horizontal:10.w),
        child: Column(
          children: [
            SizedBox(height: 50.h,),
            AnimatedContainer(
              duration: Duration(seconds: 1),
              curve: Curves.easeInOut,
              height: _trackingStarted ? 300 : 250,
              width: _trackingStarted ? 300 : 250,
              decoration: BoxDecoration(
                color: Colors.pink.shade100,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Icon(
                  Icons.favorite,
                  size: _trackingStarted ? 120 : 100,
                  color: Colors.pink,
                ),
              ),
            ),
            SizedBox(height: 40),

            // Title Text
            Text( "Ready to Track Your Cycle?",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24.spMin,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 10),

            // Subtitle Text
            Text( "Start tracking your cycle to stay on top of your health.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            SizedBox(height: 50),

            // Animated Start Button
            GestureDetector(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => PeriodLengthScreen(),));
              },
              child: ScaleTransition(
                scale: _buttonScale,
                child: Container(
                  width:MediaQuery.of(context).size.width-100.w,
                  height: 50.h,
                  decoration: BoxDecoration(
                    color: Colors.pink,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.pink.withOpacity(0.5),
                        blurRadius: 10,
                        offset: Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(  "Start Tracking",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
