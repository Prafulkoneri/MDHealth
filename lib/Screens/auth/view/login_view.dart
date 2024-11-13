import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:md_health/Screens/auth/controller/login_view_controller.dart';
import 'package:md_health/Screens/auth/view/forgot_passwaord_view.dart';
import 'package:md_health/Screens/auth/view/login_otp_view.dart';
import 'package:md_health/Screens/auth/view/otp_view.dart';
import 'package:md_health/Screens/auth/view/sign_up_view.dart';
import 'package:md_health/constants/styles/colors.dart';
import 'package:md_health/utils/utils.dart';
import 'package:md_health/widget/buttons.dart';
import 'package:md_health/widget/text_field.dart';
import 'package:provider/provider.dart';
import 'package:unique_identifier/unique_identifier.dart';

class LoginScreenView extends StatefulWidget {
  const LoginScreenView({super.key});

  @override
  State<LoginScreenView> createState() => _LoginScreenViewState();
}

class _LoginScreenViewState extends State<LoginScreenView> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      context.read<LoginViewController>().initState(
            context,
          );
    });
    initUniqueIdentifierState();
  }

  String _identifier = 'Unknown';

//  @override
//  void initState() {
//    super.initState();
//    initUniqueIdentifierState();
//  }

  Future<void> initUniqueIdentifierState() async {
    String identifier;
    try {
      identifier = (await UniqueIdentifier.serial)!;
    } on PlatformException {
      identifier = 'Failed to get Unique Identifier';
    }

    if (!mounted) return;

    setState(() {
      _identifier = identifier;
    });
  }

  @override
  Widget build(BuildContext context) {
    final read = context.read<LoginViewController>();
    final watch = context.watch<LoginViewController>();

    return Scaffold(
      // resizeToAvoidBottomInset: false,
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
          SingleChildScrollView(
            // physics: const BouncingScrollPhysics(),
            child: Column(
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
                  height: 50.h,
                ),
                // Padding(
                //   padding: EdgeInsets.only(left: 32.w, right: 32.w),
                //   child: PrimarySTextFormField(
                //     // width: 48.w,
                //     titleHeader: "YOUR MOBILE NUMBER",
                //     hintText: "tybtn",
                //   ),
                // ),
                // Padding(
                //   padding: EdgeInsets.only(left: 32.w, right: 32.w),
                //   child: MobileNoTextFormField(
                //     titleHeader: "YOUR MOBILE NUMBER",
                //     onChanged: (value) {
                //       read.setMobileNumber(value);
                //     },
                //     onCountryCodeChanged: (value) {
                //       // read.onCountryCodeSelected(value);
                //     },
                //     enableOrder: true, controller: null,
                //     // controller: watch.mobController,
                //   ),
                //   //
                // ),
                Padding(
                  padding: EdgeInsets.only(left: 32.w, right: 32.w),
                  child: MobileNoTextFormField(
                    initialSelection: 'TR',
                    controller: watch.mobController,
                    titleHeader: "YOUR MOBILE NUMBER",
                    textInputType: TextInputType.number,
                    lengthLimitingTextInputFormatter:
                        LengthLimitingTextInputFormatter(10),
                    onChanged: (value) {
                      read.setMobileNumber(value);
                    },
                    onCountryCodeChanged: (value) {
                      // read.onCountryCodeSelected(value);
                    },
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 32.w, right: 32.w),
                  child: PrimarySTextFormField(
                    // isOptional: false,
                    isPasswordField: true,
                    // width: 48.w,
                    height: 45.h,
                    controller: watch.passwordController,
                    titleHeader: "PASSWORD",
                    // hintText: "tybtn",
                  ),
                ),
                SizedBox(
                  height: 28.h,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ForgotPasswaordView()),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.only(right: 160.h),
                    child: Text(
                      "Forgot Password",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: kDefaultActiveColor,
                          letterSpacing: -1,
                          decoration: TextDecoration.underline,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                SizedBox(
                  height: 42.h,
                ),
                Container(
                  padding: EdgeInsets.only(
                    // top: 21.w,
                    bottom: 35.w,
                  ),
                  margin: EdgeInsets.only(
                    left: 32.w,
                    right: 32.w,
                  ),
                  // padding: EdgeInsets.only(left: 32.w, right: 32.w),
//
                  child: PrimaryButton(
                    // borderRadius: BorderRadius.circular(),
                    height: 45.h,
                    borderRadius: 30,
                    // width: ScreenUtil().screenWidth,
                    color: Color(0xff4CDB06),
                    // onTap: () {
                    //   read.userLogin(context);
                    // },
                    onTap: () {
                      if (watch.mobController.text.isEmpty ||
                          watch.mobController.text.length < 10) {
                        Utils.showPrimarySnackbar(
                            context, 'Enter Valid 10 Digits Mobile Number',
                            type: SnackType.error);
                      } else {
                        read.userLogin(context);
                      }
                    },
                    child: Text(
                      "Login",
                      style: TextStyle(
                          fontFamily: 'Campton',
                          color: Colors.black,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                Text(
                  "Don't have an account?",
                  style: TextStyle(
                      fontFamily: 'Campton',
                      color: Colors.white,
                      fontSize: 14.sp,
                      // letterSpacing: -1,
                      fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: 5.h,
                ),

                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignUpView()),
                    );
                  },
                  child: Text(
                    "Click Here",
                    style: TextStyle(
                        fontFamily: 'Campton',
                        decoration: TextDecoration.underline,
                        color: const Color(0xff4CDB06),
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                // Text(
                //   'Running on device with id: $_identifier\n',
                //   style: TextStyle(
                //       fontFamily: 'Campton',
                //       decoration: TextDecoration.underline,
                //       color: const Color(0xff4CDB06),
                //       fontSize: 16.sp,
                //       fontWeight: FontWeight.w700),
                // ),

                // RichText(
                //   textAlign: TextAlign.center,
                //   text: TextSpan(
                //     text: "Don’t have an account?\n",
                //     style: TextStyle(
                //         color: Colors.white,
                //         fontFamily: 'Campton',
                //         fontSize: 13.sp,
                //         letterSpacing: -1,
                //         fontWeight: FontWeight.w400),

                //     /*defining default style is optional */
                //     children: <TextSpan>[
                //       TextSpan(
                //         text: 'Click Here',
                //         style: TextStyle(
                //             decoration: TextDecoration.underline,
                //             fontFamily: 'Campton',
                //             color: Color(0xff4CDB06),
                //             fontSize: 13.sp,
                //             letterSpacing: -1,
                //             fontWeight: FontWeight.w600),
                //         recognizer: new TapGestureRecognizer()
                //           ..onTap = () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //       builder: (context) => SignUpView()),
                // );
                //           },
                //       ),
                //     ],
                //   ),
                // ),
              ],
            ),
          )
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
