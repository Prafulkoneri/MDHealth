import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'city_scroller.dart';

class HomeScreenSectionThree extends StatefulWidget {
  const HomeScreenSectionThree({super.key});

  @override
  State<HomeScreenSectionThree> createState() => _HomeScreenSectionThreeState();
}

class _HomeScreenSectionThreeState extends State<HomeScreenSectionThree> {
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    debugPrint(screenWidth.toString());

    return Container(
      color: Colors.black,
      // height: 300.h,
      child: Container(
        padding: const EdgeInsets.only(top: 20),
        child: Column(
          children: [
            Container(
              // margin: const EdgeInsets.only(bottom: 30),
              child: Text(
                'Select & Fly',
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Campton',
                    fontSize: 19.sp,
                    fontWeight: FontWeight.w700),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            const CityScroller(),
            Container(
              // padding: EdgeInsets.only(bottom: 200),
              alignment: Alignment.centerRight,
              // color:Colors.red,
              child: Image.asset(
                'assets/images/image 37.png',
                width: 240.66.w,
                height: 139.63.h,
                fit: BoxFit.cover,
                alignment: Alignment.centerRight,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
