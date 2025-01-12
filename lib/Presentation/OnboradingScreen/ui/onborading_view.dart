import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ovacare/Core/Routing/Routes.dart';
import 'package:ovacare/Core/Widgets/bottom_naive_bar.dart';

import '../../../Core/themes/Colors/ColorsStyle.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _Onboarding_1State();
}

class _Onboarding_1State extends State<OnboardingView> {
  var _controller = PageController();

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // List sub_title=[,,];
  List<Map<String, String>> content = [
    {
      'image': 'assets/homepagescreen.jpeg',
      'title': 'Know Your Health',
      'content':
      "Easily assess your risk for PCO and PCOS with AI-powered tests designed to empower your well-being."
    },
    {
      'image': 'assets/image (7).png',
      'title': 'Stay in Sync',
      'content':
      "Track your menstrual cycle with ease and receive timely notifications to plan ahead."
    },
    {
      'image': 'assets/image (7).png',
      'title': 'Find Expert Help',
      'content':
      "Get personalized recommendations for doctors to ensure the best care for your needs."
    },
    {
      'image': 'assets/tipsscreen.jpeg',
      'title': 'Live Your Best Life',
      'content':
      "Discover curated tips for healthy eating and exercises tailored for your wellness journey."
    }
  ];

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: ColorStyle.pink,
      body: PageView.builder(
        // physics: const BouncingScrollPhysics(),
        onPageChanged: (int index) {
          setState(() {
            numberIndex = index;
          });
        },
        controller: _controller,
        itemCount: content.length,
        itemBuilder: (_, i) {
          return Stack(
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Spacer(),
              Stack(
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height: 70.h,
                      ),
                      Center(
                        child: Image.asset(
                          content[i]['image']!,
                          // fit: Bos,
                          height: height - 200.h,
                          width: 400.w,
                        ),
                      ),

                    ],
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ClipPath(
                            clipper: OvalTopBorderClipper(),
                            child: Container(
                              color: Colors.white,
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 25.h,
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(content[i]['title']!,
                                              textAlign: TextAlign.center,
                                              style: GoogleFonts.robotoSlab(
                                                  fontSize: 30,
                                                  fontWeight: FontWeight.bold,
                                                  color: ColorStyle.purple)),
                                        ),
                                        Align(
                                          child: Text(
                                            content[i]['content']!,
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: 16.spMin,
                                              color: Colors.black54,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                        bottom: 20.h, right: 20.w, left: 20.w),
                                    width: double.infinity,
                                    height: 50.h,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        Expanded(
                                          child: FloatingActionButton(
                                            child: Text(
                                              'Skip',
                                              style: TextStyle(
                                                fontSize: 20.spMin,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            onPressed: () {
                                              Navigator.of(context).push(MaterialPageRoute(
                                                builder: (context) => const BottomNaiveBar(),
                                              ));
                                            },
                                            backgroundColor: ColorStyle.pink.withOpacity(0.69),
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(16.r),
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 10.w,),
                                        Expanded(
                                          child: FloatingActionButton(
                                            child: Text(
                                              numberIndex == content.length - 1
                                                  ? "Continue"
                                                  : "Next",
                                              style: TextStyle(
                                                fontSize: 20.spMin,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            onPressed: () {
                                              if (numberIndex == content.length - 1) {
                                                Navigator.pushNamed(
                                                    context, Routes.home);
                                              }
                                              _controller.nextPage(
                                                duration:
                                                const Duration(milliseconds: 200),
                                                curve: Curves.easeIn,
                                              );
                                            },
                                            backgroundColor: ColorStyle.pink,
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(16.r),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: List.generate(
                                          content.length, (index) => box(index)),
                                    ),
                                  ),
                                ],
                              ),
                            )),
                      ],
                    ),
                  ),
                ],
              ),
              // Spacer(),
            ],
          );
        },
      ),
    );
  }

  Container box(int index) {
    return Container(
      height: 10.h,
      width: numberIndex == index ? 30.w : 10.w,
      margin: EdgeInsets.only(bottom: 40.h, right: 8.w),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24), color: ColorStyle.pink),
    );
  }

  void textsonboarding() {
    if (numberIndex == 0) {}
  }
}

int numberIndex = 0;
