// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:md_health/Screens/discover/view/discover_view.dart';
// import 'package:md_health/Screens/home/view/home_view.dart';
// import 'package:md_health/Screens/main/controller/main_screen_controller.dart';
// import 'package:md_health/Screens/main/view/main_screen_view.dart';
// import 'package:md_health/Screens/health/search/view/search_view.dart';

// import 'package:md_health/constants/styles/colors.dart';
// import 'package:provider/provider.dart';

// class NotificationAppBar extends StatelessWidget
//     implements PreferredSizeWidget {
//   const NotificationAppBar({
//     super.key,
//   });
//   @override
//   final Size preferredSize = const Size.fromHeight(173);

//   @override
//   Widget build(BuildContext context) {
//     return PreferredSize(
//       preferredSize: preferredSize,
//       child: Stack(children: [
//         Container(
//           decoration: const BoxDecoration(
//               image: DecorationImage(
//                   image: AssetImage('assets/images/layer_blur.png'),
//                   fit: BoxFit.cover)),
//         ),
//         Padding(
//           padding: const EdgeInsets.only(top: 50),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.only(left: 27),
//                     child: SvgPicture.asset(
//                       'assets/icons/3_lines.svg',
//                       alignment: Alignment.topLeft,
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(right: 30),
//                     child: SvgPicture.asset(
//                       'assets/icons/box.svg',
//                       alignment: Alignment.topRight,
//                     ),
//                   )
//                 ],
//               ),
//               SizedBox(
//                 height: 27.h,
//               ),
//               Text(
//                 "NOTIFICATIONS",
//                 style: TextStyle(
//                     color: kDefaultActiveColor,
//                     fontSize: 29.sp,
//                     fontWeight: FontWeight.w700),
//               ),
//               SizedBox(
//                 height: 23.h,
//               ),
//               GestureDetector(
//                 onTap: () {
//                   Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) => MainScreenView()));
//                   // context.watch<MainScreenController>().setCurrentScreen(0);
//                 },
//                 child: Container(
//                   padding: const EdgeInsets.only(left: 17),
//                   child: Row(
//                     children: [
//                       SvgPicture.asset(
//                         'assets/icons/backicon.svg',
//                         alignment: Alignment.topRight,
//                       ),
//                       Text(
//                         "Back",
//                         style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 10.sp,
//                             fontWeight: FontWeight.w500),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ]),
//     );
//   }
// }
