import 'dart:developer';
import 'dart:ui';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:md_health/Screens/home_services/hs_review/controller/hs_review_list_controller.dart';
import 'package:md_health/Screens/home_services/search_details/view/search_details_hs.dart';
import 'package:md_health/constants/styles/colors.dart';
// import 'package:md_health/Screens/search/view/search_details_view.dart';
import 'package:md_health/test_widget.dart';
import 'package:md_health/widget/base_screen.dart';
import 'package:md_health/widget/custom_appbar.dart';
import 'package:provider/provider.dart';

class HsReviewScreen extends StatefulWidget {
  final String? packageId;
  const HsReviewScreen({super.key, this.packageId});

  @override
  State<HsReviewScreen> createState() => _HsReviewScreenState();
}

class _HsReviewScreenState extends State<HsReviewScreen> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      log(widget.packageId ?? '');
      context
          .read<HomeServicesReviewListController>()
          .initState(context, widget.packageId);
    });
  }

  Widget build(BuildContext context) {
    final read = context.read<HomeServicesReviewListController>();
    final watch = context.watch<HomeServicesReviewListController>();
    return BaseScreen(
      onWillPop: () async {
        Navigator.pushReplacement(
          context,
          SlidePageRoute(
            page: HomeServicesSearchDetails(
              packageId: widget.packageId,

              // packageId: watch.packageId,
            ),
            direction: SlideDirection.left, // Specify the slide direction here
            delay: const Duration(milliseconds: 5000),
          ),
          // MaterialPageRoute(
          //     builder: (context) => SearchDetailsView(
          //           packageId: watch.packageId,
          //         ))
        );
        return false;
      },
      backgroundColor: const Color(0xffF5F5F5),
      appBar: CustomAppBar(
        onBackPressed: () {
          Navigator.pushReplacement(
            context,
            SlidePageRoute(
              page: HomeServicesSearchDetails(
                packageId: widget.packageId,

                // packageId: watch.packageId,
              ),
              direction:
                  SlideDirection.left, // Specify the slide direction here
              delay: const Duration(milliseconds: 5000),
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
      content: Stack(
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
          watch.hsReviewlistdata?.newHsreviewsList?.isNotEmpty != true
              ? Container(
                  child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 200.h,
                      ),
                      SvgPicture.asset(
                        "assets/icons/No-orders-found.svg",
                        // width: 10,
                      ),
                    ],
                  ),
                ))
              : SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 23.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "${watch.hsReviewlistdata?.average ?? 0.0}",
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
                        "${watch.hsReviewlistdata?.totalReviews ?? 0} Reviews",
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          for (int i = 0; i < 5; i++)
                            Row(
                              children: [
                                SvgPicture.asset(
                                  i <
                                          (watch.hsReviewlistdata?.stars != null
                                              ? double.tryParse(watch
                                                              .hsReviewlistdata
                                                              ?.stars ??
                                                          '0')
                                                      ?.round() ??
                                                  0
                                              : 0)
                                      ? 'assets/icons/Star.svg'
                                      : 'assets/icons/Star.svg',
                                  width: 14.w,
                                  height: 25.w,
                                  color: i <
                                          (watch.hsReviewlistdata?.stars != null
                                              ? double.tryParse(watch
                                                              .hsReviewlistdata
                                                              ?.stars ??
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
                      Container(
                        padding: EdgeInsets.only(left: 25.w, right: 26.w),
                        child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          // physics: BouncingScrollPhysics(),
                          itemCount: watch
                                  .hsReviewlistdata?.newHsreviewsList?.length ??
                              0,
                          itemBuilder: (context, index) {
                            final element = watch
                                .hsReviewlistdata?.newHsreviewsList?[index];
                            return Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                  Row(
                                    children: [
                                      for (int i = 0; i < 5; i++)
                                        Row(
                                          children: [
                                            SvgPicture.asset(
                                              i <
                                                      (element?.personAvgStars !=
                                                              null
                                                          ? double.tryParse(element!
                                                                      .personAvgStars!
                                                                      .toString())
                                                                  ?.round() ??
                                                              0
                                                          : 0)
                                                  ? 'assets/icons/black-star.svg'
                                                  : 'assets/icons/black-star.svg',
                                              width: 14,
                                              color: i <
                                                      (element?.personAvgStars !=
                                                              null
                                                          ? double.tryParse(element!
                                                                      .personAvgStars!)
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

                                  Text.rich(
                                    TextSpan(
                                      children: [
                                        // WidgetSpan(
                                        //   child: SvgPicture.asset(
                                        //     'assets/icons/Star.svg',
                                        //     // width: 30,
                                        //     // alignment: Alignment.topRight,
                                        //   ),
                                        // ),
                                        TextSpan(
                                          text: element?.extraNotes,
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
                                      text: "${element?.fullName},  /",
                                      style: TextStyle(
                                          fontFamily: 'Campton',
                                          color: Colors.black,
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w700),

                                      /*defining default style is optional */
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: '${element?.packageName}',
                                          style: TextStyle(
                                              fontFamily: 'CamptonBookItalic',
                                              fontStyle: FontStyle.italic,
                                              color: Colors.black,
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.w500),
                                          recognizer: new TapGestureRecognizer()
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
                                  SizedBox(
                                    height: 8.h,
                                  ),
                                  Text(
                                    "${element?.date ?? 0}",
                                    // "480 Reviews",
                                    style: TextStyle(
                                      // decoration: TextDecoration.underline,
                                      fontFamily: 'Campton',
                                      color: Colors.black,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  const Divider(
                                    thickness: 1,
                                    color: Color(0xff4CDB06),
                                    // height: height,
                                  ),
                                  // SizedBox(
                                  //   height: 28.h,
                                  // ),
                                ],
                              ),
                            );
                          },
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
