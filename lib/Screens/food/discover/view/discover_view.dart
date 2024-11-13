import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:md_health/Screens/MdBooking/md_booking_payment/view/md_booking_home_view.dart';
import 'package:md_health/Screens/bottom_navigation/controller/bottom_controller.dart';
import 'package:md_health/Screens/bottom_navigation/view/bottom_view.dart';
import 'package:md_health/Screens/food/diet_plan/view/diet_plan_view.dart';
// import 'package:md_health/Screens/home/view/home_section_two.dart';
// import 'package:md_health/Screens/home/view/home_view.dart';
import 'package:md_health/Screens/home_services/home_page_services/view/hs_homepage_view.dart';
import 'package:md_health/Screens/shop/md_shop_home_page/view/md_shop_home_page.dart';
import 'package:md_health/constants/styles/colors.dart';
import 'package:md_health/constants/styles/textstyle.dart';
import 'package:md_health/test_widget.dart';
import 'package:md_health/widget/couldnt_find_treatent_box.dart';
import 'package:md_health/widget/drawer.dart';
import 'package:provider/provider.dart';

class DiscoverView extends StatelessWidget {
  const DiscoverView({super.key});

  @override
  Widget build(BuildContext context) {
    final ScaffoldState? scaffoldState = Scaffold.maybeOf(context);
    final read = context.read<NewMainScreenController>();
    final watch = context.watch<NewMainScreenController>();
    // final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return
        // Scaffold(
        // // key: scaffoldKey.currentState.openDrawer(),
        // drawer: AppDrawer(),
        // floatingActionButton: Builder(
        //   builder: (context) {
        //     return FloatingActionButton(
        //       onPressed: () => scaffoldState?.openDrawer(),
        //     );
        //   },
        // ),
        // backgroundColor: Colors.black,
        // // appBar: CustomAppBar(
        // //   hasHiText: true,
        // // ),
        // body:
        SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            children: [
              Positioned(
                child: _circle(),
                bottom: -5,
                right: -5,
              ),
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 100, sigmaY: 50),
                child: Container(
                  color: Colors.transparent,
                ),
              ),
              Column(
                children: [
                  Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: 30.h),
                      child: Text(
                        "DISCOVER THE",
                        style: TextStyle(
                            color: const Color(0xff4CDB06),
                            fontSize: 29.sp,
                            fontFamily: 'Campton',
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 20.h),
                    child: Text(
                      "MD",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 79.sp,
                          fontFamily: 'Campton',
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Container(
            color: Colors.white,
            padding: EdgeInsets.symmetric(vertical: 40.h),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    read.onHomeScreenPress();
                  },
                  child: Container(
                      padding: EdgeInsets.only(left: 24.w, right: 24.w),
                      child: const Image(
                          image: AssetImage("assets/images/Group 8.png"))),
                ),
                // DiscoverWidget(
                //   onTap: () {
                //     // Navigator.push(
                //     //   context,
                //     // SlidePageRoute(
                //     //   page: NewMainScreenView(),
                //     //   direction: SlideDirection.right,
                //     //   delay: Duration(milliseconds: 5000),
                //     // ),
                //     // );
                //     print("4515747841");
                //     read.onHomeScreenPress();
                //     // Navigator.push(context,
                //     //     MaterialPageRoute(builder: (context) => HomeView()));
                //     // context.watch<MainScreenController>().setCurrentScreen(0);
                //   },
                //   topWidget: RichText(
                //     text: TextSpan(
                //       style: TextStyle(
                //           fontFamily: 'Campton',
                //           color: Colors.black,
                //           fontSize: 18.sp,
                //           letterSpacing: -1,
                //           fontWeight: FontWeight.w500),
                //       children: <TextSpan>[
                //         TextSpan(
                //           text: 'Find your\n',
                //           style: TextStyle(
                //               fontSize: 20.sp,
                //               letterSpacing: 0,
                //               fontWeight: FontWeight.w400),
                //         ),
                //         TextSpan(
                //           text: 'treatment',
                //           style: TextStyle(
                //             fontWeight: FontWeight.w400,
                //             fontSize: 20.sp,
                //             color: kDefaultActiveColor,
                //           ),
                //         ),
                //         TextSpan(text: ' & '),
                //         TextSpan(
                //           text: 'medical tourism',
                //           style: TextStyle(
                //             fontWeight: FontWeight.w700,
                //             fontSize: 20.sp,
                //             color: kDefaultActiveColor,
                //           ),
                //         ),
                //       ],
                //     ),
                //   ),
                //   mdTitle: 'health',
                //   image: 'assets/images/image_36.png',
                //   imageWidth: 90,
                //   imageHeight: 120,
                //   // topWidgetHeight: 115,
                // ),
                SizedBox(
                  height: 20.h,
                ),
                // DiscoverWidget(
                //   onTap: () {
                //     Navigator.push(
                //       context,
                //       SlidePageRoute(
                //         page: DietPlanView(),
                //         direction: SlideDirection.right,
                //         delay: Duration(milliseconds: 5000),
                //       ),
                //     );
                //     // Navigator.push(
                //     //     context,
                //     //     MaterialPageRoute(
                //     //         builder: (context) => DietPlanView()));
                //   },
                //   topWidget: RichText(
                //     text: TextSpan(
                //       style: TextStyle(
                //           fontFamily: 'Campton',
                //           color: Colors.black,
                //           fontSize: 25.sp,
                //           // letterSpacing: -2,/
                //           fontWeight: FontWeight.w700),
                //       children: <TextSpan>[
                //         TextSpan(
                //           text: 'PLAN YOUR\n',
                //           style: TextStyle(
                //               fontSize: 20.sp,
                //               letterSpacing: 0,
                //               fontWeight: FontWeight.w400),
                //         ),
                //         const TextSpan(
                //           text: 'DIET MEAL ',
                //           style: TextStyle(
                //             fontFamily: 'Campton',
                //             color: kDefaultActiveColor,
                //           ),
                //         ),
                //         const TextSpan(
                //           text: 'NOW!',
                //         ),
                //       ],
                //     ),
                //   ),
                //   mdTitle: 'food',
                //   image: 'assets/images/image_41.png',
                //   imageWidth: 91,
                //   imageHeight: 87,
                //   topWidgetHeight: 115,
                // ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      SlidePageRoute(
                        page: const DietPlanView(),
                        direction: SlideDirection.right,
                        delay: const Duration(milliseconds: 5000),
                      ),
                    );
                  },
                  child: Container(
                      padding: EdgeInsets.only(left: 24.w, right: 24.w),
                      child: const Image(
                          image: AssetImage("assets/images/Group 11.png"))),
                ),

                SizedBox(
                  height: 20.h,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      SlidePageRoute(
                        page: const MdShopHomePageView(),
                        direction: SlideDirection.right,
                        delay: const Duration(milliseconds: 5000),
                      ),
                    );
                  },
                  child: Container(
                      padding: EdgeInsets.only(left: 24.w, right: 24.w),
                      child: const Image(
                          image: AssetImage("assets/images/Group 14.png"))),
                ),

                SizedBox(
                  height: 20.h,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      SlidePageRoute(
                        page: const HomeServicesView(),
                        direction: SlideDirection.right,
                        delay: const Duration(milliseconds: 5000),
                      ),
                    );
                  },
                  child: Container(
                      padding: EdgeInsets.only(left: 24.w, right: 24.w),
                      child: const Image(
                          image: AssetImage("assets/images/Group 11 (1).png"))),
                ),

                Padding(
                  padding: EdgeInsets.only(bottom: 50.w),
                ),
              ],
            ),
          )
        ],
      ),
      // ),
    );
  }
}

