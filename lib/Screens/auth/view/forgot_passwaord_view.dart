import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:md_health/Screens/auth/controller/forgot_password_view_controller.dart';
import 'package:md_health/Screens/auth/view/login_otp_view.dart';
import 'package:md_health/Screens/auth/view/otp_view.dart';
import 'package:md_health/widget/buttons.dart';
import 'package:md_health/widget/text_field.dart';
import 'package:provider/provider.dart';

class ForgotPasswaordView extends StatefulWidget {
  const ForgotPasswaordView({super.key});

  @override
  State<ForgotPasswaordView> createState() => _ForgotPasswaordViewState();
}

class _ForgotPasswaordViewState extends State<ForgotPasswaordView> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      context.read<ForgotPasswordViewController>().initState(
            context,
          );
    });
  }

  @override
  Widget build(BuildContext context) {
    final watch = context.watch<ForgotPasswordViewController>();
    final read = context.read<ForgotPasswordViewController>();

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 50.h,
              ),
              Image.asset(
                "assets/images/md_logo.png",
                width: 70.w,
                height: 60.h,
                // fit: BoxFit.fill,s
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                "Forgot Password",
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontFamily: 'Campton',
                    color: Colors.white,
                    // letterSpacing: .5,
                    fontSize: 26.sp,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 50.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 32.w, right: 32.w),
                child: MobileNoTextFormField(
                  // height: 46.2.h,
                  titleHeader: "YOUR MOBILE NUMBER",
                  onChanged: (value) {
                    read.mobileNumberCheck(context);
                  },
                  // onChanged: (value) {
                  //   read.setMobileNumber(value.toString());
                  // },
                  onCountryCodeChanged: (value) {
                    read.setMobileNumber(value.toString());
                  },
                  enableOrder: true, controller: watch.mobileNumberController,
                  // controller: watch.mobController,
                ),
                //
              ),
              SizedBox(
                height: 28.h,
              ),
              Container(
                padding: EdgeInsets.only(
                  left: 15.w, right: 15.w,
                  // top: 21.w,
                  bottom: 17.w,
                ),
                margin: EdgeInsets.only(
                  left: 21.w,
                  right: 17.w,
                ),
                child: PrimaryButton(
                  // borderRadius: BorderRadius.circular(),
                  height: 45.h,
                  borderRadius: 30,
                  // width: ScreenUtil().screenWidth,
                  color: Color(0xff4CDB06),
                  onTap: () {
                    if (watch.mobileNumberController != '') {
                      read.sendOtpToFirebase(
                          watch.mobileNumberController.text, context);
                    } else {}
                    // if (watch.mobileNumberController.text.length < 10) {
                    //   return;
                    // }
                    // if (watch.isLoginBtnEnabled) {
                    //   return;
                    // }
                  },
                  child: Text(
                    "Send New Password",
                    style: TextStyle(
                        fontFamily: 'Campton',
                        color: Colors.black,
                        // letterSpacing: .5,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ],
          ),
        ],
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
