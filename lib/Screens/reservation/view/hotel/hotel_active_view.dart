// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:md_health/Screens/reservation/controller/reservation_controller.dart';
// import 'package:md_health/Screens/reservation/view/hotel/hotel_request_cancel.dart';
// import 'package:md_health/Screens/reservation/view/review_view.dart';
// import 'package:md_health/constants/styles/colors.dart';
// import 'package:md_health/widget/buttons.dart';
// import 'package:md_health/widget/check_box.dart';
// import 'package:md_health/widget/drop_down.dart';

// import 'package:md_health/widget/star_rating.dart';
// import 'package:md_health/widget/text_field.dart';

// class HotelActiveView extends StatelessWidget {
//   HotelActiveView({required this.padh, required this.dekh});

//   final ReservationController padh;
//   final ReservationController dekh;

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
//                         // height: 216.h,
//                         decoration: BoxDecoration(
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
//                               Padding(
//                                 padding: const EdgeInsets.all(5.0),
//                                 child: Row(
//                                   children: [
//                                     Image.asset(
//                                       'assets/images/Rectangle_233.png',
//                                       height: 85.h,
//                                       width: 95.w,
//                                       fit: BoxFit.fill,
//                                     ),
//                                     SizedBox(
//                                       width: 10.w,
//                                     ),
//                                     Container(
//                                       height: 75.h,
//                                       width: 200.w,
//                                       // color: Colors.amber,
//                                       child: Column(
//                                         crossAxisAlignment:
//                                             CrossAxisAlignment.start,
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.spaceBetween,
//                                         children: [
//                                           Expanded(
//                                             child: Padding(
//                                               padding:
//                                                   EdgeInsets.only(left: 5.w),
//                                               child: Text(
//                                                 'Renaissence Istanbul',
//                                                 overflow: TextOverflow.ellipsis,
//                                                 style: TextStyle(
//                                                     color: Colors.black,
//                                                     fontFamily: 'Campton',
//                                                     // letterSpacing: -1,
//                                                     fontSize: 20.sp,
//                                                     fontWeight:
//                                                         FontWeight.w700),
//                                               ),
//                                             ),
//                                           ),
//                                           Expanded(
//                                             child: Row(
//                                               children: [
//                                                 SizedBox(
//                                                   width: 5.w,
//                                                 ),
//                                                 const Icon(
//                                                   Icons.star,
//                                                   size: 14,
//                                                 ),
//                                                 SizedBox(
//                                                   width: 5.w,
//                                                 ),
//                                                 Text(
//                                                   '4 Stars Hotel',
//                                                   style: TextStyle(
//                                                       color: Colors.black,
//                                                       fontFamily: 'Campton',
//                                                       letterSpacing: -1,
//                                                       fontSize: 15.sp,
//                                                       fontWeight:
//                                                           FontWeight.w400),
//                                                 )
//                                               ],
//                                             ),
//                                           ),
//                                           Expanded(
//                                             child: Row(
//                                               children: [
//                                                 SizedBox(
//                                                   width: 5.w,
//                                                 ),
//                                                 const Icon(
//                                                   Icons.location_pin,
//                                                   size: 14,
//                                                 ),
//                                                 SizedBox(
//                                                   width: 5.w,
//                                                 ),
//                                                 Text(
//                                                   'Besiktas / Istanbul',
//                                                   style: TextStyle(
//                                                       color: Colors.black,
//                                                       fontFamily: 'Campton',
//                                                       letterSpacing: -1,
//                                                       fontSize: 15.sp,
//                                                       fontWeight:
//                                                           FontWeight.w400),
//                                                 )
//                                               ],
//                                             ),
//                                           ),
//                                           Expanded(
//                                             child: Row(
//                                               children: [
//                                                 SizedBox(
//                                                   width: 5.w,
//                                                 ),
//                                                 const Icon(
//                                                   Icons.calendar_month_outlined,
//                                                   size: 14,
//                                                 ),
//                                                 SizedBox(
//                                                   width: 5.w,
//                                                 ),
//                                                 Padding(
//                                                   padding:
//                                                       const EdgeInsets.only(
//                                                           top: 3),
//                                                   child: Text(
//                                                     '12 Dec 2023 - 19 Dec 2023',
//                                                     style: TextStyle(
//                                                         color: Colors.black,
//                                                         fontFamily: 'Campton',
//                                                         letterSpacing: -1,
//                                                         fontSize: 15.sp,
//                                                         fontWeight:
//                                                             FontWeight.w400),
//                                                   ),
//                                                 )
//                                               ],
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     )
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
//                               const SizedBox(
//                                 height: 20,
//                               ),
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
//                                           height: 28.h,
//                                           width: MediaQuery.of(context)
//                                                   .size
//                                                   .width *
//                                               0.45,
//                                           alignment: Alignment.center,
//                                           decoration: const BoxDecoration(
//                                             borderRadius: BorderRadius.all(
//                                                 Radius.circular(45)),
//                                             color: Colors.black,
//                                           ),
//                                           child: Text(
//                                             dekh.isExpanded
//                                                 ? 'Close Details'
//                                                 : 'Book Details',
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
//                                             // Text('Review (29)',
//                                             // style: TextStyle(
//                                             //         fontFamily: 'Campton',
//                                             //         color: Colors.black,
//                                             //         fontSize: 16.sp,
//                                             //         fontWeight: FontWeight.w700,
//                                             //       ),
//                                             // ),
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
//                                       'Hotel Full Address',
//                                       style: TextStyle(
//                                           color: kDefaultActiveColor,
//                                           fontFamily: 'Campton',
//                                           // letterSpacing: -1,
//                                           fontSize: 16.sp,
//                                           fontWeight: FontWeight.w700),
//                                     ),
//                                     Padding(
//                                       padding: EdgeInsets.only(top: 8.0.w),
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
//                                     Container(
//                                       padding: EdgeInsets.only(top: 8.w),
//                                       child: Column(
//                                         crossAxisAlignment:
//                                             CrossAxisAlignment.start,
//                                         children: [
//                                           Text(
//                                             'Enter Date:',
//                                             style: TextStyle(
//                                                 color: kDefaultActiveColor,
//                                                 fontFamily: 'Campton',
//                                                 // letterSpacing: -1,
//                                                 fontSize: 16.sp,
//                                                 fontWeight: FontWeight.w700),
//                                           ),
//                                           Padding(
//                                             padding:
//                                                 EdgeInsets.only(top: 4.0.w),
//                                             child: Text(
//                                               '12 December 2023 / 12:00',
//                                               style: TextStyle(
//                                                   color: Colors.black,
//                                                   fontFamily: 'Campton',
//                                                   // letterSpacing: -1,
//                                                   fontSize: 16.sp,
//                                                   fontWeight: FontWeight.w400),
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                     Container(
//                                       padding: EdgeInsets.only(top: 8.w),
//                                       child: Column(
//                                         crossAxisAlignment:
//                                             CrossAxisAlignment.start,
//                                         children: [
//                                           Text(
//                                             'Exit Date:',
//                                             style: TextStyle(
//                                                 color: Colors.red,
//                                                 fontFamily: 'Campton',
//                                                 // letterSpacing: -1,
//                                                 fontSize: 16.sp,
//                                                 fontWeight: FontWeight.w700),
//                                           ),
//                                           Padding(
//                                             padding:
//                                                 EdgeInsets.only(top: 4.0.w),
//                                             child: Text(
//                                               '12 December 2023 / 12:00',
//                                               style: TextStyle(
//                                                   color: Colors.black,
//                                                   fontFamily: 'Campton',
//                                                   // letterSpacing: -1,
//                                                   fontSize: 16.sp,
//                                                   fontWeight: FontWeight.w400),
//                                             ),
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
//                                                 'Room Details',
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
//                                               padding:
//                                                   EdgeInsets.only(right: 35.w),
//                                               child: const Row(
//                                                 mainAxisAlignment:
//                                                     MainAxisAlignment
//                                                         .spaceBetween,
//                                                 children: [
//                                                   Column(
//                                                     mainAxisAlignment:
//                                                         MainAxisAlignment
//                                                             .center,
//                                                     crossAxisAlignment:
//                                                         CrossAxisAlignment
//                                                             .start,
//                                                     children: [
//                                                       RoomDetailsWidget(
//                                                         text: 'Television',
//                                                         icon:
//                                                             'assets/icons/Vector_10.svg',
//                                                       ),
//                                                       RoomDetailsWidget(
//                                                         text:
//                                                             'Suitable for whellchair use',
//                                                         icon:
//                                                             'assets/icons/Vector_10.svg',
//                                                       ),
//                                                       RoomDetailsWidget(
//                                                         text: 'Television',
//                                                         icon:
//                                                             'assets/icons/Vector_10.svg',
//                                                       ),
//                                                       RoomDetailsWidget(
//                                                         text: 'Television',
//                                                         icon:
//                                                             'assets/icons/Vector_10.svg',
//                                                       ),
//                                                     ],
//                                                   ),
//                                                   Column(
//                                                     mainAxisAlignment:
//                                                         MainAxisAlignment
//                                                             .center,
//                                                     crossAxisAlignment:
//                                                         CrossAxisAlignment
//                                                             .start,
//                                                     children: [
//                                                       RoomDetailsWidget(
//                                                         text:
//                                                             'Breakfast & Dinner',
//                                                         icon:
//                                                             'assets/icons/fluent_food-16-filled.svg',
//                                                       ),
//                                                       RoomDetailsWidget(
//                                                         text:
//                                                             'Breakfast & Dinner',
//                                                         icon:
//                                                             'assets/icons/fluent_food-16-filled.svg',
//                                                       ),
//                                                       RoomDetailsWidget(
//                                                         text:
//                                                             'Breakfast & Dinner',
//                                                         icon:
//                                                             'assets/icons/fluent_food-16-filled.svg',
//                                                       ),
//                                                       RoomDetailsWidget(
//                                                         text:
//                                                             'Breakfast & Dinner',
//                                                         icon:
//                                                             'assets/icons/fluent_food-16-filled.svg',
//                                                       ),
//                                                     ],
//                                                   ),
//                                                 ],
//                                               ),
//                                             ),
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
//                                                 height: 57.h,
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
//                                                         'Hotel Location on Google Maps',
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
//                                                   context: context,
//                                                   builder: (context) =>
//                                                       const AlertDialog(
//                                                           shape: RoundedRectangleBorder(
//                                                               borderRadius: BorderRadius
//                                                                   .all(Radius
//                                                                       .circular(
//                                                                           15.0))),
//                                                           contentPadding:
//                                                               EdgeInsets.only(
//                                                                   top: 0.0),
//                                                           content: CancellationPopUp(
//                                                               // cancelId: element?.id.toString(),
//                                                               // purchaseId:
//                                                               //     element?.purchaseId.toString(),
//                                                               // packageId: element?.id.toString(),
//                                                               )));
//                                               // CancellationPopUp();
//                                             },
//                                             child: Container(
//                                               width: double.infinity,
//                                               height: 57.h,
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

//   HotelActiveView copyWith(
//       {ReservationController? padh, ReservationController? dekh}) {
//     return HotelActiveView(padh: padh ?? this.padh, dekh: dekh ?? this.dekh);
//   }

//   @override
//   List<Object?> get props => [padh, dekh];
// }

// class RoomDetailsWidget extends StatelessWidget {
//   final String text;
//   final String icon;

//   const RoomDetailsWidget({
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
