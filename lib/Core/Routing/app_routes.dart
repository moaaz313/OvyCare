import 'package:flutter/material.dart';
import 'Routes.dart';

class AppRoutes {
  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.login:
        // return MaterialPageRoute(builder: (context) => LoginPage());
      case Routes.home:
        // return MaterialPageRoute(builder: (context) => RecommendDoc());
      case Routes.RecommedDoc:
        // return MaterialPageRoute(builder: (context) => RecommendDoc());
      default:
        // return MaterialPageRoute(builder: (context) => LoginPage());
    }
  }
}
