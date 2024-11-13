// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:md_health/Screens/home/view/home_view.dart';
// import 'package:md_health/Screens/hotel/view/hotel_details.dart';
// import 'package:md_health/Screens/main/view/main_screen_view.dart';
// import 'package:md_health/Screens/payment_details/view/payment_details_view.dart';
// import 'package:md_health/constants/styles/colors.dart';
// import 'package:md_health/widget/base_screen.dart';
// import 'package:md_health/widget/buttons.dart';
// import 'package:md_health/widget/custom_bottom_nav_bar.dart';
// import 'package:md_health/widget/drawer.dart';

// class HotelView extends StatefulWidget {
//   const HotelView({super.key});

//   @override
//   State<HotelView> createState() => _HotelViewState();
// }

// bool isExpanded = false;

// class _HotelViewState extends State<HotelView> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         extendBody: true,
//         backgroundColor: Colors.white,
//         drawer: AppDrawer(),
//         appBar: HotelAppBar(),
//         bottomNavigationBar: CustomBottomNavBar(),
//         body: Container(
//           // height: 500,
//           // alignment: Alignment.center,
//           child: SingleChildScrollView(
//             scrollDirection: Axis.vertical,
//             child: Column(
//               children: [
//                 Padding(
//                   padding: EdgeInsets.only(top: 30.h),
//                   child: Text(
//                     'Check Hotels',
//                     style: TextStyle(
//                         color: kDefaultActiveColor,
//                         fontFamily: 'Campton',
//                         fontSize: 29.sp,
//                         letterSpacing: -1,
//                         fontWeight: FontWeight.w700),
//                   ),
//                 ),
//                 const Padding(
//                   padding: EdgeInsets.all(2),
//                   child: Text('Date'),
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     SvgPicture.asset(''),
//                     const Text('12Aug - 19Aug'),
//                   ],
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(2),
//                   child: Text(
//                     'Change Date',
//                     style: TextStyle(
//                         decoration: TextDecoration.underline,
//                         color: kDefaultActiveColor,
//                         fontFamily: 'Campton',
//                         letterSpacing: -1,
//                         fontSize: 20.sp,
//                         fontWeight: FontWeight.w700),
//                   ),
//                 ),
//                 Container(
//                   margin: EdgeInsets.symmetric(horizontal: 10.w),
//                   child: Card(
//                     shape: Border.all(color: Colors.transparent),
//                     child: Padding(
//                       padding: EdgeInsets.all(10.w),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             children: [
//                               Row(
//                                 children: [
//                                   Padding(
//                                     padding: EdgeInsets.all(0),
//                                     child: Text(
//                                       'Renaissence Bosphorus Hotel',
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontFamily: 'Campton',
//                                           // letterSpacing: -1,
//                                           fontSize: 16.sp,
//                                           fontWeight: FontWeight.w700),
//                                     ),
//                                   ),
//                                   Card(
//                                     color: kDefaultActiveColor,
//                                     child: Padding(
//                                       padding: EdgeInsets.symmetric(
//                                           vertical: 1.5.h, horizontal: 8.w),
//                                       child: Text(
//                                         '4.9',
//                                         style: TextStyle(
//                                             color: Colors.black,
//                                             fontFamily: 'Campton',
//                                             // letterSpacing: -1,
//                                             fontSize: 12.sp,
//                                             fontWeight: FontWeight.w700),
//                                         textAlign: TextAlign.center,
//                                       ),
//                                     ),
//                                   )
//                                 ],
//                               ),
//                               Row(
//                                 children: [
//                                   Row(
//                                     children: [
//                                       SvgPicture.asset(
//                                         'assets/icons/mdi_location.svg',
//                                         height: 17.h,
//                                         width: 17.w,
//                                       ),
//                                       SizedBox(
//                                         width: 2.w,
//                                       ),
//                                       RichText(
//                                         text: TextSpan(
//                                             style: TextStyle(
//                                                 color: Colors.black,
//                                                 fontFamily: 'Campton',
//                                                 letterSpacing: -1,
//                                                 fontSize: 14.sp,
//                                                 fontWeight: FontWeight.w400),
//                                             children: [
//                                               TextSpan(
//                                                   text:
//                                                       'Distance to hospital '),
//                                               TextSpan(
//                                                   text: '3.7 KM',
//                                                   style: TextStyle(
//                                                       fontWeight:
//                                                           FontWeight.w700,
//                                                       fontSize: 16.sp))
//                                             ]),
//                                       )
//                                     ],
//                                   ),
//                                   SizedBox(
//                                     width: 10.w,
//                                   ),
//                                   Row(
//                                     children: [
//                                       SvgPicture.asset(
//                                         'assets/icons/Vector_4.svg',
//                                         height: 11.25.h,
//                                         width: 12.w,
//                                       ),
//                                       SizedBox(
//                                         width: 2.w,
//                                       ),
//                                       RichText(
//                                         text: TextSpan(
//                                             style: TextStyle(
//                                                 color: Colors.black,
//                                                 fontFamily: 'Campton',
//                                                 letterSpacing: -1,
//                                                 fontSize: 14.sp,
//                                                 fontWeight: FontWeight.w400),
//                                             children: [
//                                               TextSpan(text: '4 Stars Hotel ')
//                                             ]),
//                                       )
//                                     ],
//                                   ),
//                                 ],
//                               ),
//                               isExpanded
//                                   ? Column(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: [
//                                         Padding(
//                                           padding: EdgeInsets.symmetric(
//                                               vertical: 15.h),
//                                           child: Image.asset(
//                                             'assets/images/Rectangle_233.png',
//                                             height: 122.h,
//                                             width: 212.w,
//                                           ),
//                                         ),
//                                         Text(
//                                           "Per Night Price",
//                                           style: TextStyle(
//                                             fontFamily: 'Campton',
//                                             color: kDefaultActiveColor,
//                                             fontSize: 11.sp,
//                                             fontWeight: FontWeight.w500,
//                                           ),
//                                         ),
//                                         Text(
//                                           "34.000,00 ₺",
//                                           style: TextStyle(
//                                             fontFamily: 'Campton',
//                                             color: Colors.black,
//                                             fontSize: 19.sp,
//                                             fontWeight: FontWeight.w700,
//                                           ),
//                                         ),
//                                       ],
//                                     )
//                                   : Container(),
//                             ],
//                           ),
//                           ExpansionTile(
//                               // shape: Border.all(color:Colors.transparent),
//                               shape: Border.all(color: Colors.transparent),
//                               tilePadding: EdgeInsets.zero,
//                               // backgroundColor: Colors.red,
//                               trailing: SvgPicture.asset(
//                                 'assets/icons/new_expantion.svg',
//                                 // alignment: Alignment.topRight,
//                               ),
//                               onExpansionChanged: (expanded) {
//                                 setState(() {
//                                   isExpanded = expanded;
//                                 });
//                               },
//                               initiallyExpanded: isExpanded,
//                               title: Container(
//                                 padding: EdgeInsets.zero,
//                                 child: !isExpanded
//                                     ? Column(
//                                         crossAxisAlignment:
//                                             CrossAxisAlignment.start,
//                                         children: [
//                                           Text(
//                                             "Per Night Price",
//                                             style: TextStyle(
//                                               fontFamily: 'Campton',
//                                               color: kDefaultActiveColor,
//                                               fontSize: 11.sp,
//                                               fontWeight: FontWeight.w500,
//                                             ),
//                                           ),
//                                           Text(
//                                             "34.000,00 ₺",
//                                             style: TextStyle(
//                                               fontFamily: 'Campton',
//                                               color: Colors.black,
//                                               fontSize: 19.sp,
//                                               fontWeight: FontWeight.w700,
//                                             ),
//                                           ),
//                                         ],
//                                       )
//                                     : Container(
//                                         width: double.infinity,
//                                         // color: Colors.blue,
//                                         child: Column(
//                                           crossAxisAlignment:
//                                               CrossAxisAlignment.start,
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.start,
//                                           children: [
//                                             Text(
//                                               "Standart Room",
//                                               style: TextStyle(
//                                                 fontFamily: 'Campton',
//                                                 color: kDefaultActiveColor,
//                                                 fontSize: 20.sp,
//                                                 fontWeight: FontWeight.w600,
//                                               ),
//                                             ),
//                                             SizedBox(
//                                               height: 5.w,
//                                             ),
//                                             Text(
//                                               'Television, Suitable for wheelchair use, Cable TV service, Mini bar, Daily housekeeping',
//                                               style: TextStyle(
//                                                 fontFamily: 'Campton',
//                                                 color: Colors.black,
//                                                 fontSize: 14.sp,
//                                                 letterSpacing: -1,
//                                                 fontWeight: FontWeight.w400,
//                                               ),
//                                             )
//                                           ],
//                                         ),
//                                       ),
//                               )),
//                           isExpanded
//                               ? Container(
//                                   height: 300.h,
//                                   child: Column(
//                                     mainAxisAlignment: MainAxisAlignment.start,
//                                     children: [
//                                       Padding(
//                                         padding: EdgeInsets.only(
//                                             bottom: 10.w, top: 20.w),
//                                         child: PrimaryButton(
//                                           height: 50.h,
//                                           color: kDefaultActiveColor,
//                                           onTap: () {
//                                             Navigator.push(
//                                                 context,
//                                                 MaterialPageRoute(
//                                                     builder: (context) =>
//                                                         PaymentDetailsView(
//                                                           purchaseType: "",
//                                                         )));
//                                           },
//                                           borderRadius: 30,
//                                           child: Text(
//                                             'Make a Reservation',
//                                             style: TextStyle(
//                                               fontFamily: 'Campton',
//                                               color: Colors.black,
//                                               fontSize: 16.sp,
//                                               letterSpacing: -1,
//                                               fontWeight: FontWeight.w600,
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                       Padding(
//                                         padding: EdgeInsets.only(bottom: 10.w),
//                                         child: PrimaryButton(
//                                           height: 50.h,
//                                           color: Colors.black,
//                                           onTap: () {
//                                             Navigator.push(
//                                                 context,
//                                                 MaterialPageRoute(
//                                                     builder: (context) =>
//                                                         HotelDetails()));
//                                           },
//                                           borderRadius: 30,
//                                           child: Text('View Reviews',
//                                               style: TextStyle(
//                                                 fontFamily: 'Campton',
//                                                 color: Colors.white,
//                                                 fontSize: 16.sp,
//                                                 letterSpacing: -1,
//                                                 fontWeight: FontWeight.w600,
//                                               )),
//                                         ),
//                                       ),
//                                       Padding(
//                                         padding: EdgeInsets.only(bottom: 10.w),
//                                         child: PrimaryButton(
//                                           height: 50.h,
//                                           color: Color(0xffF55C5C),
//                                           onTap: () {
//                                             showDialog(
//                                                 context: context,
//                                                 builder:
//                                                     (BuildContext context) {
//                                                   return AlertDialog(
//                                                     shape:
//                                                         const RoundedRectangleBorder(
//                                                       borderRadius:
//                                                           BorderRadius.all(
//                                                               Radius.circular(
//                                                                   20.0)),
//                                                     ),
//                                                     backgroundColor: Colors.red,

//                                                     // contentPadding:
//                                                     //     EdgeInsets.symmetric(
//                                                     //         horizontal:
//                                                     //             5.w,
//                                                     //         vertical:
//                                                     //             5),
//                                                     scrollable: true,
//                                                     content: Column(
//                                                       crossAxisAlignment:
//                                                           CrossAxisAlignment
//                                                               .end,
//                                                       children: <Widget>[
//                                                         GestureDetector(
//                                                           onTap: () {
//                                                             Navigator.pop(
//                                                                 context);
//                                                           },
//                                                           child:
//                                                               SvgPicture.asset(
//                                                             'assets/icons/CloseSquare.svg',
//                                                             // width: 30,
//                                                             // alignment: Alignment.topRight,
//                                                           ),
//                                                         ),
//                                                         Center(
//                                                           child: Column(
//                                                             children: [
//                                                               SvgPicture.asset(
//                                                                 'assets/icons/favorite.svg',
//                                                                 // width: 30,
//                                                                 // alignment: Alignment.topRight,
//                                                               ),
//                                                               SizedBox(
//                                                                 height: 10.h,
//                                                               ),
//                                                               const Text(
//                                                                 "Added to favorites!",
//                                                                 style:
//                                                                     TextStyle(
//                                                                   fontFamily:
//                                                                       'Campton',
//                                                                   color: Colors
//                                                                       .white,
//                                                                   fontSize: 17,
//                                                                   fontWeight:
//                                                                       FontWeight
//                                                                           .w600,
//                                                                 ),
//                                                               ),
//                                                             ],
//                                                           ),
//                                                         ),
//                                                       ],
//                                                     ),
//                                                   );
//                                                 });
//                                           },
//                                           borderRadius: 30,
//                                           child: Text(
//                                             'Add Favourite',
//                                             style: TextStyle(
//                                               fontFamily: 'Campton',
//                                               color: Colors.white,
//                                               fontSize: 16.sp,
//                                               letterSpacing: -1,
//                                               fontWeight: FontWeight.w600,
//                                             ),
//                                           ),
//                                         ),
//                                       )
//                                     ],
//                                   ),
//                                 )
//                               : Container()
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ));
//   }
// }

