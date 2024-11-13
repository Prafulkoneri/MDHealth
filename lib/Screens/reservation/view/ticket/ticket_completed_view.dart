// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:md_health/Screens/reservation/view/review_view.dart';
// import 'package:md_health/constants/styles/colors.dart';
// import 'package:md_health/widget/drop_down.dart';

// class TicketCompletedView extends StatelessWidget {
//   const TicketCompletedView({
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
//             iconPadding: EdgeInsets.only(right: 32),
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
//             padding: EdgeInsets.only(left: 10.w, right: 10.w, top: 20.w),
//             itemCount: 1,
//             physics: const BouncingScrollPhysics(),
//             shrinkWrap: true,
//             itemBuilder: (BuildContext, index) {
//               return GestureDetector(
//                 onTap: () {},
//                 child: Column(
//                   children: [
//                     Container(
//                       decoration: BoxDecoration(
//                         color:Colors.white,
//                         borderRadius:
//                             const BorderRadius.all(Radius.circular(10)),
//                         // border: Border.all(color: const Color(0xffEFEFEF)),
//                         boxShadow: [
//                           BoxShadow(
//                               color: Colors.black.withOpacity(0.1),
//                               spreadRadius: 1,
//                               blurRadius: 10,
//                               blurStyle: BlurStyle.outer)
//                         ],
//                       ),
//                       padding:
//                       EdgeInsets.only(left :20.w, top:15.w, right:15.w),
//                       child: Container(
//                         // color: Colors.amber,
//                         child: Column(
//                           children: [
//                             Container(
//                             // color: Colors.grey,

