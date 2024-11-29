import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchDoctorBar extends StatelessWidget {
  const SearchDoctorBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Search',
              prefixIcon: Icon(Icons.search, size: 24.sp),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r), 
              ),
              contentPadding: EdgeInsets.symmetric(
                vertical: 10.h,
                horizontal: 12.w, 
              ),
            ),
          ),
        ),
        SizedBox(width: 8.w),
        IconButton(
          icon: Icon(Icons.filter_list, size: 24.sp),
          onPressed: () {
            // Add filter logic
          },
        ),
      ],
    );
  }
}
