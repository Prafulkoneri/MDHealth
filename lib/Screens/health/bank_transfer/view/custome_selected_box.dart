// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:md_health/Screens/bank_transfer/controller/bank_transfer_controller.dart';
// import 'package:md_health/Screens/home/controller/home_controller.dart';
// import 'package:md_health/constants/styles/colors.dart';
// import 'package:md_health/constants/styles/textstyle.dart';
// import 'package:provider/provider.dart';

// class CustomSelectBoxTreatmentBank extends StatefulWidget {
//   final List<String?> list;
//   final Widget? title;
//   final void Function()? onTap;
//   final bool? displayButton;
//   final String? displayButtonText;
//   final VoidCallback tapFun;
//   final bool button;

//   final VoidCallback submitActionFnction;

//   const CustomSelectBoxTreatmentBank(
//       {super.key,
//       required this.list,
//       this.onTap,
//       this.displayButton,
//       this.displayButtonText,
//       required this.title,
//       required this.tapFun,
//       required this.submitActionFnction,
//       required this.button});

//   @override
//   State<CustomSelectBoxTreatmentBank> createState() =>
//       _CustomSelectBoxTreatmentState();
// }

// class _CustomSelectBoxTreatmentState
//     extends State<CustomSelectBoxTreatmentBank> {
//   @override
//   Widget build(BuildContext context) {
//     final read = context.read<BankTransferController>();
//     final watch = context.watch<BankTransferController>();

//     return Scaffold(
//       backgroundColor: Colors.transparent,
//       body: Container(
//         padding: EdgeInsets.only(left: 30.w, right: 30.w, top: 90.w),
//         // color: Colors.red,
//         alignment: Alignment.center,
//         child: Stack(
//           children: [
//             Container(
//               height: MediaQuery.of(context).size.height * 0.6,
//               child: GestureDetector(
//                 onTap: () {
//                   Navigator.pop(context);
//                 },
//               ),
//             ),
//             Positioned(
//               top: 10,
//               left: 85,
//               child: GestureDetector(
//                 onTap: () {
//                   Navigator.pop(context);
//                 },
//                 child: Container(
//                   // color: Colors.pink,
//                   width: MediaQuery.of(context).size.width,
//                   child: SvgPicture.asset(
//                     'assets/icons/Close-Square.svg',
//                     color: Colors.white,
//                     height: 25.h,
//                   ),
//                 ),
//               ),
//             ),
//             Positioned(
//               right: 1,
//               left: 1,
//               top: 10,
//               child: Container(
//                 // color: Colors.pink,
//                 height: 100.h,
//                 width: 300.w,

//                 decoration: const BoxDecoration(
//                   color: Colors.white,
//                   shape: BoxShape.circle,
//                   // borderRadius: BorderRadius.all(Radius.circular(20)),
//                 ),
//               ),
//             ),
//             Positioned(
//               // bottom: widget.button ? 1 : 60,
//               top: 50,
//               child: Container(
//                 decoration: const BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.all(Radius.circular(10)),
//                 ),
//                 width: 300.w,
//                 child: Padding(
//                   padding: EdgeInsets.only(
//                       left: 20.w, right: 20.w, top: 20.w, bottom: 20.w),
//                   child: Column(
//                     children: [
//                       Container(
//                         margin: EdgeInsets.only(bottom: 10.w),
//                         alignment: Alignment.topLeft,
//                         child: widget.title,
//                       ),
//                       Container(
//                         margin: EdgeInsets.only(top: 5.w, bottom: 15.w),
//                         height: MediaQuery.of(context).size.height * 0.25,
//                         padding: EdgeInsets.only(top: 5.w, bottom: 5.w),
//                         child: ListView.builder(
//                           shrinkWrap: true,
//                           scrollDirection: Axis.vertical,
//                           physics: const BouncingScrollPhysics(),
//                           itemCount: widget.list.length,
//                           itemBuilder: (BuildContext context, int index) {
//                             return GestureDetector(
//                               onTap: () {
//                                 read.setSelectedTextBank(
//                                     widget.list[index], index);
//                                 debugPrint(
//                                     '///////////${widget.list[index]}/////////');
//                               },
//                               child: Padding(
//                                 padding: EdgeInsets.symmetric(vertical: 5.w),
//                                 child: Row(
//                                   children: [
//                                     watch.selectedTextIndexBank == index
//                                         ? Container(
//                                             height: 22.h,
//                                             width: 22.w,
//                                             alignment: Alignment.center,
//                                             child: SvgPicture.asset(
//                                               'assets/icons/Group 4 (2).svg',
//                                               height: 22.h,
//                                               width: 22.w,
//                                             ),
//                                           )
//                                         : Container(
//                                             height: 22.h,
//                                             width: 22.w,
//                                             alignment: Alignment.center,
//                                             child: SvgPicture.asset(
//                                               'assets/icons/Ellipse_9.svg',
//                                               height: 15.h,
//                                               width: 15.w,
//                                             ),
//                                           ),
//                                     SizedBox(
//                                       width: 10.w,
//                                     ),
//                                     Text(
//                                       widget.list[index]!,
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontFamily: 'Campton',
//                                           fontSize: 17.sp,
//                                           fontWeight: FontWeight.w400),
//                                     )
//                                   ],
//                                 ),
//                               ),
//                             );
//                           },
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//             Positioned(
//               right: 0,
//               left: 0,
//               top: 30,
//               child: Container(
//                 // color: Colors.red,
//                 // padding:  EdgeInsets.fromLTRB(30.w, 20.w, 30.w, 48.w),
//                 child: Image.asset(
//                   'assets/icons/katman_1.png',
//                   height: 30.h,
//                   width: 37.w,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
