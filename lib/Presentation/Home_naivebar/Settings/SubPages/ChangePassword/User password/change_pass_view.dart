
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ovacare/Core/Widgets/Custom_Textfromfield.dart';
import 'package:ovacare/Core/themes/Colors/ColorsStyle.dart';

import '../../../../../../Core/Widgets/Custom_Button.dart';
import '../Google password/Google password.dart';

class ChangePasswordPage extends StatelessWidget {
  // final ChangePasswordController controller = Get.put(ChangePasswordController());
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        // title:  Text('Password Change',style:FontStyles.font16w700black,),
        // centerTitle: true,
        // backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          // key: controller.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Reset Password",
                style:TextStyle(fontSize: 25.spMin, fontWeight: FontWeight.bold),
              ),
              SizedBox(height:10.h,),
              Text(
                "your new password must be different from your previous password.",
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
              SizedBox(height:30.h,),
              CustomTextfromfield(isObscure: true,hintText:"Old Password", Controller:controller),
              Align(
                alignment: Alignment.topRight,
                child:TextButton(onPressed:  (){
                  Get.to(()=>Googlepass_view());
                }, child: Text("Forgot Password?",style: TextStyle(color: ColorStyle.purplefav),))
              ),
              CustomTextfromfield(isObscure: true,hintText: "New Password",Controller:controller),
               SizedBox(height: 12.h),
              CustomTextfromfield(
                hintText: "Confirm Password",
                Controller:controller,
                // newPasswordController: controller.newPassController,
                isObscure: true
              ),
               SizedBox(height: 16.h),
              CustomButton(
                name:"SAVE PASSWORD",ontap:
                    () async {
                  // if (controller.formKey.currentState!.validate()) {
                  //   await controller.updatePassword(context);
                  // }
                },FontSize: 20.spMin,height:45.h,width:double.infinity,),

            ],
          ),
        ),
      ),
    );
  }
}
