// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:intl/intl.dart';
// import 'package:md_health/Screens/MdBooking/empty/custome_booking.dart';
// import 'package:md_health/Screens/MdBooking/md_booking_payment/view/md_booking_payment_view.dart';
// import 'package:md_health/constants/styles/colors.dart';
// import 'package:md_health/constants/styles/textstyle.dart';
// import 'package:md_health/test_widget.dart';
// import 'package:md_health/widget/buttons.dart';

// class FlightSearchView extends StatefulWidget {
//   const FlightSearchView({super.key});

//   @override
//   State<FlightSearchView> createState() => _FlightSearchViewState();
// }

// class _FlightSearchViewState extends State<FlightSearchView>
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
//               GestureDetector(
//                 onTap: () {},
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
//                           Text(
//                             'Two Way',
//                             style: TextStyle(
//                                 fontFamily: 'Campton',
//                                 color: Colors.black,
//                                 // letterSpacing: -1,
//                                 fontSize: 16.sp,
//                                 fontWeight: FontWeight.w400),
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
//               GestureDetector(
//                 onTap: () {},
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
//                           Text(
//                             'Economy',
//                             style: TextStyle(
//                                 fontFamily: 'Campton',
//                                 color: Colors.black,
//                                 // letterSpacing: -1,
//                                 fontSize: 16.sp,
//                                 fontWeight: FontWeight.w400),
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
//                             '2 Adults',
//                             style: TextStyle(
//                                 fontFamily: 'Campton',
//                                 color: Colors.black,
//                                 // letterSpacing: -1,
//                                 fontSize: 16.sp,
//                                 fontWeight: FontWeight.w400),
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
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: [
//                   Container(
//                     padding: EdgeInsets.only(
//                         left: 15.w, top: 10.w, right: 40.w, bottom: 10.w),
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(20),
//                         border: Border.all(width: 1, color: Color(0xffEDEDED))),
//                     child: Row(
//                       children: [
//                         SvgPicture.asset(
//                           'assets/icons/new_flight2024.svg',
//                           height: 13.h,
//                           width: 13.w,
//                         ),
//                         Text(
//                           '  From',
//                           style: TextStyle(
//                               fontFamily: 'Campton',
//                               color: Colors.black,
//                               letterSpacing: -1,
//                               fontSize: 18.sp,
//                               fontWeight: FontWeight.w500),
//                         ),
//                       ],
//                     ),
//                   ),
//                   SvgPicture.asset('assets/icons/new_exchange.svg'),
//                   Container(
//                     padding: EdgeInsets.only(
//                         left: 15.w, top: 10.w, right: 40.w, bottom: 10.w),
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(20),
//                         border: Border.all(width: 1, color: Color(0xffEDEDED))),
//                     child: Row(
//                       children: [
//                         SvgPicture.asset(
//                           'assets/icons/new_flight2024.svg',
//                           height: 13.h,
//                           width: 13.w,
//                         ),
//                         Text(
//                           ' To   ',
//                           style: TextStyle(
//                               fontFamily: 'Campton',
//                               color: Colors.black,
//                               // letterSpacing: -1,
//                               fontSize: 18.sp,
//                               fontWeight: FontWeight.w500),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(
//                 height: 15.w,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   GestureDetector(
//                     onTap: () async {
//                       var pickedDate = await showDatePicker(
//                         builder: (BuildContext, child) {
//                           return Theme(
//                             data: Theme.of(context).copyWith(
//                               colorScheme: const ColorScheme.light(
//                                 primary: Color(0xff1767B1),
//                                 // <-- SEE HERE
//                                 onPrimary: Colors.white,
//                                 // <-- SEE HERE
//                                 onSurface: Colors.black, // <-- SEE HERE
//                               ),
//                               textButtonTheme: TextButtonThemeData(
//                                 style: TextButton.styleFrom(
//                                   foregroundColor: const Color(
//                                       0xff1767B1), // button text color
//                                 ),
//                               ),
//                             ),
//                             child: child!,
//                           );
//                         },
//                         context: context,
//                         initialDate: DateTime.now(),
//                         firstDate: DateTime.now(),
//                         lastDate: DateTime(2100),
//                       );
//                       if (pickedDate != null) {
//                         String date = DateFormat('dd-MM-yyy')
//                             .format(pickedDate ?? DateTime.now());
//                         // read.onToDateSelected(date);
//                       }
//                     },
//                     child: Container(
//                       padding: EdgeInsets.symmetric(
//                           vertical: 15.w, horizontal: 15.w),
//                       decoration: BoxDecoration(
//                           borderRadius:
//                               const BorderRadius.all(Radius.circular(30)),
//                           border: Border.all(
//                               color: const Color(0xffEDEDED), width: 1.w)
//                           // color:Colors.white,
//                           ),
//                       // color:Colors.blue,
//                       child: Row(
//                         mainAxisSize: MainAxisSize.max,
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             crossAxisAlignment: CrossAxisAlignment.baseline,
//                             textBaseline: TextBaseline.alphabetic,
//                             children: [
//                               SvgPicture.asset(
//                                 'assets/icons/Calendar.svg',
//                                 height: 13.h,
//                                 width: 13.w,
//                               ),
//                               SizedBox(
//                                 width: 5.w,
//                               ),
//                               Text(
//                                 '12/12/2024',
//                                 style: TextStyle(
//                                     fontFamily: 'Campton',
//                                     color: Colors.black,
//                                     letterSpacing: -1,
//                                     fontSize: 18.sp,
//                                     fontWeight: FontWeight.w500),
//                               ),
//                             ],
//                           ),
//                           // SvgPicture.asset(
//                           //     'assets/icons/new_exchange.svg')
//                         ],
//                       ),
//                     ),
//                   ),
//                   SvgPicture.asset('assets/icons/new_exchange.svg'),
//                   Container(
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
//                               'assets/icons/Calendar.svg',
//                               height: 13.h,
//                               width: 13.w,
//                             ),
//                             SizedBox(
//                               width: 5.w,
//                             ),
//                             Text(
//                               '12/12/2024',
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
//                 ],
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
//         Container(
//           child: ListView.builder(
//             itemCount: 2,
//             shrinkWrap: true,
//             physics: NeverScrollableScrollPhysics(),
//             itemBuilder: (context, index) {
//               return Container(
//                 child: Container(
//                   margin: EdgeInsets.only(top: 37.w, left: 25, right: 25.w),
//                   padding: EdgeInsets.only(
//                       top: 10.w, left: 16, bottom: 12.w, right: 9.w),
//                   decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(10)),
//                   child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.end,
//                       children: [
//                         Row(
//                           children: [
//                             Expanded(
//                               child: Column(
//                                 children: [
//                                   Row(
//                                     mainAxisAlignment: MainAxisAlignment.end,
//                                     children: [
//                                       Text(
//                                         "Via",
//                                         style: TextStyle(
//                                             fontFamily: 'Campton',
//                                             color: Colors.black,
//                                             fontSize: 14.sp,
//                                             fontWeight: FontWeight.w400),
//                                       ),
//                                       Text(
//                                         " PEGASUS",
//                                         style: TextStyle(
//                                             fontStyle: FontStyle.italic,
//                                             fontFamily: 'Campton',
//                                             color: Colors.red,
//                                             fontSize: 20.sp,
//                                             fontWeight: FontWeight.w700),
//                                       ),
//                                     ],
//                                   ),
//                                   Row(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.center,
//                                     children: [
//                                       Text(
//                                         "Stockholm",
//                                         style: TextStyle(
//                                             fontFamily: 'Campton',
//                                             color: Colors.black,
//                                             fontSize: 18.sp,
//                                             fontWeight: FontWeight.w400),
//                                       ),
//                                       Expanded(
//                                         child: Column(
//                                           crossAxisAlignment:
//                                               CrossAxisAlignment.center,
//                                           children: [
//                                             SvgPicture.asset(
//                                               "assets/icons/Group 12.svg",
//                                               width: 80.w,
//                                             ),
//                                             SizedBox(
//                                               height: 5.h,
//                                             ),
//                                             Text(
//                                               "2 Hour 10 Min",
//                                               style: TextStyle(
//                                                   fontFamily: 'Campton',
//                                                   color: Colors.black,
//                                                   fontSize: 14.sp,
//                                                   fontWeight: FontWeight.w500),
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                       Text(
//                                         "Stockholm",
//                                         style: TextStyle(
//                                             fontFamily: 'Campton',
//                                             color: Colors.black,
//                                             fontSize: 18.sp,
//                                             fontWeight: FontWeight.w400),
//                                       ),
//                                     ],
//                                   ),
//                                   Row(
//                                     mainAxisAlignment:
//                                         MainAxisAlignment.spaceBetween,
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.center,
//                                     children: [
//                                       Text(
//                                         "ARN",
//                                         style: TextStyle(
//                                             fontFamily: 'Campton',
//                                             color: Colors.black,
//                                             fontSize: 26.sp,
//                                             fontWeight: FontWeight.w700),
//                                       ),
//                                       Text(
//                                         "Direct Flight",
//                                         style: TextStyle(
//                                             fontFamily: 'Campton',
//                                             color: Color(0xff4CDB06),
//                                             fontSize: 15.sp,
//                                             fontWeight: FontWeight.w500),
//                                       ),
//                                       Text(
//                                         "IST",
//                                         style: TextStyle(
//                                             fontFamily: 'Campton',
//                                             color: Colors.black,
//                                             fontSize: 26.sp,
//                                             fontWeight: FontWeight.w700),
//                                       ),
//                                     ],
//                                   ),
//                                   SizedBox(
//                                     height: 2.h,
//                                   ),
//                                   Row(
//                                     mainAxisAlignment:
//                                         MainAxisAlignment.spaceBetween,
//                                     // crossAxisAlignment: CrossAxisAlignment.center,
//                                     children: [
//                                       Text(
//                                         "18:20",
//                                         style: TextStyle(
//                                             fontFamily: 'Campton',
//                                             color: Color(0xff4CDB06),
//                                             fontSize: 17.sp,
//                                             fontWeight: FontWeight.w600),
//                                       ),
//                                       // SizedBox(
//                                       //   width: 2.w,
//                                       // ),
//                                       Container(
//                                         padding:
//                                             const EdgeInsets.only(left: 20.0),
//                                         child: Row(
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.center,
//                                           crossAxisAlignment:
//                                               CrossAxisAlignment.center,
//                                           children: [
//                                             SvgPicture.asset(
//                                                 "assets/icons/Vector (1).svg"),
//                                             // SizedBox(
//                                             //   width: 10.w,
//                                             // ),
//                                             Text(
//                                               "  1 x 15 KG",
//                                               style: TextStyle(
//                                                   fontFamily: 'Campton',
//                                                   color: black,
//                                                   fontSize: 15.sp,
//                                                   fontWeight: FontWeight.w400),
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                       Text(
//                                         "20:30",
//                                         style: TextStyle(
//                                             fontFamily: 'Campton',
//                                             color: Color(0xffF31D1D),
//                                             fontSize: 17.sp,
//                                             fontWeight: FontWeight.w600),
//                                       ),
//                                     ],
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                         SizedBox(
//                           height: 12.h,
//                         ),
//                         Divider(
//                           color: Color(0xffD5D5D5),
//                         ),
//                         SizedBox(
//                           height: 12.h,
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             PrimaryButton(
//                               width: 180.w,
//                               height: 40.h,
//                               borderRadius: 30,
//                               color: black,
//                               onTap: () {
//                                 Navigator.push(
//                                   context,
//                                   SlidePageRoute(
//                                     page: MDBookingPaymentView(),
//                                     direction: SlideDirection.right,
//                                     delay: Duration(milliseconds: 5000),
//                                   ),
//                                 );
//                                 // Navigator.push(
//                                 //   context,
//                                 //   MaterialPageRoute(
//                                 //       builder: (context) =>
//                                 //           MDBookingPaymentView()),
//                                 // );
//                               },
//                               child: Text(
//                                 'Buy Ticket',
//                                 style: TextStyle(
//                                     fontFamily: 'Campton',
//                                     color: Colors.white,
//                                     letterSpacing: -0.5,
//                                     fontSize: 16.sp,
//                                     fontWeight: FontWeight.w500),
//                               ),
//                             ),
//                             Column(
//                               children: [
//                                 Text(
//                                   '1.348,00 ₺',
//                                   style: TextStyle(
//                                       fontFamily: 'Campton',
//                                       color: Colors.black,
//                                       // letterSpacing: -0.5,
//                                       fontSize: 20.sp,
//                                       fontWeight: FontWeight.w700),
//                                 ),
//                                 Text(
//                                   'Total 2.823,00 ₺',
//                                   style: TextStyle(
//                                       fontFamily: 'Campton',
//                                       color: Colors.black,
//                                       // letterSpacing: -0.5,
//                                       fontSize: 12.sp,
//                                       fontWeight: FontWeight.w400),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         )
//                       ]),
//                 ),
//               );
//             },
//           ),
//         )
//       ],
//     );
//   }
// }