class DiscoverWidget extends StatelessWidget {
  final Widget? topWidget;
  final String? mdTitle;
  final String? image;
  final double? imageHeight;
  final double? imageWidth;
  final double? topWidgetHeight;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry? margin;
  // final EdgeInsetsGeometry? padding;
  const DiscoverWidget({
    super.key,
    required this.topWidget,
    required this.image,
    this.mdTitle,
    this.imageHeight,
    this.imageWidth,
    this.topWidgetHeight,
    this.onTap,
    this.margin,
    // this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ?? () {},
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          CouldntFindTreatmentBox(
              TopWidgetChild: topWidget,
              backgroundColor: Colors.black,
              pngImage: image,
              widgetChild: Container(
                // color: Colors.green,
                padding: EdgeInsets.only(top: 5.h),
                alignment: Alignment.centerLeft,
                child: Column(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/Group_12.svg',
                    ),
                    MdRichTextWidget(
                      fontSize: 16,
                      mdTitle: mdTitle ?? 'health',
                    )
                  ],
                ),
              ),
              height: 65,
              borderRadius: 10,
              imageHeight: imageHeight ?? 120,
              imageWidth: imageWidth,
              topWidgetHeight: topWidgetHeight,
              padding: EdgeInsets.fromLTRB(15.w, 0, 15.w, 0),
              margin: margin

              // margin: EdgeInsets.symmetric(horizontal: 5),
              // top
              ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 40.sp),
            child: Text(
              'Go to App >',
              style: TextStyle(
                  fontFamily: 'Campton',
                  color: Colors.black,
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w600),
            ),
          )
        ],
      ),
    );
  }
}

