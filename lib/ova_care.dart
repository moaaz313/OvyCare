import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ovacare/Core/Routing/app_routes.dart';
import 'Core/Routing/Routes.dart';
import 'Core/themes/Colors/ColorsStyle.dart';

class OvaCare extends StatelessWidget {
  final AppRoutes appRouter;

  const OvaCare({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize:
            const Size(375, 812), 
        minTextAdapt: true,
        child: MaterialApp(
          locale: DevicePreview.locale(context),
          builder: DevicePreview.appBuilder,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: ColorStyle.pink),
            useMaterial3: true,
          ),
          onGenerateRoute: AppRoutes.generateRoute,
          initialRoute: Routes.notify,
        ));
  }
}
