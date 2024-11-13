import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:md_health/Screens/bottom_navigation/controller/bottom_controller.dart';
import 'package:md_health/Screens/favourt/view/health_favt_pa_list_details.dart';
import 'package:md_health/Screens/main/controller/main_screen_controller.dart';
import 'package:md_health/Screens/order/controller/order_count_controller.dart';
import 'package:md_health/Screens/order_details/view/hs_list_view.dart';
import 'package:md_health/Screens/order_details/view/md_food_view.dart';
import 'package:md_health/Screens/order_details/view/md_home_view.dart';
import 'package:md_health/Screens/order_details/view/md_shop_view.dart';
// import 'package:md_health/Screens/packages/view/packages_view.dart';
import 'package:md_health/test_widget.dart';
import 'package:md_health/widget/custom_appbar.dart';
import 'package:md_health/widget/drawer.dart';
import 'package:provider/provider.dart';

class PurchesItemView extends StatefulWidget {
  const PurchesItemView({super.key});

  @override
  State<PurchesItemView> createState() => _PurchesItemViewState();
}

class _PurchesItemViewState extends State<PurchesItemView> {
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      // log(widget.packageId ?? '');
      context.read<DietOrderCountController>().initState(
            context,
          );
    });
  }

  @override
  Widget build(BuildContext context) {
    // final read = context.read<NewMainScreenController>();
    // final watch = context.watch<NewMainScreenController>();
    final read = context.read<DietOrderCountController>();
    final watch = context.watch<DietOrderCountController>();
    return Container(
      height: ScreenUtil().screenHeight,
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  SlidePageRoute(
                    page: const MdFoodView(),
                    direction: SlideDirection
                        .right, // Specify the slide direction here
                    delay: const Duration(milliseconds: 5000),
                  ),
                );
              },
              child: Container(
                margin: EdgeInsets.only(left: 18.w, right: 18.w, top: 20.w),
                padding: EdgeInsets.only(
                    left: 20.w, right: 30.w, top: 17.w, bottom: 18.w),
                decoration: BoxDecoration(
                    color: const Color(0xffFBFBFB),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.10),
                        // offset: Offset(2, 2),
                        blurRadius: 20,
                      ),
                    ]),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(
                          "assets/icons/fluent_food-24-filled.svg",
                          width: 35.w,
                          height: 40.w,
                        ),
                        SizedBox(
                          width: 10.h,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichText(
                              text: TextSpan(
                                text: 'MD',
                                style: TextStyle(
                                    fontFamily: 'Campton',
                                    color: Colors.black,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600),

                                /*defining default style is optional */
                                children: <TextSpan>[
                                  TextSpan(
                                    text: 'food',
                                    style: TextStyle(
                                        fontFamily: 'Campton',
                                        color: Colors.black,
                                        fontSize: 19.sp,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                            ),
                            RichText(
                              text: TextSpan(
                                text: 'Purchase',
                                style: TextStyle(
                                    fontFamily: 'Campton',
                                    color: Colors.black,
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w500),

                                /*defining default style is optional */
                                children: <TextSpan>[
                                  TextSpan(
                                    text: ' (${watch.orderCount ?? 0})',
                                    style: TextStyle(
                                        fontFamily: 'Campton',
                                        color: Colors.black,
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SvgPicture.asset("assets/icons/forword.svg"),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  SlidePageRoute(
                    page: const OrderMdShopView(),
                    direction: SlideDirection
                        .right, // Specify the slide direction here
                    delay: const Duration(milliseconds: 5000),
                  ),
                );
              },
              child: Container(
                margin: EdgeInsets.only(left: 18.w, right: 18.w, top: 20.w),
                padding: EdgeInsets.only(
                    left: 20.w, right: 30.w, top: 17.w, bottom: 18.w),
                decoration: BoxDecoration(
                    color: const Color(0xffFBFBFB),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.10),
                        // offset: Offset(2, 2),
                        blurRadius: 20,
                      ),
                    ]),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(
                          "assets/icons/fluent-mdl2_shop (1).svg",
                          width: 35.w,
                          height: 40.w,
                        ),

                        // Image.asset(
                        //   "assets/images/medical-icon_i-care-staff-area.png",
                        // width: 35.w,
                        // height: 27.w,
                        // ),
                        SizedBox(
                          width: 10.h,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichText(
                              text: TextSpan(
                                text: 'MD',
                                style: TextStyle(
                                    fontFamily: 'Campton',
                                    color: Colors.black,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600),

                                /*defining default style is optional */
                                children: <TextSpan>[
                                  TextSpan(
                                    text: ' shop',
                                    style: TextStyle(
                                        fontFamily: 'Campton',
                                        color: Colors.black,
                                        fontSize: 19.sp,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                            ),
                            RichText(
                              text: TextSpan(
                                text: 'Purchase',
                                style: TextStyle(
                                    fontFamily: 'Campton',
                                    color: Colors.black,
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w500),

                                /*defining default style is optional */
                                children: <TextSpan>[
                                  TextSpan(
                                    text: ' (${watch.shopOrderCount ?? 0})',
                                    style: TextStyle(
                                        fontFamily: 'Campton',
                                        color: Colors.black,
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SvgPicture.asset("assets/icons/forword.svg"),
                  ],
                ),
              ),
            ),
            ////////////////////////////////////
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  SlidePageRoute(
                    page: const HsOrderView
                        // HsOrderView
                        (
                        // foodOrderID: '',
                        // packageId:MdShopView
                        //     widget.packageId,
                        ),
                    direction: SlideDirection
                        .right, // Specify the slide direction here
                    delay: const Duration(milliseconds: 5000),
                  ),
                );
              },
              child: Container(
                margin: EdgeInsets.only(left: 18.w, right: 18.w, top: 20.w),
                padding: EdgeInsets.only(
                    left: 20.w, right: 30.w, top: 17.w, bottom: 18.w),
                decoration: BoxDecoration(
                    color: const Color(0xffFBFBFB),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.10),
                        // offset: Offset(2, 2),
                        blurRadius: 20,
                      ),
                    ]),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(
                          "assets/icons/fluent-mdl2_shop (1).svg",
                          width: 35.w,
                          height: 40.w,
                        ),

                        // Image.asset(
                        //   "assets/images/medical-icon_i-care-staff-area.png",
                        // width: 35.w,
                        // height: 27.w,
                        // ),
                        SizedBox(
                          width: 10.h,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichText(
                              text: TextSpan(
                                text: 'MD',
                                style: TextStyle(
                                    fontFamily: 'Campton',
                                    color: Colors.black,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600),

                                /*defining default style is optional */
                                children: <TextSpan>[
                                  TextSpan(
                                    text: ' HomeService',
                                    style: TextStyle(
                                        fontFamily: 'Campton',
                                        color: Colors.black,
                                        fontSize: 19.sp,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                            ),
                            RichText(
                              text: TextSpan(
                                text: 'Purchase',
                                style: TextStyle(
                                    fontFamily: 'Campton',
                                    color: Colors.black,
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w500),

                                /*defining default style is optional */
                                children: <TextSpan>[
                                  TextSpan(
                                    text: ' (${watch.hsorddercount ?? 0})',
                                    style: TextStyle(
                                        fontFamily: 'Campton',
                                        color: Colors.black,
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SvgPicture.asset("assets/icons/forword.svg"),
                  ],
                ),
              ),
            ),
            ////////////////////////////////////
          ],
        ),
      ),
    );
  }
}
