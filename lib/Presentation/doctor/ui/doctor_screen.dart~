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
  List<Doctor> filteredDoctors = [];
  String selectedGovernorate = 'All';
  String searchQuery = '';

  final List<String> governorates = [
    'All',
    'Cairo',
    'Giza',
    'Qalyubia',
    'Alexandria',
    'Assiut',
    'Minya',
    'Luxor',
    'Beni Suef',
    'Sharqia',
    'Dakahlia',
    'Suez',
    'Gharbia',
    'Fayoum',
    'Sohag',
    'Damietta'
  ];

  @override
  void initState() {
    super.initState();
    loadDoctors();
  }

  Future<void> loadDoctors() async {
    final String response =
        await rootBundle.loadString('assets/doctor/clinido_doctors_en.json');
    final List<dynamic> data = json.decode(response);

    setState(() {
      doctors = data.map((json) => Doctor.fromJson(json)).toList();
      filteredDoctors = doctors; // Initialize filteredDoctors
    });
  }

  void filterDoctors() {
    setState(() {
      filteredDoctors = doctors.where((doctor) {
        final matchesGovernorate = selectedGovernorate == 'All' ||
            doctor.governorate == selectedGovernorate;
        final matchesQuery =
            doctor.name.toLowerCase().contains(searchQuery.toLowerCase());
        return matchesGovernorate && matchesQuery;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        useIconButton: false,
        title: "Top Doctors",
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            vertical: 10.h,
            horizontal: 20.w), // Added more padding for a cleaner look
        child: Column(
          children: [
            SearchDoctorBar(
              filteredDoctors: filteredDoctors,
              governorates: governorates,
              selectedGovernorate: selectedGovernorate,
              onGovernorateChanged: (value) {
                setState(() {
                  selectedGovernorate = value!;
                  filterDoctors();
                });
              },
              onSearchChanged: (value) {
                setState(() {
                  searchQuery = value;
                  filterDoctors();
                });
              },
            ),
            SizedBox(
                height: 15
                    .h), // Add more spacing between the search bar and the doctor list
            Expanded(
              child: DoctorList(
                doctors: filteredDoctors,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
