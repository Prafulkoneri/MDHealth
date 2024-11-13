import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
// import 'package:md_health/Screens/packages/controller/packages_view_controller.dart';
import 'package:md_health/Screens/health/packages/controller/review_controller.dart';
import 'package:md_health/Screens/health/packages/view/packages_view.dart';
import 'package:md_health/Screens/order_details/controller/order_details_food_controller.dart';
import 'package:md_health/Screens/order_details/controller/shop_details_controller.dart';
import 'package:md_health/constants/styles/colors.dart';
import 'package:md_health/utils/utils.dart';
import 'package:md_health/widget/buttons.dart';
import 'package:md_health/widget/check_box.dart';
import 'package:md_health/widget/rating.dart';
import 'package:md_health/widget/recommaned.dart';
import 'package:md_health/widget/text_field.dart';
import 'package:provider/provider.dart';

class SubmitShopReviewPopUp extends StatefulWidget {
  final String? productId;
  final String? orderId;
  final String? productName;

  const SubmitShopReviewPopUp({
    super.key,
    this.productId,
    this.orderId,
    required this.productName,
  });

  @override
  State<SubmitShopReviewPopUp> createState() => _SubmitShopReviewPopUpState();
}

class _SubmitShopReviewPopUpState extends State<SubmitShopReviewPopUp> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      context.read<ShopListDetailsController>().initState(
          context, widget.orderId, widget.productName, widget.productId);
    });
  }

  @override
  Widget build(BuildContext context) {
    final read = context.read<ShopListDetailsController>();
    final watch = context.watch<ShopListDetailsController>();
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
                            "Write Shop Review",
                            // textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Campton',
                              color: black,
                              fontSize: 23.sp,
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
                        "${widget.productName}",
                        // textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Campton',
                          color: Colors.black,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),

                      NewStarRating(
                          rating: watch.shopReview ?? 0,
                          onRatingChanged: (rating) {
                            read.onTapShopReview(rating);
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
                          rating: watch.shopRecommanded ?? 0,
                          onRatingChanged: (rating) {
                            read.onTapShopRecommanded(rating);
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
                        controller: watch.shopFeedBackController,
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
                            read.shopAddReview(
                                context,
                                widget.orderId,
                                widget.productId,
                                watch.shopFeedBackController.text,
                                watch.shopReview,
                                watch.shopRecommanded,
                                '');
                            Navigator.pop(context);

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
                                                                letterSpacing:
                                                                    -1,
                                                                fontFamily:
                                                                    'Campton',
                                                                color: Colors
                                                                    .white,
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
                                                                    fontSize:
                                                                        30.sp,
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
                                                    fontWeight:
                                                        FontWeight.w400),
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
                                                  // Navigator.pop(this.context);
                                                  Navigator.pop(context);
                                                },
                                                child: Text(
                                                  "Done",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      letterSpacing: -1,
                                                      fontFamily: 'Campton',
                                                      fontSize: 16.sp,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ));
                            // // LoadingOverlay.of(context).hide();
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
