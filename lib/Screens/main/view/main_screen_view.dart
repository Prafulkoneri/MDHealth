// import 'dart:ui';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:md_health/Screens/home/view/home_view.dart';
// import 'package:md_health/Screens/main/controller/main_screen_controller.dart';
// import 'package:md_health/constants/styles/colors.dart';
// import 'package:md_health/widget/custom_appbar.dart';
// import 'package:md_health/widget/drawer.dart';
// import 'package:provider/provider.dart';

// class MainScreenView extends StatefulWidget {
//   const MainScreenView({
//     Key? key,
//   }) : super(key: key);
//   @override
//   State<MainScreenView> createState() => _MainScreenViewState();
// }

// class _MainScreenViewState extends State<MainScreenView>
//     with TickerProviderStateMixin {
//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final read = context.read<MainScreenController>();
//     final watch = context.watch<MainScreenController>();

    // getAppBar() {
    //   switch (watch.currentTab) {
    //     case 0:
    //       return CustomAppBar(
    //         hasHiText: true,
    //       );
    //     case 1:
    //       return CustomAppBar(
    //         drawerTitle: 'Messages',
    //         hasMdTitle: false,
    //       );
    //     case 2:
    //       return CustomAppBar(
    //         drawerTitle: 'Purchased Items',
    //         hasMdTitle: false,
    //       );
    //     case 3:
    //       return CustomAppBar(
    //         hasHiText: true,
    //         hasMdTitle: false,
    //       );
    //     default:
    //       return CustomAppBar(
    //         hasHiText: true,
    //         hasMdTitle: false,
    //       );
    //   }
    // }

//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         extendBody: true,
//         appBar: getAppBar(),
//         drawer: AppDrawer(),
//         backgroundColor: Colors.black,
//         body: watch.currentScreen,
//         bottomNavigationBar: Container(
//           padding: const EdgeInsets.all(16),
//           child: ClipRRect(
//             borderRadius: const BorderRadius.all(Radius.circular(50)),
//             child: BackdropFilter(
//               filter: ImageFilter.blur(sigmaX: 100, sigmaY: 100),
//               child: Container(
//                 color: Colors.transparent,
//                 child: TabBar(
//                   labelColor: const Color(0xff4CDB06),
//                   padding: const EdgeInsets.only(bottom: 20, top: 20),
//                   indicator: const UnderlineTabIndicator(
//                       borderSide:
//                           BorderSide(color: Colors.transparent, width: 0.0)),
//                   tabs: <Widget>[
//                     GestureDetector(
//                       onTap: read.onHomeScreenPress,
//                       child: SvgPicture.asset(
//                         'assets/icons/Vector_1.svg',
//                         height: 23.h,
//                         colorFilter: watch.currentTab == 0
//                             ? const ColorFilter.mode(
//                                 kDefaultActiveColor, BlendMode.srcIn)
//                             : const ColorFilter.mode(
//                                 Colors.grey, BlendMode.srcIn),
//                       ),
//                     ),
//                     GestureDetector(
//                       onTap: read.onChartScreenPress,
//                       child: SvgPicture.asset(
//                         'assets/icons/Chart.svg',
//                         height: 23.h,
//                         colorFilter: watch.currentTab == 1
//                             ? const ColorFilter.mode(
//                                 kDefaultActiveColor, BlendMode.srcIn)
//                             : const ColorFilter.mode(
//                                 Colors.grey, BlendMode.srcIn),
//                       ),
//                     ),
//                     GestureDetector(
//                       onTap: read.onTicketScreenPress,
//                       child: SvgPicture.asset(
//                         'assets/icons/Ticket.svg',
//                         alignment: Alignment.bottomCenter,
//                         height: 18.h,
//                         colorFilter: watch.currentTab == 2
//                             ? const ColorFilter.mode(
//                                 kDefaultActiveColor, BlendMode.srcIn)
//                             : const ColorFilter.mode(
//                                 Colors.grey, BlendMode.srcIn),
//                       ),
//                     ),
//                     GestureDetector(
//                       onTap: read.onDiscoverScreenPress,
//                       child: SvgPicture.asset(
//                         'assets/icons/Discovery.svg',
//                         height: 23.h,
//                         colorFilter: watch.currentTab == 3
//                             ? const ColorFilter.mode(
//                                 kDefaultActiveColor, BlendMode.srcIn)
//                             : const ColorFilter.mode(
//                                 Colors.grey, BlendMode.srcIn),
//                       ),
//                     ),
//                   ],
//                   controller: TabController(vsync: this, length: 4),
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
