// import 'package:datepicker_dropdown/datepicker_dropdown.dart';
// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:md_health/Screens/packages/controller/packages_view_controller.dart';
// import 'package:md_health/Screens/payment_details/view/payment_details_view.dart';
// import 'package:md_health/constants/styles/colors.dart';
// import 'package:md_health/widget/base_screen.dart';
// import 'package:md_health/widget/buttons.dart';
// import 'package:md_health/widget/custom_appbar.dart';
// import 'package:md_health/widget/drop_down.dart';
// import 'package:md_health/widget/rating.dart';
// import 'package:md_health/widget/text_field.dart';
// import 'package:provider/provider.dart';

// class ReviewView extends StatefulWidget {
//   const ReviewView({super.key});

//   @override
//   State<ReviewView> createState() => _ReviewViewState();
// }

// class _ReviewViewState extends State<ReviewView> {
//   @override
//   Widget build(BuildContext context) {
//     final read = context.read<PackageViewController>();
//     final watch = context.watch<PackageViewController>();
//     return BaseScreen(
//       onWillPop: () async {
//         // Navigator.pushReplacement(
//         //   context,
//         //   SlidePageRoute(
//         //     page: SearchDetailsView(
//         //       packageId: widget.packageId,

//         //       // packageId: watch.packageId,
//         //     ),
//         //     direction: SlideDirection.left, // Specify the slide direction here
//         //     delay: Duration(milliseconds: 5000),
//         //   ),
//         //   // MaterialPageRoute(
//         //   //     builder: (context) => SearchDetailsView(
//         //   //           packageId: watch.packageId,
//         //   //         ))
//         // );
//         Navigator.pop(context);

