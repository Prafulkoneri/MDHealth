import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:md_health/constants/styles/colors.dart';
import 'package:md_health/widget/buttons.dart';
import 'package:md_health/widget/loading_overlay.dart';

class TestWidget extends StatefulWidget {
  @override
  TestWidgetState createState() => TestWidgetState();
}

class TestWidgetState extends State<TestWidget> {
  bool isOffline = false;
  bool isLoading = false; // Track loading state

  void _retry() {
    setState(() {
      // isLoading = true; // Show loader
      LoadingOverlay.of(context).show();
    });

    // Simulate a 3-second delay before hiding loader
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        // isLoading = false; // Hide loader
        LoadingOverlay.of(context).hide();
      });
    });
  }

  @override
  Widget build(BuildContext ctxt) {
    return isOffline
        ? Column(
            children: [
              Center(
                child: Text(
                  "Not connected",
                  style: TextStyle(fontSize: 25.w),
                ),
              ),
            ],
          )
        : Scaffold(
            body: Center(
              child: isLoading
                  ? CircularProgressIndicator() // Show loader
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/verifiedByHomeservices.png',
                          width: 200.h,
                        ),
                        SizedBox(height: 5.h),
                        Text(
                          "No Internet Connections",
                          style: GoogleFonts.inter(
                            textStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        SizedBox(height: 5.h),
                        Text(
                          "Internet connection not found",
                          style: GoogleFonts.inter(
                            textStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 11.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        SizedBox(height: 5.h),
                        Text(
                          "Check the connection",
                          style: GoogleFonts.inter(
                            textStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 11.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Container(
                          child: PrimaryButton(
                            child: Text(
                              'Retry',
                              style: GoogleFonts.inter(
                                textStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            width: 105.w,
                            height: 35.h,
                            borderColor: kDefaultActiveColor,
                            color: Color(0xff4CDB06),
                            onTap: _retry, // Call retry function on tap
                          ),
                        ),
                      ],
                    ),
            ),
          );
  }
}
