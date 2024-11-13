// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:md_health/Screens/diet_plan/controller/dient_view_controller.dart';
// import 'package:md_health/Screens/diet_plan/view/deit_plan_result.dart';
// import 'package:md_health/Screens/diet_plan/view/diet_plan_view.dart';
// import 'package:md_health/constants/styles/colors.dart';
// import 'package:md_health/test_widget.dart';
// import 'package:md_health/widget/base_screen.dart';
// import 'package:md_health/widget/buttons.dart';
// import 'package:md_health/widget/custom_appbar.dart';
// import 'package:provider/provider.dart';

// class DietPlanSelectedItemDetails extends StatefulWidget {
//   final String? food;
//   final String? calories;
//   final String? subscriptionType;
//   final String? foodPackageId;
//   const DietPlanSelectedItemDetails(
//       {super.key,
//       this.food,
//       this.calories,
//       this.subscriptionType,
//       this.foodPackageId});

//   @override
//   State<DietPlanSelectedItemDetails> createState() =>
//       _DietPlanSelectedItemDetailsState();
// }

// class _DietPlanSelectedItemDetailsState
//     extends State<DietPlanSelectedItemDetails> {
//   @override
//   Widget build(BuildContext context) {
//     final read = context.read<DietPlanviewController>();
//     final watch = context.watch<DietPlanviewController>();
//     return BaseScreen(
//         onWillPop: () async {
//           Navigator.push(
//             context,
//             SlidePageRoute(
//               page: DietPlanResult(
//                 food: widget.food, calories: widget.calories,
//                 subscriptionType: widget.subscriptionType,

//                 // packageId:
//                 //     widget.packageId,
//               ),
//               direction:
//                   SlideDirection.left, // Specify the slide direction here
//               delay: const Duration(milliseconds: 5000),
//             ),
//           );

