// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:md_health/Screens/MdBooking/md_booking_payment/view/md_booking_payment_view.dart';
// import 'package:md_health/Screens/home/view/custom_select_box.dart';
// import 'package:md_health/constants/styles/colors.dart';
// import 'package:md_health/constants/styles/textstyle.dart';
// import 'package:md_health/test_widget.dart';
// import 'package:md_health/widget/buttons.dart';

// class VehicalSearchView extends StatefulWidget {
//   const VehicalSearchView({super.key});

//   @override
//   State<VehicalSearchView> createState() => _VehicalSearchViewState();
// }

// class _VehicalSearchViewState extends State<VehicalSearchView>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _animationController;
//   late Animation<double> _animation;

//   @override
//   void initState() {
//     super.initState();
//     _animationController = AnimationController(
//       vsync: this,
//       duration:
//           const Duration(milliseconds: 500), // Adjust the duration as needed
//     );
//     _animation = Tween<double>(begin: 1, end: 0).animate(
//       CurvedAnimation(parent: _animationController, curve: Curves.linear),
//     );
//   }

//   @override
//   void dispose() {
//     _animationController.dispose();
//     super.dispose();
//   }

//   void _showDialog() {
//     debugPrint('helooooooooooooooooooo');
//     _animationController.reset();
//     _animationController.forward();
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AnimatedBuilder(
//           animation: _animation,
//           builder: (context, child) {
//             return Transform.translate(
//               offset: Offset(
//                   0, MediaQuery.of(context).size.height * _animation.value),
//               child: CustomSelectBox(
//                 list: const [
//                   'Istanbul',
//                   'İzmir',
//                   'Ankara',
//                   'Amsterdam',
//                   'Sofia'
//                 ],
//                 title: SelectBoxText(
//                   text: 'Choose your treatment city',
//                   fontWeight: FontWeight.w700,
//                 ),
//                 tapFun: () {
//                   debugPrint('/////////////////////////helooo//////');
//                 },
//                 button: true,
//                 submitActionFnction: () {
//                   Navigator.pop(context);
//                   // _animationController.reverse();
//                 },
//               ),
//             );
//           },
//         );
//       },
//     );
//   }

//   void _showDialog2() {
//     debugPrint('helooooooooooooooooooo');
//     _animationController.reset();
//     _animationController.forward();
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AnimatedBuilder(
//           animation: _animation,
//           builder: (context, child) {
//             return Transform.translate(
//               offset: Offset(
//                   0, MediaQuery.of(context).size.height * _animation.value),
//               child: CustomSelectBox(
//                 list: const [
//                   'Economy',
//                   'Luxury',
//                   'VIP',
//                 ],
//                 title: SelectBoxText(
//                   text: 'Choose your treatment city',
//                   fontWeight: FontWeight.w700,
//                 ),
//                 tapFun: () {
//                   debugPrint('/////////////////////////helooo//////');
//                 },
//                 button: true,
//                 submitActionFnction: () {
//                   Navigator.pop(context);
//                   // _animationController.reverse();
//                 },
//               ),
//             );
//           },
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       physics: NeverScrollableScrollPhysics(),
//       child: Column(
//         children: [
//           Container(
//             decoration: const BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.only(
//                   bottomLeft: Radius.circular(10),
//                   bottomRight: Radius.circular(10),
//                 ),
//                 boxShadow: [
//                   // BoxShadow(
//                   //   // color: Colors.black.withOpacity(0.2),
//                   //   spreadRadius: 1,
//                   //   blurRadius: 10,
//                   //   offset: Offset(0,10),
//                   //   blurStyle: BlurStyle.normal,
//                   // )
//                 ]),
//             margin: EdgeInsets.only(left: 10.w, right: 17.w),
//             padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.w),
//             child: Column(
//               children: [
//                 GestureDetector(
//                   onTap: () {
//                     _showDialog();
//                   },
//                   child: Container(
//                     padding:
//                         EdgeInsets.symmetric(vertical: 15.w, horizontal: 15.w),
//                     decoration: BoxDecoration(
//                         borderRadius:
//                             const BorderRadius.all(Radius.circular(30)),
//                         border: Border.all(
//                             color: const Color(0xffEDEDED), width: 1.w)
//                         // color:Colors.white,
//                         ),
//                     // color:Colors.blue,
//                     child: Row(
//                       mainAxisSize: MainAxisSize.max,
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           crossAxisAlignment: CrossAxisAlignment.baseline,
//                           textBaseline: TextBaseline.alphabetic,
//                           children: [
//                             SvgPicture.asset(
//                               'assets/icons/Vector_14.svg',
//                               height: 13.h,
//                               width: 13.w,
//                             ),
//                             SizedBox(
//                               width: 5.w,
//                             ),
//                             Text(
//                               'Pick Up Location',
//                               style: TextStyle(
//                                   fontFamily: 'Campton',
//                                   color: Colors.black,
//                                   letterSpacing: -1,
//                                   fontSize: 18.sp,
//                                   fontWeight: FontWeight.w500),
//                             ),
//                           ],
//                         ),
//                         // SvgPicture.asset(
//                         //     'assets/icons/Arrow---Down-Circle.svg')
//                       ],
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 15.w,
//                 ),
//                 GestureDetector(
//                   onTap: () {
//                     _showDialog2();
//                   },
//                   child: Container(
//                     padding:
//                         EdgeInsets.symmetric(vertical: 15.w, horizontal: 15.w),
//                     decoration: BoxDecoration(
//                         borderRadius:
//                             const BorderRadius.all(Radius.circular(30)),
//                         border: Border.all(
//                             color: const Color(0xffEDEDED), width: 1.w)
//                         // color:Colors.white,
//                         ),
//                     // color:Colors.blue,
//                     child: Row(
//                       mainAxisSize: MainAxisSize.max,
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           crossAxisAlignment: CrossAxisAlignment.baseline,
//                           textBaseline: TextBaseline.alphabetic,
//                           children: [
//                             SvgPicture.asset(
//                               'assets/icons/mdi_person.svg',
//                               height: 15.h,
//                               width: 13.w,
//                             ),
//                             SizedBox(
//                               width: 5.w,
//                             ),
//                             Text(
//                               'Economy',
//                               style: TextStyle(
//                                   fontFamily: 'Campton',
//                                   color: Colors.black,
//                                   letterSpacing: -1,
//                                   fontSize: 18.sp,
//                                   fontWeight: FontWeight.w500),
//                             ),
//                           ],
//                         ),
//                         SvgPicture.asset('assets/icons/Arrow---Down-Circle.svg')
//                       ],
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 15.w,
//                 ),
//                 Container(
//                   padding:
//                       EdgeInsets.symmetric(vertical: 15.w, horizontal: 15.w),
//                   decoration: BoxDecoration(
//                       borderRadius: const BorderRadius.all(Radius.circular(30)),
//                       border:
//                           Border.all(color: const Color(0xffEDEDED), width: 1.w)
//                       // color:Colors.white,
//                       ),
//                   // color:Colors.blue,
//                   child: Row(
//                     mainAxisSize: MainAxisSize.max,
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         crossAxisAlignment: CrossAxisAlignment.baseline,
//                         textBaseline: TextBaseline.alphabetic,
//                         children: [
//                           SvgPicture.asset(
//                             'assets/icons/Calendar.svg',
//                             height: 13.h,
//                             width: 13.w,
//                           ),
//                           SizedBox(
//                             width: 5.w,
//                           ),
//                           Text(
//                             'Check In - Check Out',
//                             style: TextStyle(
//                                 fontFamily: 'Campton',
//                                 color: Colors.black,
//                                 letterSpacing: -1,
//                                 fontSize: 18.sp,
//                                 fontWeight: FontWeight.w500),
//                           ),
//                         ],
//                       ),
//                       // SvgPicture.asset(
//                       //     'assets/icons/Arrow---Down-Circle.svg')
//                     ],
//                   ),
//                 ),
//                 SizedBox(
//                   height: 30.w,
//                 ),
//                 PrimaryButton(
//                   borderRadius: 30,
//                   color: kDefaultActiveColor,
//                   onTap: () {},
//                   child: Text(
//                     'Search',
//                     style: TextStyle(
//                         fontFamily: 'Campton',
//                         color: Colors.black,
//                         letterSpacing: -0.5,
//                         fontSize: 16.sp,
//                         fontWeight: FontWeight.w500),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Container(
//             child: ListView.builder(
//               itemCount: 1,
//               physics: NeverScrollableScrollPhysics(),
//               shrinkWrap: true,
//               itemBuilder: (context, index) {
//                 return Container(
//                   margin: EdgeInsets.only(left: 21.w, top: 32.w, right: 21.w),
//                   decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(10.w)),
//                   padding: EdgeInsets.only(
//                       left: 11.w, right: 11.w, bottom: 21.w, top: 13.w),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.end,
//                     children: [
//                       Center(
//                         child: Image.asset(
//                           "assets/images/image 39.png",
//                           width: 173.w,
//                         ),
//                       ),
//                       SizedBox(
//                         height: 21.h,
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text(
//                             'Renault Clio HB 1.3 dCi',
//                             style: TextStyle(
//                                 fontFamily: 'Campton',
//                                 color: Colors.black,
//                                 letterSpacing: -1,
//                                 fontSize: 19.sp,
//                                 fontWeight: FontWeight.w600),
//                           ),
//                           Row(
//                             children: [
//                               Text(
//                                 'Excellent  ',
//                                 style: TextStyle(
//                                     fontFamily: 'Campton',
//                                     color: Colors.black,
//                                     // letterSpacing: -1,
//                                     fontSize: 16.sp,
//                                     fontWeight: FontWeight.w600),
//                               ),
//                               // SizedBox(
//                               //   width: 2.w,
//                               // ),
//                               Container(
//                                 padding: EdgeInsets.all(2),
//                                 decoration: BoxDecoration(
//                                     color: kDefaultActiveColor,
//                                     borderRadius: BorderRadius.circular(3)),
//                                 child: Text(
//                                   '4.3',
//                                   style: TextStyle(
//                                       fontFamily: 'Campton',
//                                       color: Colors.black,
//                                       // letterSpacing: -1,
//                                       fontSize: 13.sp,
//                                       fontWeight: FontWeight.w600),
//                                 ),
//                               ),
//                             ],
//                           )
//                         ],
//                       ),
//                       SizedBox(
//                         height: 5.h,
//                       ),
//                       Row(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         children: [
//                           Row(
//                             children: [
//                               SvgPicture.asset(
//                                 'assets/icons/location.svg',
//                                 // alignment: Alignment.topRight,
//                               ),
//                               Text(
//                                 "7+1",
//                                 style: TextStyle(
//                                     fontFamily: 'Campton',
//                                     color: Color(0xff212121),
//                                     fontSize: 12.sp,
//                                     fontWeight: FontWeight.w500),
//                               ),
//                             ],
//                           ),
//                           SizedBox(
//                             width: 5.w,
//                           ),
//                           Row(
//                             children: [
//                               SvgPicture.asset(
//                                 'assets/icons/location.svg',
//                                 // alignment: Alignment.topRight,
//                               ),
//                               const Text(
//                                 "Gasoline",
//                                 style: TextStyle(
//                                     fontFamily: 'Campton',
//                                     color: Color(0xff212121),
//                                     fontSize: 14,
//                                     fontWeight: FontWeight.w400),
//                               ),
//                             ],
//                           ),
//                           SizedBox(
//                             width: 5.w,
//                           ),
//                           Row(
//                             children: [
//                               SvgPicture.asset(
//                                 'assets/icons/location.svg',
//                                 // alignment: Alignment.topRight,
//                               ),
//                               Text(
//                                 "No Smoking",
//                                 style: TextStyle(
//                                     fontFamily: 'Campton',
//                                     color: Color(0xff212121),
//                                     fontSize: 12.sp,
//                                     fontWeight: FontWeight.w400),
//                               ),
//                             ],
//                           ),
//                           SizedBox(
//                             width: 5.w,
//                           ),
//                           Row(
//                             children: [
//                               SvgPicture.asset(
//                                 'assets/icons/location.svg',
//                                 // alignment: Alignment.topRight,
//                               ),
//                               Text(
//                                 "Wi-Fi",
//                                 style: TextStyle(
//                                     fontFamily: 'Campton',
//                                     color: Color(0xff212121),
//                                     fontSize: 12.sp,
//                                     fontWeight: FontWeight.w500),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                       SizedBox(
//                         height: 5.h,
//                       ),
//                       Row(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         children: [
//                           Row(
//                             children: [
//                               SvgPicture.asset(
//                                 'assets/icons/location.svg',
//                                 // alignment: Alignment.topRight,
//                               ),
//                               Text(
//                                 "1500 KM",
//                                 style: TextStyle(
//                                     fontFamily: 'Campton',
//                                     color: Color(0xff212121),
//                                     fontSize: 12.sp,
//                                     fontWeight: FontWeight.w500),
//                               ),
//                             ],
//                           ),
//                           SizedBox(
//                             width: 5.w,
//                           ),
//                           Row(
//                             children: [
//                               SvgPicture.asset(
//                                 'assets/icons/location.svg',
//                                 // alignment: Alignment.topRight,
//                               ),
//                               const Text(
//                                 "Manuel",
//                                 style: TextStyle(
//                                     fontFamily: 'Campton',
//                                     color: Color(0xff212121),
//                                     fontSize: 14,
//                                     fontWeight: FontWeight.w400),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                       SizedBox(
//                         height: 8.h,
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.end,
//                         children: [
//                           Text(
//                             "Daily",
//                             style: TextStyle(
//                                 fontFamily: 'Campton',
//                                 color: kDefaultActiveColor,
//                                 fontSize: 12.sp,
//                                 fontWeight: FontWeight.w600),
//                           ),
//                           Text(
//                             "  1.199,00 ₺",
//                             style: TextStyle(
//                                 fontFamily: 'Campton',
//                                 color: Color(0xff212121),
//                                 fontSize: 14.sp,
//                                 fontWeight: FontWeight.w600),
//                           ),
//                         ],
//                       ),
//                       SizedBox(
//                         height: 5.h,
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text(
//                             "Vehicle Class",
//                             style: TextStyle(
//                                 fontFamily: 'Campton',
//                                 color: kDefaultActiveColor,
//                                 fontSize: 16.sp,
//                                 fontWeight: FontWeight.w600),
//                           ),
//                           Text(
//                             "Total Price for 7 days",
//                             style: TextStyle(
//                                 fontFamily: 'Campton',
//                                 color: kDefaultActiveColor,
//                                 fontSize: 16.sp,
//                                 fontWeight: FontWeight.w600),
//                           ),
//                         ],
//                       ),
//                       SizedBox(
//                         height: 2.h,
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text(
//                             "Economy",
//                             style: TextStyle(
//                                 fontFamily: 'Campton',
//                                 color: Color(0xff212121),
//                                 fontSize: 20.sp,
//                                 fontWeight: FontWeight.w600),
//                           ),
//                           Text(
//                             " 1.199,00 ₺",
//                             style: TextStyle(
//                                 fontFamily: 'Campton',
//                                 color: Color(0xff212121),
//                                 fontSize: 20.sp,
//                                 fontWeight: FontWeight.w600),
//                           ),
//                         ],
//                       ),
//                       SizedBox(
//                         height: 15.h,
//                       ),
//                       PrimaryButton(
//                         borderRadius: 30,
//                         color: kDefaultActiveColor,
//                         onTap: () {
//                           Navigator.push(
//                             context,
//                             SlidePageRoute(
//                               page: MDBookingPaymentView(),
//                               direction: SlideDirection.right,
//                               delay: Duration(milliseconds: 5000),
//                             ),
//                           );
//                           // Navigator.push(
//                           //   context,
//                           //   MaterialPageRoute(
//                           //       builder: (context) => MDBookingPaymentView()),
//                           // );
//                         },
//                         child: Text(
//                           'Book Now',
//                           style: TextStyle(
//                               fontFamily: 'Campton',
//                               color: Colors.black,
//                               letterSpacing: -0.5,
//                               fontSize: 15.sp,
//                               fontWeight: FontWeight.w500),
//                         ),
//                       ),
//                     ],
//                   ),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
