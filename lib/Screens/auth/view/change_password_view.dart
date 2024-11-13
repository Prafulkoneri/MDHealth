import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:md_health/Screens/auth/controller/forgot_password_view_controller.dart';
import 'package:md_health/Screens/auth/view/login_view.dart';
import 'package:md_health/widget/buttons.dart';
import 'package:md_health/widget/text_field.dart';
import 'package:provider/provider.dart';

class ChangePasswordView extends StatefulWidget {
  const ChangePasswordView({super.key});

  @override
  State<ChangePasswordView> createState() => _ChangePasswordViewState();
}

class _ChangePasswordViewState extends State<ChangePasswordView> {
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
                height: 28.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 32.w, right: 32.w),
                child: PrimarySTextFormField(
                  // isOptional: false,
                  controller: watch.passwordController,
                  // isPasswordField: true,
                  titleHeader: "PASSWORD ",
                ),
              ),
              SizedBox(
                height: 28.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 32.w, right: 32.w),
                child: PrimarySTextFormField(
                  // isOptional: false,
                  controller: watch.repasswordController,
                  // isPasswordField: true,
                  titleHeader: "RE-PASSWORD",
                ),
              ),
              SizedBox(
                height: 28.h,
              ),
              Container(
                padding: EdgeInsets.only(
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
                    read.updatePassword(context);
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => LoginOtoView(verificationId: '',)),
                    // );
                  },
                  child: Text(
                    "Set New Password",
                    style: TextStyle(
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
