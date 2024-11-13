// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:md_health/Screens/MdBooking/md_booking_payment/view/md_booking_payment_view.dart';
// import 'package:md_health/Screens/payment/view/payment_view.dart';
// import 'package:md_health/constants/styles/colors.dart';
// import 'package:md_health/test_widget.dart';
// import 'package:md_health/widget/base_screen.dart';
// import 'package:md_health/widget/custom_appbar.dart';
// import 'package:md_health/widget/drop_down.dart';
// import 'package:md_health/widget/text_field.dart';

// class MDBookingPAymentTwo extends StatefulWidget {
//   const MDBookingPAymentTwo({super.key});

//   @override
//   State<MDBookingPAymentTwo> createState() => _MDBookingPAymentTwoState();
// }

// class _MDBookingPAymentTwoState extends State<MDBookingPAymentTwo> {
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
//           preferredSize: Size.fromHeight(125.w),
//           child: CustomAppBar(
//             onBackPressed: () {
//               Navigator.push(
//                 context,
//                 SlidePageRoute(
//                   page: MDBookingPaymentView(),
//                   direction: SlideDirection.right,
//                   delay: Duration(milliseconds: 5000),
//                 ),
//                 // MaterialPageRoute(
//                 //     builder: (context) => MDBookingPAymentTwo()),
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
//           //   crossAxisAlignment: CrossAxisAlignment.center,
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
//             SizedBox(
//               height: 28.h,
//             ),
//             Container(
//               padding: EdgeInsets.only(
//                 left: 25.w,
//               ),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   Text(
//                     "Contact Details",
//                     style: TextStyle(
//                         fontFamily: 'Campton',
//                         color: Color(0xff4CDB06),
//                         fontSize: 20.sp,
//                         fontWeight: FontWeight.w700),
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(
//               height: 9.h,
//             ),
//             Container(
//               margin: EdgeInsets.only(left: 26.w, right: 26.w),
//               padding: EdgeInsets.only(
//                   left: 13.w, bottom: 29.w, top: 30.w, right: 13.w),
//               decoration: BoxDecoration(
//                   color: Colors.white, borderRadius: BorderRadius.circular(10)),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   PrimaryInformationTextFormFieldNew(
//                     borderColor: Color(0xffEDEDED),
//                     // width: 48.w,
//                     titleHeader: "*E-mail Address",
//                     hintText: "Your e-mail address",
//                   ),
//                   SizedBox(
//                     height: 23.h,
//                   ),
//                   PrimaryInformationTextFormFieldNew(
//                     // width: 48.w,
//                     borderColor: Color(0xffEDEDED),
//                     titleHeader: "*Mobile Phone",
//                     hintText: "Mobile Phone Number",
//                   ),
//                   SizedBox(
//                     height: 41.h,
//                   ),
//                   Text(
//                     "*We will send you your flight and ticket\n information via e-mail and free SMS.",
//                     style: TextStyle(
//                         fontStyle: FontStyle.italic,
//                         fontFamily: 'Campton',
//                         color: Color(0xff979797),
//                         fontSize: 16.sp,
//                         fontWeight: FontWeight.w400),
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(
//               height: 28.h,
//             ),
//             Container(
//               padding: EdgeInsets.only(
//                 left: 25.w,
//               ),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   Text(
//                     "1. Adult",
//                     style: TextStyle(
//                         fontFamily: 'Campton',
//                         color: Color(0xff4CDB06),
//                         fontSize: 20.sp,
//                         fontWeight: FontWeight.w700),
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(
//               height: 9.h,
//             ),
//             Container(
//               margin: EdgeInsets.only(left: 26.w, right: 26.w),
//               padding: EdgeInsets.only(
//                   left: 13.w, bottom: 29.w, top: 30.w, right: 13.w),
//               decoration: BoxDecoration(
//                   color: Colors.white, borderRadius: BorderRadius.circular(10)),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   PrimaryInformationTextFormFieldNew(
//                     borderColor: Color(0xffEDEDED),
//                     // width: 48.w,
//                     titleHeader: "*First Name ",
//                     hintText: "First Name ",
//                   ),
//                   SizedBox(
//                     height: 23.h,
//                   ),
//                   PrimaryInformationTextFormFieldNew(
//                     // width: 48.w,
//                     borderColor: Color(0xffEDEDED),
//                     titleHeader: "*Last Name",
//                     hintText: "Last Name",
//                   ),
//                   SizedBox(
//                     height: 23.h,
//                   ),
//                   PrimaryInformationTextFormFieldNew(
//                     // width: 48.w,
//                     borderColor: Color(0xffEDEDED),
//                     titleHeader: "*TC ID Number",
//                     hintText: "TCKN",
//                   ),
//                   SizedBox(
//                     height: 23.h,
//                   ),
//                   Row(
//                     children: [
//                       SvgPicture.asset("assets/icons/Ellipse 9.svg"),
//                       SizedBox(
//                         width: 10.w,
//                       ),
//                       Text(
//                         '"Not a Turkish Citizen."',
//                         style: TextStyle(
//                             // decoration: TextDecoration.underline,
//                             fontFamily: 'Campton',
//                             color: black,
//                             // letterSpacing: .5,
//                             fontSize: 17.sp,
//                             fontWeight: FontWeight.w600),
//                       ),
//                     ],
//                   ),
//                   SizedBox(
//                     height: 23.h,
//                   ),
//                   PrimaryInformationTextFormFieldNew(
//                     // width: 48.w,
//                     borderColor: Color(0xffEDEDED),
//                     titleHeader: "*Patient Birth Date",
//                     hintText: "Birth Date",
//                   ),
//                   SizedBox(
//                     height: 23.h,
//                   ),
//                   PrimaryInformationTextFormFieldNew(
//                     // width: 48.w,
//                     borderColor: Color(0xffEDEDED),
//                     titleHeader: "*Patient Birth Date",
//                     hintText: "Birth Date",
//                   ),
//                   SizedBox(
//                     height: 23.h,
//                   ),
//                   PrimaryInformationTextFormFieldNew(
//                     // width: 48.w,
//                     borderColor: Color(0xffEDEDED),
//                     titleHeader: "*Gender",
//                     hintText: "Choose",
//                   ),
//                   SizedBox(
//                     height: 23.h,
//                   ),
//                   // SDropDownField(
//                   //   borderColor: Color(0xffEDEDED),
//                   //   titleHeader: "*Patient Country",
//                   //   onChanged: (value) {
//                   //     // read.onSelectAccountType(value);
//                   //   },
//                   //   hint: "Country",
//                   //   items: [
//                   //     DropdownMenuItem(
//                   //       value: "current",
//                   //       child: Text(
//                   //         "Current",
//                   //         style: TextStyle(
//                   //           fontSize: 14.sp,
//                   //         ),
//                   //       ),
//                   //     ),
//                   //     DropdownMenuItem(
//                   //       value: "saving",
//                   //       child: Text(
//                   //         "Saving",
//                   //         style: TextStyle(
//                   //           fontSize: 14.sp,
//                   //         ),
//                   //       ),
//                   //     )
//                   //   ],
//                   // ),
//                   SizedBox(
//                     height: 41.h,
//                   ),

//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: [
//                       Text(
//                         "Allowed Luggage Capacity",
//                         style: TextStyle(
//                             letterSpacing: -2,
//                             fontFamily: 'Campton',
//                             color: Color(0xff979797),
//                             fontSize: 16.sp,
//                             fontWeight: FontWeight.w400),
//                       ),
//                       SizedBox(
//                         width: 10.h,
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           SvgPicture.asset(
//                             "assets/icons/Vector (1).svg",
//                             width: 12.w,
//                             height: 12.w,
//                           ),
//                           // SizedBox(
//                           //   width: 10.w,
//                           // ),
//                           Text(
//                             "  1 x 15 KG",
//                             style: TextStyle(
//                                 fontFamily: 'Campton',
//                                 color: black,
//                                 fontSize: 14.sp,
//                                 fontWeight: FontWeight.w400),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(
//               height: 15.h,
//             ),
//             Container(
//               padding: EdgeInsets.only(left: 25.w),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   Text(
//                     'Pay Via',
//                     style: TextStyle(
//                         fontFamily: 'Campton',
//                         fontSize: 19,
//                         color: kDefaultActiveColor,
//                         fontWeight: FontWeight.w700,
//                         letterSpacing: -1),
//                   ),
//                 ],
//               ),
//             ),
//             // Padding(
//             //   padding: EdgeInsets.only(
//             //     left: 34.w,
//             //     top: 10.w,
//             //   ),
//             // child: Text(
//             //   'Pay Via',
//             //   style: TextStyle(
//             //       fontFamily: 'Campton',
//             //       fontSize: 19,
//             //       color: kDefaultActiveColor,
//             //       fontWeight: FontWeight.w700,
//             //       letterSpacing: -1),
//             // ),
//             // ),
//             Container(
//               padding: EdgeInsets.only(left: 18.w, right: 18.w, bottom: 26.w),
//               child: Column(
//                 children: [
//                   GestureDetector(
//                     onTap: () {
//                       Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => PaymentView()));
//                     },
//                     child: SvgPicture.asset(
//                       'assets/icons/Group_9.svg',
//                       height: 92.h,
//                       width: 394.w,
//                     ),
//                   ),
//                   GestureDetector(
//                     onTap: () {
//                       // _showDialog();
//                     },
//                     child: SvgPicture.asset(
//                       'assets/icons/Group_7.svg',
//                       height: 92.h,
//                       width: 394.w,
//                     ),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.only(bottom: 100.w),
//                     child: GestureDetector(
//                       onTap: () {
//                         // _showDialog();
//                       },
//                       child: SvgPicture.asset(
//                         'assets/icons/Group_8.svg',
//                         height: 92.h,
//                         width: 394.w,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             // SizedBox(
//             //   height: 100.h,
//             // ),
//           ],
//         ));
//   }
// }
