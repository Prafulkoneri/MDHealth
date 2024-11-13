import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:md_health/Screens/order/controller/order_count_controller.dart';
import 'package:md_health/Screens/order_details/view/hs_list_details_view.dart';
import 'package:md_health/Screens/order_details/view/hs_list_view.dart';
import 'package:md_health/Screens/order_details/view/md_food_view.dart';
import 'package:md_health/Screens/order_details/view/md_shop_view.dart';
import 'package:md_health/test_widget.dart';
import 'package:md_health/widget/base_screen.dart';
import 'package:md_health/widget/custom_appbar.dart';
import 'package:provider/provider.dart';

class OrderView extends StatefulWidget {
  const OrderView({super.key});

  @override
  State<OrderView> createState() => _OrderViewState();
}

class _OrderViewState extends State<OrderView> {
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
    final read = context.read<DietOrderCountController>();
    final watch = context.watch<DietOrderCountController>();
    return BaseScreen(
        onWillPop: () async {
          // Navigator.push(
          //   context,
          //   SlidePageRoute(
          //     page: OrderMdShopView(
          //         // packageId:MdShopView
          //         //     widget.packageId,
          //         ),
          //     direction:
          //         SlideDirection.left, // Specify the slide direction here
          //     delay: Duration(milliseconds: 5000),
          //   ),
          // );

          return false;
        },
        backgroundColor: const Color(0xffF5F5F5),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(110.h),
          child: CustomAppBar(
            // hasBackButton: true,
            hasMdTitle: false,
            drawerTitle: "Orders",
          ),
        ),
        content: Column(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  SlidePageRoute(
                    page: const MdFoodView(screenName: 'Orders'),
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
                    page: const OrderMdShopView(
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
          ],
        ));
  }
}
