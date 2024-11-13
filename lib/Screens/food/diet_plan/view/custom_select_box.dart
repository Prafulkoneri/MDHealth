// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:md_health/constants/styles/colors.dart';
// import 'package:md_health/constants/styles/textstyle.dart';

// class CustomSelectBox extends StatefulWidget {
//   final List<String> list;
//   final Widget? title;
//   final bool? displayButton;
//   final String? displayButtonText;
//   final VoidCallback tapFun;
//   final bool button;

//   final VoidCallback submitActionFnction;
//   const CustomSelectBox(
//       {super.key,
//       required this.list,
//       this.displayButton,
//       this.displayButtonText,
//       required this.title,
//       required this.tapFun,

//       required this.submitActionFnction,
//       required this.button});



//   @override
//   State<CustomSelectBox> createState() => _CustomSelectBoxState();
// }

// class _CustomSelectBoxState extends State<CustomSelectBox> {
//   final List<String> cities = [
//     'Istanbul',
//     'İzmir',
//     'Ankara',
//     'Amsterdam',
//     'Sofia'
//   ];

//   @override
//   Widget build(BuildContext context) {
//     var selected = false;

//     return Scaffold(
//       backgroundColor: Colors.transparent,
//       body: Container(
//         padding: EdgeInsets.symmetric(horizontal: 30.w),
//         alignment: Alignment.center,
//         child: Stack(
//           children: [
//             Container(
//               height: MediaQuery.of(context).size.height * 0.6 ,
//               // color: Colors.red,
//               child: GestureDetector(
//                 onTap: () {
//                   Navigator.pop(context);
//                 },
//               ),
//             ),
//             Positioned(
//                 top: 10,

//                 child: GestureDetector(
//                   onTap: () {
//                     Navigator.pop(context);
//                   },

//                   child: Container(
//                     // color: Colors.pink,
//                     width: MediaQuery.of(context).size.width,
//                     padding: EdgeInsets.only(left: 150.w),
//                     child: SvgPicture.asset(
//                       'assets/icons/Close-Square.svg',
//                       color: Colors.white,
//                     ),
//                   ),
//                 ),),
//             Positioned(
//               right: 0,
//               left: 0,
//               top: 8,
//               child: Container(
//                 // color: Colors.pink,
//                 height: 90.h,
//                 width: 300.w,

//                 decoration: const BoxDecoration(
//                   color: Colors.white,
//                   shape: BoxShape.circle,
//                   // borderRadius: BorderRadius.all(Radius.circular(20)),
//                 ),

//               ),
//             ),
//             Positioned(
//               bottom: widget.button ? 1 : 60,
//               top: 50,
//               child: Container(
//                 decoration: const BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.all(Radius.circular(10)),
//                 ),
//                 width: 300.w,
//                 child: Padding(
//                   padding:
//                       EdgeInsets.symmetric( horizontal:20.w,vertical: 20.w),

//                   child: Column(
//                     // mainAxisAlignment: MainAxisAlignment.start,
//                     children: [
//                       Container(

//                         // color: Colors.brown,
//                         alignment: Alignment.topLeft,
//                         child: widget.title!,
//                         // SelectBoxText(
//                         //   text: widget.title!,
//                         //   // text: 'Choose your treatment city',
//                         //   fontWeight: FontWeight.w700,
//                         // ),
//                       ),
//                       Container(
//                         padding:  EdgeInsets.only(top: 5.w, bottom: 5.w),
//                         height: 230.h,
//                         child: ListView.builder(
//                           shrinkWrap: true,
//                           physics: const BouncingScrollPhysics(),
//                           itemCount: widget.list.length,
//                           itemBuilder: (BuildContext context, int index) {
//                             return GestureDetector(
//                               onTap: () {},
//                               child: Padding(
//                                 padding: EdgeInsets.symmetric(vertical: 10.w),
//                                 child: Row(
//                                   children: [
//                                     SvgPicture.asset(
//                                       'assets/icons/Group_2.svg',
//                                       height: 22.h,
//                                       width: 22.w,
//                                     ),
//                                     SizedBox(
//                                       width: 10.w,
//                                     ),
//                                     SelectBoxText(text: widget.list[index])
//                                   ],
//                                 ),
//                               ),
//                             );
//                           },
//                         ),
//                       ),
//                       widget.button
//                           ? Container(
//                               width: double.infinity,
//                               padding: EdgeInsets.symmetric(
//                                   horizontal: 50.w, vertical: 15.w),
//                               decoration: const BoxDecoration(
//                                   borderRadius:
//                                       BorderRadius.all(Radius.circular(30)),
//                                   color: kDefaultActiveColor),
//                               alignment: Alignment.center,
//                               child: GestureDetector(
//                                 onTap: widget.submitActionFnction,
//                                 child:  Center(
//                                   child: Text(
//                                     'Choose',
//                                     style: TextStyle(
//                                       fontFamily: 'Campton',
//                                       fontSize: 20.sp,
//                                       color: Colors.black,
//                                       fontWeight: FontWeight.w600,),
//                                   ),
//                                 ),
//                               ),
//                             )
//                           : Container()

//                     ],
//                   ),
//                 ),
//               ),
//             ),

//             Positioned(
//               right: 1,
//               left: 1,
//               top: 30,
//               child: Container(
//                 // color: Colors.red,
//                 // padding:  EdgeInsets.fromLTRB(30.w, 20.w, 30.w, 48.w),
//                 child: Image.asset(
//                   'assets/icons/katman_1.png',
//                   height: 25.h,
//                   width: 35.w,
//                 ),
//               ),
//             ),

//           ],
//         ),
//       ),
//     );
//   }
// }
