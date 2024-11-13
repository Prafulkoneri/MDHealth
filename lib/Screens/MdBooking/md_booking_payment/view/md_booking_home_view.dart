// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:md_health/Screens/MdBooking/md_booking_payment/view/flight_one_view.dart';
// import 'package:md_health/Screens/MdBooking/md_booking_payment/view/hotel_one_view.dart';
// import 'package:md_health/Screens/MdBooking/md_booking_payment/view/vehical_one_view.dart';
// import 'package:md_health/Screens/packages/controller/packages_view_controller.dart';
// import 'package:md_health/Screens/packages/view/package_detail_view.dart';
// import 'package:md_health/constants/styles/colors.dart';
// import 'package:md_health/test_widget.dart';
// import 'package:md_health/widget/base_screen.dart';
// import 'package:md_health/widget/custom_appbar.dart';
// import 'package:md_health/widget/custome_indicator.dart';
// import 'package:provider/provider.dart';

// class MdBookingHomeView extends StatefulWidget {
//   const MdBookingHomeView({super.key});

//   @override
//   State<MdBookingHomeView> createState() => _MdBookingHomeViewState();
// }

// class _MdBookingHomeViewState extends State<MdBookingHomeView> {
//   @override
//   Widget build(BuildContext context) {
//     final read = context.read<PackageViewController>();
//     final watch = context.watch<PackageViewController>();
//     return DefaultTabController(
//         length: 3,
//         initialIndex: 0,
//         child: BaseScreen(
//             onWillPop: () async {
//               // Navigator.pushReplacement(
//               //   context,
//               //   SlidePageRoute(
//               //     page: PackageDetailView(
//               //       type: widget.type,
//               //       purchesId: watch.purchesId,
//               //       packageId: watch.packageId,
//               //     ),
//               //     direction: SlideDirection.left, // Specify the slide direction here
//               //     delay: Duration(milliseconds: 5000),
//               //   ),
//               // );

