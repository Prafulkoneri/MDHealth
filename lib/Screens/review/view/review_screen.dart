import 'dart:developer';
import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:md_health/Screens/health/search/view/search_details_view.dart';
import 'package:md_health/Screens/review/controller/review_controller.dart';
import 'package:md_health/constants/styles/colors.dart';
// import 'package:md_health/Screens/search/view/search_details_view.dart';
import 'package:md_health/test_widget.dart';
import 'package:md_health/widget/base_screen.dart';
import 'package:md_health/widget/custom_appbar.dart';
import 'package:md_health/widget/loader.dart';
import 'package:provider/provider.dart';

class ReviewScreen extends StatefulWidget {
  final String? packageId;
  const ReviewScreen({super.key, required this.packageId});

  @override
  State<ReviewScreen> createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      log(widget.packageId ?? '');
      context.read<ReviewController>().initState(context, widget.packageId);
    });
  }

  Widget build(BuildContext context) {
    final read = context.read<ReviewController>();
    final watch = context.watch<ReviewController>();
    return BaseScreen(
      onWillPop: () async {
        Navigator.pushReplacement(
          context,
          SlidePageRoute(
            page: SearchDetailsView(
              packageId: widget.packageId,

              // packageId: watch.packageId,
            ),
            direction: SlideDirection.left, // Specify the slide direction here
            delay: Duration(milliseconds: 5000),
          ),
          // MaterialPageRoute(
          //     builder: (context) => SearchDetailsView(
          //           packageId: watch.packageId,
          //         ))
        );
        return false;
      },
      backgroundColor: Color(0xffF5F5F5),
      appBar: CustomAppBar(
        onBackPressed: () {
          Navigator.pushReplacement(
            context,
            SlidePageRoute(
              page: SearchDetailsView(
                packageId: widget.packageId,

                // packageId: watch.packageId,
              ),
              direction:
                  SlideDirection.left, // Specify the slide direction here
              delay: Duration(milliseconds: 5000),
            ),
            // MaterialPageRoute(
            //     builder: (context) => SearchDetailsView(
            //           packageId: watch.packageId,
            //         ))
          );
        },
        hasBackButton: true,
        hasMdTitle: false,
      ),
      content: watch.isLoading
          ? Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(
                  height: 200.h,
                ),
                const Loader(),
              ],
            )
          : Stack(
              children: [
                // Positioned(
                //   child: _circle(),
                //   bottom: -5,
                //   right: -5,
                // ),
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
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 23.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "${watch.customerReviewsAverage}",
                            // "4.8",
                            style: TextStyle(
                              fontFamily: 'Campton',
                              color: Colors.black,
                              fontSize: 40.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Text(
                        "${watch.customerReviewsCount ?? 0} Reviews",
                        // "480 Reviews",
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          fontFamily: 'Campton',
                          color: Colors.black,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      // SvgPicture.asset(
                      //   'assets/icons/Star.svg',
                      //   // width: 30,
                      //   // alignment: Alignment.topRight,
                      // ),
                      // Row(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      //   children: [
                      //     for (int i = 0; i < 5; i++)
                      //       Row(
                      //         children: [
                      //           SvgPicture.asset(
                      //             'assets/icons/Star.svg',
                      //           ),
                      //           // Add a SizedBox with a fixed width for spacing between stars
                      //           if (i < 4) SizedBox(width: 4.w),
                      //         ],
                      //       ),
                      //   ],
                      // ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          for (int i = 0; i < 5; i++)
                            Row(
                              children: [
                                SvgPicture.asset(
                                  i <
                                          (watch.customerReviewsAverage != null
                                              ? double.tryParse(watch
                                                              .customerReviewsAverage ??
                                                          '0')
                                                      ?.round() ??
                                                  0
                                              : 0)
                                      ? 'assets/icons/Star.svg'
                                      : 'assets/icons/Star.svg',
                                  width: 14.w,
                                  height: 25.w,
                                  color: i <
                                          (watch.customerReviewsAverage != null
                                              ? double.tryParse(watch
                                                              .customerReviewsAverage ??
                                                          '0')
                                                      ?.round() ??
                                                  0
                                              : 0)
                                      ? kDefaultActiveColor
                                      : Colors.black,
                                ),
                                if (i < 4)
                                  SizedBox(
                                    width: 3.w,
                                  ),
                              ],
                            ),
                        ],
                      ),
                      watch.customerReviewsData?.isNotEmpty == true
                          ? Container(
                              padding: EdgeInsets.only(left: 25.w, right: 26.w),
                              child: ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                // physics: BouncingScrollPhysics(),
                                itemCount:
                                    watch.customerReviewsData?.length ?? 0,
                                itemBuilder: (context, index) {
                                  final element =
                                      watch.customerReviewsData?[index];
                                  return Container(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 25.h,
                                        ),
                                        Row(
                                          children: [
                                            for (int i = 0; i < 5; i++)
                                              Row(
                                                children: [
                                                  SvgPicture.asset(
                                                    i <
                                                            (element?.stars !=
                                                                    null
                                                                ? double.tryParse(element!
                                                                            .stars!
                                                                            .toString())
                                                                        ?.round() ??
                                                                    0
                                                                : 0)
                                                        ? 'assets/icons/black-star.svg'
                                                        : 'assets/icons/black-star.svg',
                                                    width: 14,
                                                    color: i <
                                                            (element?.stars !=
                                                                    null
                                                                ? double.tryParse(element!
                                                                            .stars!
                                                                            .toString())
                                                                        ?.round() ??
                                                                    0
                                                                : 0)
                                                        ? kDefaultActiveColor
                                                        : Colors.black,
                                                  ),
                                                  if (i < 4)
                                                    SizedBox(
                                                      width: 3.w,
                                                    ),
                                                ],
                                              ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 5.h,
                                        ),
                                        Text.rich(
                                          TextSpan(
                                            children: [
                                              TextSpan(
                                                text: element?.reviewFeedback,
                                                // '   Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
                                                style: TextStyle(
                                                  fontFamily: 'Campton',
                                                  color: Colors.black,
                                                  fontSize: 16.sp,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10.h,
                                        ),
                                        RichText(
                                          // textAlign: TextAlign.start,
                                          text: TextSpan(
                                            text:
                                                "${element?.customerName},  /",
                                            style: TextStyle(
                                                fontFamily: 'Campton',
                                                color: Colors.black,
                                                fontSize: 16.sp,
                                                fontWeight: FontWeight.w700),

                                            /*defining default style is optional */
                                            children: <TextSpan>[
                                              TextSpan(
                                                text:
                                                    '${element?.packageName}\n',
                                                style: TextStyle(
                                                    fontFamily:
                                                        'CamptonBookItalic',
                                                    fontStyle: FontStyle.italic,
                                                    color: Colors.black,
                                                    fontSize: 16.sp,
                                                    fontWeight:
                                                        FontWeight.w400),
                                                recognizer:
                                                    new TapGestureRecognizer()
                                                      ..onTap = () {
                                                        // Navigator.push(
                                                        //   context,
                                                        //   MaterialPageRoute(
                                                        //       builder: (context) => SignUpView()),
                                                        // );
                                                      },
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(height: 8.h),
                                        RichText(
                                          text: TextSpan(
                                            text: '${element?.date}',
                                            style: TextStyle(
                                                fontFamily: 'Campton',
                                                fontStyle: FontStyle.italic,
                                                color: Colors.black,
                                                fontSize: 16.sp,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 20.h,
                                        ),
                                        const Divider(
                                          thickness: 1,
                                          color: Color(0xff4CDB06),
                                          // height: height,
                                        ),
                                        SizedBox(
                                          height: 28.h,
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            )
                          : Center(
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 120.h,
                                  ),
                                  SvgPicture.asset(
                                    "assets/icons/No-Reviews-Available.svg",
                                    // width: 10,
                                  ),
                                ],
                              ),
                            )
                    ],
                  ),
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
