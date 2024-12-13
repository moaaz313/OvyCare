import 'package:flutter/material.dart';

import 'doctor.dart';
import 'doctor_card.dart';

class DoctorList extends StatelessWidget {
  final List<Doctor> doctors;

  const DoctorList({required this.doctors, super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: doctors.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Column(
          children: [DoctorCard(doctor: doctors[index]), const Divider()],
        );
      },
    );
  }
}
