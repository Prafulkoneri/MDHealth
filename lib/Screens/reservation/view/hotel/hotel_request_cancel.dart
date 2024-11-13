// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:md_health/Screens/packages/controller/packages_view_controller.dart';
// import 'package:md_health/constants/styles/colors.dart';
// import 'package:md_health/widget/buttons.dart';
// import 'package:md_health/widget/text_field.dart';
// import 'package:provider/provider.dart';

// class CancellationPopUp extends StatefulWidget {
//   const CancellationPopUp({super.key});

//   @override
//   State<CancellationPopUp> createState() =>
//       _CancellationPopUpState();
// }

// class _CancellationPopUpState extends State<CancellationPopUp> {
//   @override
//   Widget build(BuildContext context) {
//     final read = context.read<PackageViewController>();
//     final watch = context.watch<PackageViewController>();
//     return Container(
//       width: ScreenUtil().screenWidth,
//       height: 450.h,
//       // padding:
//       //     EdgeInsets.only(bottom: 10.w),
//       child: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Stack(
//               children: [
//                 Container(
//                   decoration: const BoxDecoration(
//                       borderRadius: BorderRadius.all(Radius.circular(15.0))),
//                   child: ClipRRect(
//                     borderRadius: BorderRadius.circular(15), // Image border
//                     child: SizedBox.fromSize(
//                       // size: Size.fromRadius(
//                       //     10), // Image radius
//                       child: const Image(
//                           image: AssetImage("assets/images/pop__new_.png")),
//                     ),
//                   ),

//                   // Image(
//                   //     image: AssetImage(
//                   //         "assets/images/pop__new_.png")),
//                 ),
//                 Positioned(
//                     top: 15,
//                     right: 15,
//                     // left: 0,
//                     child: GestureDetector(
//                       onTap: () {
//                         Navigator.pop(context);
//                       },
//                       child: SvgPicture.asset("assets/icons/red_close.svg"),
//                     )),
//                 Positioned(
//                     top: 25,
//                     right: 0,
//                     left: 0,
//                     child: SvgPicture.asset("assets/icons/sad.svg")),
//                 Positioned(
//                   top: 80,
//                   right: 65.w,
//                   // left: 0,
//                   child: Center(
//                     child: Text(
//                       "Request Cancel",
//                       style: TextStyle(
//                           color: Colors.white,
//                           // letterSpacing: .5,
//                           fontSize: 22.sp,
//                           fontWeight: FontWeight.w700),
//                     ),
//                   ),
//                 )
//               ],
//             ),
//             SizedBox(
//               height: 38.h,
//             ),
//             Container(
//               padding: EdgeInsets.only(left: 18.0.w),
//               child: Text(
//                 "Cancellation Detail",
//                 style: TextStyle(
//                     color: Colors.black,
//                     // letterSpacing: .5,
//                     fontSize: 16.sp,
//                     fontWeight: FontWeight.w500),
//               ),
//             ),
//             SizedBox(
//               height: 10.h,
//             ),
//             Padding(
//               padding: EdgeInsets.only(left: 10.0.w, right: 10.w),
//               child: PrimaryInformationTextFormFieldreq(
//                 controller: watch.reasonController,
//                 maxLines: 100,

//                 // color: Colors.red,
//                 height: 100.w,
//                 // titleHeader: "*Patient Contact Number",
//                 hintText:
//                     "Please write your treatment cancellation request in detail",
//                 contentPadding: const EdgeInsets.only(top: 20, left: 15),
//               ),
//             ),
//             SizedBox(
//               height: 38.h,
//             ),
//             Padding(
//               padding: EdgeInsets.only(left: 18.0.w),
//               child: Row(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                  GestureDetector(
//                     onTap: () {
//                       read.onChecked();
//                     },
//                     child: Container(
//                       margin: EdgeInsets.only(right: 5.w, bottom: 2.5.w),
//                       height: 15.h,
//                       width: 15.w,
//                       decoration: BoxDecoration(
//                         color: watch.isChecked
//                             ? kDefaultActiveColor
//                             : const Color(0xffD9D9D9),
//                         borderRadius:
//                             const BorderRadius.all(Radius.circular(2)),
//                       ),
//                     ),
//                   ),
//                   Flexible(
//                     child: Text(
//                       " I confirm that I wish cancel my reservation",
//                       style: TextStyle(
//                           color: Colors.black,
//                           // letterSpacing: .5,
//                           fontSize: 16.sp,
//                           fontWeight: FontWeight.w500),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(
//               height: 30.h,
//             ),
//             Container(
//               padding: EdgeInsets.only(left: 18.0.w),
//               child: PrimaryButton(
//                 // borderColor: Colors.black,
//                 width: 250.w,
//                 height: 57.w,

//                 borderRadius: 30,

//                 color: const Color(0xffF55C5C),
//                 // color: kDefaultActiveColor,
//                 onTap: () {
//                   // read.packageDeleteActiveStatus(
//                       // context, element?.id.toString());
//                   // Navigator.push(
//                   //   context,
//                   //   MaterialPageRoute(
//                   //       builder: (context) =>
//                   //           PackageSView(PackageId: element?.id.toString())
//                   //           ),
//                   // );
//                   Navigator.pop(
//                       context);
//                   showDialog(
//                       // barrierColor: Colors
//                       //     .transparent,
//                       context: context,
//                       builder: (context) => AlertDialog(
//                             shape: const RoundedRectangleBorder(
//                                 borderRadius:
//                                     BorderRadius.all(Radius.circular(15.0))),

