import 'package:flutter/material.dart';
import 'package:test_cubit/presentation/Screens/Recommenation_Doctor/Ui/RecommendDoc.dart';

import '../../presentation/Auth_Module/login/Ui/login_page.dart';
import 'Routes.dart';

class AppRoutes {
  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.login:
        return MaterialPageRoute(builder: (context) => LoginPage());
      case Routes.home:
        return MaterialPageRoute(builder: (context) => RecommendDoc());
      case Routes.RecommedDoc:
        return MaterialPageRoute(builder: (context) => RecommendDoc());
      default:
        return MaterialPageRoute(builder: (context) => LoginPage());
    }
  }
}
