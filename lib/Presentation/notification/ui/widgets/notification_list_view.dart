import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ovacare/Core/Routing/Routes.dart';
import 'package:ovacare/Core/extentions/Navigation_extention.dart';
import 'package:ovacare/Core/themes/Colors/ColorsStyle.dart';

import 'notification_card.dart';
import 'notification_item.dart';

class NotificationListView extends StatefulWidget {
  const NotificationListView({super.key, required this.notifications});
  final List<NotificationItem> notifications;

  @override
  State<NotificationListView> createState() => _NotificationListViewState();
}

class _NotificationListViewState extends State<NotificationListView> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.notifications.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 0.h, horizontal: 8.w),
          child: NotificationCard(
            item: widget.notifications[index],
            onTap: () {
              setState(() {
                widget.notifications[index].isNew = false;
              });
              showDialog(
                context: context,
                builder: (context) {
                  List<Widget> actions = [
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text(
                        "Close",
                        style: TextStyle(color: ColorStyle.pink),
                      ),
                    ),
                  ];

                  if (widget.notifications[index].title.contains("Tips")) {
                    actions.add(
                      TextButton(
                        onPressed: () {
                          context.pushNamed(Routes.tips);
                        },
                        child: const Text(
                          "Go to Tips",
                          style: TextStyle(color: ColorStyle.purple),
                        ),
                      ),
                    );
                  } else if (widget.notifications[index].title
                      .contains("Cycle")) {
                    actions.add(
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Go to Calander",
                          style: TextStyle(color: ColorStyle.purple),
                        ),
                      ),
                    );
                  }

                  return AlertDialog(
                    title: Text(
                      widget.notifications[index].title,
                      style: const TextStyle(color: ColorStyle.purple),
                    ),
                    content: Text(widget.notifications[index].description),
                    actions: actions,
                  );
                },
              );
            },
          ),
        );
      },
    );
  }
}
