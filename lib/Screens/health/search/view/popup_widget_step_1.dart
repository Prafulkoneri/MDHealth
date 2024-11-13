// import 'dart:ui';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:md_health/constants/styles/colors.dart';

// class PopupDialogWidgetStepOne extends StatefulWidget {

//   final VoidCallback onTap;
//   final VoidCallback? onTapButton2;
//   final String? onTapButton2Text;
//   final Widget child;
//   final String onTapText;
//   final Row? titleRow;

//   const PopupDialogWidgetStepOne({
//     super.key,
//     required this.onTap,
//     required this.onTapText,
//     required this.child,
//     this.titleRow,
//     this.onTapButton2,
//     this.onTapButton2Text,
//   });

//   @override
//   State<PopupDialogWidgetStepOne> createState() => _PopupDialogWidgetStepOneState();
// }

// class _PopupDialogWidgetStepOneState extends State<PopupDialogWidgetStepOne> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       alignment: Alignment.center,
//       // color: Colors.amber,
//       // height: MediaQuery.of(context).size.height * 0.65,
//       child: Stack(
//         children: [
//           Container(
//             width: double.infinity,
//             alignment: Alignment.center,
//             // color: Colors.red,
//             height: MediaQuery.of(context).size.height * 0.6,
//             decoration: const BoxDecoration(
//               borderRadius: BorderRadius.all(
//                 Radius.circular(20.0),
//               ),
//               // color: Colors.red,
//             ),
//           ),
//           // Container()
//           Positioned(
//             top: 80,
//             right: 1,
//             left: 1,
//             child: Container(
//               margin:  EdgeInsets.symmetric(horizontal: 10.w),
//               decoration: const BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.all(Radius.circular(20.0)),
//               ),
//               // height: 300.h,
//               padding: EdgeInsets.only(bottom: 50.w),
//               // width: 331.w,
//               child: Column(
//                 children: [
//                   SizedBox(
//                     height: 120.h,
//                   ),
//                   widget.child,
//                    SizedBox(height: 20.h),
//                   // Add some space between the text and the button
// //
//                   GestureDetector(
//                     onTap: widget.onTap,
//                     child: Container(
//                       width: 300.w,
//                       height: 41.h,
//                       decoration: BoxDecoration(
//                         color: kDefaultActiveColor,
//                         borderRadius: BorderRadius.circular(20.w),
//                         // border: Border.all(color: borderColor ?? Colors.transparent)
//                       ),
//                       child:  Center(
//                         child: Text(
//                           "Myself",
//                           style: TextStyle(
//                             fontFamily: 'Campton',
//                             color: Colors.black,
//                             fontSize: 16.sp,
//                             fontWeight: FontWeight.w600,
//                           ),
//                           // style: TextStyle(
//                           //     color: textColor ?? Colors.white,
//                           //     fontWeight: fontWeight ?? FontWeight.w700,
//                           //     fontSize: fontSize ?? 14.sp),
//                         ),
//                       ),
//                     ),
//                   ),
//                    SizedBox(height: 15.h),
//                   if(widget.onTapButton2 != null)
//                    GestureDetector(
//                     onTap: widget.onTapButton2,
//                     child: Container(
//                         width: 300.w,
//                         height: 41.h,
//                         decoration: BoxDecoration(
//                             color: Colors.transparent,
//                             borderRadius: BorderRadius.circular(20.w),
//                             border: Border.all(color: Colors.black)),
//                         child:  Center(
//                             child: Text(
//                           widget.onTapButton2Text ?? "Other",
//                           style: TextStyle(
//                             fontFamily: 'Campton',
//                             color: Colors.black,
//                             fontSize: 16.sp,
//                             fontWeight: FontWeight.w600,
//                           ),
//                           // style: TextStyle(
//                           //     color: textColor ?? Colors.white,
//                           //     fontWeight: fontWeight ?? FontWeight.w700,
//                           //     fontSize: fontSize ?? 14.sp),
//                         ))),
//                   ),
// // TextButton(
//                 ],
//               ),
//               // child: ,
//             ),
//           ),
//           Positioned(
//             child: Container(
//               width: double.infinity,
//               margin:  EdgeInsets.symmetric(horizontal: 11.w),
//               child: SvgPicture.asset(
//                 'assets/icons/BG.svg',
//                 color: kDefaultActiveColor,
//                 fit: BoxFit.fill,
//               ),
//             ),
//           ),
//           Positioned(
//             top: 25,
//             right: 1,
//             left: 1,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 SvgPicture.asset(
//                   'assets/icons/pop_up.svg',
//                   height: 60.h,
//                   width: 60.w,
//                   // alignment: Alignment.topRight,
//                 ),
//                 Padding(
//                   padding: EdgeInsets.only(top :8.0.w),
//                   child: Text(
//                     "Step 1",
//                     style: TextStyle(
//                       fontFamily: 'Campton',
//                       color: Colors.black,
//                       fontSize: 20,
//                       fontWeight: FontWeight.w700,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),

//           // Positioned(
//           //   top: 110,
//           //   right: 1,
//           //   left: 1,
//           //   child:
//           // ),
//           Positioned(
//             top: 0,
//             right: 0,
//             child: Container(
//               width: MediaQuery.of(context).size.width,
//               child: GestureDetector(
//                 onTap: () {
//                   Navigator.pop(context);
//                 },
//                 child: Padding(
//                   padding:
//                       const EdgeInsets.only(left: 260.0, bottom: 110, top: 4),
//                   child: SvgPicture.asset(
//                     'assets/icons/CloseSquare.svg',
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
