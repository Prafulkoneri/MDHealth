// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:md_health/Screens/reservation/controller/reservation_controller.dart';
// import 'package:md_health/Screens/reservation/view/review_view.dart';
// import 'package:md_health/constants/styles/colors.dart';
// import 'package:md_health/widget/drop_down.dart';
// import 'package:provider/provider.dart';
// import 'package:md_health/widget/star_rating.dart';

// class VehicleCompletedView extends StatelessWidget {
//   const VehicleCompletedView({
//     super.key,
//   });

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
//                   child: Container(
//                     decoration: BoxDecoration(
//                         color:Colors.white,
//                         borderRadius:
//                         const BorderRadius.all(Radius.circular(10)),
//                         // border: Border.all(color: const Color(0xffEFEFEF)),
//                         boxShadow: [
//                           BoxShadow( color: Colors.black.withOpacity(0.1),
//                               spreadRadius: 1,
//                               blurRadius: 10,
//                               blurStyle: BlurStyle.outer)]
//                     ),
//                     child: Padding(
//                       padding: EdgeInsets.all(10.w),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Container(
//                             child: Row(
//                               crossAxisAlignment: CrossAxisAlignment.end,
//                               children: [
//                                 Container(
//                                   decoration: const BoxDecoration(
//                                     borderRadius: BorderRadius.all(
//                                         Radius.circular(30)),
//                                   ),
//                                   margin: EdgeInsets.symmetric(
//                                       vertical: 15.h, horizontal: 15.w),
//                                   child: Image.asset(
//                                     'assets/images/image 39.png',
//                                     height: 70.h,
//                                     width: 100.w,
//                                     fit: BoxFit.fitWidth,
//                                   ),
//                                 ),
//                                 Container(
//                                   padding: EdgeInsets.only(
//                                     bottom: 30.h,
//                                   ),
//                                   child: Column(
//                                     crossAxisAlignment:
//                                     CrossAxisAlignment.start,
//                                     // mainAxisAlignment: MainAxisAlignment.end,
//                                     children: [
//                                       Padding(
//                                         padding:
//                                         EdgeInsets.only(bottom: 7.w),
//                                         child: Text(
//                                           'Sixt Rental',
//                                           style: TextStyle(
//                                               color: Colors.black,
//                                               fontFamily: 'Campton',
//                                               // letterSpacing: -1,
//                                               fontSize: 18.sp,
//                                               fontWeight: FontWeight.w700),
//                                         ),
//                                       ),
//                                       Row(
//                                         children: [
//                                           SvgPicture.asset(
//                                             'assets/icons/mdi_location.svg',
//                                             height: 11.25.h,
//                                             width: 12.w,
//                                           ),
//                                           SizedBox(
//                                             width: 5.w,
//                                           ),
//                                           RichText(
//                                             text: TextSpan(
//                                                 style: TextStyle(
//                                                     color: Colors.black,
//                                                     fontFamily: 'Campton',
//                                                     letterSpacing: -1,
//                                                     fontSize: 12.sp,
//                                                     fontWeight:
//                                                     FontWeight.w400),
//                                                 children: const [
//                                                   TextSpan(
//                                                       text:
//                                                       'Besiktas / Istanbul'),
//                                                 ]),
//                                           )
//                                         ],
//                                       ),
//                                       SizedBox(
//                                         height: 5.w,
//                                       ),
//                                       Row(
//                                         children: [
//                                           SvgPicture.asset(
//                                             'assets/icons/uiw_date.svg',
//                                             height: 11.25.h,
//                                             width: 12.w,
//                                           ),
//                                           // SizedBox(
//                                           //   width: 5.w,
//                                           // ),
//                                           Padding(
//                                             padding: const EdgeInsets.only(top:3.0,left:5),
//                                             child: RichText(
//                                               text: TextSpan(
//                                                   style: TextStyle(
//                                                       color: Colors.black,
//                                                       fontFamily: 'Campton',
//                                                       letterSpacing: -1,
//                                                       fontSize: 12.sp,
//                                                       fontWeight:
//                                                       FontWeight.w400),
//                                                   children: const [
//                                                     TextSpan(
//                                                         text:
//                                                         '12 Dec 2023 - 19 Dec 2023')
//                                                   ]),
//                                             ),
//                                           )
//                                         ],
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           Container(
//                             padding: EdgeInsets.only(right: 15.w,left: 15.w,bottom: 15.w),
//                             child:
//                             GestureDetector(
//                               onTap: () {
//                                 Navigator.push(context, MaterialPageRoute(builder: (context) => const ReviewView()));
//                               },
//                               child: Container(
//                                   height: 45.h,
//                                   width: double.infinity,
//                                   alignment: Alignment.center,
//                                   decoration: const BoxDecoration(
//                                     borderRadius: BorderRadius.all(
//                                         Radius.circular(30)),
//                                     color: Color(0xffF3771D),
//                                   ),
//                                   child: Text(

//                                     'Write Review',
//                                     style: TextStyle(
//                                       fontFamily: 'Campton',
//                                       fontSize: 14.sp,
//                                       color: Colors.white,
//                                       fontWeight: FontWeight.w600,
//                                     ),
//                                   )),
//                             ),

//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 );
//               }),
//         ),
//       ],
//     );
//   }
// }