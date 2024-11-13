// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:md_health/Screens/MdBooking/empty/flight_search_view.dart';
// import 'package:md_health/Screens/MdBooking/empty/hotel_search_view.dart';
// import 'package:md_health/Screens/MdBooking/empty/vehical_search_view.dart';
// import 'package:md_health/Screens/packages/controller/packages_view_controller.dart';
// import 'package:md_health/widget/base_screen.dart';
// import 'package:md_health/widget/custom_appbar.dart';
// import 'package:md_health/widget/custome_indicator.dart';
// import 'package:md_health/widget/profile_app_bar.dart';
// import 'package:provider/provider.dart';

// class SearchFlightView extends StatefulWidget {
//   const SearchFlightView({super.key});

//   @override
//   State<SearchFlightView> createState() => _SearchFlightViewState();
// }

// class _SearchFlightViewState extends State<SearchFlightView> {
//   @override
//   Widget build(BuildContext context) {
//     final read = context.read<PackageViewController>();
//     final watch = context.watch<PackageViewController>();
//     return DefaultTabController(
//       length: 3,
//       initialIndex: 0,
//       child: BaseScreen(
//         onWillPop: () async {
//           // Navigator.pushReplacement(
//           //   context,
//           //   SlidePageRoute(
//           //     page: PackageDetailView(
//           //       type: widget.type,
//           //       purchesId: watch.purchesId,
//           //       packageId: watch.packageId,
//           //     ),
//           //     direction: SlideDirection.left, // Specify the slide direction here
//           //     delay: Duration(milliseconds: 5000),
//           //   ),
//           // );

//           return false;
//         },
//         hasScrollView: true,
//         backgroundColor: Color(0xffF5F5F5),
//         appBar: PreferredSize(
//           preferredSize: Size.fromHeight(130),
//           child: CustomAppBar(
//             mdTitle: "booking",
//             //  isMdBookingAppBar: true,
//             hasHiText: true,
//             // hasBackButton: ,
//             hasMdTitle: true,
//             // drawerTitle: "Orders",
//           ),
//         ),
//         content: Column(
//           children: [
//             TabBar(
//               isScrollable: false,
//               splashBorderRadius: BorderRadius.circular(10),
//               indicator:
//                   CustomIndicator(color: Colors.transparent, radius: 0.w),
//               padding: EdgeInsets.only(top: 20.w, right: 20.w),
//               labelPadding: EdgeInsets.only(bottom: 0.w),
//               tabs: <Widget>[
//                 Container(
//                   padding: EdgeInsets.only(left: 10.w, right: 8.w),
//                   child: Tab(
//                       child: watch.selectedIndex == 0
//                           ? Container(
//                               height: 200,
//                               // padding: EdgeInsets.only(left: 20.w),
//                               decoration: BoxDecoration(
//                                   color: Colors.white,
//                                   gradient: watch.selectedIndex == 0
//                                       ? LinearGradient(
//                                           begin: const Alignment(0, 15),
//                                           end: Alignment.topCenter,
//                                           colors: [
//                                             // Start with a transparent color at the bottom
//                                             Colors.white.withOpacity(0.1),
//                                             Colors
//                                                 .white, // Adjust the shadow intensity here
//                                           ],
//                                         )
//                                       : null),
//                               //
//                               // borderRadius: BorderRadius.circular(10),
//                               child: Row(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   SvgPicture.asset(
//                                     'assets/icons/Vector_14.svg',
//                                     height: 14.h,
//                                     width: 21.w,
//                                   ),
//                                   SizedBox(
//                                     width: 5.w,
//                                   ),
//                                   Text(
//                                     'Hotel',
//                                     style: TextStyle(
//                                         fontFamily: 'Campton',
//                                         color: Colors.black,
//                                         letterSpacing: -1,
//                                         fontSize: 19.sp,
//                                         fontWeight: FontWeight.w700),
//                                   )
//                                 ],
//                               ),
//                             )
//                           : Container(
//                               height: 200.h,
//                               decoration: BoxDecoration(
//                                   // color: Colors.black.withOpacity(0.),
//                                   gradient: LinearGradient(
//                                 begin: const Alignment(0, 15),
//                                 end: Alignment.topCenter,
//                                 colors: [
//                                   // Start with a transparent color at the bottom
//                                   Colors.black.withOpacity(0.2),
//                                   Colors
//                                       .white, // Adjust the shadow intensity here
//                                 ],
//                               )),
//                               child: Row(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   SvgPicture.asset(
//                                     'assets/icons/Vector_14.svg',
//                                     height: 14.h,
//                                     width: 21.w,
//                                   ),
//                                   SizedBox(
//                                     width: 5.w,
//                                   ),
//                                   Text(
//                                     'Hotel',
//                                     style: TextStyle(
//                                         fontFamily: 'Campton',
//                                         color: Colors.black,
//                                         letterSpacing: -1,
//                                         fontSize: 19.sp,
//                                         fontWeight: FontWeight.w700),
//                                   )
//                                 ],
//                               ),
//                             )),
//                 ),
//                 Container(
//                   padding: EdgeInsets.only(right: 8.w),
//                   child: Tab(
//                       child: watch.selectedIndex == 1
//                           ? Container(
//                               height: 200,
//                               // padding: EdgeInsets.only(left: 20.w),
//                               decoration: BoxDecoration(
//                                   color: Colors.white,
//                                   gradient: watch.selectedIndex == 0
//                                       ? LinearGradient(
//                                           begin: const Alignment(0, 15),
//                                           end: Alignment.topCenter,
//                                           colors: [
//                                             // Start with a transparent color at the bottom
//                                             Colors.white.withOpacity(0.1),
//                                             Colors
//                                                 .white, // Adjust the shadow intensity here
//                                           ],
//                                         )
//                                       : null),
//                               //
//                               // borderRadius: BorderRadius.circular(10),
//                               child: Row(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   SvgPicture.asset(
//                                     'assets/icons/Vector (2).svg',
//                                     height: 14.h,
//                                     width: 21.w,
//                                   ),
//                                   SizedBox(
//                                     width: 5.w,
//                                   ),
//                                   Text(
//                                     'Flight',
//                                     style: TextStyle(
//                                         fontFamily: 'Campton',
//                                         color: Colors.black,
//                                         letterSpacing: -1,
//                                         fontSize: 19.sp,
//                                         fontWeight: FontWeight.w700),
//                                   )
//                                 ],
//                               ),
//                             )
//                           : Container(
//                               height: 200,
//                               decoration: BoxDecoration(
//                                   // color: Colors.black.withOpacity(0.),
//                                   gradient: LinearGradient(
//                                 begin: const Alignment(0, 15),
//                                 end: Alignment.topCenter,
//                                 colors: [
//                                   // Start with a transparent color at the bottom
//                                   Colors.black.withOpacity(0.2),
//                                   Colors
//                                       .white, // Adjust the shadow intensity here
//                                 ],
//                               )),
//                               child: Row(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   SvgPicture.asset(
//                                     'assets/icons/Vector (2).svg',
//                                     height: 14.h,
//                                     width: 21.w,
//                                   ),
//                                   SizedBox(
//                                     width: 5.w,
//                                   ),
//                                   Text(
//                                     'Flight',
//                                     style: TextStyle(
//                                         fontFamily: 'Campton',
//                                         color: Colors.black,
//                                         letterSpacing: -1,
//                                         fontSize: 19.sp,
//                                         fontWeight: FontWeight.w700),
//                                   )
//                                 ],
//                               ),
//                             )),
//                 ),
//                 Tab(
//                     child: watch.selectedIndex == 2
//                         ? Container(
//                             height: 200,

