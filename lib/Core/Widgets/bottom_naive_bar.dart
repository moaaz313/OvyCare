import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ovacare/Presentation/Homepage/Ui/Homepage_view.dart';
import 'package:ovacare/Presentation/Settings/SubPages/Edit_Profile/ui/EditProfileView.dart';
import 'package:ovacare/Presentation/Settings/ui/Settings_View.dart';
import 'package:ovacare/Presentation/Tip_page/Ui/TipsView.dart';
import 'package:ovacare/Presentation/doctor/ui/doctor_screen.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';

import '../../../../Core/themes/Colors/ColorsStyle.dart';
import '../../Presentation/Community/CommunityHomepage/ui/CommunityHomepage.dart';
import '../../Presentation/Result Normal/ui/resultNormal_view.dart';
import '../../Presentation/ResultAbnormal/ui/ResutlAbnormal_view.dart';


class  BottomNaiveBar extends StatefulWidget {
  const BottomNaiveBar({super.key});

  @override
  State<BottomNaiveBar> createState() => _BottomNaiveBar();
}

class _BottomNaiveBar extends State<BottomNaiveBar> {
  int selected = 0;
  bool heart = false;
  final controller = PageController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: StylishBottomBar(
        option: AnimatedBarOptions(
          iconSize: 32,
          barAnimation: BarAnimation.fade,
          iconStyle: IconStyle.animated,
          opacity: 0.3,
        ),
        items: [
          BottomBarItem(
            icon: const Icon(FontAwesomeIcons.house, size: 20),
            title: const Text('Home'),
            // backgroundColor: Colors.black,
            selectedColor:
                ColorStyle.pink, // selectedIcon: const Icon(Icons.read_more),
          ),
          BottomBarItem(
            icon: const Icon(FontAwesomeIcons.lightbulb, size: 28),
            title: const Text('Tips'),
            // backgroundColor: Colors.black,
            selectedColor: ColorStyle.pink,
          ),
          BottomBarItem(
            icon:  Icon(FontAwesomeIcons.users, size: 24),
            title: const Text('Community'),
            // backgroundColor: Colors.black,
            selectedColor: ColorStyle.pink
          ),
          BottomBarItem(
            icon: const Icon(
              FontAwesomeIcons.userDoctor,
              size: 25,
            ),
            title: const Text('Doctors'),
            // backgroundColor: Colors.black,
            selectedColor: ColorStyle.pink,
          ),
          BottomBarItem(
            icon: const Icon(
              Icons.settings,
              size: 28,
            ),
            title: const Text('Settings'),
            // backgroundColor: Colors.black,
            selectedColor: ColorStyle.pink,
          ),
        ],
        // fabLocation: StylishBarFabLocation.end,
        hasNotch: true,
        currentIndex: selected,
        onTap: (index) {
          setState(() {
            selected = index;
            controller.jumpToPage(index);
          });
        },
      ),
      body: SafeArea(
        child: PageView(
          controller: controller,
          children:  [
            const HomepageView(),
            const TipsView(),
            // PCOSResultNormal(),
            Communityhomepage(),
            const DoctorScreen(),
            SettingsView()
          ],
        ),
      ),
    );
  }
}