//           return false;
//         },
//         backgroundColor: Colors.white,
//         hasScrollView: false,
//         appBar: CustomAppBar(
//           hasMdTitle: false,
//           hasBackButton: true,
//           onBackPressed: () {
//             Navigator.push(
//               context,
//               SlidePageRoute(
//                 page: const DietPlanView(
//                     // packageId:
//                     //     widget.packageId,
//                     ),
//                 direction:
//                     SlideDirection.left, // Specify the slide direction here
//                 delay: const Duration(milliseconds: 5000),
//               ),
//             );
//           },
//         ),
//         content: Builder(builder: (context) {
//           return SingleChildScrollView(
//             child: Column(
//               children: [
//                 Container(
//                     padding: EdgeInsets.only(top: 35.w, bottom: 59.w),
//                     // height: 100.h,
//                     width: ScreenUtil().screenWidth,
//                     color: Colors.black,
//                     child: const Column(
//                       // sort
//                       children: [
//                         Text(
//                           "SEARCH",
//                           style: TextStyle(
//                               fontFamily: 'Campton',
//                               color: kDefaultActiveColor,
//                               fontSize: 39,
//                               fontWeight: FontWeight.w700),
//                         ),
//                         Text(
//                           "RESULTS",
//                           style: TextStyle(
//                               fontFamily: 'Campton',
//                               color: Colors.white,
//                               fontSize: 70,
//                               fontWeight: FontWeight.w700),
//                         )
//                       ],
//                     )),
//                 Container(
//                   margin: const EdgeInsets.only(top: 10, bottom: 10),
//                   decoration: BoxDecoration(
//                       borderRadius: const BorderRadius.all(Radius.circular(15)),
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.black.withOpacity(0.1),
//                           spreadRadius: 1,
//                           blurStyle: BlurStyle.outer,
//                           blurRadius: 10,
//                         )
//                       ]),
//                   padding: EdgeInsets.only(
//                       left: 10.w, right: 8.w, top: 16.w, bottom: 20.w),
//                   child: Stack(
//                     children: [
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Container(
//                               decoration: const BoxDecoration(
//                                 color: Colors.white,
//                               ),
//                               child:
//                                   // watch.images != ""
//                                   //     ?
//                                   Image(
//                                 image: NetworkImage(
//                                   ' element?.images ?? ',
//                                   // "assets/images/vecteezy_hamburger-food-png-generative-ai_27147309.png",
//                                 ),
//                                 width: ScreenUtil().screenWidth,
//                                 fit: BoxFit.fill,
//                                 height: 150.h,
//                               )
//                               //  Image(
//                               //     image: NetworkImage(
//                               //       scale: 1.0,
//                               //       element?.images ?? '',
//                               //       // "assets/images/new_group.png",
//                               //     ),
//                               //     width: ScreenUtil()
//                               //         .screenWidth,
//                               //     // fit: BoxFit.fill,
//                               //     height: 150.h,
//                               //     // height: 60.h,
//                               //   )
//                               // : Container(
//                               //     width: ScreenUtil().screenWidth,
//                               //     // fit: BoxFit.fill,
//                               //     height: 150.h,
//                               //     decoration: BoxDecoration(
//                               //         color: const Color(0xffD9D9D9),
//                               //         border: Border.all(
//                               //           width: 2,
//                               //           color: const Color(0xffD9D9D9),
//                               //         ),
//                               //         borderRadius: BorderRadius.circular(5)),
//                               //     child: const Center(
//                               //       child: Text(
//                               //         "Food Logo",
//                               //         style: TextStyle(
//                               //             fontFamily: 'Campton',
//                               //             color: Color(0xff9A9A9A),
//                               //             fontSize: 14,
//                               //             fontWeight: FontWeight.w700),
//                               //       ),
//                               //     ),
//                               //   ),
//                               //  AppNetworkImages(
//                               //     imageUrl: ' ${element?.images}'
//                               //     // "assets/images/vecteezy_hamburger-food-png-generative-ai_27147309.png",
//                               //     ),
//                               // width: ScreenUtil().screenWidth,
//                               // // fit: BoxFit.fill,
//                               // height: 150.h,
//                               ),
//                           //  Image(
//                           //   image: NetworkImage(
//                           //     ' ${element?.packageName}'
//                           //     // "assets/images/vecteezy_hamburger-food-png-generative-ai_27147309.png",
//                           //     ),
//                           // width: ScreenUtil().screenWidth,
//                           // fit: BoxFit.fill,
//                           // height: 150.h,
//                           // ),

//                           SizedBox(
//                             height: 10.w,
//                           ),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Text(
//                                 " {element?.packageName}",
//                                 // "Hearth Valve Replacement Surgery",
//                                 style: TextStyle(
//                                     fontFamily: 'Campton',
//                                     color: const Color(0xff212121),
//                                     fontSize: 16.sp,
//                                     fontWeight: FontWeight.w700),
//                               ),
//                               Expanded(
//                                 child: Row(
//                                   mainAxisAlignment: MainAxisAlignment.end,
//                                   children: [
//                                     // element?.featuredStatus == "approved"
//                                     //     ?
//                                     Container(
//                                       padding: EdgeInsets.only(
//                                           left: 8,
//                                           top: 4,
//                                           right: 8.w,
//                                           bottom: 4),
//                                       decoration: BoxDecoration(
//                                           borderRadius:
//                                               BorderRadius.circular(20),
//                                           color: Colors.yellow),
//                                       child: Text(
//                                         "Featured",
//                                         // "Nivea",featured
//                                         style: TextStyle(
//                                             // decoration:
//                                             // TextDecoration.underline,
//                                             // letterSpacing: 3.5,
//                                             color: black,
//                                             fontSize: 10.sp,
//                                             fontWeight: FontWeight.w700),
//                                       ),
//                                     ),
//                                     // : Container(),
//                                     SizedBox(
//                                       width: 10.w,
//                                     ),
//                                     // element?.verified == "yes"
//                                     //     ?
//                                     Image(
//                                       image: const AssetImage(
//                                         "assets/images/new_group.png",
//                                       ),
//                                       width: 75.w,
//                                       // height: 60.h,
//                                     )
//                                     // : Container()
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           ),
//                           SizedBox(
//                             height: 7.h,
//                           ),
//                           /////////////
//                           Column(
//                             children: [
//                               Row(
//                                 children: [
//                                   SvgPicture.asset(
//                                     'assets/icons/location.svg',
//                                     // alignment: Alignment.topRight,
//                                   ),
//                                   Text(
//                                     "{element?.cityName}",
//                                     // "Beşiktaş / İstanbul",
//                                     style: TextStyle(
//                                         fontStyle: FontStyle.italic,
//                                         fontFamily: 'Campton',
//                                         color: const Color(0xff212121),
//                                         fontSize: 13.sp,
//                                         fontWeight: FontWeight.w400),
//                                   ),
//                                 ],
//                               ),
//                               SizedBox(
//                                 height: 7.h,
//                               ),
//                               Row(
//                                 children: [
//                                   SvgPicture.asset(
//                                     'assets/icons/time.svg',
//                                     alignment: Alignment.topRight,
//                                   ),
//                                   Text(
//                                     "{element?.subscriptionType}",
//                                     // "Treatment Periods 3-5 days",
//                                     style: TextStyle(
//                                         fontFamily: 'Campton',
//                                         color: const Color(0xff212121),
//                                         fontSize: 13.sp,
//                                         fontStyle: FontStyle.italic,
//                                         fontWeight: FontWeight.w400),
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                           SizedBox(
//                             height: 10.w,
//                           ),
//                           // element?.foodType == 'Veg'
//                           //     ?
//                           Text(
//                             " This package is the basic package it includes Veg",
//                             style: GoogleFonts.notoSans(
//                               textStyle: TextStyle(
//                                 color: black,
//                                 fontSize: 12.sp,
//                                 fontWeight: FontWeight.w700,
//                               ),
//                             ),
//                           ),
//                           // : Container(),
//                           ////////////////////////////////////
//                           // element?.foodType == 'Non-Veg'
//                           //     ?
//                           Text(
//                             " This package is the basic package it includes Non-Veg",
//                             style: GoogleFonts.notoSans(
//                               textStyle: TextStyle(
//                                 color: black,
//                                 fontSize: 12.sp,
//                                 fontWeight: FontWeight.w400,
//                               ),
//                             ),
//                           ),
//                           // : Container(),
//                           // element?.foodType == 'Veg & Non-Veg'
//                           //     ?
//                           Text(
//                             "*This package is the basic package it includes Veg & Non-Veg",
//                             style: GoogleFonts.notoSans(
//                               textStyle: TextStyle(
//                                 color: black,
//                                 fontSize: 12.sp,
//                                 fontWeight: FontWeight.w700,
//                               ),
//                             ),
//                           ),
//                           // : Container(),
//                           SizedBox(
//                             height: 10.w,
//                           ),
//                           Text(
//                             "Package Included",
//                             style: TextStyle(
//                               fontFamily: 'Campton',
//                               color: const Color(0xff4CDB06),
//                               fontSize: 14.sp,
//                               fontWeight: FontWeight.w700,
//                             ),
//                           ),
//                           SizedBox(
//                             height: 5.w,
//                           ),
//                           // ListView.builder(
//                           //   // padding: EdgeInsets.only(
//                           //   //     bottom: 10.w),
//                           //   physics: NeverScrollableScrollPhysics(),
//                           //   shrinkWrap: true,
//                           //   itemCount: element?.mealTypes?.length ?? 0,
//                           //   itemBuilder: (context, index) {
//                           //     final mealType = element?.mealTypes?[index];
//                           //     return
//                           Container(
//                             padding: const EdgeInsets.only(bottom: 10),
//                             child: Row(
//                               children: [
//                                 Image.asset(
//                                   "assets/icons/katman_1.png",
//                                   width: 10.w,
//                                   height: 7.h,
//                                 ),
//                                 SizedBox(
//                                   width: 5.w,
//                                 ),
//                                 Text(
//                                   "{mealType}",
//                                   // "Tour",
//                                   style: TextStyle(
//                                     fontFamily: 'Campton',
//                                     color: Colors.black,
//                                     fontSize: 13.sp,
//                                     fontWeight: FontWeight.w400,
//                                   ),
//                                 ),
//                                 // SvgPicture.asset(
//                                 //   'assets/icons/katman_1.png',
//                                 //   // alignment: Alignment.topRight,
//                                 // ),
//                               ],
//                             ),
//                           ),
//                           // },
//                           // ),

//                           Text(
//                             'Meal Service Price ',
//                             style: TextStyle(
//                               fontFamily: 'Campton',
//                               color: kDefaultActiveColor,
//                               fontSize: 17.sp,
//                               letterSpacing: -1,
//                               fontWeight: FontWeight.w600,
//                             ),
//                           ),
//                           Row(
//                             children: [
//                               // if ((element?.monthlySalesPrice ?? 0).toDouble() <
//                               //     (element?.monthlyPackagePrice ?? 0)
//                               //         .toDouble())
//                               Stack(
//                                 children: [
//                                   // Your other content here

//                                   // Conditionally display slanted line or container

//                                   Positioned.fill(
//                                     child: CustomPaint(
//                                       painter:
//                                           SlantedLinePainter(color: Colors.red),
//                                     ),
//                                   ),
//                                   //  / You can customize this container if needed

//                                   // Text(
//                                   //   "${element?.monthlyPackagePrice}",
//                                   //   style:
//                                   //       GoogleFonts.notoSans(
//                                   //     textStyle: TextStyle(
//                                   //       color: Colors.black,
//                                   //       fontSize: 14,
//                                   //       fontWeight:
//                                   //           FontWeight.w500,
//                                   //     ),
//                                   //   ),
//                                   // ),
//                                   // Text(
//                                   //   "₺",
//                                   //   style:
//                                   //       GoogleFonts.notoSans(
//                                   //     textStyle: TextStyle(
//                                   //       color: Colors.black,
//                                   //       fontSize: 14,
//                                   //       fontWeight:
//                                   //           FontWeight.w500,
//                                   //     ),
//                                   //   ),
//                                   // ),
//                                   RichText(
//                                     text: TextSpan(
//                                         text: "{element?.monthlyPackagePrice}",
//                                         style: TextStyle(
//                                             fontFamily: 'Campton',
//                                             color: Colors.black,
//                                             fontSize: 16.sp,
//                                             fontWeight: FontWeight.w600),
//                                         children: [
//                                           TextSpan(
//                                             text: ' ₺',
//                                             style: GoogleFonts.inter(
//                                               textStyle: TextStyle(
//                                                   // fontFamily: 'Campton',
//                                                   color: Colors.black,
//                                                   fontSize: 16.sp,
//                                                   fontWeight: FontWeight.w600),
//                                             ),
//                                           ),
//                                         ]),
//                                   ),
//                                 ],
//                               )
//                               // else
//                               //   Container(),
//                               // element?.discountPrice != ""
//                               //     ? Text(
//                               //         "  ( ${element?.discountPrice}%  Discount)",
//                               //         style: GoogleFonts.notoSans(
//                               //           textStyle: TextStyle(
//                               //             color: kDefaultActiveColor,
//                               //             fontSize: 14,
//                               //             fontWeight: FontWeight.w600,
//                               //           ),
//                               //         ),
//                               //       )
//                               //     : Container()
//                             ],
//                           ),

//                           ///////////////////////////////////////

//                           //////////////////////////////////////
//                           SizedBox(
//                             height: 5.h,
//                           ),
//                           RichText(
//                             text: TextSpan(
//                               style: TextStyle(
//                                 fontFamily: 'Campton',
//                                 color: Colors.black,
//                                 fontSize: 16.sp,
//                                 letterSpacing: -1.5,
//                                 fontWeight: FontWeight.w600,
//                               ),
//                               children: [
//                                 TextSpan(
//                                     text:
//                                         // '${element?.foodPackageId} ₺',
//                                         '{element?.monthlySalesPrice} ',
//                                     style: TextStyle(fontSize: 20.sp)
//                                     // style: GoogleFonts.inter(
//                                     //   textStyle: TextStyle(
//                                     //     fontSize: 20.sp,
//                                     //   ),
//                                     // ),
//                                     ),
//                                 TextSpan(
//                                   text:
//                                       // '${element?.foodPackageId} ₺',
//                                       '₺',
//                                   style: GoogleFonts.inter(
//                                     textStyle: TextStyle(
//                                       fontSize: 20.sp,
//                                     ),
//                                   ),
//                                 ),
//                                 TextSpan(text: ' ({widget.salesPrice}  '),
//                                 TextSpan(
//                                   text: '₺',
//                                   style: GoogleFonts.inter(),
//                                 ),
//                                 TextSpan(
//                                   text: ' per meal )',
//                                 )
//                               ],
//                             ),
//                           ),

//                           Container(
//                             padding: EdgeInsets.only(top: 25.w),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.end,
//                               children: [
//                                 PrimaryButton(
//                                   height: 35.h,
//                                   width: 160.w,
//                                   color: kDefaultActiveColor,
//                                   onTap: () {
//                                     // showStepOneDialog(
//                                     //     id: widget.foodPackageId.toString());
//                                   },
//                                   text: 'Purchase Meal Service',
//                                   textStyle: TextStyle(
//                                     fontFamily: 'Campton',
//                                     color: Colors.black,
//                                     fontSize: 16.sp,
//                                     letterSpacing: -1,
//                                     fontWeight: FontWeight.w600,
//                                   ),
//                                   textColor: Colors.black,
//                                 ),
//                                 SizedBox(
//                                   width: 15.w,
//                                 ),
//                                 GestureDetector(
//                                     onTap: () {
//                                       print(widget.foodPackageId);
//                                       // return;
//                                       read.addToFavMenuFood(
//                                         context,
//                                         widget.foodPackageId.toString(),
//                                         "food",
//                                       );
//                                     },
//                                     child:
//                                         //  element?.isFavorite != "yes"
//                                         //     ?
//                                         Container(
//                                       height: 35.h,
//                                       width: 46.w,
//                                       padding: EdgeInsets.only(
//                                           left: 3.5.w, top: 7.w, bottom: 7.w),
//                                       alignment: Alignment.center,
//                                       decoration: BoxDecoration(
//                                           color: Color(0xffF55C5C),
//                                           borderRadius: BorderRadius.all(
//                                               Radius.circular(5))),
//                                       child: SvgPicture.asset(
//                                         'assets/icons/favorite.svg',
//                                       ),
//                                     )
//                                     // : Container(
//                                     //     height: 35.h,
//                                     //     width: 46.w,
//                                     //     padding: EdgeInsets.only(
//                                     //         left: 3.5.w,
//                                     //         top: 7.w,
//                                     //         bottom: 7.w),
//                                     //     alignment: Alignment.center,
//                                     //     decoration: BoxDecoration(
//                                     //         color: Colors.grey,
//                                     //         borderRadius: BorderRadius.all(
//                                     //             Radius.circular(5))),
//                                     //     child: SvgPicture.asset(
//                                     //       'assets/icons/favorite.svg',
//                                     //     ),
//                                     //   ),
//                                     ),
//                               ],
//                             ),
//                           )
//                         ],
//                       ),
//                       Positioned(
//                         bottom: 100.w,
//                         right: 15,
//                         child: GestureDetector(
//                           onTap: () {
//                             print("object");
//                             print(widget?.foodPackageId);
//                             read.viewMenuDetails(context, widget.foodPackageId);
//                             // setState(() {
//                             //   isExpanded = !isExpanded;
//                             // });
//                           },
//                           child: SvgPicture.asset(
//                             'assets/icons/ViewDetails Button (1).svg',
//                             // alignment: Alignment.topRight,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           );
//         }));
//   }
// }
