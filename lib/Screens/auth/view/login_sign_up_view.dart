import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:md_health/Screens/auth/controller/signup_view_controller.dart';

import 'package:md_health/Screens/auth/view/login_view.dart';
import 'package:md_health/Screens/auth/view/sign_up_view.dart';
import 'package:md_health/Screens/bottom_navigation/view/bottom_view.dart';
import 'package:md_health/widget/buttons.dart';
import 'package:provider/provider.dart';

class SignUpLoginScreenView extends StatefulWidget {
  const SignUpLoginScreenView({super.key});

  @override
  State<SignUpLoginScreenView> createState() => _SignUpLoginScreenViewState();
}

class _SignUpLoginScreenViewState extends State<SignUpLoginScreenView> {
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      context.read<SignupViewController>().initState(
            context,
          );
    });
  }

  @override
  Widget build(BuildContext context) {
    final watch = context.watch<SignupViewController>();
    final read = context.read<SignupViewController>();
    return Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            Positioned(
              bottom: -5,
              right: -5,
              child: _circle(),
            ),
            Positioned(
              top: -5,
              left: -5,
              child: _circle(),
            ),
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 150, sigmaY: 150),
              child: Container(
                color: Colors.transparent,
              ),
            ),
            Column(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 38.h,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Image.asset(
                          "assets/images/katman_1.png",
                          width: 75.w,
                          height: 55.h,
                          // fit: BoxFit.fill,s
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                        RichText(
                          text: TextSpan(
                            text: 'MD',
                            style: TextStyle(
                                fontFamily: 'Campton',
                                color: Colors.white,
                                fontSize: 20.sp,
                                letterSpacing: -1,
                                fontWeight: FontWeight.w700),

                            /*defining default style is optional */
                            children: const <TextSpan>[
                              TextSpan(
                                text: 'health',
                                style: TextStyle(fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 29.h,
                        ),
                        const Text(
                          "A NEW APPROACH IN MODERN TREATMENT",
                          style: TextStyle(
                              letterSpacing: 3.5,
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 19,
                        ),
                        Text(
                          "PLAN YOUR TREATMENT",
                          style: TextStyle(
                              letterSpacing: -0.7,
                              color: const Color(0xff4CDB06),
                              fontSize: 25.sp,
                              fontWeight: FontWeight.w700),
                        ),
                        Text(
                          "NOW",
                          style: TextStyle(
                              letterSpacing: -1,
                              color: Colors.white,
                              fontSize: 75.sp,
                              fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                    bottom: 10.w,
                  ),
                  margin: EdgeInsets.only(
                    left: 21.w,
                    right: 17.w,
                  ),
                  child: PrimaryButton(
                    borderRadius: 30,
                    height: 45.h,
                    color: const Color(0xff4CDB06),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignUpView()),
                      );
                    },
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                          color: Colors.black,
                          // letterSpacing: .5,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Container(
                  padding: EdgeInsets.only(
                    // top: 21.w,
                    bottom: 10.w,
                  ),
                  margin: EdgeInsets.only(
                    left: 21.w,
                    right: 17.w,
                  ),
                  child: PrimaryButton(
                    height: 45.h,
                    borderColor: Colors.white,
                    borderRadius: 30,
                    color: Colors.transparent,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginScreenView()),
                      );
                    },
                    child: Text(
                      "Login",
                      style: TextStyle(
                          color: Colors.white,
                          // letterSpacing: .5,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                // SizedBox(
                //   height: 20.h,
                // ),
                GestureDetector(
                  onTap: () {
                    read.guestLogin(context);
                  },
                  //  () =>
                  //  Navigator.pushReplacement(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => const NewMainScreenView())),
                  child: Container(
                    padding: EdgeInsets.only(
                      top: 15.w,
                      // bottom: 20.w,
                    ),
                    margin: EdgeInsets.only(
                      left: 21.w,
                      right: 17.w,
                    ),
                    child: Text(
                      'Skip Now',
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          letterSpacing: -1,
                          color: Colors.white,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ));
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
