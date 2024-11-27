import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../themes/Colors/ColorsStyle.dart';
import '../themes/TextStyles/fontstyle.dart';

class CustomButton extends StatelessWidget {
  final String name;
  final width;
  final height;
  final ontap;
  final  BackgroundColor;
  const CustomButton({super.key, required this.name,required this.ontap,this.BackgroundColor, this.width, this.height});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: ontap,
        child:Text(name,style:TextStyle(fontSize: 14.spMin,color: Colors.white),),
      style: ElevatedButton.styleFrom(
        minimumSize:  Size(64.w, 36.h),
        maximumSize: Size.infinite,
        // fixedSize: Size(width??327.w,height??52.h),
        // padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
        backgroundColor:BackgroundColor??ColorStyle.pink,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.r))),
      )
    );
  }
}