// class HotelAppBar extends StatelessWidget implements PreferredSizeWidget {
//   // final VoidCallback onBackTap;

//   HotelAppBar({
//     super.key,
//   });

//   @override
//   final Size preferredSize = Size.fromHeight(120.h);
//   @override
//   Widget build(BuildContext context) {
//     return PreferredSize(
//       preferredSize: const Size.fromHeight(120),
//       child: Stack(children: [
//         Container(
//           decoration: const BoxDecoration(
//               image: DecorationImage(
//                   image: AssetImage('assets/images/layer_blur.png'),
//                   fit: BoxFit.cover)),
//         ),
//         Padding(
//           padding: EdgeInsets.only(top: 50.h),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Container(
//                 // color: Colors.black,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     GestureDetector(
//                       onTap: () {
//                         final ScaffoldState? scaffoldState =
//                             Scaffold.maybeOf(context);
//                         scaffoldState?.openDrawer();
//                       },
//                       child: Padding(
//                         padding: const EdgeInsets.only(left: 27),
//                         child: SvgPicture.asset(
//                           'assets/icons/3_lines.svg',
//                           alignment: Alignment.topLeft,
//                         ),
//                       ),
//                     ),
//                     Column(
//                       // mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Container(
//                           // color: Colors.red,
//                           padding: EdgeInsets.only(bottom: 8.h),
//                           child: Image.asset(
//                             'assets/images/katman_1.png',
//                             height: 33.h,
//                             width: 43.42.w,
//                             fit: BoxFit.fitWidth,
//                           ),
//                         ),
//                         Text(
//                           'powered by',
//                           style: TextStyle(
//                               color: Colors.white,
//                               fontFamily: 'Campton',
//                               fontSize: 14.sp,
//                               letterSpacing: -1,
//                               fontWeight: FontWeight.w400),
//                         ),
//                         RichText(
//                             text: TextSpan(
//                                 style: TextStyle(
//                                     color: Colors.white,
//                                     fontFamily: 'Campton',
//                                     fontSize: 22.sp,
//                                     letterSpacing: -1,
//                                     fontWeight: FontWeight.w400),
//                                 children: [
//                               const TextSpan(
//                                   text: 'MD',
//                                   style:
//                                       TextStyle(fontWeight: FontWeight.w700)),
//                               const TextSpan(text: 'booking')
//                             ]))
//                       ],
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(right: 30),
//                       child: SvgPicture.asset(
//                         'assets/icons/box.svg',
//                         alignment: Alignment.topRight,
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//         Positioned(
//           bottom: 10,
//           left: 0,
//           child: GestureDetector(
//             onTap: () {
//               Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                       builder: (context) => PaymentDetailsView(
//                             purchaseType: "",
//                           )));
//             },
//             child: Container(
//               padding: EdgeInsets.only(left: 17.w),
//               child: Row(
//                 crossAxisAlignment: CrossAxisAlignment.end,
//                 children: [
//                   SvgPicture.asset(
//                     'assets/icons/backicon.svg',
//                     // alignment: Alignment.topRight,
//                   ),
//                   SizedBox(
//                     width: 2.w,
//                   ),
//                   Text(
//                     "Back",
//                     style: TextStyle(
//                         color: Colors.white,
//                         fontFamily: 'Campton',
//                         fontSize: 18.sp,
//                         letterSpacing: -1,
//                         fontWeight: FontWeight.w600),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         )
//       ]),
//     );
//   }
// }
