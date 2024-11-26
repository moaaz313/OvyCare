import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ovacare/Presentation/Home_naivebar/home_naivebar/Ui/Homenaivebar_view.dart';
import 'package:device_preview/device_preview.dart';
import 'Core/themes/Colors/ColorsStyle.dart';
import 'Presentation/Home_naivebar/Homepage/Ui/Homepage_view.dart';

void main() => runApp(
  DevicePreview(
    enabled: !kReleaseMode,
    builder: (context) => MyApp(), // Wrap your app
  ),
);
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812), // Set according to your design dimensions
      minTextAdapt: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: ColorStyle.pink),
            useMaterial3: true,
          ),
          home: child,
        );
      },
      child: const HomeNaivebarView(), // The root of your app
    );
  }
}
