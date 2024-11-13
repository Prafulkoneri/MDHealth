import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:md_health/Screens/auth/controller/signup_view_controller.dart';
import 'package:md_health/Screens/auth/view/sign_up_view.dart';
import 'package:md_health/Screens/auth/view/successful_view.dart';
import 'package:md_health/utils/utils.dart';
import 'package:md_health/widget/buttons.dart';
import 'package:provider/provider.dart';

class SignUpOtpView extends StatefulWidget {
  final String verificationId;
  const SignUpOtpView({super.key, required this.verificationId});

  @override
  State<SignUpOtpView> createState() =>
      _SignUpOtpViewState(verificationId: verificationId);
}

class _SignUpOtpViewState extends State<SignUpOtpView> {
  final String verificationId;

  _SignUpOtpViewState({required this.verificationId});

  @override
  Widget build(BuildContext context) {
    final read = context.read<SignupViewController>();
    final watch = context.watch<SignupViewController>();

    return Scaffold(
      backgroundColor: Colors.black,
      body: WillPopScope(
        onWillPop: () async {
          // Navigator.pushReplacement(
          //     context,
          //     MaterialPageRoute(
          //         builder: (context) => SignUpView(
          //             // packageId:
          //             )));
          return false;
        },
        child: Container(
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
                children: [
                  SizedBox(
                    height: 30.h,
                  ),
                  Image.asset(
                    "assets/images/md_logo.png",
                    width: 60.w,
                    height: 70.h,
                    // fit: BoxFit.fill,s
                  ),
                  SizedBox(
                    height: 50.h,
                  ),
                  Text(
                    "ENTER DIGIT CODE",
                    style: TextStyle(
                        color: Colors.white,
                        letterSpacing: 4,
                        fontSize: 9.sp,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  OtpTextField(
                    // obscureText: true,

                    clearText: false,
                    fieldWidth: 50,
                    borderWidth: 1.w,
                    borderRadius: BorderRadius.circular(15),
                    focusedBorderColor: const Color(0xff4CDB06),
                    numberOfFields: 6,
                    // borderColor: Color.fromARGB(255, 219, 6, 6),
                    //set to true to show as box or false to show as dash
                    showFieldAsBox: true,
                    //runs when a code is typed in
                    onCodeChanged: (String code) {
                      // handle validation or checks here

                      // Check if the code is empty (user is deleting)
                      if (code.isEmpty) {
                      } else {}
                    },

                    textStyle: TextStyle(
                      fontFamily: 'Campton',
                      color: Colors.white, // Set your desired text color
                      fontSize: 18.sp, // Set your desired font size
                      fontWeight:
                          FontWeight.bold, // Set your desired font weight
                      // Add more text style properties as needed
                    ),

                    //runs when every textfield is filled
                    onSubmit: (String code) {
                      debugPrint('I am onSubmit');
                      read.setVerificationCode(code);
                      // print(verificationCode);
                    }, // end onSubmit
                    // margin: EdgeInsets.symmetric(horizontal: 10.0),
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  Container(
                    padding: EdgeInsets.only(
                      // top: 21.w,
                      bottom: 40.w,
                    ),
                    margin: EdgeInsets.only(
                      left: 21.w,
                      right: 17.w,
                    ),
                    child: PrimaryButton(
                      width: 295.w,
                      // borderRadius: BorderRadius.circular(),
                      borderRadius: 30,
                      // width: ScreenUtil().screenWidth,
                      color: const Color(0xff4CDB06),
                      onTap: () async {
                        // print(verificationCode);

                        if (watch.verificationCode != '') {
                          try {
                            debugPrint('I came in');
                            PhoneAuthCredential credential =
                                PhoneAuthProvider.credential(
                              verificationId: widget.verificationId,
                              smsCode: watch.verificationCode,
                            );
                            UserCredential userCredential = await FirebaseAuth
                                .instance
                                .signInWithCredential(credential);

                            User? user = userCredential.user;
                            if (user != null) {
                              watch.NewRegistration(context);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const SuccessfulScreen()),
                              );
                            } else {
                              Utils.showPrimarySnackbar(
                                  context, 'Otp Verification Failed',
                                  type: SnackType.error);
                            }
                          } catch (e) {
                            Utils.showPrimarySnackbar(
                                context, 'Otp Verification Failed',
                                type: SnackType.error);
                          }
                        }
                      },
                      child: Text(
                        "Confirm",
                        style: TextStyle(
                            fontFamily: 'Campton',
                            color: Colors.black,
                            // letterSpacing: .5,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  Text(
                    "Didn't receive the SMS?",
                    style: TextStyle(
                        fontFamily: 'Campton',
                        color: Colors.white,
                        fontSize: 13.sp,
                        // letterSpacing: -1,
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  GestureDetector(
                    onTap: () {
                      print(watch.mobController.text);
                      // return;
                      read.sendOtpToFirebase(watch.mobController.text,
                          watch.selectedCountryCode, context);
                    },
                    child: Text(
                      "Click Here",
                      style: TextStyle(
                          fontFamily: 'Campton',
                          decoration: TextDecoration.underline,
                          color: const Color(0xff4CDB06),
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w600),
                    ),
                  )
                ],
              ),
            ],
          ),
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