//               return false;
//             },
//             hasScrollView: true,
//             backgroundColor: Color(0xffF5F5F5),
//             appBar: PreferredSize(
//               preferredSize: Size.fromHeight(130),
//               child: CustomAppBar(
//                 mdTitle: "booking",
//                 //  isMdBookingAppBar: true,
//                 hasHiText: true,
//                 // hasBackButton: ,
//                 hasMdTitle: true,
//                 // drawerTitle: "Orders",
//               ),
//             ),
//             content: Column(children: [
//               Container(
//                   color: Colors.black,
//                   child: Column(children: [
//                     Column(
//                       children: [
//                         SizedBox(
//                           height: 12.h,
//                         ),
//                         Center(
//                           child: Text(
//                             "BOOK RELIABLE & AFFORDABLE",
//                             style: TextStyle(
//                                 fontFamily: 'Campton',
//                                 color: kDefaultActiveColor,
//                                 fontSize: 12.sp,
//                                 letterSpacing: 3,
//                                 fontWeight: FontWeight.w500),
//                           ),
//                         ),
//                         SizedBox(
//                           height: 20.h,
//                         ),
//                         Center(
//                           child: RichText(
//                               text: const TextSpan(
//                                   style: TextStyle(
//                                       fontFamily: 'Campton',
//                                       color: Colors.white,
//                                       fontSize: 25,
//                                       letterSpacing: -2,
//                                       fontWeight: FontWeight.w700),
//                                   children: [
//                                 TextSpan(
//                                   text: 'HOTEL ',
//                                 ),
//                                 TextSpan(
//                                   text: '/ ',
//                                   style: TextStyle(
//                                     color: kDefaultActiveColor,
//                                   ),
//                                 ),
//                                 TextSpan(
//                                   text: 'FLIGHT ',
//                                 ),
//                                 TextSpan(
//                                   text: '/ ',
//                                   style: TextStyle(
//                                     color: kDefaultActiveColor,
//                                   ),
//                                 ),
//                                 TextSpan(
//                                   text: 'VEHICLE',
//                                 ),
//                               ])),
//                         ),
//                         SizedBox(
//                           height: 20.h,
//                         ),
//                         Text(
//                           "IN SECONDS",
//                           style: TextStyle(
//                               fontFamily: 'Campton',
//                               color: kDefaultActiveColor,
//                               letterSpacing: 3,
//                               fontSize: 19.sp,
//                               fontWeight: FontWeight.w500),
//                         ),
//                         SizedBox(
//                           height: 70.sp,
//                         ),
//                       ],
//                     ),
//                   ])),
//               Container(
//                   color: const Color(0xffF5F5F5),
//                   width: double.infinity,
//                   // m: EdgeInsets.only(left: 15.w, top: 15.w, right: 10.w),
//                   child: Column(
//                     children: [
//                       Container(
//                         margin:
//                             EdgeInsets.only(left: 15.w, top: 15.w, right: 10.w),
//                         width: double.infinity,
//                         padding: EdgeInsets.symmetric(vertical: 60.w),
//                         decoration: const BoxDecoration(
//                           borderRadius: BorderRadius.all(Radius.circular(7)),
//                           color: Color(0xffDA0000),
//                         ),
//                         alignment: Alignment.center,
//                         child: Text(
//                           'Advertising Area',
//                           style: TextStyle(
//                               fontFamily: 'Campton',
//                               color: Colors.white,
//                               letterSpacing: -1,
//                               fontSize: 16.sp,
//                               fontWeight: FontWeight.w800),
//                         ),
//                       ),
//                       TabBar(
//                         isScrollable: false,
//                         splashBorderRadius: BorderRadius.circular(10),
//                         indicator: CustomIndicator(
//                             color: Colors.transparent, radius: 0.w),
//                         padding: EdgeInsets.only(top: 20.w, right: 20.w),
//                         labelPadding: EdgeInsets.only(bottom: 0.w),
//                         tabs: <Widget>[
//                           Container(
//                             padding: EdgeInsets.only(left: 10.w, right: 8.w),
//                             child: Tab(
//                                 child: watch.selectedIndex == 0
//                                     ? Container(
//                                         height: 200,
//                                         // padding: EdgeInsets.only(left: 20.w),
//                                         decoration: BoxDecoration(
//                                             color: Colors.white,
//                                             gradient: watch.selectedIndex == 0
//                                                 ? LinearGradient(
//                                                     begin:
//                                                         const Alignment(0, 15),
//                                                     end: Alignment.topCenter,
//                                                     colors: [
//                                                       // Start with a transparent color at the bottom
//                                                       Colors.white
//                                                           .withOpacity(0.1),
//                                                       Colors
//                                                           .white, // Adjust the shadow intensity here
//                                                     ],
//                                                   )
//                                                 : null),
//                                         //
//                                         // borderRadius: BorderRadius.circular(10),
//                                         child: Row(
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.center,
//                                           children: [
//                                             SvgPicture.asset(
//                                               'assets/icons/Vector_14.svg',
//                                               height: 14.h,
//                                               width: 21.w,
//                                             ),
//                                             SizedBox(
//                                               width: 5.w,
//                                             ),
//                                             Text(
//                                               'Hotel',
//                                               style: TextStyle(
//                                                   fontFamily: 'Campton',
//                                                   color: Colors.black,
//                                                   letterSpacing: -1,
//                                                   fontSize: 19.sp,
//                                                   fontWeight: FontWeight.w700),
//                                             )
//                                           ],
//                                         ),
//                                       )
//                                     : Container(
//                                         height: 200.h,
//                                         decoration: BoxDecoration(
//                                             // color: Colors.black.withOpacity(0.),
//                                             gradient: LinearGradient(
//                                           begin: const Alignment(0, 15),
//                                           end: Alignment.topCenter,
//                                           colors: [
//                                             // Start with a transparent color at the bottom
//                                             Colors.black.withOpacity(0.2),
//                                             Colors
//                                                 .white, // Adjust the shadow intensity here
//                                           ],
//                                         )),
//                                         child: Row(
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.center,
//                                           children: [
//                                             SvgPicture.asset(
//                                               'assets/icons/Vector_14.svg',
//                                               height: 14.h,
//                                               width: 21.w,
//                                             ),
//                                             SizedBox(
//                                               width: 5.w,
//                                             ),
//                                             Text(
//                                               'Hotel',
//                                               style: TextStyle(
//                                                   fontFamily: 'Campton',
//                                                   color: Colors.black,
//                                                   letterSpacing: -1,
//                                                   fontSize: 19.sp,
//                                                   fontWeight: FontWeight.w700),
//                                             )
//                                           ],
//                                         ),
//                                       )),
//                           ),
//                           Container(
//                             padding: EdgeInsets.only(right: 8.w),
//                             child: Tab(
//                                 child: watch.selectedIndex == 1
//                                     ? Container(
//                                         height: 200,
//                                         // padding: EdgeInsets.only(left: 20.w),
//                                         decoration: BoxDecoration(
//                                             color: Colors.white,
//                                             gradient: watch.selectedIndex == 0
//                                                 ? LinearGradient(
//                                                     begin:
//                                                         const Alignment(0, 15),
//                                                     end: Alignment.topCenter,
//                                                     colors: [
//                                                       // Start with a transparent color at the bottom
//                                                       Colors.white
//                                                           .withOpacity(0.1),
//                                                       Colors
//                                                           .white, // Adjust the shadow intensity here
//                                                     ],
//                                                   )
//                                                 : null),
//                                         //
//                                         // borderRadius: BorderRadius.circular(10),
//                                         child: Row(
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.center,
//                                           children: [
//                                             SvgPicture.asset(
//                                               'assets/icons/new_flight2024.svg',
//                                               height: 14.h,
//                                               width: 21.w,
//                                             ),
//                                             SizedBox(
//                                               width: 5.w,
//                                             ),
//                                             Text(
//                                               'Flight',
//                                               style: TextStyle(
//                                                   fontFamily: 'Campton',
//                                                   color: Colors.black,
//                                                   letterSpacing: -1,
//                                                   fontSize: 19.sp,
//                                                   fontWeight: FontWeight.w700),
//                                             )
//                                           ],
//                                         ),
//                                       )
//                                     : Container(
//                                         height: 200,
//                                         decoration: BoxDecoration(
//                                             // color: Colors.black.withOpacity(0.),
//                                             gradient: LinearGradient(
//                                           begin: const Alignment(0, 15),
//                                           end: Alignment.topCenter,
//                                           colors: [
//                                             // Start with a transparent color at the bottom
//                                             Colors.black.withOpacity(0.2),
//                                             Colors
//                                                 .white, // Adjust the shadow intensity here
//                                           ],
//                                         )),
//                                         child: Row(
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.center,
//                                           children: [
//                                             SvgPicture.asset(
//                                               'assets/icons/new_flight2024.svg',
//                                               height: 14.h,
//                                               width: 21.w,
//                                             ),
//                                             SizedBox(
//                                               width: 5.w,
//                                             ),
//                                             Text(
//                                               'Flight',
//                                               style: TextStyle(
//                                                   fontFamily: 'Campton',
//                                                   color: Colors.black,
//                                                   letterSpacing: -1,
//                                                   fontSize: 19.sp,
//                                                   fontWeight: FontWeight.w700),
//                                             )
//                                           ],
//                                         ),
//                                       )),
//                           ),
//                           Tab(
//                               child: watch.selectedIndex == 2
//                                   ? Container(
//                                       height: 200,

