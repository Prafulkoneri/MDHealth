// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/scheduler.dart';
// import 'package:md_health/Screens/reservation/controller/reservation_controller.dart';
// import 'package:md_health/Screens/reservation/view/hotel/hotel_active_view.dart';
// import 'package:md_health/Screens/reservation/view/ticket/ticket_active_view.dart';
// import 'package:md_health/Screens/reservation/view/vehicle/vehicle_active_view.dart';
// import 'package:provider/provider.dart';

// class AcitvePackageView extends StatefulWidget {
//   const AcitvePackageView({
//     super.key,
//   });

//   @override
//   State<AcitvePackageView> createState() => _AcitvePackageViewState();
// }

// class _AcitvePackageViewState extends State<AcitvePackageView> {
//   @override
//   void initState() {
//     super.initState();
//     SchedulerBinding.instance.addPostFrameCallback((_) {
//       context.read<ReservationController>().initState(context);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final read = context.read<ReservationController>();
//     final watch = context.watch<ReservationController>();

//     switch (watch.currentIndex) {
//       case 0:
//         return HotelActiveView(padh: read, dekh: watch);
//       case 1:
//         return VehicleActiveView(padh: read, dekh: watch);
//       case 2:
//         return TicketActiveView(padh: read, dekh: watch);
//       default:
//         return HotelActiveView(padh: read, dekh: watch);
//     }
//   }
// }
