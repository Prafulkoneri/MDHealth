import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:md_health/Screens/health/packages/controller/review_controller.dart';
import 'package:md_health/Screens/health/packages/view/packages_view.dart';
import 'package:md_health/constants/styles/colors.dart';
import 'package:md_health/test_widget.dart';
import 'package:md_health/widget/base_screen.dart';
import 'package:md_health/widget/buttons.dart';
import 'package:md_health/widget/custom_appbar.dart';
import 'package:md_health/widget/rating.dart';
import 'package:md_health/widget/recommaned.dart';
import 'package:md_health/widget/text_field.dart';
import 'package:provider/provider.dart';

class ReviewForPackageView extends StatefulWidget {
  final String? packageId;
  final String? purchesId;
  final String? treatmentValue;
  final String? transportation;
  final String? behavior;
  final String? acomodation;
  const ReviewForPackageView(
      {super.key,
      this.packageId,
      this.treatmentValue,
      this.transportation,
      this.behavior,
      this.acomodation,
      this.purchesId});

  @override
  State<ReviewForPackageView> createState() => _ReviewForPackageViewState();
}

class _ReviewForPackageViewState extends State<ReviewForPackageView> {
  @override
  void initState() {
    print('******${widget.packageId}');
    print('******${widget.purchesId}');
    SchedulerBinding.instance.addPostFrameCallback((_) {
      context.read<WriteReviewController>().initState(
            context,
            widget.packageId,
            widget.purchesId,
          );
    });
  }