//                               height: MediaQuery.of(context).size.height * 0.15,
//                               child: Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 crossAxisAlignment: CrossAxisAlignment.end,
//                                 children: [
//                                   Expanded(
//                                     flex: 2,
//                                     child: Container(
//                                   // margin: EdgeInsets.symmetric(
//                                   //     vertical: 15.h, horizontal: 15.w),
//                                       child: Container(
//                                         child: Column(
//                                           crossAxisAlignment:
//                                               CrossAxisAlignment.center,
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.start,
//                                           children: [
//                                             Text(
//                                               'Stockholm Airport',
//                                               style: TextStyle(
//                                                   color: Colors.black,
//                                                   fontFamily: 'Campton',
//                                                   letterSpacing: -0.5,
//                                                   fontSize: 12.sp,
//                                                   fontWeight: FontWeight.w400),
//                                             ),
//                                             Padding(
//                                               padding:
//                                                   EdgeInsets.only(top: 3.0.w),
//                                               child: Text(
//                                                 'ARN',
//                                                 style: TextStyle(
//                                                     color: Colors.black,
//                                                     fontFamily: 'Campton',
//                                                     letterSpacing: -0.5,
//                                                     fontSize: 20.sp,
//                                                     fontWeight:
//                                                         FontWeight.w600),
//                                               ),
//                                             ),
//                                             SvgPicture.asset(
//                                               'assets/icons/Group_17.svg',
//                                               height: 25.h,
//                                             ),
//                                             Padding(
//                                               padding:
//                                                   EdgeInsets.only(top: 3.0.w),
//                                               child: Text(
//                                                 'IST',
//                                                 style: TextStyle(
//                                                     color: Colors.black,
//                                                     fontFamily: 'Campton',
//                                                     letterSpacing: -0.5,
//                                                     fontSize: 20.sp,
//                                                     fontWeight:
//                                                         FontWeight.w600),
//                                               ),
//                                             ),
//                                             Text(
//                                               'Istanbul Airport',
//                                               style: TextStyle(
//                                                   color: Colors.black,
//                                                   fontFamily: 'Campton',
//                                                   letterSpacing: -0.5,
//                                                   fontSize: 12.sp,
//                                                   fontWeight: FontWeight.w400),
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                   Expanded(
//                                     flex: 5,
//                                     child: Container(
//                                       child: Row(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.end,
//                                         children: [
//                                           Expanded(
//                                             flex: 1,
//                                             child: Container(
// // color:Colors.green,
//                                                 ),
//                                           ),
//                                           Expanded(
//                                             flex: 7,
//                                             child: Column(
//                                               crossAxisAlignment:
//                                                   CrossAxisAlignment.end,
//                                               children: [
//                                                 Padding(
//                                                   padding: EdgeInsets.only(
//                                                       bottom: 20.0.h),
//                                                   child: Row(
//                                                     mainAxisAlignment:
//                                                         MainAxisAlignment.end,
//                                                     children: [
//                                                       Padding(
//                                                         padding:
//                                                             EdgeInsets.only(
//                                                                 right: 2.5.w),
//                                                         child: Text('Via'),
//                                                       ),
//                                                       Image.asset(
//                                                         'assets/images/image 44.png',
//                                                         width: 60.w,
//                                                         height: 15.h,
//                                                       ),
//                                                     ],
//                                                   ),
//                                                 ),
//                                                 Column(
//                                                   crossAxisAlignment:
//                                                       CrossAxisAlignment.start,
//                                                   mainAxisAlignment:
//                                                       MainAxisAlignment
//                                                           .spaceBetween,
//                                                   children: [
//                                                     Container(
//                                                       padding: EdgeInsets.only(
//                                                           bottom: 10.w),
//                                                       child: Row(
//                                                         mainAxisAlignment:
//                                                             MainAxisAlignment
//                                                                 .spaceBetween,
//                                                         crossAxisAlignment:
//                                                             CrossAxisAlignment
//                                                                 .baseline,
//                                                         textBaseline:
//                                                             TextBaseline
//                                                                 .alphabetic,
//                                                         children: [
//                                                           SvgPicture.asset(
//                                                             'assets/icons/Vector_13.svg',
//                                                             height: 12.h,
//                                                           ),
//                                                           RichText(
//                                                             text: TextSpan(
//                                                               style: TextStyle(
//                                                                   color: Colors
//                                                                       .black,
//                                                                   fontFamily:
//                                                                       'Campton',
//                                                                   letterSpacing:
//                                                                       0,
//                                                                   fontSize:
//                                                                       16.sp,
//                                                                   fontWeight:
//                                                                       FontWeight
//                                                                           .w600),
//                                                               children: [
//                                                                 TextSpan(
//                                                                     text:
//                                                                         'Stockholm'),
//                                                                 TextSpan(
//                                                                   text: ' to ',
//                                                                   style:
//                                                                       TextStyle(
//                                                                     color:
//                                                                         kDefaultActiveColor,
//                                                                   ),
//                                                                 ),
//                                                                 TextSpan(
//                                                                     text:
//                                                                         'Istanbul'),
//                                                               ],
//                                                             ),
//                                                           ),
//                                                         ],
//                                                       ),
//                                                     ),
//                                                     Container(
//                                                       child: Row(
//                                                         crossAxisAlignment:
//                                                             CrossAxisAlignment
//                                                                 .baseline,
//                                                         textBaseline:
//                                                             TextBaseline
//                                                                 .alphabetic,
//                                                         children: [
//                                                           SvgPicture.asset(
//                                                             'assets/icons/uiw_date.svg',
//                                                             height: 11.25.h,
//                                                             width: 12.w,
//                                                           ),
//                                                           SizedBox(
//                                                             width: 5.w,
//                                                           ),
//                                                           RichText(
//                                                             text: TextSpan(
//                                                                 style: TextStyle(
//                                                                     color: Colors.black,
//                                                                     fontFamily: 'Campton',
//                                                                     letterSpacing: -1,
//                                                                     fontSize: 12.sp,
//                                                                     fontWeight: FontWeight.w400),
//                                                                 children: const [
//                                                                   TextSpan(
//                                                                       text:
//                                                                           '12 Dec 2023 - 16:30')
//                                                                 ]),
//                                                           )
//                                                         ],
//                                                       ),
//                                                     ),
//                                                   ],
//                                                 ),
//                                               ],
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             Container(
//                               padding: EdgeInsets.only(bottom:15.w),
//                               child: GestureDetector(
//                                 onTap: () {
//                                   Navigator.push(
//                                       context,
//                                       MaterialPageRoute(
//                                           builder: (context) => ReviewView()));
//                                 },
//                                 child: Container(
//                                   height: 45.h,
//                                   width: double.infinity,
//                                   alignment: Alignment.center,
//                                   decoration: BoxDecoration(
//                                     borderRadius:
//                                         BorderRadius.all(Radius.circular(30)),
//                                     color: Color(0xffF3771D),
//                                   ),
//                                   child: Text(
//                                     'Write Review',
//                                     style: TextStyle(
//                                       fontFamily: 'Campton',
//                                       fontSize: 14.sp,
//                                       color: Colors.white,
//                                       fontWeight: FontWeight.w500,
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               );
//             },
//           ),
//         ),
//       ],
//     );
//   }
// }
