// import 'package:flutter/material.dart';
// import 'package:flutter/scheduler.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:md_health/Screens/reservation/controller/reservation_controller.dart';
// import 'package:md_health/Screens/reservation/view/active_packages_view.dart';
// import 'package:md_health/Screens/reservation/view/cancel_packages_view.dart';
// import 'package:md_health/Screens/reservation/view/completed_packages_view.dart';
// import 'package:md_health/constants/styles/colors.dart';
// import 'package:md_health/widget/base_screen.dart';
// import 'package:md_health/widget/custom_appbar.dart';
// import 'package:provider/provider.dart';

// class ReservationView extends StatefulWidget {
//   const ReservationView({super.key});

//   @override
//   State<ReservationView> createState() => _ReservationViewState();
// }

// class _ReservationViewState extends State<ReservationView>
//     with TickerProviderStateMixin {
//   @override
//   void initState() {
//     super.initState();
//     SchedulerBinding.instance.addPostFrameCallback((_) {
//       context.read<ReservationController>().initState(context);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final dekh = context.watch<ReservationController>();

//     return BaseScreen(
//         onWillPop: () async {
//           // Navigator.pushReplacement(
//           //   context,
//           //   SlidePageRoute(
//           //     page: SearchDetailsView(
//           //       packageId: widget.packageId,

//           //       // packageId: watch.packageId,
//           //     ),
//           //     direction: SlideDirection.left, // Specify the slide direction here
//           //     delay: Duration(milliseconds: 5000),
//           //   ),
//           //   // MaterialPageRoute(
//           //   //     builder: (context) => SearchDetailsView(
//           //   //           packageId: watch.packageId,
//           //   //         ))
//           // );
//           Navigator.pop(context);

