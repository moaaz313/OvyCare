import 'package:flutter/material.dart';
import 'package:ovacare/Presentation/Home_naivebar/Tip_page/Ui/TipsView.dart';
import 'package:ovacare/Presentation/Home_naivebar/doctor/ui/doctor_screen.dart';
import 'package:ovacare/Presentation/Home_naivebar/home_naivebar/Ui/Homenaivebar_view.dart';
import 'package:ovacare/Presentation/notification/ui/notification_screen.dart';
import 'Routes.dart';

class AppRoutes {
  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.login:
      // return MaterialPageRoute(builder: (context) => LoginPage());
      case Routes.home:
        return MaterialPageRoute(
            builder: (context) => const HomeNaivebarView());
      case Routes.recommedDoc:
        return MaterialPageRoute(builder: (context) => const DoctorScreen());
      case Routes.notify:
        return MaterialPageRoute(builder: (context) => NotificationScreen());
       case Routes.tips:
        return MaterialPageRoute(builder: (context) => const TipsView());  
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}
