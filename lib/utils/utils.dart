import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:md_health/Screens/auth/view/login_view.dart';
import 'package:md_health/Screens/auth/view/sign_up_view.dart';
import 'package:md_health/Screens/bottom_navigation/view/bottom_view.dart';
import 'package:md_health/constants/styles/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum SnackType {
  error,
  success,
  invalidated,
  info,

  /// only works in debug mode
  debug,

  /// only works in debug mode
  debugError,
}

class Utils {
  static showLogdinDialog(BuildContext context, message) {
    showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15.0))),

              // insetPadding:
              //    EdgeInsets.all(0),
              contentPadding: const EdgeInsets.only(top: 0.0),

              content: Container(
                width: ScreenUtil().screenWidth,
                height: 350.h,
                // padding:
                //     EdgeInsets.only(bottom: 10.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Stack(
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15.0))),
                          child: ClipRRect(
                            borderRadius:
                                BorderRadius.circular(15), // Image border
                            child: SizedBox.fromSize(
                              // size: Size.fromRadius(
                              //     10), // Image radius
                              child: const Image(
                                  image: AssetImage(
                                      "assets/images/green_pop_up.png")),
                            ),
                          ),

                          // Image(
                          //     image: AssetImage(
                          //         "assets/images/pop__new_.png")),
                        ),
                        Positioned(
                            top: 15,
                            right: 15,
                            // left: 0,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //       builder: (context) =>
                                //           AllOrderDetailView()),
                                // );
                                // Now using the context obtained from the builder
                              },
                              child: SvgPicture.asset(
                                  "assets/icons/red_close.svg"),
                            )),
                        Positioned(
                          top: 15,
                          right: 0,
                          left: 0,
                          child: SvgPicture.asset(
                            'assets/icons/material-symbols_person-celebrate.svg',
                            height: 53.h,
                            width: 53.w,
                            // alignment: Alignment.topRight,
                          ),
                        ),
                        Positioned(
                          top: 80.w,
                          left: 100.w,
                          // left: 0,
                          child: RichText(
                              text: TextSpan(
                                  style: TextStyle(
                                    fontFamily: 'Campton',
                                    color: Colors.black,
                                    fontSize: 25.sp,
                                    fontWeight: FontWeight.w700,
                                  ),
                                  children: [
                                TextSpan(
                                    text: 'Oopps!',
                                    style: TextStyle(color: Colors.black)),
                              ])),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20.w,
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      ),
                      // height: 700.h,
                      padding: EdgeInsets.only(right: 10.w, left: 10.w),
                      // width: 331.w,
                      child: Column(
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // Text(
                          //   " Excited to explore more?\nit's time to join MD Family ",
                          // style: TextStyle(
                          //   fontFamily: 'Campton',
                          //   color: Colors.black,
                          //   fontSize: 19.sp,
                          //   fontWeight: FontWeight.w600,
                          // ),
                          // ),
                          RichText(
                              text: TextSpan(
                                  style: TextStyle(
                                    fontFamily: 'Campton',
                                    color: Colors.black,
                                    fontSize: 25.sp,
                                    fontWeight: FontWeight.w700,
                                  ),
                                  children: [
                                TextSpan(
                                  text:
                                      "Excited to explore more? it's\n   time to join",
                                  style: TextStyle(
                                    fontFamily: 'Campton',
                                    color: Colors.black,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                TextSpan(
                                  text: ' MD ',
                                  style: TextStyle(
                                    fontFamily: 'Campton',
                                    color: Colors.black,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                TextSpan(
                                  text: 'Family',
                                  style: TextStyle(
                                    fontFamily: 'Campton',
                                    color: Colors.black,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ])),
                          SizedBox(
                            height: 20.w,
                          ),
                          GestureDetector(
                            onTap: () async {
                              SharedPreferences pref =
                                  await SharedPreferences.getInstance();
                              pref.clear();
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const SignUpView()));

                              // Navigator.pop(context);
                              // Navigator.pushReplacement(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) =>
                              //             NewMainScreenView()));
                            },
                            child: Container(
                              width: 100.w,
                              height: 30.h,
                              decoration: BoxDecoration(
                                color: kDefaultActiveColor,
                                borderRadius: BorderRadius.circular(30.w),
                                // border: Border.all(color: borderColor ?? Colors.transparent)
                              ),
                              child: Center(
                                child: Text(
                                  "Get Started",
                                  style: TextStyle(
                                    fontFamily: 'Campton',
                                    color: Colors.black,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  // style: TextStyle(
                                  //     color: textColor ?? Colors.white,
                                  //     fontWeight: fontWeight ?? FontWeight.w700,
                                  //     fontSize: fontSize ?? 14.sp),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 50.h,
                          ),
                          RichText(
                              text: TextSpan(
                                  style: TextStyle(
                                    fontFamily: 'Campton',
                                    color: Colors.black,
                                    fontSize: 25.sp,
                                    fontWeight: FontWeight.w700,
                                  ),
                                  children: [
                                TextSpan(
                                  text: "Already ",
                                  style: TextStyle(
                                    fontFamily: 'Campton',
                                    color: Colors.black,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                TextSpan(
                                  text: ' MD ',
                                  style: TextStyle(
                                    fontFamily: 'Campton',
                                    color: Colors.black,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                TextSpan(
                                  text: 'Member',
                                  style: TextStyle(
                                    fontFamily: 'Campton',
                                    color: Colors.black,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ])),
                          SizedBox(
                            height: 10.h,
                          ),
                          GestureDetector(
                            onTap: () async {
                              SharedPreferences pref =
                                  await SharedPreferences.getInstance();
                              pref.clear();
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const LoginScreenView()));
                            },
                            child: Container(
                              width: 100.w,
                              height: 30.h,
                              decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.circular(30.w),
                                  border: Border.all(
                                      width: 1.w, color: Colors.grey)),
                              child: Center(
                                child: Text(
                                  "Sign In",
                                  style: TextStyle(
                                    fontFamily: 'Campton',
                                    color: Colors.black,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      // child: ,
                    ),
                  ],
                ),
              ),
            ));
  }

  static ScaffoldFeatureController showPrimarySnackbar(
      BuildContext context, text,
      {SnackType? type}) {
    ScaffoldMessenger.of(context).clearSnackBars();

    Color? color, textColor;
    switch (type) {
      case SnackType.error:
        debugPrint('\x1B[35mError: $text\x1B[0m');

        color = const Color(0xFFDC3545);
        textColor = Colors.white;
        break;
      case SnackType.invalidated:
        debugPrint('\x1B[35mInvalidated: $text\x1B[0m');

        color = const Color(0xFFDC3545);
        textColor = Colors.white;
        break;
      case SnackType.success:
        color = const Color(0xFF28A745);
        textColor = Colors.white;
        break;
      case SnackType.info:
        color = Colors.red;
        break;
      case SnackType.debug:
        if (kReleaseMode) break;
        debugPrint('\x1B[33mDebug: $text\x1B[0m');
        color = const Color(0xFFFFC107);
        textColor = const Color(0xFF343A40);
        text = 'Debug: $text';
        break;
      case SnackType.debugError:
        if (kReleaseMode) break;
        debugPrint('\x1B[31mDebugError: $text\x1B[0m');
        color = const Color.fromARGB(255, 7, 110, 255);
        textColor = Colors.white;
        text = 'Debug Error: $text';
        break;
      default:
        color = Colors.grey;
        break;
    }

    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        // margin: isOverSheet ? EdgeInsets.only(bottom: MediaQuery.of(context).size.height / 1.6) : null,
        behavior: SnackBarBehavior.floating,
        // margin: EdgeInsets.only(bottom: 83.w),
        // duration: Duration(seconds:1),
        action: SnackBarAction(
          label: 'Dismiss',
          textColor: Colors.white,
          onPressed: () {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
          },
        ),
        content: Text(
          text ?? '',
          style: TextStyle(color: textColor, fontSize: 14.sp),
          maxLines: 4,
        ),
        backgroundColor: color,
      ),
    );
  }
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}
