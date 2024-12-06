import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ovacare/Core/themes/Colors/ColorsStyle.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CustomAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    // Set status bar color
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        //  statusBarColor: Colors.pink, // Match the AppBar color
        statusBarIconBrightness: Brightness.light,
      ),
    );

    return AppBar(
      // backgroundColor: Colors.pink, // Fill the AppBar with the color
      elevation: 0,
      title: Text(
        title,
        style: const TextStyle(
          color: ColorStyle.purple,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
      leading: IconButton(
        padding: const EdgeInsetsDirectional.only(start: 10),
        icon: const Icon(Icons.arrow_back_ios, color: ColorStyle.black),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