//                             // insetPadding:
//                             //    EdgeInsets.all(0),
//                             contentPadding: const EdgeInsets.only(top: 0.0),

//                             content: Container(
//                               width: ScreenUtil().screenWidth,
//                               height: 350.h,
//                               // padding:
//                               //     EdgeInsets.only(bottom: 10.w),
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.center,
//                                 children: [
//                                   Stack(
//                                     children: [
//                                       Container(
//                                         decoration: const BoxDecoration(
//                                             borderRadius: BorderRadius.all(
//                                                 Radius.circular(15.0))),
//                                         child: ClipRRect(
//                                           borderRadius: BorderRadius.circular(
//                                               15), // Image border
//                                           child: SizedBox.fromSize(
//                                             // size: Size.fromRadius(
//                                             //     10), // Image radius
//                                             child: const Image(
//                                                 image: AssetImage(
//                                                     "assets/images/pop__new_.png")),
//                                           ),
//                                         ),

//                                         // Image(
//                                         //     image: AssetImage(
//                                         //         "assets/images/pop__new_.png")),
//                                       ),
//                                       Positioned(
//                                           top: 25,
//                                           right: 0,
//                                           left: 0,
//                                           child: Column(
//                                             children: [
//                                               SvgPicture.asset(
//                                                   "assets/icons/sad.svg"),
//                                               // Text(
//                                               //   "Delete",
//                                               //   style: TextStyle(
//                                               //       color: Colors.white,
//                                               //       // letterSpacing: .5,
//                                               //       fontSize: 30.sp,
//                                               //       fontWeight: FontWeight.w700),
//                                               // ),
//                                               RichText(
//                                                 text: TextSpan(
//                                                   text: 'Thank',
//                                                   style: TextStyle(
//                                                       color: Colors.white,
//                                                       fontSize: 30.sp,
//                                                       fontWeight:
//                                                           FontWeight.w700),

//                                                   /*defining default style is optional */
//                                                   children: <TextSpan>[
//                                                     TextSpan(
//                                                       text: ' You!',
//                                                       style: TextStyle(
//                                                           color: Colors.black,
//                                                           fontSize: 30.sp,
//                                                           fontWeight:
//                                                               FontWeight.w500),
//                                                     ),
//                                                   ],
//                                                 ),
//                                               ),
//                                             ],
//                                           )),
//                                       // Positioned(
//                                       //   top: 80,
//                                       //   right: 55,
//                                       //   // left: 0,
//                                       // child: Text(
//                                       //   "Request Cancel",
//                                       //   style: TextStyle(
//                                       //       color: Colors.white,
//                                       //       // letterSpacing: .5,
//                                       //       fontSize: 25.sp,
//                                       //       fontWeight: FontWeight.w700),
//                                       // ),
//                                       // )
//                                     ],
//                                   ),
//                                   SizedBox(
//                                     height: 38.h,
//                                   ),
//                                   Text(
//                                     "Thank you for your request.",
//                                     textAlign: TextAlign.center,
//                                     style: TextStyle(
//                                         color: Colors.black,
//                                         // letterSpacing: .5,
//                                         fontSize: 21.sp,
//                                         fontWeight: FontWeight.w600),
//                                   ),
//                                   SizedBox(
//                                     height: 38.h,
//                                   ),
//                                   Text(
//                                     'Our team will contact you as soon as possible \nregarding your cancellation request.',
//                                     textAlign: TextAlign.center,
//                                     style: TextStyle(
//                                         color: Colors.black,
//                                         // letterSpacing: .5,
//                                         fontSize: 14.sp,
//                                         fontWeight: FontWeight.w400),
//                                   ),
//                                   SizedBox(
//                                     height: 48.h,
//                                   ),
//                                   Container(
//                                     padding: EdgeInsets.only(
//                                         left: 22.w, right: 21.w),
//                                     child: PrimaryButton(
//                                       // width:
//                                       //     125.w,
//                                       // height:
//                                       //     35.w,
//                                       // borderRadius: BorderRadius.circular(),
//                                       borderRadius: 25,
//                                       // width: ScreenUtil().screenWidth,
//                                       color: const Color(0xffF55C5C),
//                                       onTap: () {
//                                         Navigator.pop(context);
//                                         // Navigator.push(
//                                         //   context,
//                                         //   MaterialPageRoute(
//                                         //       builder: (context) =>
//                                         //           ChangeInformationFormView()),
//                                         // );
//                                       },
//                                       child: Text(
//                                         "Done",
//                                         style: TextStyle(
//                                             color: Colors.white,
//                                             // letterSpacing: .5,
//                                             fontSize: 16.sp,
//                                             fontWeight: FontWeight.w600),
//                                       ),
//                                     ),
//                                   )
//                                 ],
//                               ),
//                             ),
//                           ));
//                   // Navigator.push(
//                   //   context,
//                   //   MaterialPageRoute(builder: (context) => SignUpView()),
//                   // );
//                 },
//                 child: Text(
//                   "Submit Cancel Request",
//                   style: TextStyle(
//                       color: Colors.white,
//                       // letterSpacing: .5,
//                       fontSize: 16.sp,
//                       fontWeight: FontWeight.w600),
//                 ),
//               ),
//             ),
//             // Row(
//             //   children: [
//             //     SeconderyCheckBox(
//             //       // value: watch.isVerifyChecked,
//             //       onChanged: (value) {
//             //         // read.onVerifyChecked(value);
//             //       },
//             //     ),
//             //   ],
//             // ),
//           ],
//         ),
//       ),
//     );
//   }
// }

