// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/scheduler.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:md_health/Screens/packages/controller/packages_view_controller.dart';
// import 'package:md_health/Screens/reservation/controller/reservation_controller.dart';
// import 'package:md_health/Screens/reservation/view/hotel/hotel_cancelled_view.dart';
// import 'package:md_health/Screens/reservation/view/ticket/ticket_cancelled_view.dart';
// import 'package:md_health/Screens/reservation/view/vehicle/vehicle_cancelled_view.dart';
// import 'package:md_health/constants/styles/colors.dart';
// import 'package:md_health/widget/buttons.dart';
// import 'package:md_health/widget/drop_down.dart';
// import 'package:provider/provider.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class CancelPackageView extends StatefulWidget {
//   final String? PackageId;
//   const CancelPackageView({super.key, this.PackageId});

//   @override
//   State<CancelPackageView> createState() => _CancelPackageViewState();
// }

// class _CancelPackageViewState extends State<CancelPackageView> {
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

//     switch (watch.currentIndex) {
//       case 0:
//         return HotelCancelledView();
//       case 1:
//         return VehicleCancelledView();
//       case 2:
//         return TicketCancelledView();
//       default:
//         return HotelCancelledView();
//     }
//   }
// }
