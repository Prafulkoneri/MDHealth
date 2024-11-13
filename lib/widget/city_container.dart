import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/styles/colors.dart';

class CityContainer extends StatelessWidget {
  final String? cityName;

  const CityContainer({
    super.key,
    required this.cityName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45.h,
      width: 102.w,
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(40)),
          border: Border.all(color: kDefaultActiveColor, width: 2)),
      child: Text(
        cityName!,
        style: TextStyle(
            color: Colors.white,
            fontFamily: 'Campton',
            fontSize: 16.sp,
            fontWeight: FontWeight.w600),
      ),
    );
  }
}
