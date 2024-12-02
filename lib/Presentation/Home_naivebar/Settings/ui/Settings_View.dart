import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ovacare/Core/themes/Colors/ColorsStyle.dart';

import '../SubPages/Edit_Profile/ui/EditProfileView.dart';
import '../SubPages/Language/ui/Language_View.dart';

class SettingsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.grey,
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Row(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage('assets/dohaa.jpeg'), // Replace with your image path
                ),
                const SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Doha Noor',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'dohanoor14@gmail.com',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 30),
            const SectionHeader(title: 'Account'),
            ProfileOption(
              icon: Icons.person,
              trailingWidget: Icon(Icons.arrow_forward_ios, size:18.h, color: Colors.black),
              title: 'Edit profile',
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => edit_profile(),));
              },
            ),
            ProfileOption(
              icon: Icons.lock,
              trailingWidget: Icon(Icons.arrow_forward_ios, size:18.h, color: Colors.black),
              title: 'Change Password',
              onTap: () {
                // Add your navigation logic
              },
            ),
            const SectionHeader(title: 'Settings'),
            ProfileOption(
              icon: Icons.language,
              trailingWidget: Icon(Icons.arrow_forward_ios, size:18.h, color: Colors.black),
              title: 'Language',
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => LanguageView(),));
              },
            ),
            ProfileOption(
              icon: Icons.notifications,
              trailingWidget: Switch(value: true, onChanged: (value){}),
              title: 'Notification',
              onTap: () {
                // Add your navigation logic
              },
            ),
            const SectionHeader(title: 'Security'),
            ProfileOption(
              icon: Icons.delete,
              trailingWidget: Icon(Icons.arrow_forward_ios, size:18.h, color: Colors.black),
              title: 'Delete account',
              onTap: () {
                // Add your navigation logic
              },
            ),
            InkWell(
              child: Container(
                alignment: Alignment.center,
                height: 50.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15.r)),
                  color:ColorStyle.lightgray
                ),
                child: Text('Logout',style:TextStyle(fontSize: 22.spMin,fontWeight: FontWeight.bold,color: Colors.red),),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SectionHeader extends StatelessWidget {
  final String title;

  const SectionHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:EdgeInsets.symmetric(vertical: 5.h),
      child: Text(
        title,
        style:  TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black,
          fontSize: 20.spMin,
        ),
      ),
    );
  }
}

class ProfileOption extends StatelessWidget {
  final IconData icon;
  final Widget trailingWidget;
  final String title;
  final VoidCallback onTap;

  const ProfileOption({required this.icon, required this.title, required this.onTap, required this.trailingWidget});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: Icon(icon, color: title == 'Delete account' ? Colors.red : ColorStyle.pink,size: 25.h,),
        title: Text(title, style: TextStyle(fontSize:18.spMin)),
        trailing:  trailingWidget,
        onTap: onTap,
      ),
    );
  }
}
