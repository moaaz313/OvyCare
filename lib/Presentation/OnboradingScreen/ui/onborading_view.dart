

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../Core/themes/Colors/ColorsStyle.dart';
import '../../Home_naivebar/home_naivebar/Ui/Homenaivebar_view.dart';
// import 'home.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({Key? key}) : super(key: key);

  @override
  State<OnboardingView> createState() => _Onboarding_1State();
}

class _Onboarding_1State extends State<OnboardingView> {
  var _controller = PageController();

  @override
  void initState() {
    _controller = PageController(initialPage: 0 );
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
      'image':'assets/image (7).png',
      'title': 'Know Your Health',
      'content': "Easily assess your risk for PCO and PCOS with AI-powered tests designed to empower your well-being."
    },
    {
      'image':'assets/image (7).png',
      'title': 'Stay in Sync',
      'content': "Track your menstrual cycle with ease and receive timely notifications to plan ahead."
    },
    {
      'image':'assets/image (7).png',
      'title': 'Find Expert Help',
      'content': "Get personalized recommendations for doctors to ensure the best care for your needs."
    },
    {
      'image':'assets/image (7).png',
      'title': 'Live Your Best Life',
      'content': "Discover curated tips for healthy eating and exercises tailored for your wellness journey."
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        onPageChanged: (int index){
          setState(() {
            numberIndex = index;
          });
        },
        controller: _controller,
        itemCount: content.length,
        itemBuilder: (_,i){
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Spacer(),
              Stack(
                children: [
                  Container(
                    height:600.h,
                    color: ColorStyle.pink,
                    child: Center(child: Text("SideCutClipper()")),
                  ),

                  Column(
                    children: [
                      SizedBox(height:50.h,),
                      Center(
                         child:Image.asset(
                           content[i]['image']!,height:600.h,width: 400.w,
                         ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 40.h,horizontal: 25.w),
                    child: Align(alignment: Alignment.topRight,
                      child:InkWell(
                        onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomeNaivebarView(),));
                        },child: Text("Skip",style: TextStyle(fontSize: 20.spMin,fontWeight: FontWeight.bold,color: Colors.white),),),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // mainAxisAlignment:MainAxisAlignment.start,
                    children: [
                      // Spacer(),
                      // SizedBox(height:MediaQuery.of(context).size.height-340.h,),
                      ClipPath(
                        clipper:OvalTopBorderClipper(),
                        child: Container(
                          // height:280.h,
                          // margin: EdgeInsets.only(top: 200.h),
                          color: Colors.white,
                          child: Column(
                          children: [
                            // Spacer()
                            SizedBox(height: 25.h,),
                            Container(
                              padding: EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  Padding(
                                    padding:  EdgeInsets.all(8.0),
                                    child: Text(content[i]['title']! ,textAlign: TextAlign.center,
                                        style: GoogleFonts.robotoSlab(
                                          // fontStyle: FontStyle.italic,
                                            fontSize:30,fontWeight: FontWeight.bold,color: ColorStyle.purple
                                        )
                                    ),
                                  ),Align(
                                    child:Text(
                                      content[i]['content']!
                                      ,textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize:16.spMin,
                                        color: Colors.black54,
                                        // fontWeight: FontWeight.bold,
                                      ),

                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(bottom: 20.h , right: 20.w, left: 20.w),
                              width: double.infinity,
                              height:50.h,
                              child: FloatingActionButton(
                                child:  Text( numberIndex == content.length - 1 ? "Continue" : "Next" ,
                                  style: TextStyle(
                                    fontSize:20.spMin,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),),
                                onPressed: (){
                                  if (numberIndex == content.length - 1) {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) =>HomeNaivebarView(),
                                      ),
                                    );
                                  }
                                  _controller.nextPage(
                                    duration: Duration(milliseconds: 200),
                                    curve: Curves.easeIn,
                                  );
                                },
                                backgroundColor: ColorStyle.pink,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16.r),
                                ),
                              ),

                            ),
                            Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: List.generate(content.length, (index) => box( index )
                                ),
                              ),
                            ),

                          ],
                        ),
                        )
                      ),
                    ],
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

  Container box(int index ) {
    return Container(
      height: 10.h,
      width: numberIndex == index ? 30.w: 10.w,
      margin: EdgeInsets.only(bottom: 40.h , right: 8.w),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color:ColorStyle.pink
      ),
    );
  }
  void textsonboarding(){
    if(numberIndex==0){

    }
  }
}
int numberIndex=0;