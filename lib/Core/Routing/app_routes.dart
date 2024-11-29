import 'package:flutter/material.dart';
import 'package:ovacare/Presentation/Home_naivebar/doctor/ui/doctor_screen.dart';
import 'package:ovacare/Presentation/Home_naivebar/home_naivebar/Ui/Homenaivebar_view.dart';
import 'Routes.dart';

class AppRoutes {
  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.login:
      // return MaterialPageRoute(builder: (context) => LoginPage());
      case Routes.home:
      return MaterialPageRoute(builder: (context) => const HomeNaivebarView());
      case Routes.recommedDoc:
        return MaterialPageRoute(builder: (context) => const  DoctorScreen());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}