//           return false;
//         },
//         appBar: CustomAppBar(
//           hasMdTitle: false,
//           drawerTitle: 'Reservations',
//         ),
//         backgroundColor: Color(0xffF5F5F5),
//         content: Container(
//           // color: Colors.pink,
//           padding: EdgeInsets.only(top: 25.w),
//           child: Column(
//             children: [
//               Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 10.0.w),
//                 child: TabBar(
//                     physics: const BouncingScrollPhysics(),
//                     labelPadding: EdgeInsets.symmetric(horizontal: 5.w),
//                     indicator: const UnderlineTabIndicator(
//                         borderSide: BorderSide(color: Colors.transparent)),
//                     onTap: (index) {
//                       dekh.setCurrentIndex(index);
//                     },
//                     controller: TabController(vsync: this, length: 3),
//                     tabs: [
//                       Container(
//                         height: 40.h,
//                         width: 130.w,
//                         alignment: Alignment.center,
//                         decoration: dekh.currentIndex == 0
//                             ? const BoxDecoration(
//                                 borderRadius:
//                                     BorderRadius.all(Radius.circular(30)),
//                                 color: kDefaultActiveColor,
//                               )
//                             : BoxDecoration(
//                                 borderRadius:
//                                     const BorderRadius.all(Radius.circular(30)),
//                                 border: Border.all(
//                                     color: Colors.black, width: 1.w)),
//                         child: Text(
//                           'Hotel',
//                           style: TextStyle(
//                               fontFamily: 'Campton',
//                               fontWeight: FontWeight.w600,
//                               fontSize: 16.sp,
//                               color: Colors.black),
//                         ),
//                       ),
//                       Container(
//                         height: 40.h,
//                         width: 130.w,
//                         alignment: Alignment.center,
//                         decoration: dekh.currentIndex == 1
//                             ? const BoxDecoration(
//                                 borderRadius:
//                                     BorderRadius.all(Radius.circular(30)),
//                                 color: kDefaultActiveColor,
//                               )
//                             : BoxDecoration(
//                                 borderRadius:
//                                     const BorderRadius.all(Radius.circular(30)),
//                                 border: Border.all(
//                                     color: Colors.black, width: 1.w)),
//                         child: Text(
//                           'Vehicle',
//                           style: TextStyle(
//                               fontFamily: 'Campton',
//                               fontWeight: FontWeight.w600,
//                               fontSize: 16.sp,
//                               color: Colors.black),
//                         ),
//                       ),
//                       Container(
//                         height: 40.h,
//                         width: 130.w,
//                         alignment: Alignment.center,
//                         decoration: dekh.currentIndex == 2
//                             ? const BoxDecoration(
//                                 borderRadius:
//                                     BorderRadius.all(Radius.circular(30)),
//                                 color: kDefaultActiveColor,
//                               )
//                             : BoxDecoration(
//                                 borderRadius:
//                                     const BorderRadius.all(Radius.circular(30)),
//                                 border: Border.all(
//                                     color: Colors.black, width: 1.w)),
//                         child: Text(
//                           'Ticket’s',
//                           style: TextStyle(
//                               fontFamily: 'Campton',
//                               fontWeight: FontWeight.w600,
//                               fontSize: 16.sp,
//                               color: Colors.black),
//                         ),
//                       ),
//                     ]),
//               ),
//               Padding(
//                 padding: EdgeInsets.symmetric(vertical: 20.w),
//                 child: Container(
//                   height: 1.h,
//                   color: kDefaultActiveColor,
//                   margin: EdgeInsets.symmetric(horizontal: 15.w),
//                 ),
//               ),
//               TabBar(
//                   padding: EdgeInsets.only(top: 10.w, bottom: 10.w),
//                   physics: const BouncingScrollPhysics(),
//                   indicator: const UnderlineTabIndicator(
//                       borderSide: BorderSide(color: Colors.transparent)),
//                   onTap: (index) {
//                     dekh.setChildIndex(index);
//                   },
//                   controller: TabController(vsync: this, length: 3),
//                   tabs: [
//                     Container(
//                       padding:
//                           EdgeInsets.only(bottom: 8.w, right: 10.w, left: 10.w),
//                       decoration: dekh.childIndex == 0
//                           ? BoxDecoration(
//                               border: Border(
//                                   bottom: BorderSide(
//                                       color: kDefaultActiveColor, width: 4.w)),
//                             )
//                           : null,
//                       child: Text(
//                         'Active',
//                         style: TextStyle(
//                             fontFamily: 'Campton',
//                             fontWeight: dekh.childIndex == 0
//                                 ? FontWeight.w600
//                                 : FontWeight.w400,
//                             fontSize: 16.sp,
//                             color: Colors.black),
//                       ),
//                     ),
//                     Container(
//                       padding:
//                           EdgeInsets.only(bottom: 8.w, right: 8.w, left: 8.w),
//                       decoration: dekh.childIndex == 1
//                           ? BoxDecoration(
//                               border: Border(
//                                   bottom: BorderSide(
//                                       color: kDefaultActiveColor, width: 5.w)),
//                             )
//                           : null,
//                       child: Text(
//                         'Completed',
//                         style: TextStyle(
//                             fontFamily: 'Campton',
//                             fontWeight: dekh.childIndex == 1
//                                 ? FontWeight.w600
//                                 : FontWeight.w400,
//                             fontSize: 15.sp,
//                             color: Colors.black),
//                       ),
//                     ),
//                     Container(
//                       padding:
//                           EdgeInsets.only(bottom: 8.w, right: 8.w, left: 8.w),
//                       decoration: dekh.childIndex == 2
//                           ? BoxDecoration(
//                               border: Border(
//                                   bottom: BorderSide(
//                                       color: kDefaultActiveColor, width: 5.w)),
//                             )
//                           : null,
//                       child: Text(
//                         'Cancelled',
//                         style: TextStyle(
//                             fontFamily: 'Campton',
//                             fontWeight: dekh.childIndex == 2
//                                 ? FontWeight.w600
//                                 : FontWeight.w400,
//                             fontSize: 16.sp,
//                             color: Colors.black),
//                       ),
//                     ),
//                   ]),
//               ListView(
//                 shrinkWrap: true,
//                 physics: const BouncingScrollPhysics(),
//                 children: [
//                   IndexedStack(
//                     index: dekh.childIndex,
//                     children: <Widget>[
//                       Visibility(
//                         maintainState: true,
//                         visible: dekh.childIndex == 0,
//                         child: const AcitvePackageView(),
//                       ),
//                       Visibility(
//                         maintainState: true,
//                         visible: dekh.childIndex == 1,
//                         child: const CompletedPackageView(),
//                       ),
//                       Visibility(
//                         maintainState: true,
//                         visible: dekh.childIndex == 2,
//                         child: const CancelPackageView(),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ));
//   }
// }
