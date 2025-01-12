import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ovacare/Core/Routing/Routes.dart';
import 'package:ovacare/Core/Widgets/Custom_Button.dart';

import '../../../Core/themes/Colors/ColorsStyle.dart';

class TipsView extends StatelessWidget {
  const TipsView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(8.0.r),
              child: Text(
                'Manage Polycystic Ovaries',
                style:
                    TextStyle(fontSize: 18.spMin, fontWeight: FontWeight.bold),
              ),
            ),
            PcoTips(context),
            SizedBox(
              height: 10.h,
            ),
            Padding(
              padding: EdgeInsets.all(8.0.r),
              child: Text(
                'Healthy Eating Made Simple',
                style:
                    TextStyle(fontSize: 18.spMin, fontWeight: FontWeight.bold),
              ),
            ),
            HealthyTips(context),
            SizedBox(
              height: 10.h,
            ),
            Padding(
              padding: EdgeInsets.all(8.0.r),
              child: Text(
                'Exercises for a Healthier You',
                style:
                    TextStyle(fontSize: 18.spMin, fontWeight: FontWeight.bold),
              ),
            ),
            ExerciseTips(),
          ],
        ),
      ),
    );
  }
}

Widget PcoTips(context) {
  return Container(
    height: 150.h,
    width: double.infinity,
    // padding: EdgeInsets.fromLTRB(10.w, 10.h, 0, 5.h),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.4), // Shadow color with opacity
            spreadRadius: 5, // Spread radius
            blurRadius: 7, // Blur radius
            offset: const Offset(0, 3), // Offset in x and y direction
          ),
        ],
        image: const DecorationImage(
            image: AssetImage('assets/background2.jpg'), fit: BoxFit.cover)),
    child: Stack(
      children: [
        // ClipRRect(
        //   borderRadius: BorderRadius.circular(15), // Same border radius
        //   child: Image.asset(
        //     'assets/background2.jpg',
        //     fit: BoxFit.cover,
        //   ),
        // ),
        // Blur overlay
        ClipRRect(
          borderRadius: BorderRadius.circular(15), // Same border radius
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
            child: Container(
              color: Colors.black.withOpacity(0.0), // Optional overlay color
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(10.0.r),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Text(
                //   'Manage Polycystic Ovaries',
                //   style: FontStyles.font16w700black,
                // ),
                Text(
                  'Discover expert advice and lifestyle\nadjustments to help manage \nPCO symptoms and improve\nyour reproductive health.',
                  style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                      fontSize: 14.spMin),
                ),
                SizedBox(height: 5.h,),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorStyle.pink,

                  ),
                    onPressed: () {
                      Navigator.pushNamed(context, Routes.info);
                    },
                    child:Text('Learn More',style: TextStyle(color: Colors.white),))
              ]),
        ),
      ],
    ),
  );
}

Widget HealthyTips(context) {
  return Container(
    height: 150.h,
    width: double.infinity,
    padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
    decoration: BoxDecoration(
      color: ColorStyle.rose,
      borderRadius: BorderRadius.circular(15.r),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.4), // Shadow color with opacity
          spreadRadius: 5, // Spread radius
          blurRadius: 7, // Blur radius
          offset: const Offset(0, 3), // Offset in x and y direction
        ),
      ],
    ),
    child: Stack(
      children: [
        Row(
          children: [
            const Spacer(),
            Container(
              width: 140.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.r),
                  image: const DecorationImage(
                      image: AssetImage('assets/food.png'), fit: BoxFit.cover)),
              // child: Image.asset('assets/food.jpg',fit: BoxFit.cover,)
            ),
          ],
        ),
        Row(
          children: [
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Text(
                  //   'Healthy Eating Made Simple',
                  //   style: FontStyles.font16w700black,
                  // ),
                  Text(
                    'Explore delicious and nutritious\nmeal ideas to support hormonal\nbalance and overall well-being.',
                    style: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.bold,
                        fontSize: 14.spMin),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorStyle.pink,

                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, Routes.healthy);
                      },
                      child:Text('Explore Recipes',style: TextStyle(color: Colors.white),))
                ]),
            // Spacer(),
          ],
        ),
      ],
    ),
  );
}

Widget ExerciseTips() {
  return Container(
    height: 150.h,
    width: double.infinity,
    // padding: EdgeInsets.fromLTRB(10.w, 10.h, 0, 5.h),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.4), // Shadow color with opacity
            spreadRadius: 5, // Spread radius
            blurRadius: 7, // Blur radius
            offset: const Offset(0, 3), // Offset in x and y direction
          ),
        ],
        image: const DecorationImage(
            image: AssetImage('assets/fitness.jpg'), fit: BoxFit.cover)),
    child: Stack(
      children: [
        // Background image
        // ClipRRect(
        //   borderRadius: BorderRadius.circular(15), // Same border radius
        //   child: Image.asset(
        //     'assets/fitness.jpg',
        //     fit: BoxFit.cover,
        //   ),
        // ),
        // Blur overlay
        // ClipRRect(
        //   borderRadius: BorderRadius.circular(15), // Same border radius
        //   child: BackdropFilter(
        //     filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
        //     child: Container(
        //       color: Colors.black.withOpacity(0.0), // Optional overlay color
        //     ),
        //   ),
        // ),
        Padding(
          padding: EdgeInsets.all(10.0.r),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Text(
                //   'Exercises for a Healthier You',
                //   style: FontStyles.font16w700black,
                // ),
                Text(
                  'Find workouts tailored to enhance\n your fitness and reduce symptoms\n associated with PCO and PCOS.',
                  style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                      fontSize: 14.spMin),
                ),
                SizedBox(height: 5.h,),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorStyle.pink,

                    ),
                    onPressed: () {
                    },
                    child:Text('Start Exercising',style: TextStyle(color: Colors.white),))
              ]),
        ),
      ],
    ),
  );
}
