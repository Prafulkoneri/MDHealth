import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
// import 'package:md_health/Screens/packages/controller/packages_view_controller.dart';
import 'package:md_health/Screens/health/packages/controller/review_controller.dart';
import 'package:md_health/Screens/health/packages/view/packages_view.dart';
import 'package:md_health/Screens/order_details/controller/hs_details_controller.dart';
import 'package:md_health/Screens/order_details/controller/order_details_food_controller.dart';
import 'package:md_health/constants/styles/colors.dart';
import 'package:md_health/utils/utils.dart';
import 'package:md_health/widget/buttons.dart';
import 'package:md_health/widget/check_box.dart';
import 'package:md_health/widget/rating.dart';
import 'package:md_health/widget/recommaned.dart';
import 'package:md_health/widget/text_field.dart';
import 'package:provider/provider.dart';

class SubmitHSReviewPopUp extends StatefulWidget {
  final String? packageId;
  final String? purchaseID;
  final String? orderId;

  const SubmitHSReviewPopUp({
    super.key,
    this.packageId,
    this.purchaseID,
    this.orderId,
  });

  @override
  State<SubmitHSReviewPopUp> createState() => _SubmitHSReviewPopUpState();
}

class _SubmitHSReviewPopUpState extends State<SubmitHSReviewPopUp> {
  // final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      context.read<HsDetailsViewController>().initState(
          context, widget.packageId, widget.purchaseID, widget.orderId);
    });
  }

  @override
  Widget build(BuildContext context) {
    final read = context.read<HsDetailsViewController>();
    final watch = context.watch<HsDetailsViewController>();
    return ClipRRect(
      borderRadius: BorderRadius.circular(15.0),
      child: Container(
        width: ScreenUtil().screenWidth,
        height: 450.h,
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                // SizedBox(
                //   height: 10.h,
                // ),
                Container(
                  padding: EdgeInsets.only(left: 15.w, right: 10.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 25.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Write Home Services Review",
                            // textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Campton',
                              color: black,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: SvgPicture.asset(
                              "assets/icons/red_close.svg",
                              color: Colors.grey,
                              width: 25.w,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 25.h,
                      ),
                      Text(
                        "Treatment",
                        // textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Campton',
                          color: Colors.black,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),

                      NewStarRating(
                          rating: watch.treatmentRating ?? 0,
                          onRatingChanged: (rating) {
                            read.onTaptreatment(rating);
                            print(rating);
                          }),
                      SizedBox(
                        height: 15.h,
                      ),
                      Text(
                        "Behavior / Professionalism",
                        // textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Campton',
                          color: Colors.black,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),

                      NewStarRating(
                          rating: watch.behaviourRating ?? 0,
                          onRatingChanged: (rating) {
                            read.onTapBehaviour(rating);
                            print(rating);
                          }),
                      SizedBox(
                        height: 15.h,
                      ),
                      Text(
                        "Do you recommend this service?",
                        // textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Campton',
                          color: Colors.black,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      NewRCRating(
                          rating: watch.recommanededcount ?? 0,
                          onRatingChanged: (rating) {
                            read.onTapRecommanded(rating);
                            print(rating);
                          }),
                      SizedBox(
                        height: 8.h,
                      ),

                      SizedBox(
                        height: 34.h,
                      ),
                      RichText(
                          text: TextSpan(
                              style: TextStyle(
                                fontFamily: 'Campton',
                                color: Colors.black,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w700,
                              ),
                              children: [
                            TextSpan(
                              text: 'Extra Notes',
                              style: TextStyle(
                                fontFamily: 'Campton',
                                color: Colors.black,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            TextSpan(
                              text: "*Optional",
                              style: TextStyle(
                                fontFamily: 'Campton',
                                fontWeight: FontWeight.w500,
                                fontSize: 14.sp,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          ])),
                      SizedBox(
                        height: 10.h,
                      ),
                      PrimaryInformationTextFormFieldreq(
                        controller: watch.feedbackHSController,
                        // borderRadius: 50,
                        // titleHeader: "Extra Notes *Optional",
                        maxLines: 100,

                        // color: Colors.red,
                        height: 100.w,
                        // titleHeader: "*Patient Contact Number",
                        hintText: "Please share you feedback & experience.",
                        contentPadding: EdgeInsets.only(top: 20, left: 15),
                      ),
                      // Add this section to your existing code below the last SizedBox
                      SizedBox(
                        height: 30.h,
                      ),

                      Center(
                        child: PrimaryButton(
                          width: ScreenUtil().screenWidth,
                          borderRadius: 30,
                          color: Color(0xffF3771D),
                          onTap: () {
                            log(watch.feedbackHSController.text);
                            read.homeServicesAddReview(
                                context,
                                widget.packageId,
                                widget.purchaseID,
                                // watch.feedbackHSController.text,epfo
                                watch.treatmentRating ?? 0.0,
                                watch.behaviourRating ?? 0.0,
                                watch.recommanededcount ?? 0.0,
                                watch.feedbackHSController.text,
                                widget.orderId);
                            // Navigator.pop(context);
                          },
                          child: Text(
                            "Submit Review",
                            style: TextStyle(
                                color: Colors.white,
                                letterSpacing: -1,
                                fontFamily: 'Campton',
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 80.h,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
