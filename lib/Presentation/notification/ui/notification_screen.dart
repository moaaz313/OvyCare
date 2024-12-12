import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ovacare/Core/Widgets/custom_app_bar.dart';
import 'package:ovacare/Core/themes/Colors/ColorsStyle.dart';
import 'package:ovacare/Presentation/notification/ui/widgets/notification_list_view.dart';

import 'widgets/notification_item.dart';

class NotificationScreen extends StatelessWidget {
  NotificationScreen({super.key});

  final List<NotificationItem> notifications = [
    NotificationItem(
      title: "Track Your Cycle",
      description:
          "Keep track of your cycle effortlessly with our integrated calendar. Stay informed and prepared.",
      time: "2h",
      icon: Icons.calendar_month,
      iconColor: ColorStyle.purple,
    ),
    NotificationItem(
      title: "Healthy Food Tips",
      description:
          "Discover tips for maintaining a balanced diet to support your health and well-being.",
      time: "4h",
      icon: Icons.fastfood,
      iconColor: ColorStyle.pink,
    ),
    NotificationItem(
      title: "Exercise Tips",
      description:
          "Explore effective exercise routines to boost your energy and fitness levels.",
      time: "8h",
      icon: Icons.fitness_center,
      iconColor: ColorStyle.orange,
    ),
    NotificationItem(
      title: "Test Result Available",
      description:
          "Your PCOS test results are now available. Please check the details to understand the next steps for your treatment.",
      time: "1h",
      icon: Icons.assignment_turned_in,
      iconColor: ColorStyle.purple,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  CustomAppBar(title: "Notification",useIconButton:true),
      body: NotificationListView(
        notifications: notifications,
      ),
    );
  }
}

class TipsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Tips",
          style: TextStyle(
            color: ColorStyle.purple,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body:  Center(
        child: Text(
          "Here are some useful tips!",
          style: TextStyle(fontSize: 18.spMin, color: ColorStyle.darkgray),
        ),
      ),
    );
  }
}
