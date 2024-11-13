// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:md_health/Screens/MdBooking/empty/hotel_search_view.dart';
// import 'package:md_health/Screens/MdBooking/md_booking_payment/view/md_booking_home_view.dart';
// import 'package:md_health/Screens/MdBooking/md_booking_payment/view/md_booking_payment_view_two.dart';
// import 'package:md_health/constants/styles/colors.dart';
// import 'package:md_health/test_widget.dart';
// import 'package:md_health/widget/base_screen.dart';
// import 'package:md_health/widget/buttons.dart';
// import 'package:md_health/widget/custom_appbar.dart';

// class MDBookingPaymentView extends StatefulWidget {
//   const MDBookingPaymentView({super.key});

//   @override
//   State<MDBookingPaymentView> createState() => _MDBookingPaymentViewState();
// }

// class _MDBookingPaymentViewState extends State<MDBookingPaymentView> {
//   @override
//   Widget build(BuildContext context) {
//     return BaseScreen(
//         onWillPop: () async {
//           // Navigator.pushReplacement(
//           //   context,
//           //   SlidePageRoute(
//           //     page: PackageDetailView(
//           //       type: widget.type,
//           //       purchesId: watch.purchesId,
//           //       packageId: watch.packageId,
//           //     ),
//           //     direction: SlideDirection.left, // Specify the slide direction here
//           //     delay: Duration(milliseconds: 5000),
//           //   ),
//           // );

