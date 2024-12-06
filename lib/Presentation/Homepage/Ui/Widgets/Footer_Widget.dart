import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ovacare/Core/Routing/Routes.dart';

import '../../../../Core/themes/Colors/ColorsStyle.dart';

Widget Footer(context) {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Recommentation Doctor",
            style: TextStyle(fontSize: 18.spMin, fontWeight: FontWeight.bold),
          ),
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, Routes.recommedDoc);
            },
            child: Text(
              "See All",
              style: TextStyle(
                  color: ColorStyle.purple,
                  fontSize: 15.spMin,
                  fontWeight: FontWeight.w500),
            ),
          )
        ],
      ),
    ],
  );
}
