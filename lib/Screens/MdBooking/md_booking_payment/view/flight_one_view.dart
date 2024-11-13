// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:intl/intl.dart';
// import 'package:md_health/Screens/MdBooking/empty/custome_booking.dart';
// import 'package:md_health/Screens/MdBooking/empty/search_flight.dart';
// import 'package:md_health/constants/styles/colors.dart';
// import 'package:md_health/constants/styles/textstyle.dart';
// import 'package:md_health/test_widget.dart';
// import 'package:md_health/widget/buttons.dart';

// class FlightSearchViewOne extends StatefulWidget {
//   const FlightSearchViewOne({super.key});

//   @override
//   State<FlightSearchViewOne> createState() => _FlightSearchViewOneState();
// }

// class _FlightSearchViewOneState extends State<FlightSearchViewOne>
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
//                 onTap: () {
//                   Navigator.push(
//                     context,
//                     SlidePageRoute(
//                       page: SearchFlightView(),
//                       direction: SlideDirection.right,
//                       delay: Duration(milliseconds: 5000),
//                     ),
//                   );
//                   // Navigator.push(
//                   //   context,
//                   //   MaterialPageRoute(builder: (context) => SearchFlightView()),
//                   // );
//                 },
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
//       ],
//     );
//   }
// }