//           return false;
//         },
//         backgroundColor: Color(0xffF5F5F5),
//         appBar: PreferredSize(
//           preferredSize: Size.fromHeight(120.w),
//           child: CustomAppBar(
//             onBackPressed: () {
//               Navigator.push(
//                 context,
//                 SlidePageRoute(
//                   page: MdBookingHomeView(),
//                   direction: SlideDirection.left,
//                   delay: Duration(milliseconds: 5000),
//                 ),
//                 // MaterialPageRoute(
//                 //     builder: (context) => MDBookingPaymentView()),
//               );
//             },
//             hasCartIcon: true,
//             hasBackButton: true,
//             // hasMdTitle: true,
//             mdTitle: "booking",
//             // drawerTitle: "Orders",
//           ),
//         ),
//         content: Column(
//           children: [
//             SizedBox(
//               height: 26.h,
//             ),
//             Text(
//               "Payment Details",
//               style: TextStyle(
//                   fontFamily: 'Campton',
//                   color: Color(0xff4CDB06),
//                   fontSize: 29.sp,
//                   fontWeight: FontWeight.w700),
//             ),
//             Text(
//               "Clear the Cart",
//               style: TextStyle(
//                   decoration: TextDecoration.underline,
//                   fontFamily: 'Campton',
//                   color: Color(0xffF31D1D),
//                   fontSize: 16.sp,
//                   fontWeight: FontWeight.w700),
//             ),
//             Container(
//               margin: EdgeInsets.only(top: 37.w, left: 25, right: 25.w),
//               padding: EdgeInsets.only(
//                   top: 10.w, left: 16, bottom: 12.w, right: 9.w),
//               decoration: BoxDecoration(
//                   color: Colors.white, borderRadius: BorderRadius.circular(10)),
//               child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.end,
//                   // mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     Row(
//                       // crossAxisAlignment: CrossAxisAlignment.end,
//                       // mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Expanded(
//                           child: Column(
//                             // mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             // crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Row(
//                                 crossAxisAlignment: CrossAxisAlignment.center,
//                                 children: [
//                                   Text(
//                                     "Stockholm",
//                                     style: TextStyle(
//                                         fontFamily: 'Campton',
//                                         color: Colors.black,
//                                         fontSize: 18.sp,
//                                         fontWeight: FontWeight.w400),
//                                   ),
//                                   Expanded(
//                                     child: Column(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.center,
//                                       children: [
//                                         SvgPicture.asset(
//                                           "assets/icons/Group 12.svg",
//                                           width: 80.w,
//                                         ),
//                                         SizedBox(
//                                           height: 5.h,
//                                         ),
//                                         Text(
//                                           "2 Hour 10 Min",
//                                           style: TextStyle(
//                                               fontFamily: 'Campton',
//                                               color: Colors.black,
//                                               fontSize: 14.sp,
//                                               fontWeight: FontWeight.w500),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                   Text(
//                                     "Stockholm",
//                                     style: TextStyle(
//                                         fontFamily: 'Campton',
//                                         color: Colors.black,
//                                         fontSize: 18.sp,
//                                         fontWeight: FontWeight.w400),
//                                   ),
//                                 ],
//                               ),
//                               Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 crossAxisAlignment: CrossAxisAlignment.center,
//                                 children: [
//                                   Text(
//                                     "ARN",
//                                     style: TextStyle(
//                                         fontFamily: 'Campton',
//                                         color: Colors.black,
//                                         fontSize: 26.sp,
//                                         fontWeight: FontWeight.w700),
//                                   ),
//                                   Text(
//                                     "Direct Flight",
//                                     style: TextStyle(
//                                         fontFamily: 'Campton',
//                                         color: Color(0xff4CDB06),
//                                         fontSize: 15.sp,
//                                         fontWeight: FontWeight.w500),
//                                   ),
//                                   Text(
//                                     "IST",
//                                     style: TextStyle(
//                                         fontFamily: 'Campton',
//                                         color: Colors.black,
//                                         fontSize: 26.sp,
//                                         fontWeight: FontWeight.w700),
//                                   ),
//                                 ],
//                               ),
//                               SizedBox(
//                                 height: 2.h,
//                               ),
//                               Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 // crossAxisAlignment: CrossAxisAlignment.center,
//                                 children: [
//                                   Text(
//                                     "18:20",
//                                     style: TextStyle(
//                                         fontFamily: 'Campton',
//                                         color: Color(0xff4CDB06),
//                                         fontSize: 17.sp,
//                                         fontWeight: FontWeight.w600),
//                                   ),
//                                   // SizedBox(
//                                   //   width: 2.w,
//                                   // ),
//                                   Container(
//                                     padding: const EdgeInsets.only(left: 20.0),
//                                     child: Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.center,
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.center,
//                                       children: [
//                                         SvgPicture.asset(
//                                             "assets/icons/Vector (1).svg"),
//                                         // SizedBox(
//                                         //   width: 10.w,
//                                         // ),
//                                         Text(
//                                           "  1 x 15 KG",
//                                           style: TextStyle(
//                                               fontFamily: 'Campton',
//                                               color: black,
//                                               fontSize: 15.sp,
//                                               fontWeight: FontWeight.w400),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                   Text(
//                                     "20:30",
//                                     style: TextStyle(
//                                         fontFamily: 'Campton',
//                                         color: Color(0xffF31D1D),
//                                         fontSize: 17.sp,
//                                         fontWeight: FontWeight.w600),
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                     SizedBox(
//                       height: 12.h,
//                     ),
//                     Text(
//                       "Delete Products",
//                       style: TextStyle(
//                           decoration: TextDecoration.underline,
//                           fontFamily: 'Campton',
//                           color: Color(0xffF31D1D),
//                           fontSize: 10.sp,
//                           fontWeight: FontWeight.w600),
//                     ),
//                   ]),
//             ),
//             Container(
//               margin: EdgeInsets.only(left: 25.w, top: 19.w, right: 25.w),
//               decoration: BoxDecoration(
//                   color: Color(0xffFFFFFF),
//                   borderRadius: BorderRadius.circular(10),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.black.withOpacity(0.10),
//                       // offset: Offset(2, 2),
//                       blurRadius: 20,
//                     ),
//                   ]),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Container(
//                     padding:
//                         EdgeInsets.only(left: 26.w, top: 20.w, right: 26.w),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text(
//                           "Products",
//                           style: TextStyle(
//                               // decoration: TextDecoration.underline,
//                               fontFamily: 'Campton',
//                               color: Color(0xff9B9B9B),
//                               // letterSpacing: .5,
//                               fontSize: 14.sp,
//                               fontWeight: FontWeight.w400),
//                         ),
//                         Text(
//                           "299,99 ₺",
//                           style: TextStyle(
//                               // decoration: TextDecoration.underline,
//                               fontFamily: 'Campton',
//                               color: black,
//                               // letterSpacing: .5,
//                               fontSize: 14.sp,
//                               fontWeight: FontWeight.w500),
//                         )
//                       ],
//                     ),
//                   ),
//                   SizedBox(
//                     height: 5.h,
//                   ),
//                   Container(
//                     padding: EdgeInsets.only(left: 26.w, right: 26.w),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text(
//                           "Products",
//                           style: TextStyle(
//                               // decoration: TextDecoration.underline,
//                               fontFamily: 'Campton',
//                               color: Color(0xff9B9B9B),
//                               // letterSpacing: .5,
//                               fontSize: 14.sp,
//                               fontWeight: FontWeight.w400),
//                         ),
//                         RichText(
//                           // textAlign: TextAlign.start,
//                           text: TextSpan(
//                             text: "FREE",
//                             style: TextStyle(
//                                 fontFamily: 'Campton',
//                                 color: Color(0xff4CDB06),
//                                 fontSize: 14.sp,
//                                 fontWeight: FontWeight.w700),

//                             /*defining default style is optional */
//                             children: <TextSpan>[
//                               TextSpan(
//                                 text: "   379,00 ₺",
//                                 style: TextStyle(
//                                     fontFamily: 'Campton',
//                                     color: Colors.black,
//                                     fontSize: 14.sp,
//                                     fontWeight: FontWeight.w500),
//                               )
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(
//                     height: 16.h,
//                   ),
//                   Container(
//                     padding:
//                         EdgeInsets.only(right: 12.w, top: 16.w, bottom: 15.w),
//                     width: ScreenUtil().screenWidth,
//                     color: Colors.black,
//                     child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.end,
//                         children: [
//                           Text(
//                             "invite your friends",
//                             style: TextStyle(
//                                 // decoration: TextDecoration.underline,
//                                 fontFamily: 'Campton',
//                                 color: Colors.white,
//                                 // letterSpacing: .5,
//                                 fontSize: 20.sp,
//                                 fontWeight: FontWeight.w500),
//                           ),
//                           RichText(
//                             // textAlign: TextAlign.start,
//                             text: TextSpan(
//                               text: "and",
//                               style: TextStyle(
//                                   fontFamily: 'Campton',
//                                   color: Colors.white,
//                                   fontSize: 25.sp,
//                                   fontWeight: FontWeight.w500),

//                               /*defining default style is optional */
//                               children: <TextSpan>[
//                                 TextSpan(
//                                   text: " earn",
//                                   style: TextStyle(
//                                       fontFamily: 'Campton',
//                                       color: Color(0xff4CDB06),
//                                       fontSize: 25.sp,
//                                       fontWeight: FontWeight.w500),
//                                 ),
//                                 TextSpan(
//                                   text: " MD",
//                                   style: TextStyle(
//                                       fontFamily: 'Campton',
//                                       color: Color(0xff4CDB06),
//                                       fontSize: 27.sp,
//                                       fontWeight: FontWeight.w700),
//                                 ),
//                                 TextSpan(
//                                   text: "coin.",
//                                   style: TextStyle(
//                                       fontFamily: 'Campton',
//                                       color: Colors.white,
//                                       fontSize: 20.sp,
//                                       fontWeight: FontWeight.w500),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ]),
//                   ),
//                   SizedBox(
//                     height: 14.h,
//                   ),
//                   Padding(
//                     padding: EdgeInsets.only(left: 26.w, right: 26.w),
//                     child: Text(
//                       "Total Price",
//                       style: TextStyle(
//                           // decoration: TextDecoration.underline,
//                           fontFamily: 'Campton',
//                           color: Color(0xff4CDB06),
//                           // letterSpacing: .5,
//                           fontSize: 18.sp,
//                           fontWeight: FontWeight.w600),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 3.h,
//                   ),
//                   Padding(
//                     padding: EdgeInsets.only(left: 26.w, right: 26.w),
//                     child: Text(
//                       "299,99 ₺",
//                       style: TextStyle(
//                           // decoration: TextDecoration.underline,
//                           fontFamily: 'Campton',
//                           color: black,
//                           // letterSpacing: .5,
//                           fontSize: 28.sp,
//                           fontWeight: FontWeight.w700),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 12.w,
//                   )
//                 ],
//               ),
//             ),
//             SizedBox(
//               height: 21.w,
//             ),
//             Container(
//               margin: EdgeInsets.only(left: 20.w, right: 20.w),
//               child: Text(
//                 "Read and confirm the agreement.",
//                 style: TextStyle(
//                     // decoration: TextDecoration.underline,
//                     fontFamily: 'Campton',
//                     color: Color(0xff4CDB06),
//                     // letterSpacing: .5,
//                     fontSize: 18.sp,
//                     fontWeight: FontWeight.w700),
//               ),
//             ),
//             SizedBox(
//               height: 22.w,
//             ),
//             Card(
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(15.0),
//                 ),
//                 margin: EdgeInsets.only(left: 26.w, right: 26.w),
//                 child: Container(
//                     padding: EdgeInsets.only(
//                         left: 22.w, top: 20.w, bottom: 26.w, right: 17.w),
//                     decoration: BoxDecoration(
//                         color: Color(0xffFFFFFF),
//                         // borderRadius: BorderRadius.circular(10),
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.black.withOpacity(0.10),
//                             // offset: Offset(2, 2),
//                             blurRadius: 20,
//                           ),
//                         ]),
//                     child: Column(children: [
//                       Text(
//                         "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
//                         style: TextStyle(
//                             // decoration: TextDecoration.underline,
//                             fontFamily: 'Campton',
//                             color: black,
//                             // letterSpacing: .5,
//                             fontSize: 16.sp,
//                             fontWeight: FontWeight.w400),
//                       ),
//                       SizedBox(
//                         height: 23.w,
//                       ),
//                       Row(
//                         children: [
//                           SvgPicture.asset("assets/icons/Ellipse 9.svg"),
//                           SizedBox(
//                             width: 10.w,
//                           ),
//                           Text(
//                             '"Read and approved."',
//                             style: TextStyle(
//                                 // decoration: TextDecoration.underline,
//                                 fontFamily: 'Campton',
//                                 color: black,
//                                 // letterSpacing: .5,
//                                 fontSize: 17.sp,
//                                 fontWeight: FontWeight.w600),
//                           ),
//                         ],
//                       ),
//                     ]))),
//             SizedBox(
//               height: 56.h,
//             ),
//             PrimaryButton(
//               width: 310.w,
//               // borderRadius: BorderRadius.circular(),
//               height: 40.h,
//               borderRadius: 30,
//               // width: ScreenUtil().screenWidth,
//               color: Color(0xff4CDB06),
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   SlidePageRoute(
//                     page: MDBookingPAymentTwo(),
//                     direction: SlideDirection.right,
//                     delay: Duration(milliseconds: 5000),
//                   ),
//                   // MaterialPageRoute(
//                   //     builder: (context) => MDBookingPAymentTwo()),
//                 );
//                 // Navigator.push(
//                 //   context,
//                 //   MaterialPageRoute(builder: (context) => LoginScreenView()),
//                 // );
//               },
//               child: Text(
//                 "Next Step",
//                 style: TextStyle(
//                     fontFamily: 'Campton',
//                     color: Colors.white,
//                     fontSize: 19.sp,
//                     fontWeight: FontWeight.w700),
//               ),
//             ),
//             SizedBox(
//               height: 100.w,
//             ),
//           ],
//         ));
//   }
// }
