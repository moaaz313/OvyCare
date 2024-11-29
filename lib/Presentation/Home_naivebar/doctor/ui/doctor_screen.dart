import 'package:flutter/material.dart';
import 'package:ovacare/Presentation/Home_naivebar/doctor/ui/widgets/doctor.dart';

import '../../../../Core/Widgets/custom_app_bar.dart';
import 'widgets/doctor_list.dart';
import 'widgets/search_doctor_bar.dart';

class DoctorScreen extends StatelessWidget {
  const DoctorScreen({super.key});

  final List<Doctor> doctors = const [
    Doctor(
      name: 'Dr. Dohaaaa',
      specialty: 'General',
      imageUrl: 'assets/doctor.png',
      hospital: 'RSUD Gatot Subroto',
      rating: '4.8',
      reviews: '4,279 reviews',
    ),
    Doctor(
      name: 'Dr. Nooooooooor',
      specialty: 'General',
      hospital: 'RSUD Gatot Subroto',
      rating: '4.8',
      reviews: '4,279 reviews',
      imageUrl: 'assets/doctor.png',
    ),
    Doctor(
      name: 'Dr. Alaa',
      specialty: 'General',
      hospital: 'RSUD Gatot Subroto',
      rating: '4.8',
      reviews: '4,279 reviews',
      imageUrl: 'assets/image_doctor.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Column(
            children: [
              const CustomAppBar(
                text: " Recommendation Doctor",
              ),
              const SearchDoctorBar(),
              Expanded(
                child: DoctorList(
                  doctors: doctors,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}