//                             decoration: BoxDecoration(
//                                 color: Colors.white,
//                                 gradient: watch.selectedIndex == 0
//                                     ? LinearGradient(
//                                         begin: const Alignment(0, 15),
//                                         end: Alignment.topCenter,
//                                         colors: [
//                                           // Start with a transparent color at the bottom
//                                           Colors.white.withOpacity(0.1),
//                                           Colors
//                                               .white, // Adjust the shadow intensity here
//                                         ],
//                                       )
//                                     : null),
//                             //
//                             // borderRadius: BorderRadius.circular(10),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 SvgPicture.asset(
//                                   'assets/icons/Vector (3).svg',
//                                   height: 14.h,
//                                   width: 21.w,
//                                 ),
//                                 SizedBox(
//                                   width: 5.w,
//                                 ),
//                                 Text(
//                                   'Vehicle',
//                                   style: TextStyle(
//                                       fontFamily: 'Campton',
//                                       color: Colors.black,
//                                       letterSpacing: -1,
//                                       fontSize: 19.sp,
//                                       fontWeight: FontWeight.w700),
//                                 )
//                               ],
//                             ),
//                           )
//                         : Container(
//                             height: 200,
//                             decoration: BoxDecoration(
//                                 // color: Colors.black.withOpacity(0.),
//                                 gradient: LinearGradient(
//                               begin: const Alignment(0, 15),
//                               end: Alignment.topCenter,
//                               colors: [
//                                 // Start with a transparent color at the bottom
//                                 Colors.black.withOpacity(0.2),
//                                 Colors
//                                     .white, // Adjust the shadow intensity here
//                               ],
//                             )),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 SvgPicture.asset(
//                                   'assets/icons/Vector (3).svg',
//                                   height: 14.h,
//                                   width: 21.w,
//                                 ),
//                                 SizedBox(
//                                   width: 5.w,
//                                 ),
//                                 Text(
//                                   'Vehicle',
//                                   style: TextStyle(
//                                       fontFamily: 'Campton',
//                                       color: Colors.black,
//                                       letterSpacing: -1,
//                                       fontSize: 19.sp,
//                                       fontWeight: FontWeight.w700),
//                                 )
//                               ],
//                             ),
//                           )),
//               ],
//               onTap: (index) {
//                 read.onTabClicked(index);
//               },
//             ),
//             ListView(
//               shrinkWrap: true,
//               physics: const NeverScrollableScrollPhysics(),
//               children: [
//                 IndexedStack(
//                   index: watch.selectedIndex,
//                   children: <Widget>[
//                     Visibility(
//                       maintainState: true,
//                       visible: watch.selectedIndex == 0,
//                       child: const HotelSearchView(),
//                     ),
//                     Visibility(
//                       maintainState: true,
//                       visible: watch.selectedIndex == 1,
//                       child: const FlightSearchView(),
//                     ),
//                     Visibility(
//                       maintainState: true,
//                       visible: watch.selectedIndex == 2,
//                       child: const VehicalSearchView(),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