Widget _circle() {
  return Container(
    height: 75,
    width: 75,
    decoration: const BoxDecoration(
      shape: BoxShape.circle,
      color: Color(0xff4CDB06),
    ),
  );
}
///////////////////////////////////////////////////////////////////////////////////////////////
// import 'dart:ui';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:md_health/Screens/MdBooking/md_booking_payment/view/md_booking_home_view.dart';
// import 'package:md_health/Screens/bottom_navigation/controller/bottom_controller.dart';
// import 'package:md_health/Screens/bottom_navigation/view/bottom_view.dart';
// import 'package:md_health/Screens/diet_plan/view/diet_plan_view.dart';
// import 'package:md_health/Screens/home/view/home_section_two.dart';
// import 'package:md_health/Screens/home/view/home_view.dart';
// import 'package:md_health/Screens/md_shop_home_page/view/md_shop_home_page.dart';
// import 'package:md_health/constants/styles/colors.dart';
// import 'package:md_health/constants/styles/textstyle.dart';
// import 'package:md_health/test_widget.dart';
// import 'package:md_health/widget/couldnt_find_treatent_box.dart';
// import 'package:md_health/widget/drawer.dart';
// import 'package:provider/provider.dart';

// class DiscoverView extends StatelessWidget {
//   const DiscoverView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final ScaffoldState? scaffoldState = Scaffold.maybeOf(context);
//     final read = context.read<NewMainScreenController>();
//     final watch = context.watch<NewMainScreenController>();
//     // final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
//     return
//         // Scaffold(
//         // // key: scaffoldKey.currentState.openDrawer(),
//         // drawer: AppDrawer(),
//         // floatingActionButton: Builder(
//         //   builder: (context) {
//         //     return FloatingActionButton(
//         //       onPressed: () => scaffoldState?.openDrawer(),
//         //     );
//         //   },
//         // ),
//         // backgroundColor: Colors.black,
//         // // appBar: CustomAppBar(
//         // //   hasHiText: true,
//         // // ),
//         // body:
//         SingleChildScrollView(
//       child: Column(
//         children: [
//           Stack(
//             children: [
//               Positioned(
//                 child: _circle(),
//                 bottom: -5,
//                 right: -5,
//               ),
//               BackdropFilter(
//                 filter: ImageFilter.blur(sigmaX: 100, sigmaY: 50),
//                 child: Container(
//                   color: Colors.transparent,
//                 ),
//               ),
//               Column(
//                 children: [
//                   Center(
//                     child: Padding(
//                       padding: EdgeInsets.only(top: 30.h),
//                       child: Text(
//                         "DISCOVER THE",
//                         style: TextStyle(
//                             color: const Color(0xff4CDB06),
//                             fontSize: 29.sp,
//                             fontFamily: 'Campton',
//                             fontWeight: FontWeight.w700),
//                       ),
//                     ),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.only(bottom: 20.h),
//                     child: Text(
//                       "MD",
//                       style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 79.sp,
//                           fontFamily: 'Campton',
//                           fontWeight: FontWeight.w700),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//           Container(
//             color: Colors.white,
//             padding: EdgeInsets.symmetric(vertical: 40.h),
//             child: Column(
//               children: [
//                 GestureDetector(
//                   onTap: () {
//                     read.onHomeScreenPress();
//                   },
//                   child: Container(
//                       padding: EdgeInsets.only(left: 24.w, right: 24.w),
//                       child: const Image(
//                           image: AssetImage("assets/images/Group 8.png"))),
//                 ),
//                 // DiscoverWidget(
//                 //   onTap: () {
//                 //     // Navigator.push(
//                 //     //   context,
//                 //     // SlidePageRoute(
//                 //     //   page: NewMainScreenView(),
//                 //     //   direction: SlideDirection.right,
//                 //     //   delay: Duration(milliseconds: 5000),
//                 //     // ),
//                 //     // );
//                 //     print("4515747841");
//                 //     read.onHomeScreenPress();
//                 //     // Navigator.push(context,
//                 //     //     MaterialPageRoute(builder: (context) => HomeView()));
//                 //     // context.watch<MainScreenController>().setCurrentScreen(0);
//                 //   },
//                 //   topWidget: RichText(
//                 //     text: TextSpan(
//                 //       style: TextStyle(
//                 //           fontFamily: 'Campton',
//                 //           color: Colors.black,
//                 //           fontSize: 18.sp,
//                 //           letterSpacing: -1,
//                 //           fontWeight: FontWeight.w500),
//                 //       children: <TextSpan>[
//                 //         TextSpan(
//                 //           text: 'Find your\n',
//                 //           style: TextStyle(
//                 //               fontSize: 20.sp,
//                 //               letterSpacing: 0,
//                 //               fontWeight: FontWeight.w400),
//                 //         ),
//                 //         TextSpan(
//                 //           text: 'treatment',
//                 //           style: TextStyle(
//                 //             fontWeight: FontWeight.w400,
//                 //             fontSize: 20.sp,
//                 //             color: kDefaultActiveColor,
//                 //           ),
//                 //         ),
//                 //         TextSpan(text: ' & '),
//                 //         TextSpan(
//                 //           text: 'medical tourism',
//                 //           style: TextStyle(
//                 //             fontWeight: FontWeight.w700,
//                 //             fontSize: 20.sp,
//                 //             color: kDefaultActiveColor,
//                 //           ),
//                 //         ),
//                 //       ],
//                 //     ),
//                 //   ),
//                 //   mdTitle: 'health',
//                 //   image: 'assets/images/image_36.png',
//                 //   imageWidth: 90,
//                 //   imageHeight: 120,
//                 //   // topWidgetHeight: 115,
//                 // ),
//                 SizedBox(
//                   height: 20.h,
//                 ),
//                 // DiscoverWidget(
//                 //   onTap: () {
//                 //     Navigator.push(
//                 //       context,
//                 //       SlidePageRoute(
//                 //         page: DietPlanView(),
//                 //         direction: SlideDirection.right,
//                 //         delay: Duration(milliseconds: 5000),
//                 //       ),
//                 //     );
//                 //     // Navigator.push(
//                 //     //     context,
//                 //     //     MaterialPageRoute(
//                 //     //         builder: (context) => DietPlanView()));
//                 //   },
//                 //   topWidget: RichText(
//                 //     text: TextSpan(
//                 //       style: TextStyle(
//                 //           fontFamily: 'Campton',
//                 //           color: Colors.black,
//                 //           fontSize: 25.sp,
//                 //           // letterSpacing: -2,/
//                 //           fontWeight: FontWeight.w700),
//                 //       children: <TextSpan>[
//                 //         TextSpan(
//                 //           text: 'PLAN YOUR\n',
//                 //           style: TextStyle(
//                 //               fontSize: 20.sp,
//                 //               letterSpacing: 0,
//                 //               fontWeight: FontWeight.w400),
//                 //         ),
//                 //         const TextSpan(
//                 //           text: 'DIET MEAL ',
//                 //           style: TextStyle(
//                 //             fontFamily: 'Campton',
//                 //             color: kDefaultActiveColor,
//                 //           ),
//                 //         ),
//                 //         const TextSpan(
//                 //           text: 'NOW!',
//                 //         ),
//                 //       ],
//                 //     ),
//                 //   ),
//                 //   mdTitle: 'food',
//                 //   image: 'assets/images/image_41.png',
//                 //   imageWidth: 91,
//                 //   imageHeight: 87,
//                 //   topWidgetHeight: 115,
//                 // ),
//                 GestureDetector(
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       SlidePageRoute(
//                         page: const DietPlanView(),
//                         direction: SlideDirection.right,
//                         delay: const Duration(milliseconds: 5000),
//                       ),
//                     );
//                   },
//                   child: Container(
//                       padding: EdgeInsets.only(left: 24.w, right: 24.w),
//                       child: const Image(
//                           image: AssetImage("assets/images/Group 11.png"))),
//                 ),

//                 SizedBox(
//                   height: 20.h,
//                 ),
//                 GestureDetector(
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       SlidePageRoute(
//                         page: const MdShopHomePageView(),
//                         direction: SlideDirection.right,
//                         delay: const Duration(milliseconds: 5000),
//                       ),
//                     );
//                   },
//                   child: Container(
//                       padding: EdgeInsets.only(left: 24.w, right: 24.w),
//                       child: const Image(
//                           image: AssetImage("assets/images/Group 14.png"))),
//                 ),
//                 // DiscoverWidget(Group 1000003442
//                 //   onTap: () {
//                 // Navigator.push(
//                 //   context,
//                 //   SlidePageRoute(
//                 //     page: MdShopHomePageView(),
//                 //     direction: SlideDirection.right,
//                 //     delay: Duration(milliseconds: 5000),
//                 //   ),
//                 // );
//                 //     // Navigator.push(
//                 //     //     context,
//                 //     //     MaterialPageRoute(
//                 //     //         builder: (context) => MdShopHomePageView()));
//                 //   },
//                 //   topWidget: RichText(
//                 //     text: TextSpan(
//                 //       style: TextStyle(
//                 //           fontFamily: 'Campton',
//                 //           color: Colors.black,
//                 //           fontSize: 18.sp,
//                 //           letterSpacing: -1,
//                 //           fontWeight: FontWeight.w500),
//                 //       children: <TextSpan>[
//                 //         TextSpan(
//                 //           text: 'YOUR MEDICAL NEEDS\n',
//                 //           style: TextStyle(
//                 //               fontSize: 20.sp,
//                 //               letterSpacing: 0,
//                 //               fontWeight: FontWeight.w400),
//                 //         ),
//                 //         const TextSpan(
//                 //           text: 'ON MDSHOP!',
//                 //           style: TextStyle(
//                 //             color: kDefaultActiveColor,
//                 //           ),
//                 //         ),
//                 //       ],
//                 //     ),
//                 //   ),
//                 //   mdTitle: 'shop',
//                 //   image: 'assets/images/MASKE.png',
//                 //   imageWidth: 120,
//                 //   imageHeight: 90,
//                 //   // padding: EdgeInsets.only(top:5.sp, right: 0),
//                 //   topWidgetHeight: 115,
//                 // ),
//                 SizedBox(
//                   height: 20.h,
//                 ),
//                 GestureDetector(
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       SlidePageRoute(
//                         page: const MdBookingHomeView(),
//                         direction: SlideDirection.right,
//                         delay: const Duration(milliseconds: 5000),
//                       ),
//                     );
//                   },
//                   child: Container(
//                       padding: EdgeInsets.only(left: 24.w, right: 24.w),
//                       child: const Image(
//                           image: AssetImage("assets/images/Group 13.png"))),
//                 ),
//                 // DiscoverWidget(
//                 //   onTap: () => Navigator.push(
//                 //     context,
//                 //     SlidePageRoute(
//                 //       page: MdBookingHomeView(),
//                 //       direction: SlideDirection.right,
//                 //       delay: Duration(milliseconds: 5000),
//                 //     ),
//                 //   ),
//                 //   //  Navigator.push(
//                 //   //     context,
//                 //   //     MaterialPageRoute(
//                 //   //         builder: (context) => MdBookingHomeView())),
//                 //   topWidget: RichText(
//                 //     text: TextSpan(
//                 //       style: TextStyle(
//                 //           fontFamily: 'Campton',
//                 //           color: Colors.black,
//                 //           fontSize: 22.sp,
//                 //           letterSpacing: -1,
//                 //           fontWeight: FontWeight.w700),
//                 //       children: <TextSpan>[
//                 //         TextSpan(
//                 //           text: 'BOOK RELIABLE & AFFORDABLE\n',
//                 //           style: TextStyle(
//                 //               fontSize: 15.sp,
//                 //               letterSpacing: -1,
//                 //               fontWeight: FontWeight.w400),
//                 //         ),
//                 //         const TextSpan(
//                 //           text: 'HOTEL',
//                 //         ),
//                 //         TextSpan(
//                 //           text: ' / ',
//                 //           style: TextStyle(
//                 //             color: kDefaultActiveColor,
//                 //           ),
//                 //         ),
//                 //         const TextSpan(
//                 //           text: 'FLIGHT',
//                 //         ),
//                 //         TextSpan(
//                 //           text: ' / ',
//                 //           style: TextStyle(
//                 //             color: kDefaultActiveColor,
//                 //           ),
//                 //         ),
//                 //         const TextSpan(
//                 //           text: 'VEHICLE',
//                 //         ),
//                 //       ],
//                 //     ),
//                 //   ),
//                 //   mdTitle: 'booking',
//                 //   image: 'assets/images/image_37.png',
//                 //   imageWidth: 179.6,
//                 //   imageHeight: 58.09,
//                 //   topWidgetHeight: 110,
//                 //   margin: EdgeInsets.only(right: 15, left: 30),
//                 // ),
//                 Padding(
//                   padding: EdgeInsets.only(bottom: 50.w),
//                 ),
//               ],
//             ),
//           )
//         ],
//       ),
//       // ),
//     );
//   }
// }

// class DiscoverWidget extends StatelessWidget {
//   final Widget? topWidget;
//   final String? mdTitle;
//   final String? image;
//   final double? imageHeight;
//   final double? imageWidth;
//   final double? topWidgetHeight;
//   final VoidCallback? onTap;
//   final EdgeInsetsGeometry? margin;
//   // final EdgeInsetsGeometry? padding;
//   const DiscoverWidget({
//     super.key,
//     required this.topWidget,
//     required this.image,
//     this.mdTitle,
//     this.imageHeight,
//     this.imageWidth,
//     this.topWidgetHeight,
//     this.onTap,
//     this.margin,
//     // this.padding,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap ?? () {},
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.end,
//         children: [
//           CouldntFindTreatmentBox(
//               TopWidgetChild: topWidget,
//               backgroundColor: Colors.black,
//               pngImage: image,
//               widgetChild: Container(
//                 // color: Colors.green,
//                 padding: EdgeInsets.only(top: 5.h),
//                 alignment: Alignment.centerLeft,
//                 child: Column(
//                   children: [
//                     SvgPicture.asset(
//                       'assets/icons/Group_12.svg',
//                     ),
//                     MdRichTextWidget(
//                       fontSize: 16,
//                       mdTitle: mdTitle ?? 'health',
//                     )
//                   ],
//                 ),
//               ),
//               height: 65,
//               borderRadius: 10,
//               imageHeight: imageHeight ?? 120,
//               imageWidth: imageWidth,
//               topWidgetHeight: topWidgetHeight,
//               padding: EdgeInsets.fromLTRB(15.w, 0, 15.w, 0),
//               margin: margin

//               // margin: EdgeInsets.symmetric(horizontal: 5),
//               // top
//               ),
//           Container(
//             margin: EdgeInsets.symmetric(horizontal: 40.sp),
//             child: Text(
//               'Go to App >',
//               style: TextStyle(
//                   fontFamily: 'Campton',
//                   color: Colors.black,
//                   fontSize: 13.sp,
//                   fontWeight: FontWeight.w600),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }

// Widget _circle() {
//   return Container(
//     height: 75,
//     width: 75,
//     decoration: const BoxDecoration(
//       shape: BoxShape.circle,
//       color: Color(0xff4CDB06),
//     ),
//   );
// }
