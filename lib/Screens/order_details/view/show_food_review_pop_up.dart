import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:md_health/Screens/order_details/controller/order_details_food_controller.dart';
import 'package:md_health/constants/styles/colors.dart';
import 'package:provider/provider.dart';

class ShowFoodReviewPopUp extends StatefulWidget {
  final String? orderId;
  final String? packageName;

  const ShowFoodReviewPopUp({
    super.key,
    required this.orderId,
    required this.packageName,
  });

  @override
  State<ShowFoodReviewPopUp> createState() => _ShowFoodReviewPopUpState();
}

class _ShowFoodReviewPopUpState extends State<ShowFoodReviewPopUp> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      context.read<OrderListFoodViewController>().initState(
            context,
            widget.orderId,
          );
    });
  }

  @override
  Widget build(BuildContext context) {
    final read = context.read<OrderListFoodViewController>();
    final watch = context.watch<OrderListFoodViewController>();
    final reviewData = watch.showfoodreviewdata;
    return ClipRRect(
      borderRadius: BorderRadius.circular(15.0),
      child: SizedBox(
        width: ScreenUtil().screenWidth,
        height: 350.h,
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(left: 15.w, right: 10.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 25.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Food Review",
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
                      SizedBox(height: 25.h),
                      Text(
                        "${widget.packageName ?? 'N/A'}", // Default value if null
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
                                'assets/icons/black-star.svg',
                                width: 20,
                                color: i <
                                        (reviewData?.rating ??
                                            0) // Default to 0 if null
                                    ? Color(0xff4CDB06)
                                    : Colors.black,
                              ),
                            ),
                        ],
                      ),
                      SizedBox(height: 10.h),
                      Text(
                        "Do you recommend this service?",
                        style: TextStyle(
                          fontFamily: 'Campton',
                          color: Colors.black,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Row(
                        children: [
                          for (int i = 0; i < 10; i++)
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Container(
                                width: 15.w,
                                height: 15.w,
                                decoration: BoxDecoration(
                                  color: (i < (reviewData?.recommendation ?? 0))
                                      ? Color(0xff4CDB06)
                                      : Colors.black,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                        ],
                      ),
                      SizedBox(height: 8.h),
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
                          ],
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Container(
                        width: ScreenUtil().screenWidth,
                        height: 100.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(
                            color: const Color.fromARGB(255, 61, 60, 60),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "${reviewData?.feedback ?? 'No feedback available'}", // Default message if null
                            style: TextStyle(
                              fontFamily: 'Campton',
                              color: Colors.black,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
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
