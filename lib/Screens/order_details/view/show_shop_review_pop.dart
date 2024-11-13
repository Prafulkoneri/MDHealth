import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:md_health/Screens/order_details/controller/shop_details_controller.dart';
import 'package:md_health/constants/styles/colors.dart';
import 'package:provider/provider.dart';

class ShowShopReviewPopUp extends StatefulWidget {
  final String? productId;
  final String? orderId;
  final String? productName;

  const ShowShopReviewPopUp({
    super.key,
    required this.orderId,
    required this.productName,
    this.productId,
  });

  @override
  State<ShowShopReviewPopUp> createState() => _ShowShopReviewPopUpState();
}

class _ShowShopReviewPopUpState extends State<ShowShopReviewPopUp> {
  // final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      context.read<ShopListDetailsController>().initState(
            context,
            widget.productId,
            widget.orderId,
            widget.productName,
          );
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
        height: 350.h,
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
                            "Shop Review",
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
                      Row(
                        children: [
                          for (int i = 0; i < 5; i++)
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: SvgPicture.asset(
                                i < watch.rating!
                                    ? 'assets/icons/black-star.svg'
                                    : 'assets/icons/black-star.svg',
                                width: 20,
                                color: i < watch.rating!
                                    ? Color(0xff4CDB06)
                                    : Colors.black,
                                // alignment: Alignment.topRight,
                              ),
                            ),
                        ],
                      ),

                      SizedBox(
                        height: 10.h,
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
                      // Text(
                      //   "${watch.showfoodreviewdata?.feedback},${watch.showfoodreviewdata?.rating},${watch.showfoodreviewdata?.recommendation}   ",
                      //   // textAlign: TextAlign.center,
                      //   style: TextStyle(
                      //     fontFamily: 'Campton',
                      //     color: Colors.black,
                      //     fontSize: 16.sp,
                      //     fontWeight: FontWeight.w700,
                      //   ),
                      // ),
                      Row(
                        children: [
                          for (int i = 0; i < 10; i++)
                            Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: i < watch.recommendation!
                                    ? Container(
                                        width: 15.w,
                                        height: 15.w,
                                        decoration: BoxDecoration(
                                            color: Color(0xff4CDB06),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                      )
                                    : Container(
                                        width: 15.w,
                                        height: 15.w,
                                        decoration: BoxDecoration(
                                            color: Colors.black,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                      )),
                        ],
                      ),

                      SizedBox(
                        height: 8.h,
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
                      Container(
                          width: ScreenUtil().screenWidth,
                          height: 100.h,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(
                                  // width: 1.5,
                                  color:
                                      const Color.fromARGB(255, 61, 60, 60))),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "${watch.feedback}",
                              style: TextStyle(
                                fontFamily: 'Campton',
                                color: Colors.black,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          )),
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
