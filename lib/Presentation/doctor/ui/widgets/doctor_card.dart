import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ovacare/Core/themes/Colors/ColorsStyle.dart';
import 'package:ovacare/Presentation/doctor/ui/widgets/doctor.dart';
import 'package:ovacare/Presentation/doctor_details/ui/doctor_details.dart';

import '../../../../Core/Routing/Routes.dart';

class DoctorCard extends StatelessWidget {
  final Doctor doctor;
  const DoctorCard({required this.doctor, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => DoctorDetailsScreen(doctor: doctor),));
      },
      child: Container(
        // height: 130.h,
        padding: EdgeInsets.only(bottom:15.h),
        child: Row(
          children: [
            Container(
              width: 80.w,
              height:80.h,
              decoration: BoxDecoration(
                color: ColorStyle.pink,
                borderRadius: BorderRadius.circular(12.r),
                image: DecorationImage(
                  alignment: AlignmentDirectional.topEnd,
                  image: AssetImage(doctor.imageUrl),
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
                  SizedBox(height: 10.h),
                  Text(
                    '${doctor.specialty} | ${doctor.hospital}',
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.grey[600],
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.amber, size: 18.sp),
                      SizedBox(width: 6.w),
                      Text(
                        '${doctor.rating} (${doctor.reviews})',
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
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
