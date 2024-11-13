// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:md_health/Screens/reservation/controller/reservation_controller.dart';
// import 'package:md_health/Screens/reservation/view/hotel/hotel_request_cancel.dart';
// import 'package:md_health/Screens/reservation/view/review_view.dart';
// import 'package:md_health/constants/styles/colors.dart';
// import 'package:md_health/widget/drop_down.dart';

// import 'package:md_health/widget/star_rating.dart';

// class VehicleActiveView extends StatelessWidget {
//   const VehicleActiveView({
//     super.key,
//     required this.padh,
//     required this.dekh,
//   });

//   final ReservationController padh;
//   final ReservationController dekh;

//   // void showCancelConfirmationDialog(BuildContext context) {
//   //   showDialog(
//   //     context: context,
//   //     builder: (BuildContext context) {
//   //       return AlertDialog(
//   //         title: Text('Cancel Request?'),
//   //         content: Text('Are you sure you want to cancel the request?'),
//   //         actions: [
//   //           TextButton(
//   //             onPressed: () {
//   //               // Close the dialog and perform cancel action
//   //               Navigator.pop(context);
//   //               // Add your cancel logic here
//   //               // print('Request Cancelled');
//   //             },
//   //             child: Text('Yes'),
//   //           ),
//   //           TextButton(
//   //             onPressed: () {
//   //               // Close the dialog
//   //               Navigator.pop(context);
//   //             },
//   //             child: Text('No'),
//   //           ),
//   //         ],
//   //       );
//   //     },
//   //   );
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Padding(
//           padding: EdgeInsets.only(
//             left: 10.w,
//             right: 10.w,
//           ),
//           child: PackageDropDownSearchList(
//             textEditingController: null,
//             iconPadding: const EdgeInsets.only(right: 32),
//             // titleHeader: "*Patient Country",
//             onChanged: (value) {
//               // read.onSelectAccountType(value);
//             },
//             hint: "List for date",
//             items: [
//               DropdownMenuItem(
//                 value: "current",
//                 child: Text(
//                   "Current",
//                   style: TextStyle(
//                     fontSize: 14.sp,
//                   ),
//                 ),
//               ),
//               DropdownMenuItem(
//                 value: "saving",
//                 child: Text(
//                   "Saving",
//                   style: TextStyle(
//                     fontSize: 14.sp,
//                   ),
//                 ),
//               )
//             ],
//           ),
//         ),
//         Container(
//           // margin: EdgeInsets.only(left: 18.w, right: 18.w),
//           child: ListView.builder(
//               padding: EdgeInsets.only(left: 10.w, right: 10.w, top: 20.w),
//               itemCount: 1,
//               physics: const BouncingScrollPhysics(),
//               shrinkWrap: true,
//               itemBuilder: (BuildContext, index) {
//                 return GestureDetector(
//                   onTap: () {},
//                   child: Column(
//                     children: [
//                       Container(
//                         decoration: BoxDecoration(
//                             color: Colors.white,
//                             borderRadius:
//                                 const BorderRadius.all(Radius.circular(10)),
//                             // border: Border.all(color: const Color(0xffEFEFEF)),
//                             boxShadow: [
//                               BoxShadow(
//                                   color: Colors.black.withOpacity(0.1),
//                                   spreadRadius: 1,
//                                   blurRadius: 10,
//                                   blurStyle: BlurStyle.outer)
//                             ]),
//                         child: Padding(
//                           padding: EdgeInsets.all(10.w),
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Container(
//                                 child: Row(
//                                   crossAxisAlignment: CrossAxisAlignment.end,
//                                   children: [
//                                     Container(
//                                       decoration: const BoxDecoration(
//                                         borderRadius: BorderRadius.all(
//                                             Radius.circular(30)),
//                                       ),
//                                       margin: EdgeInsets.symmetric(
//                                           vertical: 15.h, horizontal: 15.w),
//                                       child: Image.asset(
//                                         'assets/images/image 39.png',
//                                         height: 70.h,
//                                         width: 100.w,
//                                         fit: BoxFit.fitWidth,
//                                       ),
//                                     ),
//                                     Container(
//                                       padding: EdgeInsets.only(
//                                         bottom: 30.h,
//                                       ),
//                                       child: Column(
//                                         crossAxisAlignment:
//                                             CrossAxisAlignment.start,
//                                         // mainAxisAlignment: MainAxisAlignment.end,
//                                         children: [
//                                           Padding(
//                                             padding:
//                                                 EdgeInsets.only(bottom: 7.w),
//                                             child: Text(
//                                               'Sixt Rental',
//                                               style: TextStyle(
//                                                   color: Colors.black,
//                                                   fontFamily: 'Campton',
//                                                   // letterSpacing: -1,
//                                                   fontSize: 18.sp,
//                                                   fontWeight: FontWeight.w700),
//                                             ),
//                                           ),
//                                           Row(
//                                             children: [
//                                               SvgPicture.asset(
//                                                 'assets/icons/mdi_location.svg',
//                                                 height: 11.25.h,
//                                                 width: 12.w,
//                                               ),
//                                               SizedBox(
//                                                 width: 5.w,
//                                               ),
//                                               RichText(
//                                                 text: TextSpan(
//                                                     style: TextStyle(
//                                                         color: Colors.black,
//                                                         fontFamily: 'Campton',
//                                                         letterSpacing: -1,
//                                                         fontSize: 12.sp,
//                                                         fontWeight:
//                                                             FontWeight.w400),
//                                                     children: const [
//                                                       TextSpan(
//                                                           text:
//                                                               'Besiktas / Istanbul'),
//                                                     ]),
//                                               )
//                                             ],
//                                           ),
//                                           SizedBox(
//                                             height: 5.w,
//                                           ),
//                                           Row(
//                                             children: [
//                                               SvgPicture.asset(
//                                                 'assets/icons/uiw_date.svg',
//                                                 height: 11.25.h,
//                                                 width: 12.w,
//                                               ),
//                                               // SizedBox(
//                                               //   width: 5.w,
//                                               // ),
//                                               //  SizedBox(
//                                               //   height: 13.h,
//                                               // ),
//                                               Padding(
//                                                 padding: const EdgeInsets.only(left:5.0,top:3),
//                                                 child: RichText(
//                                                   text: TextSpan(
//                                                       style: TextStyle(
//                                                           color: Colors.black,
//                                                           fontFamily: 'Campton',
//                                                           letterSpacing: -1,
//                                                           fontSize: 12.sp,
//                                                           fontWeight:
//                                                               FontWeight.w400),
//                                                       children: const [
//                                                         TextSpan(
//                                                             text:
//                                                                 '12 Dec 2023 - 19 Dec 2023')
//                                                       ]),
//                                                 ),
//                                               )
//                                             ],
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               dekh.isExpanded
//                                   ? Padding(
//                                       padding: EdgeInsets.symmetric(
//                                           horizontal: 15.w, vertical: 10.w),
//                                       child: Column(
//                                         crossAxisAlignment:
//                                             CrossAxisAlignment.start,
//                                         children: [
//                                           Text(
//                                             "Total Price",
//                                             style: TextStyle(
//                                               fontFamily: 'Campton',
//                                               color: kDefaultActiveColor,
//                                               fontSize: 16.sp,
//                                               fontWeight: FontWeight.w600,
//                                             ),
//                                           ),
//                                           RichText(
//                                             text: TextSpan(
//                                                 style: TextStyle(
//                                                   fontFamily: 'Campton',
//                                                   color: Colors.black,
//                                                   fontSize: 16.sp,
//                                                   fontWeight: FontWeight.w600,
//                                                 ),
//                                                 children: [
//                                                   const TextSpan(
//                                                       text: "34.000,00 ₺"),
//                                                   TextSpan(
//                                                     text: "(Per day)",
//                                                     style: TextStyle(
//                                                       fontSize: 13.sp,
//                                                     ),
//                                                   ),
//                                                 ]),
//                                           ),
//                                         ],
//                                       ),
//                                     )
//                                   : Container(),
//                               Container(
//                                 padding: EdgeInsets.symmetric(horizontal: 15.w),
//                                 child: Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     GestureDetector(
//                                       onTap: () {
//                                         padh.onExpanded();
//                                       },
//                                       child: Container(
//                                           height: 30.h,
//                                           width: MediaQuery.of(context)
//                                                   .size
//                                                   .width *
//                                               0.45,
//                                           alignment: Alignment.center,
//                                           decoration: const BoxDecoration(
//                                             borderRadius: BorderRadius.all(
//                                                 Radius.circular(20)),
//                                             color: Colors.black,
//                                           ),
//                                           child: Text(
//                                             dekh.isExpanded
//                                                 ? 'Close Details'
//                                                 : 'Reservation Details',
//                                             style: TextStyle(
//                                               fontFamily: 'Campton',
//                                               fontSize: 14.sp,
//                                               color: Colors.white,
//                                               fontWeight: FontWeight.w500,
//                                             ),
//                                           )),
//                                     ),
//                                     GestureDetector(
//                                       onTap: () {
//                                         Navigator.push(
//                                           context,
//                                           MaterialPageRoute(
//                                               builder: (context) =>
//                                                   const ReviewView()),
//                                         );
//                                       },
//                                       child: Container(
//                                         padding: EdgeInsets.only(bottom: 15.w),
//                                         child: Column(
//                                           crossAxisAlignment:
//                                               CrossAxisAlignment.end,
//                                           children: [
//                                             RichText(
//                                               text: TextSpan(
//                                                   style: TextStyle(
//                                                     fontFamily: 'Campton',
//                                                     color: Colors.black,
//                                                     fontSize: 14.sp,
//                                                     fontWeight: FontWeight.w700,
//                                                   ),
//                                                   children: [
//                                                     const TextSpan(
//                                                         text: 'Reviews '),
//                                                     TextSpan(
//                                                       text: '(29)',
//                                                       style: TextStyle(
//                                                         fontWeight:
//                                                             FontWeight.w400,
//                                                         fontSize: 12.sp,
//                                                       ),
//                                                     ),
//                                                   ]),
//                                             ),
//                                             const StarRating(numberOfStars: 4)
//                                           ],
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                       dekh.isExpanded
//                           ? Container(
//                               margin: EdgeInsets.symmetric(vertical: 20.w),
//                               width: double.infinity,
//                               decoration: BoxDecoration(
//                                   color: Colors.white,
//                                   borderRadius: const BorderRadius.all(
//                                       Radius.circular(10)),
//                                   // border: Border.all(color: const Color(0xffEFEFEF)),
//                                   boxShadow: [
//                                     BoxShadow(
//                                         color: Colors.black.withOpacity(0.1),
//                                         spreadRadius: 1,
//                                         blurRadius: 10,
//                                         blurStyle: BlurStyle.outer)
//                                   ]),
//                               padding: EdgeInsets.symmetric(
//                                   horizontal: 20.w, vertical: 35.w),
//                               child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Text(
//                                       'Acent Full Address',
//                                       style: TextStyle(
//                                           color: kDefaultActiveColor,
//                                           fontFamily: 'Campton',
//                                           // letterSpacing: -1,
//                                           fontSize: 16.sp,
//                                           fontWeight: FontWeight.w700),
//                                     ),
//                                     Padding(
//                                       padding: EdgeInsets.only(top: 15.0.w),
//                                       child: Text(
//                                         'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim Besiktas / Istanbul',
//                                         style: TextStyle(
//                                             color: Colors.black,
//                                             fontFamily: 'Campton',
//                                             // letterSpacing: -1,
//                                             fontSize: 14.sp,
//                                             fontWeight: FontWeight.w400),
//                                       ),
//                                     ),
//                                     Padding(
//                                       padding: EdgeInsets.only(top: 15.0.w),
//                                       child: Text(
//                                         'Vehicle Delivery Date',
//                                         style: TextStyle(
//                                             color: kDefaultActiveColor,
//                                             fontFamily: 'Campton',
//                                             // letterSpacing: -1,
//                                             fontSize: 16.sp,
//                                             fontWeight: FontWeight.w700),
//                                       ),
//                                     ),
//                                     Container(
//                                       padding: EdgeInsets.only(top: 8.w),
//                                       child: Row(
//                                         crossAxisAlignment:
//                                             CrossAxisAlignment.start,
//                                         children: [
//                                           Text(
//                                             'Pick-Up Date:',
//                                             style: TextStyle(
//                                                 color: kDefaultActiveColor,
//                                                 fontFamily: 'Campton',
//                                                 // letterSpacing: -1,
//                                                 fontSize: 14.sp,
//                                                 fontWeight: FontWeight.w700),
//                                           ),
//                                           Text(
//                                             '12 December 2023 / 12:00',
//                                             style: TextStyle(
//                                                 color: Colors.black,
//                                                 fontFamily: 'Campton',
//                                                 // letterSpacing: -1,
//                                                 fontSize: 14.sp,
//                                                 fontWeight: FontWeight.w400),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                     Container(
//                                       padding: EdgeInsets.only(top: 4.w),
//                                       child: Row(
//                                         crossAxisAlignment:
//                                             CrossAxisAlignment.start,
//                                         children: [
//                                           Text(
//                                             'Return Date:',
//                                             style: TextStyle(
//                                                 color: Colors.red,
//                                                 fontFamily: 'Campton',
//                                                 // letterSpacing: -1,
//                                                 fontSize: 14.sp,
//                                                 fontWeight: FontWeight.w700),
//                                           ),
//                                           Text(
//                                             '12 December 2023 / 12:00',
//                                             style: TextStyle(
//                                                 color: Colors.black,
//                                                 fontFamily: 'Campton',
//                                                 // letterSpacing: -1,
//                                                 fontSize: 14.sp,
//                                                 fontWeight: FontWeight.w400),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                     Container(
//                                         padding: EdgeInsets.only(top: 16.w),
//                                         child: Column(
//                                           crossAxisAlignment:
//                                               CrossAxisAlignment.start,
//                                           children: [
//                                             Padding(
//                                               padding:
//                                                   EdgeInsets.only(bottom: 8.w),
//                                               child: Text(
//                                                 'Vehicle Details',
//                                                 style: TextStyle(
//                                                     color: kDefaultActiveColor,
//                                                     fontFamily: 'Campton',
//                                                     // letterSpacing: -1,
//                                                     fontSize: 16.sp,
//                                                     fontWeight:
//                                                         FontWeight.w700),
//                                               ),
//                                             ),
//                                             Container(
//                                                 padding: EdgeInsets.only(
//                                                     right: 35.w, left: 8.w),
//                                                 child: Column(
//                                                   crossAxisAlignment:
//                                                       CrossAxisAlignment.start,
//                                                   children: [
//                                                     Text(
//                                                       'Economy',
//                                                       style: TextStyle(
//                                                           color: Colors.black,
//                                                           fontFamily: 'Campton',
//                                                           // letterSpacing: -1,
//                                                           fontSize: 16.sp,
//                                                           fontWeight:
//                                                               FontWeight.w500),
//                                                     ),
//                                                     SizedBox(
//                                                       height: 8.h,
//                                                     ),
//                                                     const Column(
//                                                       children: [
//                                                         VehicleDetailsWidget(
//                                                             text: 'Wi-Fi',
//                                                             icon:
//                                                                 'assets/icons/logos_wifi.svg'),
//                                                         VehicleDetailsWidget(
//                                                             text: 'Wi-Fi',
//                                                             icon:
//                                                                 'assets/icons/logos_wifi.svg'),
//                                                         VehicleDetailsWidget(
//                                                             text: 'Wi-Fi',
//                                                             icon:
//                                                                 'assets/icons/logos_wifi.svg'),
//                                                         VehicleDetailsWidget(
//                                                             text: 'Wi-Fi',
//                                                             icon:
//                                                                 'assets/icons/logos_wifi.svg'),
//                                                       ],
//                                                     ),
//                                                   ],
//                                                 )),
//                                           ],
//                                         )),
//                                     Padding(
//                                       padding: EdgeInsets.only(top: 20.0.w),
//                                       child: Column(
//                                         children: [
//                                           GestureDetector(
//                                             onTap: () {},
//                                             child: Container(
//                                                 width: double.infinity,
//                                                 height: 45.h,
//                                                 decoration: const BoxDecoration(
//                                                   borderRadius:
//                                                       BorderRadius.all(
//                                                           Radius.circular(30)),
//                                                   color: Color(0xff34A853),
//                                                 ),
//                                                 child: Row(
//                                                     mainAxisAlignment:
//                                                         MainAxisAlignment
//                                                             .center,
//                                                     children: [
//                                                       SvgPicture.asset(
//                                                         'assets/icons/Vector_11.svg',
//                                                         width: 21.w,
//                                                         height: 21.h,
//                                                       ),
//                                                       SizedBox(
//                                                         width: 5.w,
//                                                       ),
//                                                       Text(
//                                                         'The location for pick-up/delivery',
//                                                         style: TextStyle(
//                                                             color: Colors.white,
//                                                             fontFamily:
//                                                                 'Campton',
//                                                             // letterSpacing: -1,
//                                                             fontSize: 16.sp,
//                                                             fontWeight:
//                                                                 FontWeight
//                                                                     .w600),
//                                                       ),
//                                                     ])),
//                                           ),
//                                           SizedBox(
//                                             height: 10.h,
//                                           ),
//                                           GestureDetector(
//                                             onTap: () {
//                                               showDialog(
//                                     context: context,
//                                     builder: (context) => const AlertDialog(
//                                         shape: RoundedRectangleBorder(
//                                             borderRadius: BorderRadius.all(
//                                                 Radius.circular(15.0))),
//                                         contentPadding:
//                                             EdgeInsets.only(top: 0.0),
//                                         content: CancellationPopUp(
//                                           // cancelId: element?.id.toString(),
//                                           // purchaseId:
//                                           //     element?.purchaseId.toString(),
//                                           // packageId: element?.id.toString(),
//                                         )));
//                                             },
//                                             child: Container(
//                                               width: double.infinity,
//                                               height: 45.h,
//                                               alignment: Alignment.center,
//                                               decoration: const BoxDecoration(
//                                                 borderRadius: BorderRadius.all(
//                                                     Radius.circular(30)),
//                                                 color: Color(0xffF55C5C),
//                                               ),
//                                               child: Text(
//                                                 'Cancellation Request',
//                                                 style: TextStyle(
//                                                     color: Colors.white,
//                                                     fontFamily: 'Campton',
//                                                     // letterSpacing: -1,
//                                                     fontSize: 16.sp,
//                                                     fontWeight:
//                                                         FontWeight.w600),
//                                               ),
//                                             ),
//                                           )
//                                         ],
//                                       ),
//                                     ),
//                                   ]),
//                             )
//                           : Container(),
//                     ],
//                   ),
//                 );
//               }),
//         ),
//       ],
//     );
//   }
// }

// class VehicleDetailsWidget extends StatelessWidget {
//   final String text;
//   final String icon;

//   const VehicleDetailsWidget({
//     super.key,
//     required this.text,
//     required this.icon,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.only(bottom: 8.0.w),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: [
//           SvgPicture.asset(
//             icon,
//             width: 11.w,
//             height: 10.h,
//           ),
//           SizedBox(
//             width: 2.5.w,
//           ),
//           Text(
//             text,
//             style: TextStyle(
//                 color: Colors.black,
//                 fontFamily: 'Campton',
//                 // letterSpacing: -1,
//                 fontSize: 12.sp,
//                 fontWeight: FontWeight.w500),
//           ),
//         ],
//       ),
//     );
//   }
// }
