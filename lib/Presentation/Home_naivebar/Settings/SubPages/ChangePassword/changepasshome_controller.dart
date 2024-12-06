
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Google password/Google password.dart';
import 'Google password/ui.dart';
import 'User password/change_pass_view.dart';

class changepasshome_controller extends GetxController{

  Future<Widget> checkProvide() async {
    var user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      for (var userInfo in user.providerData) {
        if (userInfo.providerId == 'password') {
          return ChangePasswordPage();
        } else if (userInfo.providerId == 'google.com') {
          return GooglePasswordView();
        } else {
          return Center(
            child: Text('Unsupported authentication provider: ${userInfo.providerId}'),
          );
        }
      }
    }
    return Center(child: Text('No user is signed in.'));
  }
}