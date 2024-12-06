import 'package:flutter/material.dart';
import 'package:ovacare/Core/themes/Colors/ColorsStyle.dart';

import 'notification_item.dart';

class NotificationCard extends StatelessWidget {
  final NotificationItem item;
  final VoidCallback? onTap; // Callback for handling taps

  const NotificationCard({super.key, required this.item, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: ColorStyle.white,
      child: ListTile(
        onTap: onTap, // Trigger the callback when tapped
        leading: CircleAvatar(
          backgroundColor: item.iconColor.withOpacity(0.1),
          child: Icon(
            item.icon,
            color: item.iconColor,
          ),
        ),
        title: Text(
          item.title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: ColorStyle.black,
          ),
        ),
        subtitle: Text(
          item.description,
          style: const TextStyle(color: ColorStyle.darkgray),
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              item.time,
              style: const TextStyle(color: ColorStyle.gray),
            ),
            if (item.isNew)
              const CircleAvatar(
                radius: 4,
                backgroundColor: ColorStyle.pink,
              ),
          ],
        ),
      ),
    );
  }
}