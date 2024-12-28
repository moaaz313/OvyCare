import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'doctor.dart';

class SearchDoctorBar extends StatelessWidget {
  final List<String> governorates;
  final String selectedGovernorate;
  final ValueChanged<String?> onGovernorateChanged;
  final ValueChanged<String> onSearchChanged;
  final List<Doctor> filteredDoctors;

  const SearchDoctorBar({
    super.key,
    required this.governorates,
    required this.selectedGovernorate,
    required this.onGovernorateChanged,
    required this.onSearchChanged,
    required this.filteredDoctors,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: TextField(
                onTapOutside: (event) =>
                    FocusManager.instance.primaryFocus?.unfocus(),
                onChanged: onSearchChanged,
                decoration: InputDecoration(
                  hintText: 'Search by name',
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
            SizedBox(width: 8.w), // Spacing between the search bar and dropdown
            DropdownButton<String>(
              value: selectedGovernorate,
              onChanged: onGovernorateChanged,
              items: governorates.map((governorate) {
                return DropdownMenuItem(
                  value: governorate,
                  child: Text(governorate),
                );
              }).toList(),
            ),
          ],
        ),
        SizedBox(
            height: 10.h), // Space between the search bar and the result count
        Text(
          '${filteredDoctors.length} doctors found',
          style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
