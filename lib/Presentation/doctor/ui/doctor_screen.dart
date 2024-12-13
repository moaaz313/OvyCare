import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import '../../../Core/Widgets/custom_app_bar.dart';
import 'widgets/doctor.dart';
import 'widgets/doctor_list.dart';
import 'widgets/search_doctor_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorScreen extends StatefulWidget {
  const DoctorScreen({super.key});

  @override
  State<DoctorScreen> createState() => _DoctorScreenState();
}

class _DoctorScreenState extends State<DoctorScreen> {
  List<Doctor> doctors = [];

  @override
  void initState() {
    super.initState();
    loadDoctors();
  }

  Future<void> loadDoctors() async {
    final String response = await rootBundle
        .loadString('assets/doctor/clinido_doctors_en.json');
    final List<dynamic> data = json.decode(response);

    setState(() {
      doctors = data.map((json) => Doctor.fromJson(json)).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        useIconButton: true,
        title: "Top Doctor",
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 15.w),
        child: Column(
          children: [
            const SearchDoctorBar(),
            SizedBox(height: 10.h),
            Expanded(
              child: DoctorList(
                doctors: doctors,
              ),
            )
          ],
        ),
      ),
    );
  }
}
