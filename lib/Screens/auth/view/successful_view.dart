import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:md_health/Screens/auth/view/login_view.dart';
import 'package:md_health/Screens/auth/view/otp_view.dart';
import 'package:md_health/Screens/bottom_navigation/view/bottom_view.dart';
import 'package:md_health/Screens/health/home/view/home_view.dart';
import 'package:md_health/Screens/main/view/main_screen_view.dart';

class SuccessfulScreen extends StatefulWidget {
  const SuccessfulScreen({super.key});

  @override
  State<SuccessfulScreen> createState() => _SuccessfulScreenState();
}

class _SuccessfulScreenState extends State<SuccessfulScreen> {
  void initState() {
    super.initState();

    // Add a delay using Future.delayed to automatically navigate after 5 seconds
    Timer(Duration(milliseconds: 1500), () {
      // Use Navigator to push the next page onto the navigation stack
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => const LoginScreenView(
                // index: 0,
                )),

        // (Route<dynamic> route) => false,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Stack(
          children: [
            Positioned(
              child: _circle(),
              bottom: -5,
              right: -5,
            ),
            Positioned(
              child: _circle(),
              top: -5,
              left: -5,
            ),
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 150, sigmaY: 150),
              child: Container(
                color: Colors.transparent,
              ),
            ),
            Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 62.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/md_logo.png",
                      width: 71.w,
                      height: 67.h,
                      // fit: BoxFit.fill,s
                    ),
                  ],
                ),
                SizedBox(
                  height: 200.h,
                ),
                Text(
                  "YOUR SIGN UP PROCESS",
                  style: TextStyle(
                      color: Colors.white,
                      letterSpacing: 5.5,
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 11.h,
                ),
                Text(
                  "SUCCESSFULLY",
                  style: TextStyle(
                      color: Colors.white,
                      letterSpacing: 5.5,
                      fontSize: 31.sp,
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: 75.h,
                ),
                Text(
                  "YOU ARE DIRECTED TO THE LOGIN PAGE",
                  style: TextStyle(
                      color: Color(0xff4CDB06),
                      letterSpacing: 2,
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w700),
                ),
                // Padding(SUCCESSFULLY
                //   padding: EdgeInsets.only(left: 32.w, right: 32.w),
                //   child: PrimarySTextFormField(
                //     // width: 48.w,
                //     titleHeader: "RE-PASSWORD",
                //     hintText: "tybtn",
                //   ),
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Widget _circle() {
  return Container(
    height: 100,
    width: 100,
    decoration: const BoxDecoration(
      shape: BoxShape.circle,
      color: Color(0xff4CDB06),
    ),
  );
}
