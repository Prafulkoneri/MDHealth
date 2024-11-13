import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:md_health/constants/styles/colors.dart';

// import '../../../constants/styles/colors.dart';

class FindYourPackage extends StatelessWidget {
  const FindYourPackage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20, bottom: 23),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
            style: TextStyle(
              fontFamily: 'Campton',
              fontSize: 25.sp,
              fontWeight: FontWeight.w700,
              color: Colors.black,
              letterSpacing: -2,
            ),
            children: [
              const TextSpan(text: 'Find your '),
              TextSpan(
                  text: 'medical ',
                  style: TextStyle(
                    color: kDefaultActiveColor,
                    fontFamily: 'Campton',
                    fontSize: 26.sp,
                    fontWeight: FontWeight.w700,
                  )),
              TextSpan(text: 'package\n', style: TextStyle(fontSize: 29.sp)),
              const TextSpan(
                  text: '& flight to Turkiye!',
                  style: TextStyle(fontWeight: FontWeight.w400))
            ]),
      ),
    );
  }
}