//                                       decoration: BoxDecoration(
//                                           color: Colors.white,
//                                           gradient: watch.selectedIndex == 0
//                                               ? LinearGradient(
//                                                   begin: const Alignment(0, 15),
//                                                   end: Alignment.topCenter,
//                                                   colors: [
//                                                     // Start with a transparent color at the bottom
//                                                     Colors.white
//                                                         .withOpacity(0.1),
//                                                     Colors
//                                                         .white, // Adjust the shadow intensity here
//                                                   ],
//                                                 )
//                                               : null),
//                                       //
//                                       // borderRadius: BorderRadius.circular(10),
//                                       child: Row(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.center,
//                                         children: [
//                                           SvgPicture.asset(
//                                             'assets/icons/new_vehical.svg',
//                                             color: black,
//                                             height: 14.h,
//                                             width: 21.w,
//                                           ),
//                                           SizedBox(
//                                             width: 5.w,
//                                           ),
//                                           Text(
//                                             'Vehicle',
//                                             style: TextStyle(
//                                                 fontFamily: 'Campton',
//                                                 color: Colors.black,
//                                                 letterSpacing: -1,
//                                                 fontSize: 19.sp,
//                                                 fontWeight: FontWeight.w700),
//                                           )
//                                         ],
//                                       ),
//                                     )
//                                   : Container(
//                                       height: 200,
//                                       decoration: BoxDecoration(
//                                           // color: Colors.black.withOpacity(0.),
//                                           gradient: LinearGradient(
//                                         begin: const Alignment(0, 15),
//                                         end: Alignment.topCenter,
//                                         colors: [
//                                           // Start with a transparent color at the bottom
//                                           Colors.black.withOpacity(0.2),
//                                           Colors
//                                               .white, // Adjust the shadow intensity here
//                                         ],
//                                       )),
//                                       child: Row(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.center,
//                                         children: [
//                                           SvgPicture.asset(
//                                             'assets/icons/new_vehical.svg',
//                                             height: 14.h,
//                                             width: 21.w,
//                                           ),
//                                           SizedBox(
//                                             width: 5.w,
//                                           ),
//                                           Text(
//                                             'Vehicle',
//                                             style: TextStyle(
//                                                 fontFamily: 'Campton',
//                                                 color: Colors.black,
//                                                 letterSpacing: -1,
//                                                 fontSize: 19.sp,
//                                                 fontWeight: FontWeight.w700),
//                                           )
//                                         ],
//                                       ),
//                                     )),
//                         ],
//                         onTap: (index) {
//                           read.onTabClicked(index);
//                         },
//                       ),
//                       ListView(
//                         shrinkWrap: true,
//                         physics: const NeverScrollableScrollPhysics(),
//                         children: [
//                           IndexedStack(
//                             index: watch.selectedIndex,
//                             children: <Widget>[
//                               Visibility(
//                                 maintainState: true,
//                                 visible: watch.selectedIndex == 0,
//                                 child: const HotelSearchViewOne(),
//                               ),
//                               Visibility(
//                                 maintainState: true,
//                                 visible: watch.selectedIndex == 1,
//                                 child: const FlightSearchViewOne(),
//                               ),
//                               Visibility(
//                                 maintainState: true,
//                                 visible: watch.selectedIndex == 2,
//                                 child: const VehicalSearchViewOne(),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ],
//                   ))
//             ])));
//   }
// }
