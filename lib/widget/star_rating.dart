// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:md_health/constants/styles/colors.dart';
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
//             (index) {
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