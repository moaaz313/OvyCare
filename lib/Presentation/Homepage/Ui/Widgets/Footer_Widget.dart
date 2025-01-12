import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ovacare/Core/Routing/Routes.dart';
import 'package:ovacare/Core/themes/Colors/ColorsStyle.dart';
import 'package:ovacare/Presentation/doctor/ui/widgets/doctor.dart'; // Your doctor model

class Footer extends StatefulWidget {
  const Footer({super.key});

  @override
  State<Footer> createState() => _FooterState();
}

class _FooterState extends State<Footer> {
  List<Doctor> doctors = [];
  bool isLoading = true; // Loading state

  @override
  void initState() {
    super.initState();
    loadDoctors(); // Load doctors when the footer is initialized
  }

  Future<void> loadDoctors() async {
    final String response =
        await rootBundle.loadString('assets/doctor/clinido_doctors_en.json');
    final List<dynamic> data = json.decode(response);

    setState(() {
      doctors = data
          .map((json) => Doctor.fromJson(json))
          .toList(); // Parse the doctors from the JSON
      isLoading = false; // Set loading to false after doctors are loaded
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Top Doctors",
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, Routes.recommedDoc);
              },
              child: Text(
                "See All",
                style: TextStyle(
                  color: ColorStyle.purple,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
        // Show loading indicator while fetching data
        isLoading
            ? const Center(child: CircularProgressIndicator())
            : SizedBox(
                height: 200.h, // Set the height for the ListView
                child: ListView.separated(
                  separatorBuilder: (context, index) => SizedBox(width:10.w),
                  scrollDirection: Axis.horizontal, // Horizontal scrolling
                  itemCount: doctors.length < 5
                      ? doctors.length
                      : 5, // Display last 5 or less doctors
                  itemBuilder: (context, index) {
                    // Get the last 5 doctors using sublist
                    final lastDoctors = doctors.sublist(doctors.length - 5,
                        doctors.length); // Get the last 5 doctors
                    return DoctorCard2(
                        doctor: lastDoctors[index]); // Use the custom card
                  },
                ),
              ),
      ],
    );
  }
}

class DoctorCard2 extends StatelessWidget {
  final Doctor doctor;

  const DoctorCard2({required this.doctor, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, Routes.docDetails, arguments: doctor);
      },
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: ColorStyle.purple,width: 1.5),
            borderRadius: BorderRadius.circular(10.r)),
        width: 150.w, // Fixed width for each card
        padding: EdgeInsets.symmetric(vertical: 10.h,horizontal: 10.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 5.h,),
            Container(
              width: 110.w,
              height: 110.w,
              decoration: BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: NetworkImage(
                      doctor.profileImage.trim()), // Image from the network
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // SizedBox(height: 20.h), // Spacing between image and text
            Spacer(),
            // Name and Governorate text
            Text(
              doctor.name,
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 5.h),
            Row(
              children: [

                Container(
                  // color: Colors.green,
                    child: Row(
                  children: [
                    Icon(Icons.star, color: Colors.amber, size: 18.sp),
                    Text(
                      ' 4.8',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                )),

                Spacer(),
                Icon(Icons.location_on_rounded,color: ColorStyle.gray,),
                Text(" ${doctor.governorate}",
                  style: TextStyle(fontSize: 12.sp, color: Colors.grey),
                  textAlign: TextAlign.center,
                ),

              ],
            ),
          ],
        ),
      ),
    );
  }
}
