import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ovacare/Core/Widgets/Custom_Button.dart';

import '../../../../../../Core/Widgets/Custom_Textfromfield.dart';
class GooglePasswordView extends StatelessWidget {
   GooglePasswordView({super.key});
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: Text('Google Password'),
      ),
      body: Container(
        padding:EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Reset Password",
              style:TextStyle(fontSize: 25.spMin, fontWeight: FontWeight.bold),
            ),
            SizedBox(height:10.h,),
            Text(
              "Enter the email associated with your account and we'll send you an email with instructions to reset your password.",
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
            SizedBox(height:30.h,),
            Text(
              "Email address",
              style: TextStyle(fontSize:16.spMin, fontWeight: FontWeight.bold,color: Colors.black45),
            ),
            CustomTextfromfield(hintText:"yours@gmail.com", Controller: controller),
            SizedBox(height: 15.h,),
            Center(child: CustomButton(name: 'Send Email', ontap: (){},FontSize: 20.spMin,height:45.h,width:double.infinity,)),

          ],
        ),
      ),
    );
  }
}
