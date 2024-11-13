// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:md_health/Screens/MdBooking/empty/custome_booking.dart';
// import 'package:md_health/Screens/MdBooking/md_booking_payment/view/md_booking_payment_view.dart';
// import 'package:md_health/Screens/home/view/custom_select_box.dart';
// import 'package:md_health/constants/styles/colors.dart';
// import 'package:md_health/constants/styles/textstyle.dart';
// import 'package:md_health/test_widget.dart';
// import 'package:md_health/widget/buttons.dart';
// // import 'package:md_health/home/custom_select_box.dart';

// class HotelSearchView extends StatefulWidget {
//   const HotelSearchView({super.key});

//   @override
//   State<HotelSearchView> createState() => _HotelSearchViewState();
// }

// class _HotelSearchViewState extends State<HotelSearchView>
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
//               child: CustomSelectBoxBooking(
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

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Container(
//           decoration: const BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.only(
//                 bottomLeft: Radius.circular(10),
//                 bottomRight: Radius.circular(10),
//               ),
//               boxShadow: [
//                 // BoxShadow(
//                 //   // color: Colors.black.withOpacity(0.2),
//                 //   spreadRadius: 1,
//                 //   blurRadius: 10,
//                 //   offset: Offset(0,10),
//                 //   blurStyle: BlurStyle.normal,
//                 // )
//               ]),
//           margin: EdgeInsets.only(left: 10.w, right: 17.w),
//           padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.w),
//           child: Column(
//             children: [
//               Container(
//                 padding: EdgeInsets.symmetric(vertical: 15.w, horizontal: 15.w),
//                 decoration: BoxDecoration(
//                     borderRadius: const BorderRadius.all(Radius.circular(30)),
//                     border:
//                         Border.all(color: const Color(0xffEDEDED), width: 1.w)
//                     // color:Colors.white,
//                     ),
//                 // color:Colors.blue,
//                 child: Row(
//                   mainAxisSize: MainAxisSize.max,
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     GestureDetector(
//                       onTap: () {
//                         _showDialog();
//                       },
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         crossAxisAlignment: CrossAxisAlignment.baseline,
//                         textBaseline: TextBaseline.alphabetic,
//                         children: [
//                           SvgPicture.asset(
//                             'assets/icons/Vector_14.svg',
//                             height: 13.h,
//                             width: 13.w,
//                           ),
//                           SizedBox(
//                             width: 5.w,
//                           ),
//                           Text(
//                             'Where are you going?',
//                             style: TextStyle(
//                                 fontFamily: 'Campton',
//                                 color: Colors.black,
//                                 letterSpacing: -1,
//                                 fontSize: 18.sp,
//                                 fontWeight: FontWeight.w500),
//                           ),
//                         ],
//                       ),
//                     ),
//                     // SvgPicture.asset(
//                     //     'assets/icons/Arrow---Down-Circle.svg')
//                   ],
//                 ),
//               ),
//               SizedBox(
//                 height: 15.w,
//               ),
//               GestureDetector(
//                 onTap: () {
//                   _showDialog2();
//                 },
//                 child: Container(
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
//                             'assets/icons/mdi_person.svg',
//                             height: 15.h,
//                             width: 13.w,
//                           ),
//                           SizedBox(
//                             width: 5.w,
//                           ),
//                           Text(
//                             '2 Adults - 1 Room',
//                             style: TextStyle(
//                                 fontFamily: 'Campton',
//                                 color: Colors.black,
//                                 letterSpacing: -1,
//                                 fontSize: 18.sp,
//                                 fontWeight: FontWeight.w500),
//                           ),
//                         ],
//                       ),
//                       SvgPicture.asset('assets/icons/Arrow---Down-Circle.svg')
//                     ],
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: 15.w,
//               ),
//               Container(
//                 padding: EdgeInsets.symmetric(vertical: 15.w, horizontal: 15.w),
//                 decoration: BoxDecoration(
//                     borderRadius: const BorderRadius.all(Radius.circular(30)),
//                     border:
//                         Border.all(color: const Color(0xffEDEDED), width: 1.w)
//                     // color:Colors.white,
//                     ),
//                 // color:Colors.blue,
//                 child: Row(
//                   mainAxisSize: MainAxisSize.max,
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       crossAxisAlignment: CrossAxisAlignment.baseline,
//                       textBaseline: TextBaseline.alphabetic,
//                       children: [
//                         SvgPicture.asset(
//                           'assets/icons/Calendar.svg',
//                           height: 13.h,
//                           width: 13.w,
//                         ),
//                         SizedBox(
//                           width: 5.w,
//                         ),
//                         Text(
//                           'Check In - Check Out',
//                           style: TextStyle(
//                               fontFamily: 'Campton',
//                               color: Colors.black,
//                               letterSpacing: -1,
//                               fontSize: 18.sp,
//                               fontWeight: FontWeight.w500),
//                         ),
//                       ],
//                     ),
//                     // SvgPicture.asset(
//                     //     'assets/icons/Arrow---Down-Circle.svg')
//                   ],
//                 ),
//               ),
//               SizedBox(
//                 height: 30.w,
//               ),
//               PrimaryButton(
//                 borderRadius: 30,
//                 color: kDefaultActiveColor,
//                 onTap: () {},
//                 child: Text(
//                   'Search',
//                   style: TextStyle(
//                       fontFamily: 'Campton',
//                       color: Colors.black,
//                       letterSpacing: -0.5,
//                       fontSize: 16.sp,
//                       fontWeight: FontWeight.w500),
//                 ),
//               ),
//             ],
//           ),
//         ),
//         SizedBox(
//           height: 41.h,
//         ),
//         Column(
//           children: [
//             Text(
//               'Search Results',
//               style: TextStyle(
//                   fontFamily: 'Campton',
//                   color: Colors.black,
//                   letterSpacing: -1,
//                   fontSize: 20.sp,
//                   fontWeight: FontWeight.w600),
//             ),
//             Container(
//               child: ListView.builder(
//                 itemCount: 1,
//                 physics: NeverScrollableScrollPhysics(),
//                 shrinkWrap: true,
//                 itemBuilder: (context, index) {
//                   return Container(
//                     margin: EdgeInsets.only(left: 21.w, top: 32.w, right: 21.w),
//                     decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(10.w)),
//                     padding: EdgeInsets.only(
//                         left: 11.w, right: 11.w, bottom: 21.w, top: 13.w),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.end,
//                       children: [
//                         ClipRRect(
//                             borderRadius: BorderRadius.circular(8.0),
//                             child:
//                                 Image.asset("assets/images/Rectangle_233.png")),
//                         SizedBox(
//                           height: 21.h,
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text(
//                               'Kleopatra Hotel',
//                               style: TextStyle(
//                                   fontFamily: 'Campton',
//                                   color: Colors.black,
//                                   // letterSpacing: -1,
//                                   fontSize: 20.sp,
//                                   fontWeight: FontWeight.w600),
//                             ),
//                             Row(
//                               children: [
//                                 Text(
//                                   'Excellent  ',
//                                   style: TextStyle(
//                                       fontFamily: 'Campton',
//                                       color: Colors.black,
//                                       // letterSpacing: -1,
//                                       fontSize: 16.sp,
//                                       fontWeight: FontWeight.w600),
//                                 ),
//                                 // SizedBox(
//                                 //   width: 2.w,
//                                 // ),
//                                 Container(
//                                   padding: EdgeInsets.all(2),
//                                   decoration: BoxDecoration(
//                                       color: kDefaultActiveColor,
//                                       borderRadius: BorderRadius.circular(3)),
//                                   child: Text(
//                                     '4.3',
//                                     style: TextStyle(
//                                         fontFamily: 'Campton',
//                                         color: Colors.black,
//                                         // letterSpacing: -1,
//                                         fontSize: 13.sp,
//                                         fontWeight: FontWeight.w600),
//                                   ),
//                                 ),
//                               ],
//                             )
//                           ],
//                         ),
//                         SizedBox(
//                           height: 5.h,
//                         ),
//                         Row(
//                           children: [
//                             SvgPicture.asset(
//                               'assets/icons/location.svg',
//                               // alignment: Alignment.topRight,
//                             ),
//                             const Text(
//                               " Distance to hospital",
//                               style: TextStyle(
//                                   fontFamily: 'Campton',
//                                   color: Color(0xff212121),
//                                   fontSize: 14,
//                                   fontWeight: FontWeight.w400),
//                             ),
//                             const Text(
//                               "  3.7 KM",
//                               style: TextStyle(
//                                   fontFamily: 'Campton',
//                                   color: Color(0xff212121),
//                                   fontSize: 14,
//                                   fontWeight: FontWeight.w700),
//                             ),
//                           ],
//                         ),
//                         SizedBox(
//                           height: 5.h,
//                         ),
//                         Row(
//                           children: [
//                             SvgPicture.asset(
//                               'assets/icons/bi_star-fill.svg',
//                               // alignment: Alignment.topRight,
//                             ),
//                             const Text(
//                               "   4 Stars Hotel",
//                               style: TextStyle(
//                                   fontFamily: 'Campton',
//                                   color: Color(0xff212121),
//                                   fontSize: 14,
//                                   fontWeight: FontWeight.w400),
//                             ),
//                           ],
//                         ),
//                         SizedBox(
//                           height: 15.h,
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           children: [
//                             Text(
//                               'Standart Room',
//                               style: TextStyle(
//                                   fontFamily: 'Campton',
//                                   color: kDefaultActiveColor,
//                                   // letterSpacing: -1,
//                                   fontSize: 20.sp,
//                                   fontWeight: FontWeight.w600),
//                             ),
//                           ],
//                         ),
//                         SizedBox(
//                           height: 7.h,
//                         ),
//                         const Text(
//                           "Television, Suitable for wheelchair use, Cable TV service, Mini bar, Daily housekeeping",
//                           style: TextStyle(
//                               fontFamily: 'Campton',
//                               color: Color(0xff212121),
//                               fontSize: 14,
//                               fontWeight: FontWeight.w400),
//                         ),
//                         SizedBox(
//                           height: 8.h,
//                         ),
//                         Row(
//                           children: [
//                             Text(
//                               "Per Night Price",
//                               style: TextStyle(
//                                   fontFamily: 'Campton',
//                                   color: kDefaultActiveColor,
//                                   fontSize: 12.sp,
//                                   fontWeight: FontWeight.w600),
//                             ),
//                             Text(
//                               "  1.199,00 ₺",
//                               style: TextStyle(
//                                   fontFamily: 'Campton',
//                                   color: Color(0xff212121),
//                                   fontSize: 16.sp,
//                                   fontWeight: FontWeight.w600),
//                             ),
//                           ],
//                         ),
//                         SizedBox(
//                           height: 5.h,
//                         ),
//                         Text(
//                           "Total Price for 7 days",
//                           style: TextStyle(
//                               fontFamily: 'Campton',
//                               color: kDefaultActiveColor,
//                               fontSize: 16.sp,
//                               fontWeight: FontWeight.w600),
//                         ),
//                         SizedBox(
//                           height: 2.h,
//                         ),
//                         Text(
//                           " 1.199,00 ₺",
//                           style: TextStyle(
//                               fontFamily: 'Campton',
//                               color: Color(0xff212121),
//                               fontSize: 20.sp,
//                               fontWeight: FontWeight.w600),
//                         ),
//                         SizedBox(
//                           height: 15.h,
//                         ),
//                         PrimaryButton(
//                           borderRadius: 30,
//                           color: kDefaultActiveColor,
//                           onTap: () {
//                             Navigator.push(
//                               context,
//                               SlidePageRoute(
//                                 page: MDBookingPaymentView(),
//                                 direction: SlideDirection.right,
//                                 delay: Duration(milliseconds: 5000),
//                               ),
//                               // MaterialPageRoute(
//                               //     builder: (context) => MDBookingPaymentView()),
//                             );
//                           },
//                           child: Text(
//                             'Book Hotel',
//                             style: TextStyle(
//                                 fontFamily: 'Campton',
//                                 color: Colors.black,
//                                 // letterSpacing: -0.5,
//                                 fontSize: 15.sp,
//                                 fontWeight: FontWeight.w500),
//                           ),
//                         ),
//                       ],
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ],
//         )
//       ],
//     );
//   }
// }
