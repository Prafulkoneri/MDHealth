// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/scheduler.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:md_health/Screens/hotel/view/hotel_review.dart';
// import 'package:md_health/Screens/packages/controller/packages_view_controller.dart';
// import 'package:md_health/Screens/packages/view/review_view.dart';
// import 'package:md_health/Screens/reservation/controller/reservation_controller.dart';
// import 'package:md_health/Screens/reservation/view/hotel/hotel_cancelled_view.dart';
// import 'package:md_health/Screens/reservation/view/hotel/hotel_completed_view.dart';
// import 'package:md_health/Screens/reservation/view/review_view.dart';
// import 'package:md_health/Screens/reservation/view/ticket/ticket_completed_view.dart';
// import 'package:md_health/Screens/reservation/view/vehicle/vehicle_completed_view.dart';
// import 'package:md_health/constants/styles/colors.dart';
// import 'package:md_health/widget/buttons.dart';
// import 'package:md_health/widget/drop_down.dart';
// import 'package:md_health/widget/rating.dart';
// import 'package:provider/provider.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class CompletedPackageView extends StatefulWidget {
//   const CompletedPackageView({
//     super.key,
//   });

//   @override
//   State<CompletedPackageView> createState() => _CompletedPackageViewState();
// }

// class _CompletedPackageViewState extends State<CompletedPackageView> {

//   @override
//   void initState() {
//     super.initState();
//     SchedulerBinding.instance.addPostFrameCallback((_) {
//       context.read<ReservationController>().initState(context);
//     });
//   }
  
//   @override
//   Widget build(BuildContext context) {
//     final read = context.read<PackageViewController>();
//     final watch = context.watch<ReservationController>();

//     switch(watch.currentIndex){
//       case 0:
//         return HotelCompletedView();
//       case 1:
//         return VehicleCompletedView();
//       case 2:
//         return TicketCompletedView();
//       default :
//         return HotelCompletedView();
//     }
//   }
// }
