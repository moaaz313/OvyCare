import 'package:flutter/material.dart';
import 'package:ovacare/Core/Widgets/bottom_naive_bar.dart';
import 'package:ovacare/Presentation/Authentication/login/Ui/login_screen.dart';
import 'package:ovacare/Presentation/OnboradingScreen/ui/onborading_view.dart';
import 'package:ovacare/Presentation/Settings/SubPages/Edit_Profile/ui/EditProfileView.dart';
import 'package:ovacare/Presentation/Test_PCOD/ui/TestPCOD_view.dart';
import 'package:ovacare/Presentation/Tip_page/SubPages/InfoPage/ui/Info_View.dart';
import 'package:ovacare/Presentation/Tip_page/SubPages/healthyfoodPage/Ui/Healthy_view.dart';
import 'package:ovacare/Presentation/Tip_page/Ui/TipsView.dart';
import 'package:ovacare/Presentation/doctor/ui/doctor_screen.dart';
import 'package:ovacare/Presentation/notification/ui/notification_screen.dart';
import 'Routes.dart';

class AppRoutes {
  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onboarding:
        return MaterialPageRoute(builder: (context) => const OnboardingView());
      case Routes.login:
      return MaterialPageRoute(builder: (context) =>  LoginScreen());
      case Routes.home:
        return MaterialPageRoute(builder: (context) => const BottomNaiveBar());
      case Routes.recommedDoc:
        return MaterialPageRoute(builder: (context) => const DoctorScreen());
      case Routes.notify:
        return MaterialPageRoute(builder: (context) => NotificationScreen());
      case Routes.tips:
        return MaterialPageRoute(builder: (context) => const TipsView());
      case Routes.healthy:
        return MaterialPageRoute(builder: (context) => HealthyView());
      case Routes.info:
        return MaterialPageRoute(builder: (context) => const InfoView());
      case Routes.editProfile:
        return MaterialPageRoute(builder: (context) => const EditProfileView());
      case Routes.testPcod:
        return MaterialPageRoute(builder: (context) => const TestPcodView());    
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}
