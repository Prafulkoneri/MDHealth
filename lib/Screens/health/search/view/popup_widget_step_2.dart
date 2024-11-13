// import 'dart:ui';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:md_health/Screens/payment_details/view/payment_details_view.dart';
// import 'package:md_health/constants/styles/colors.dart';
// import 'package:md_health/widget/drop_down.dart';
// import 'package:md_health/widget/text_field.dart';

// class PopupDialogWidgetStepTwo extends StatefulWidget {
//   const PopupDialogWidgetStepTwo({
//     super.key,
//   });

//   @override
//   State<PopupDialogWidgetStepTwo> createState() =>
//       _PopupDialogWidgetStepTwoState();
// }

// class _PopupDialogWidgetStepTwoState extends State<PopupDialogWidgetStepTwo> {
//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       color: Colors.transparent,
//       child: Container(
//         alignment: Alignment.center,
//         // color: Colors.amber,
//         // height: MediaQuery.of(context).size.height * 0.8,
//         child: Stack(
//           children: [
//             Container(
//               width: double.infinity,
//               alignment: Alignment.center,
//               // height: MediaQuery.of(context).size.height * 0.85,
//               decoration: const BoxDecoration(
//                 // color: Colors.red,
//                 borderRadius: BorderRadius.all(
//                   Radius.circular(20.0),
//                 ),
//                 // color: Colors.red,
//               ),
//             ),
//             // Container()
//             Positioned(
//               top: 80,
//               right: 1,
//               left: 1,
//               child: Container(
//                 margin: EdgeInsets.symmetric(horizontal: 10.w),
//                 decoration: const BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.all(Radius.circular(20.0)),
//                 ),
//                 // height: 700.h,
//                 padding: EdgeInsets.only(bottom: 35.w, right: 10.w, left: 10.w),
//                 // width: 331.w,
//                 child: Column(
//                   children: [
//                     SizedBox(
//                       height: 120.h,
//                     ),
//                     Text(
//                       'Please fill in the information',
//                       style: TextStyle(
//                         fontFamily: 'Campton',
//                         color: Colors.black,
//                         fontSize: 17.sp,
//                         fontWeight: FontWeight.w700,
//                       ),
//                     ),
//                     SDropDownField(
//                       // height: 60.h,
//                       titleHeader: "",
//                       onChanged: (value) {
//                         // read.onSelectAccountType(value);
//                       },
//                       hint: "Your Country",
//                       items: [
//                         DropdownMenuItem(
//                           value: "current",
//                           child: Text(
//                             "Current",
//                             style: TextStyle(
//                               fontSize: 14.sp,
//                             ),
//                           ),
//                         ),
//                         DropdownMenuItem(
//                           value: "saving",
//                           child: Text(
//                             "Saving",
//                             style: TextStyle(
//                               fontSize: 14.sp,
//                             ),
//                           ),
//                         )
//                       ],
//                     ),
//                     SDropDownField(
//                       titleHeader: "",
//                       onChanged: (value) {
//                         // read.onSelectAccountType(value);
//                       },
//                       hint: "Your City",
//                       items: [
//                         DropdownMenuItem(
//                           value: "current",
//                           child: Text(
//                             "Current",
//                             style: TextStyle(
//                               fontSize: 14.sp,
//                             ),
//                           ),
//                         ),
//                         DropdownMenuItem(
//                           value: "saving",
//                           child: Text(
//                             "Saving",
//                             style: TextStyle(
//                               fontSize: 14.sp,
//                             ),
//                           ),
//                         )
//                       ],
//                     ),

//                     Padding(
//                       padding: EdgeInsets.only(top: 25),
//                       child: PrimaryInformationTextFormField(
//                         borderColor: Color(0xff989898),
//                         hintText: 'Your Address',
//                         hintStyle: TextStyle(
//                           fontFamily: 'Campton',
//                           // color: Colors.black,
//                           fontSize: 16.sp,
//                           fontWeight: FontWeight.w400,
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: 20.h),
//                     // Add some space between the text and the button
//                       Padding(
//                         padding:  EdgeInsets.only(bottom: 15.w),
//                         child: Text('Birth Date', style : TextStyle(
//                           fontFamily: 'Campton',
//                           color: kDefaultActiveColor,
//                           fontSize: 17.sp,
//                           fontWeight: FontWeight.w600,
//                         ),),
//                       ),
//                     Padding(
//                       padding: EdgeInsets.only(bottom: 20),
//                       child: PrimaryInformationTextFormField(
//                         borderColor: Color(0xff989898),
//                         hintText: 'Date',
//                         hintStyle: TextStyle(
//                           fontFamily: 'Campton',
//                           // color: Colors.black,
//                           fontSize: 16.sp,
//                           fontWeight: FontWeight.w400,
//                         ),
//                       ),
//                     ),
//                     GestureDetector(
//                       onTap: () {
//                         Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => PaymentDetailsView()));
//                       },
//                       child: Container(
//                         width: 300.w,
//                         height: 41.h,
//                         decoration: BoxDecoration(
//                           color: kDefaultActiveColor,
//                           borderRadius: BorderRadius.circular(20.w),
//                           // border: Border.all(color: borderColor ?? Colors.transparent)
//                         ),
//                         child: Center(
//                           child: Text(
//                             "Go Payment Page",
//                             style: TextStyle(
//                               fontFamily: 'Campton',
//                               color: Colors.black,
//                               fontSize: 16.sp,
//                               fontWeight: FontWeight.w600,
//                             ),
//                             // style: TextStyle(
//                             //     color: textColor ?? Colors.white,
//                             //     fontWeight: fontWeight ?? FontWeight.w700,
//                             //     fontSize: fontSize ?? 14.sp),
//                           ),
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: 15.h),
//                   ],
//                 ),
//                 // child: ,
//               ),
//             ),
//             Positioned(
//               child: Container(
//                 width: double.infinity,
//                 margin: EdgeInsets.symmetric(horizontal: 11.w),
//                 child: SvgPicture.asset(
//                   'assets/icons/BG.svg',
//                   color: kDefaultActiveColor,
//                   fit: BoxFit.fill,
//                 ),
//               ),
//             ),
//             Positioned(
//               top: 25,
//               right: 1,
//               left: 1,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   SvgPicture.asset(
//                     'assets/icons/pop_up.svg',
//                     height: 60.h,
//                     width: 60.w,
//                     // alignment: Alignment.topRight,
//                   ),
//                   Padding(
//                     padding: EdgeInsets.only(top: 8.0.w),
//                     child: Text(
//                       "Step 2",
//                       style: TextStyle(
//                         fontFamily: 'Campton',
//                         color: Colors.black,
//                         fontSize: 20,
//                         fontWeight: FontWeight.w700,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),

//             // Positioned(
//             //   top: 110,
//             //   right: 1,
//             //   left: 1,
//             //   child:
//             // ),
//             Positioned(
//               top: 0,
//               right: 0,
//               child: Container(
//                 width: MediaQuery.of(context).size.width,
//                 child: GestureDetector(
//                   onTap: () {
//                     Navigator.pop(context);
//                   },
//                   child: Padding(
//                     padding:
//                         const EdgeInsets.only(left: 260.0, bottom: 110, top: 4),
//                     child: SvgPicture.asset(
//                       'assets/icons/CloseSquare.svg',
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
