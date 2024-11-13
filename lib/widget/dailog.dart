import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:md_health/Screens/auth/view/sign_up_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

showLoginDialog(BuildContext context, message) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: const Color(0xffFFFFFF),
          // shape: ,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),

          // scrollable: true,
          child: SizedBox(
            height: 205.h,
            // width: 400.w,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Flexible(
                  child: Text(
                    "Please login to use this feature!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: const Color(0xff006F94),
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                SizedBox(
                  height: 37.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 19.w,
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () async {
                          SharedPreferences pref =
                              await SharedPreferences.getInstance();
                          // pref.clear();
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SignUpView()));
                        },
                        child: Container(
                          padding: EdgeInsets.only(
                              left: 24.w, right: 24.w, top: 9.w, bottom: 9.w),
                          decoration: BoxDecoration(
                              color: const Color(0xff39C19D),
                              borderRadius: BorderRadius.circular(8)),
                          child: Text(
                            "Go",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                // letterSpacing: .5,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          padding: EdgeInsets.only(
                              left: 14.w, right: 15.w, top: 9.w, bottom: 9.w),
                          decoration: BoxDecoration(
                              color: const Color(0xffEC7074),
                              // border: Border.all(width: 1, color: Black),
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            children: [
                              Text(
                                "Cancel",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    // letterSpacing: .5,
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w700),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      });
}
