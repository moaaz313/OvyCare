import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ovacare/Presentation/doctor/ui/widgets/doctor.dart';
import 'package:ovacare/Presentation/doctor_details/ui/doctor_details.dart';

class DoctorCard extends StatelessWidget {
  final Doctor doctor;
  const DoctorCard({required this.doctor, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => DoctorDetailsScreen(doctor: doctor),
        ));
      },
      child: Container(
        padding: EdgeInsets.only(bottom: 10.h),
        child: Row(
          children: [
            Container(
              width: 100.w,
              height: 100.h,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(12.r),
                image: DecorationImage(
                  alignment:AlignmentDirectional.topEnd, // Alignment for the image
                  image: NetworkImage(doctor.profileImage.trim()), // Your image source
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    doctor.name,
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // SizedBox(height: .h),
                  Text(
                    doctor.title,
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.grey[600],
                    ),
                  ),
                  SizedBox(height: 8.h),
                  // Spacer(),
                  Padding(
                    padding: EdgeInsetsDirectional.only(end: 8.w),
                    child: Row(
                      children: [
                        Icon(Icons.star, color: Colors.amber, size: 18.sp),
                        Text(
                          '4.8',
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: Colors.grey[600],
                          ),
                        ),
                        const Spacer(),
                        const Icon(Icons.location_on_outlined),
                        Text(doctor.city),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