  @override
  Widget build(BuildContext context) {
    final read = context.read<WriteReviewController>();
    final watch = context.watch<WriteReviewController>();
    return BaseScreen(
      onWillPop: () async {
        Navigator.push(
          context,
          SlidePageRoute(
            page: PackageSView(
              packageId: watch.packageId.toString(),
            ),
            direction: SlideDirection.left, // Specify the slide direction here
            delay: Duration(milliseconds: 5000),
          ),
        );

        return false;
      },
      backgroundColor: const Color(0xffF5F5F5),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(125.h),
        child: CustomAppBar(
          onBackPressed: () {
            Navigator.push(
              context,
              SlidePageRoute(
                page: PackageSView(
                  packageId: watch.packageId.toString(),
                ),
                direction:
                    SlideDirection.left, // Specify the slide direction here
                delay: Duration(milliseconds: 5000),
              ),
            );
          },
          hasMdTitle: false,
          drawerTitle: 'Packages',
          hasBackButton: true,
        ),
      ),
      content: Column(
        children: [
          SizedBox(
            height: 20.h,
          ),
          Text(
            "please write your feedback for",
            // textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Campton',
              color: kDefaultActiveColor,
              fontSize: 19.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            "better services",
            // textAlign: TextAlign.center,
            style: TextStyle(
              letterSpacing: -0.5,
              fontFamily: 'Campton',
              color: Colors.black,
              fontSize: 40.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
          RichText(
            text: TextSpan(
              text: '& get ',
              style: TextStyle(
                  fontFamily: 'Campton',
                  color: Color(0xff4CDB06),
                  fontSize: 19.sp,
                  fontWeight: FontWeight.w500),

              /*defining default style is optional */
              children: <TextSpan>[
                TextSpan(
                  text: 'MD',
                  style: TextStyle(
                      letterSpacing: -1,
                      fontFamily: 'Campton',
                      color: Color(0xff4CDB06),
                      fontSize: 19.sp,
                      fontWeight: FontWeight.w700),
                ),
                TextSpan(
                  text: 'coin.',
                  style: TextStyle(
                      letterSpacing: -1,
                      fontFamily: 'Campton',
                      color: Color(0xff4CDB06),
                      fontSize: 19.sp,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            margin: const EdgeInsets.all(20.0),
            child: Container(
              padding: EdgeInsets.only(left: 15.w, right: 13.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 25.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Write Review",
                        // textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Campton',
                          color: black,
                          fontSize: 23.sp,
                          fontWeight: FontWeight.w700,
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

                  SizedBox(
                    height: 8.h,
                  ),
                  NewStarRating(
                      rating: watch.comfort ?? 0,
                      onRatingChanged: (rating) {
                        read.onRatingSelectsComfort(rating);
                        print(rating);
                      }),
                  SizedBox(
                    height: 30.h,
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
                  SizedBox(
                    height: 8.h,
                  ),
                  NewStarRating(
                      rating: watch.behaviorValueratingValue ?? 0,
                      onRatingChanged: (rating) {
                        read.onRatingSelectsBehavior(rating);
                        print(rating);
                      }),
                  SizedBox(
                    height: 30.h,
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
                    controller: watch.reviewController,
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
                        read.writeReview(
                            context, widget.packageId, widget.purchesId);
                        showDialog(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15.0))),

                                  // insetPadding:
                                  //    EdgeInsets.all(0),
                                  contentPadding: EdgeInsets.only(top: 0.0),

                                  content: Container(
                                    width: ScreenUtil().screenWidth,
                                    height: 350.h,
                                    // padding:
                                    //     EdgeInsets.only(bottom: 10.w),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Stack(
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(
                                                              15.0))),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        15), // Image border
                                                child: SizedBox.fromSize(
                                                  // size: Size.fromRadius(
                                                  //     10), // Image radius
                                                  child: Image(
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
                                                right: 0,
                                                left: 0,
                                                child: Column(
                                                  children: [
                                                    SvgPicture.asset(
                                                        "assets/icons/happy_pop_up.svg"),
                                                    // Text(
                                                    //   "Delete",
                                                    //   style: TextStyle(
                                                    //       color: Colors.white,
                                                    //       // letterSpacing: .5,
                                                    //       fontSize: 30.sp,
                                                    //       fontWeight: FontWeight.w700),
                                                    // ),
                                                    SizedBox(
                                                      height: 10.w,
                                                    ),
                                                    RichText(
                                                      text: TextSpan(
                                                        text: 'Thank',
                                                        style: TextStyle(
                                                            letterSpacing: -1,
                                                            fontFamily:
                                                                'Campton',
                                                            color: Colors.white,
                                                            fontSize: 30.sp,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w700),

                                                        /*defining default style is optional */
                                                        children: <TextSpan>[
                                                          TextSpan(
                                                            text: ' You!',
                                                            style: TextStyle(
                                                                letterSpacing:
                                                                    -1,
                                                                fontFamily:
                                                                    'Campton',
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 30.sp,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                )),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 38.h,
                                        ),
                                        Text(
                                          "Thank you for your review.",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Colors.black,
                                              letterSpacing: -1,
                                              fontFamily: 'Campton',
                                              fontSize: 21.sp,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        SizedBox(
                                          height: 15.h,
                                        ),
                                        RichText(
                                          textAlign: TextAlign.center,
                                          text: TextSpan(
                                            text:
                                                'The reward will be credited to your\n',
                                            style: TextStyle(
                                                letterSpacing: -1,
                                                fontFamily: 'Campton',
                                                color: Colors.black,
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w400),
                                            children: <TextSpan>[
                                              TextSpan(
                                                text: 'MD',
                                                style: TextStyle(
                                                    letterSpacing: -1,
                                                    fontFamily: 'Campton',
                                                    color: Colors.black,
                                                    fontSize: 17.sp,
                                                    fontWeight:
                                                        FontWeight.w700),
                                              ),
                                              TextSpan(
                                                text:
                                                    'Coin account as soon as possible.',
                                                style: TextStyle(
                                                    letterSpacing: -1,
                                                    fontFamily: 'Campton',
                                                    color: Colors.black,
                                                    fontSize: 14.sp,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 48.h,
                                        ),
                                        Container(
                                          padding: EdgeInsets.only(
                                              left: 22.w, right: 21.w),
                                          child: PrimaryButton(
                                            // width:
                                            //     125.w,
                                            // height:
                                            //     35.w,
                                            // borderRadius: BorderRadius.circular(),
                                            borderRadius: 25,
                                            // width: ScreenUtil().screenWidth,
                                            color: Color(0xff4CDB06),
                                            onTap: () {
                                              Navigator.pop(this.context);
                                              Navigator.pop(context);
                                            },
                                            child: Text(
                                              "Done",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  letterSpacing: -1,
                                                  fontFamily: 'Campton',
                                                  fontSize: 16.sp,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ));
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
            ),
          )
        ],
      ),
    );
  }
}
