// import 'dart:ui';

// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:md_health/Screens/hotel/view/hotel_view.dart';
// import 'package:md_health/constants/styles/colors.dart';
// import 'package:md_health/widget/base_screen.dart';

// class HotelReview extends StatelessWidget {
//   const HotelReview({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BaseScreen(
//       onWillPop: () async {
//         return false;
//       },
//       backgroundColor: Color(0xffF5F5F5),
//       appBar: HotelAppBar(),
//       content: Stack(
//         children: [
//           // Positioned(
//           //   child: _circle(),
//           //   bottom: -5,
//           //   right: -5,
//           // ),
//           Positioned(
//             child: _circle(),
//             top: -5,
//             left: -5,
//           ),
//           BackdropFilter(
//             filter: ImageFilter.blur(sigmaX: 150, sigmaY: 150),
//             child: Container(
//               color: Colors.transparent,
//             ),
//           ),
//           SingleChildScrollView(
//             physics: BouncingScrollPhysics(),
//             child: Column(
//               children: [
//                 SizedBox(
//                   height: 23.h,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text(
//                       "4.8",
//                       style: TextStyle(
//                         fontFamily: 'Campton',
//                         color: Colors.black,
//                         fontSize: 40.sp,
//                         fontWeight: FontWeight.w600,
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(
//                   height: 5.h,
//                 ),
//                 Text(
//                   "480 Reviews",
//                   style: TextStyle(
//                     decoration: TextDecoration.underline,
//                     fontFamily: 'Campton',
//                     color: Colors.black,
//                     fontSize: 16.sp,
//                     fontWeight: FontWeight.w400,
//                   ),
//                 ),
//                 SizedBox(
//                   height: 5.h,
//                 ),
//                 SvgPicture.asset(
//                   'assets/icons/Star.svg',
//                   // width: 30,
//                   // alignment: Alignment.topRight,
//                 ),
//                 Container(
//                   padding: EdgeInsets.only(left: 25.w, right: 26.w),
//                   child: ListView.builder(
//                     physics: NeverScrollableScrollPhysics(),
//                     shrinkWrap: true,
//                     // physics: BouncingScrollPhysics(),
//                     itemCount: 5,
//                     itemBuilder: (context, index) {
//                       return Container(
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             SizedBox(
//                               height: 10.h,
//                             ),
//                             Text.rich(
//                               TextSpan(
//                                 children: [
//                                   WidgetSpan(
//                                       child: StarRating(
//                                     numberOfStars: 3,
//                                   )),
//                                   TextSpan(
//                                     text:
//                                         '   Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
//                                     style: TextStyle(
//                                       fontFamily: 'Campton',
//                                       color: Colors.black,
//                                       fontSize: 16.sp,
//                                       fontWeight: FontWeight.w400,
//                                     ),
//                                   )
//                                 ],
//                               ),
//                             ),
//                             SizedBox(
//                               height: 10.h,
//                             ),
//                             RichText(
//                               // textAlign: TextAlign.start,
//                               text: TextSpan(
//                                 text: "Ali G.  /",
//                                 style: TextStyle(
//                                     fontFamily: 'Campton',
//                                     color: Colors.black,
//                                     fontSize: 16.sp,
//                                     fontWeight: FontWeight.w700),

//                                 /*defining default style is optional */
//                                 children: <TextSpan>[
//                                   TextSpan(
//                                     text:
//                                         ' Heart Valve Replacement Surgery\n 12/12/2023',
//                                     style: TextStyle(
//                                         fontFamily: 'CamptonBookItalic',
//                                         fontStyle: FontStyle.italic,
//                                         color: Colors.black,
//                                         fontSize: 16.sp,
//                                         fontWeight: FontWeight.w500),
//                                     recognizer: new TapGestureRecognizer()
//                                       ..onTap = () {
//                                         // Navigator.push(
//                                         //   context,
//                                         //   MaterialPageRoute(
//                                         //       builder: (context) => SignUpView()),
//                                         // );
//                                       },
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             SizedBox(
//                               height: 28.h,
//                             ),
//                             Divider(
//                               thickness: 1,
//                               color: Color(0xff4CDB06),
//                               // height: height,
//                             ),
//                             SizedBox(
//                               height: 28.h,
//                             ),
//                           ],
//                         ),
//                       );
//                     },
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
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
//                     Padding(
//                       padding: const EdgeInsets.only(left: 27),
//                       child: SvgPicture.asset(
//                         'assets/icons/3_lines.svg',
//                         alignment: Alignment.topLeft,
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
//               // Navigator.pop(context);
//               Navigator.push(context,
//                   MaterialPageRoute(builder: (context) => HotelView()));
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

// Widget _circle() {
//   return Container(
//     height: 100,
//     width: 100,
//     decoration: const BoxDecoration(
//       shape: BoxShape.circle,
//       color: Color(0xff4CDB06),
//     ),
//   );
// }

// class StarRating extends StatelessWidget {
//   final int numberOfStars;
//   final int totalStars;

//   const StarRating({
//     Key? key,
//     required this.numberOfStars,
//     this.totalStars = 5,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: List.generate(
//         totalStars,
//         (index) {
//           if (index < numberOfStars) {
//             return Padding(
//               padding: EdgeInsets.only(right: 5.w),
//               child: SvgPicture.asset(
//                 'assets/icons/Vector_4.svg',
//                 color: kDefaultActiveColor,
//                 height: 15.h,
//                 width: 15.w,
//               ),
//             );
//           } else {
//             return Padding(
//               padding: EdgeInsets.only(right: 5.w),
//               child: SvgPicture.asset(
//                 'assets/icons/Vector_4.svg',
//                 color: Colors.grey, // Grey color for inactive stars
//                 height: 15.h,
//                 width: 15.w,
//               ),
//             );
//           }
//         },
//       ),
//     );
//   }
// }