//         return false;
//       },
//       backgroundColor: const Color(0xffF5F5F5),
//       appBar: PreferredSize(
//         preferredSize: Size.fromHeight(110.h),
//         child: CustomAppBar(
//           // mdTitle: false,
//           hasMdTitle: false,
//           drawerTitle: 'Reservation',
//           hasBackButton: true,
//           onBackPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//       ),
//       content: Column(
//         children: [
//           SizedBox(
//             height: 20.h,
//           ),
//           Text(
//             "please write your feedback for",
//             // textAlign: TextAlign.center,
//             style: TextStyle(
//               fontFamily: 'Campton',
//               color: kDefaultActiveColor,
//               fontSize: 19.sp,
//               fontWeight: FontWeight.w500,
//             ),
//           ),
//           Text(
//             "better services",
//             // textAlign: TextAlign.center,
//             style: TextStyle(
//               fontFamily: 'Campton',
//               color: Colors.black,
//               fontSize: 40.sp,
//               fontWeight: FontWeight.w700,
//             ),
//           ),
//           Text(
//             "& get MDcoin.",
//             // textAlign: TextAlign.center,
//             style: TextStyle(
//               fontFamily: 'Campton',
//               color: kDefaultActiveColor,
//               fontSize: 19.sp,
//               fontWeight: FontWeight.w500,
//             ),
//           ),
//           Card(
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(15.0),
//             ),
//             margin: const EdgeInsets.all(20.0),
//             child: Container(
//               padding: EdgeInsets.only(left: 15.w, right: 13.w),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   SizedBox(
//                     height: 10.h,
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text(
//                         "Write Review",
//                         // textAlign: TextAlign.center,
//                         style: TextStyle(
//                           fontFamily: 'Campton',
//                           color: kDefaultActiveColor,
//                           fontSize: 23.sp,
//                           fontWeight: FontWeight.w700,
//                         ),
//                       ),
//                     ],
//                   ),
//                   SizedBox(
//                     height: 25.h,
//                   ),
//                   Text(
//                     "Treatment",
//                     // textAlign: TextAlign.center,
//                     style: TextStyle(
//                       fontFamily: 'Campton',
//                       color: Colors.black,
//                       fontSize: 16.sp,
//                       fontWeight: FontWeight.w700,
//                     ),
//                   ),
//                   NewStarRating(
//                       rating: watch.ratingValue ?? 0,
//                       onRatingChanged: (rating) {
//                         read.onRatingSelect(rating);
//                         print(rating);
//                       }),
//                   SizedBox(
//                     height: 43.h,
//                   ),
//                   Text(
//                     "Acommodition",
//                     // textAlign: TextAlign.center,
//                     style: TextStyle(
//                       fontFamily: 'Campton',
//                       color: Colors.black,
//                       fontSize: 16.sp,
//                       fontWeight: FontWeight.w700,
//                     ),
//                   ),
//                   NewStarRating(
//                       rating: watch.ratingValue ?? 0,
//                       onRatingChanged: (rating) {
//                         read.onRatingSelect(rating);
//                         print(rating);
//                       }),
//                   SizedBox(
//                     height: 43.h,
//                   ),
//                   Text(
//                     "Behavior / Professionalism",
//                     // textAlign: TextAlign.center,
//                     style: TextStyle(
//                       fontFamily: 'Campton',
//                       color: Colors.black,
//                       fontSize: 16.sp,
//                       fontWeight: FontWeight.w700,
//                     ),
//                   ),
//                   NewStarRating(
//                       rating: watch.ratingValue ?? 0,
//                       onRatingChanged: (rating) {
//                         read.onRatingSelect(rating);
//                         print(rating);
//                       }),
//                   SizedBox(
//                     height: 25.h,
//                   ),
//                   Text(
//                     "Transportation",
//                     // textAlign: TextAlign.center,
//                     style: TextStyle(
//                       fontFamily: 'Campton',
//                       color: Colors.black,
//                       fontSize: 16.sp,
//                       fontWeight: FontWeight.w700,
//                     ),
//                   ),
//                   NewStarRating(
//                       rating: watch.ratingValue ?? 0,
//                       onRatingChanged: (rating) {
//                         read.onRatingSelect(rating);
//                         print(rating);
//                       }),
//                   SizedBox(
//                     height: 25.h,
//                   ),
//                   Text(
//                     "Do you recommanded this vehical",
//                     // textAlign: TextAlign.center,
//                     style: TextStyle(
//                       fontFamily: 'Campton',
//                       color: Colors.black,
//                       fontSize: 16.sp,
//                       fontWeight: FontWeight.w700,
//                     ),
//                   ),
//                   SizedBox(
//                     height: 5.h,
//                   ),
//                   PackageDropDownSearchList(
//                     textEditingController: null,
//                     iconPadding: const EdgeInsets.only(right: 32),
//                     // titleHeader: "*Patient Country",
//                     onChanged: (value) {
//                       // read.onSelectAccountType(value);
//                     },
//                     hint: "10",
//                     items: [
//                       DropdownMenuItem(
//                         value: "current",
//                         child: Text(
//                           "Current",
//                           style: TextStyle(
//                             fontSize: 14.sp,
//                           ),
//                         ),
//                       ),
//                       DropdownMenuItem(
//                         value: "saving",
//                         child: Text(
//                           "Saving",
//                           style: TextStyle(
//                             fontSize: 14.sp,
//                           ),
//                         ),
//                       )
//                     ],
//                   ),
//                   SizedBox(
//                     height: 34.h,
//                   ),
//                   RichText(
//                       text: TextSpan(
//                           style: TextStyle(
//                             fontFamily: 'Campton',
//                             color: Colors.black,
//                             fontSize: 16.sp,
//                             fontWeight: FontWeight.w700,
//                           ),
//                           children: [
//                         const TextSpan(text: 'Extra Notes'),
//                         TextSpan(
//                           text: "*Optional",
//                           style: TextStyle(
//                             fontWeight: FontWeight.w500,
//                             fontSize: 14.sp,
//                             fontStyle: FontStyle.italic,
//                           ),
//                         ),
//                       ])),
//                   SizedBox(
//                     height: 10.h,
//                   ),
//                   PrimaryCTextFormField(
//                     // titleHeader: "Extra Notes *Optional",
//                     maxLines: 100,
//                     // borderRadius: 5,
//                     // color: Colors.red,
//                     height: 100.w,
//                     // titleHeader: "*Patient Contact Number",
//                     hintText: "Please share you feedback & experience.",
//                     // contentPadding: EdgeInsets.only(top: 20, left: 15),
//                   ),
//                   SizedBox(
//                     height: 20.h,
//                   ),
//                   SizedBox(
//                     height: 37.h,
//                   ),
//                   PrimaryButton(
//                     width: 300,
//                     // borderRadius: BorderRadius.circular(),
//                     borderRadius: 30,
//                     // width: ScreenUtil().screenWidth,
//                     color: const Color(0xffF3771D),
//                     onTap: () {
//                       showDialog(
//                           // barrierColor: Colors
//                           //     .transparent,
//                           context: context,
//                           builder: (BuildContext context) => AlertDialog(
//                                 shape: const RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.all(
//                                         Radius.circular(15.0))),

//                                 // insetPadding:
//                                 //    EdgeInsets.all(0),
//                                 contentPadding: const EdgeInsets.only(top: 0.0),

//                                 content: Container(
//                                   width: ScreenUtil().screenWidth,
//                                   height: 350.h,
//                                   // padding:
//                                   //     EdgeInsets.only(bottom: 10.w),
//                                   child: Column(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.center,
//                                     children: [
//                                       Stack(
//                                         children: [
//                                           Container(
//                                             decoration: const BoxDecoration(
//                                                 borderRadius: BorderRadius.all(
//                                                     Radius.circular(15.0))),
//                                             child: ClipRRect(
//                                               borderRadius:
//                                                   BorderRadius.circular(
//                                                       15), // Image border
//                                               child: SizedBox.fromSize(
//                                                 // size: Size.fromRadius(
//                                                 //     10), // Image radius
//                                                 child: const Image(
//                                                     image: AssetImage(
//                                                         "assets/images/green_pop_up.png")),
//                                               ),
//                                             ),

//                                             // Image(
//                                             //     image: AssetImage(
//                                             //         "assets/images/pop__new_.png")),
//                                           ),
//                                           Positioned(
//                                               top: 25,
//                                               right: 0,
//                                               left: 0,
//                                               child: Column(
//                                                 children: [
//                                                   // Text('data'),
//                                                   SvgPicture.asset(
//                                                       "assets/icons/material_symbols_person_celebrate.svg"
//                                                       // "assets/icons/sad.svg"
//                                                       ),
//                                                   // Text(
//                                                   //   "Delete",
//                                                   //   style: TextStyle(
//                                                   //       color: Colors.white,
//                                                   //       // letterSpacing: .5,
//                                                   //       fontSize: 30.sp,
//                                                   //       fontWeight: FontWeight.w700),
//                                                   // ),
//                                                   RichText(
//                                                     text: TextSpan(
//                                                       text: 'Thank',
//                                                       style: TextStyle(
//                                                           letterSpacing: -1,
//                                                           fontFamily: 'Campton',
//                                                           color: Colors.white,
//                                                           fontSize: 30.sp,
//                                                           fontWeight:
//                                                               FontWeight.w700),

//                                                       /*defining default style is optional */
//                                                       children: <TextSpan>[
//                                                         TextSpan(
//                                                           text: ' You!',
//                                                           style: TextStyle(
//                                                               letterSpacing: -1,
//                                                               fontFamily:
//                                                                   'Campton',
//                                                               color:
//                                                                   Colors.black,
//                                                               fontSize: 30.sp,
//                                                               fontWeight:
//                                                                   FontWeight
//                                                                       .w500),
//                                                         ),
//                                                       ],
//                                                     ),
//                                                   ),
//                                                 ],
//                                               )),
//                                           // Positioned(
//                                           //   top: 80,
//                                           //   right: 55,
//                                           //   // left: 0,
//                                           // child: Text(
//                                           //   "Request Cancel",
//                                           //   style: TextStyle(
//                                           //       color: Colors.white,
//                                           //       // letterSpacing: .5,
//                                           //       fontSize: 25.sp,
//                                           //       fontWeight: FontWeight.w700),
//                                           // ),
//                                           // )
//                                         ],
//                                       ),
//                                       SizedBox(
//                                         height: 38.h,
//                                       ),
//                                       Text(
//                                         "Thank you for your review.",
//                                         textAlign: TextAlign.center,
//                                         style: TextStyle(
//                                             color: Colors.black,
//                                             letterSpacing: -1,
//                                             fontFamily: 'Campton',
//                                             fontSize: 21.sp,
//                                             fontWeight: FontWeight.w600),
//                                       ),
//                                       SizedBox(
//                                         height: 10.h,
//                                       ),
//                                       RichText(
//                                         textAlign: TextAlign.center,
//                                         text: TextSpan(
//                                           text:
//                                               'The reward will be credited to your\n',
//                                           style: TextStyle(
//                                               letterSpacing: -1,
//                                               fontFamily: 'Campton',
//                                               color: Colors.black,
//                                               fontSize: 14.sp,
//                                               fontWeight: FontWeight.w400),

//                                           /*defining default style is optional */
//                                           children: <TextSpan>[
//                                             TextSpan(
//                                               text: 'MD',
//                                               style: TextStyle(
//                                                   letterSpacing: -1,
//                                                   fontFamily: 'Campton',
//                                                   color: Colors.black,
//                                                   fontSize: 21.sp,
//                                                   fontWeight: FontWeight.w600),
//                                             ),
//                                             TextSpan(
//                                               text:
//                                                   'Coin account as soon as possible.',
//                                               style: TextStyle(
//                                                   letterSpacing: -1,
//                                                   fontFamily: 'Campton',
//                                                   color: Colors.black,
//                                                   fontSize: 14.sp,
//                                                   fontWeight: FontWeight.w400),
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                       SizedBox(
//                                         height: 48.h,
//                                       ),
//                                       Container(
//                                         padding: EdgeInsets.only(
//                                             left: 22.w, right: 21.w),
//                                         child: PrimaryButton(
//                                           // width:
//                                           //     125.w,
//                                           // height:
//                                           //     35.w,
//                                           // borderRadius: BorderRadius.circular(),
//                                           borderRadius: 25,
//                                           // width: ScreenUtil().screenWidth,
//                                           color: const Color(0xff4CDB06),
//                                           onTap: () {
//                                             Navigator.pop(this.context);
//                                             Navigator.pop(context);
//                                           },
//                                           child: Text(
//                                             "Done",
//                                             style: TextStyle(
//                                                 color: Colors.black,
//                                                 letterSpacing: -1,
//                                                 fontFamily: 'Campton',
//                                                 fontSize: 16.sp,
//                                                 fontWeight: FontWeight.w600),
//                                           ),
//                                         ),
//                                       )
//                                     ],
//                                   ),
//                                 ),
//                               ));
//                       // Navigator.push(
//                       //   context,
//                       //   MaterialPageRoute(
//                       //       builder: (context) => PaymentDetailsView()),
//                       // );
//                     },
//                     child: Text(
//                       "Submit Review",
//                       style: TextStyle(
//                           color: Colors.white,
//                           letterSpacing: -1,
//                           fontFamily: 'Campton',
//                           fontSize: 16.sp,
//                           fontWeight: FontWeight.w600),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 80.h,
//                   ),
//                 ],
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
