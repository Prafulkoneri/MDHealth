import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:md_health/constants/styles/colors.dart';
import 'package:md_health/constants/styles/textstyle.dart';

class CustomSelectBoxBooking extends StatefulWidget {
  final List<String> list;
  final Widget? title;
  final bool? displayButton;
  final String? displayButtonText;
  final VoidCallback tapFun;
  final bool button;

  final VoidCallback submitActionFnction;
  const CustomSelectBoxBooking(
      {super.key,
      required this.list,
      this.displayButton,
      this.displayButtonText,
      required this.title,
      required this.tapFun,
      required this.submitActionFnction,
      required this.button});

  @override
  State<CustomSelectBoxBooking> createState() => _CustomSelectBoxBookingState();
}

class _CustomSelectBoxBookingState extends State<CustomSelectBoxBooking> {
  int count = 0;

  void incrementCount() {
    setState(() {
      count++;
    });
  }

  void decrementCount() {
    setState(() {
      if (count > 0) {
        count--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 30.w),
        // color: Colors.red,
        alignment: Alignment.center,
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.5,
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ),
            Positioned(
              top: 10,
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  // color: Colors.pink,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.only(left: 150.w),
                  child: SvgPicture.asset(
                    'assets/icons/Close-Square.svg',
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Positioned(
              right: 1,
              left: 1,
              top: 0,
              child: Container(
                // color: Colors.pink,
                height: 100.h,
                width: 300.w,

                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  // borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
              ),
            ),
            Positioned(
              // bottom: widget.button ? 1 : 60,
              top: 50,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                width: 300.w,
                child: Padding(
                  padding: EdgeInsets.only(
                      left: 20.w, right: 20.w, top: 20.w, bottom: 20.w),
                  child: Column(
                    children: [
                      Container(
                          padding: EdgeInsets.only(
                              left: 20.w, right: 20.w, top: 25.w, bottom: 5.w),
                          child: Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Adult    ',
                                    style: TextStyle(
                                        color: Colors.black,
                                        // letterSpacing: -1,
                                        fontFamily: 'Campton',
                                        fontSize: 19.sp,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(
                                      left: 0.w,
                                    ),
                                    height: 20.h,
                                    // width: 107.w,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all(width: 1)),
                                    child: Row(
                                      children: [
                                        GestureDetector(
                                          onTap: decrementCount,
                                          child: Container(
                                            width: 25.w,
                                            decoration: BoxDecoration(
                                              color: kDefaultActiveColor,
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(20),
                                                bottomLeft: Radius.circular(20),
                                              ),
                                            ),
                                            // padding: EdgeInsets.only(
                                            //     left: 6.w, right: 6.w),
                                            // width: ,

                                            child: Center(
                                              child: Text(
                                                '-',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    // letterSpacing: -1,
                                                    fontFamily: 'Campton',
                                                    fontSize: 22.sp,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 11.w,
                                        ),
                                        Center(
                                          child: Text(
                                            '$count',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontFamily: 'Campton',
                                              fontSize: 22,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 11.w,
                                        ),
                                        GestureDetector(
                                          onTap: incrementCount,
                                          child: Container(
                                            // width: ,
                                            width: 25.w,
                                            decoration: BoxDecoration(
                                              color: kDefaultActiveColor,
                                              borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(20),
                                                bottomRight:
                                                    Radius.circular(20),
                                              ),
                                            ),
                                            child: Center(
                                              child: Text(
                                                '+',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    // letterSpacing: -1,
                                                    fontFamily: 'Campton',
                                                    fontSize: 22.sp,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 23.h,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Children',
                                    style: TextStyle(
                                        color: Colors.black,
                                        // letterSpacing: -1,
                                        fontFamily: 'Campton',
                                        fontSize: 19.sp,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(
                                      left: 0.w,
                                    ),
                                    height: 20.h,
                                    // width: 107.w,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all(width: 1)),
                                    child: Row(
                                      children: [
                                        GestureDetector(
                                          onTap: decrementCount,
                                          child: Container(
                                            width: 25.w,
                                            decoration: BoxDecoration(
                                              color: kDefaultActiveColor,
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(20),
                                                bottomLeft: Radius.circular(20),
                                              ),
                                            ),
                                            // padding: EdgeInsets.only(
                                            //     left: 6.w, right: 6.w),
                                            // width: ,

                                            child: Center(
                                              child: Text(
                                                '-',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    // letterSpacing: -1,
                                                    fontFamily: 'Campton',
                                                    fontSize: 22.sp,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 11.w,
                                        ),
                                        Center(
                                          child: Text(
                                            '$count',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontFamily: 'Campton',
                                              fontSize: 22,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 11.w,
                                        ),
                                        GestureDetector(
                                          onTap: incrementCount,
                                          child: Container(
                                            // width: ,
                                            width: 25.w,
                                            decoration: BoxDecoration(
                                              color: kDefaultActiveColor,
                                              borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(20),
                                                bottomRight:
                                                    Radius.circular(20),
                                              ),
                                            ),
                                            child: Center(
                                              child: Text(
                                                '+',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    // letterSpacing: -1,
                                                    fontFamily: 'Campton',
                                                    fontSize: 22.sp,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 23.h,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Room',
                                    style: TextStyle(
                                        color: Colors.black,
                                        // letterSpacing: -1,
                                        fontFamily: 'Campton',
                                        fontSize: 19.sp,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(
                                      left: 0.w,
                                    ),
                                    height: 20.h,
                                    // width: 107.w,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all(width: 1)),
                                    child: Row(
                                      children: [
                                        GestureDetector(
                                          onTap: decrementCount,
                                          child: Container(
                                            width: 25.w,
                                            decoration: BoxDecoration(
                                              color: kDefaultActiveColor,
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(20),
                                                bottomLeft: Radius.circular(20),
                                              ),
                                            ),
                                            // padding: EdgeInsets.only(
                                            //     left: 6.w, right: 6.w),
                                            // width: ,

                                            child: Center(
                                              child: Text(
                                                '-',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    // letterSpacing: -1,
                                                    fontFamily: 'Campton',
                                                    fontSize: 22.sp,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 11.w,
                                        ),
                                        Center(
                                          child: Text(
                                            '$count',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontFamily: 'Campton',
                                              fontSize: 22,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 11.w,
                                        ),
                                        GestureDetector(
                                          onTap: incrementCount,
                                          child: Container(
                                            // width: ,
                                            width: 25.w,
                                            decoration: BoxDecoration(
                                              color: kDefaultActiveColor,
                                              borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(20),
                                                bottomRight:
                                                    Radius.circular(20),
                                              ),
                                            ),
                                            child: Center(
                                              child: Text(
                                                '+',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    // letterSpacing: -1,
                                                    fontFamily: 'Campton',
                                                    fontSize: 22.sp,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              )
                            ],
                          )),
                      SizedBox(
                        height: 23.h,
                      ),
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(
                              horizontal: 50.w, vertical: 10.w),
                          decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30)),
                              color: kDefaultActiveColor),
                          alignment: Alignment.center,
                          child: GestureDetector(
                            onTap: widget.submitActionFnction,
                            child: Center(
                              child: Text(
                                'Choose',
                                style: TextStyle(
                                  fontFamily: 'Campton',
                                  fontSize: 15.sp,
                                  letterSpacing: -1,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              right: 1,
              left: 1,
              top: 25,
              child: Container(
                // color: Colors.red,
                // padding:  EdgeInsets.fromLTRB(30.w, 20.w, 30.w, 48.w),
                child: Image.asset(
                  'assets/icons/katman_1.png',
                  height: 32.97.h,
                  width: 41.w,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
