import 'package:flutter/material.dart';
import 'package:md_health/Screens/favourt/view/health_favt_pa_list_details.dart';
import 'package:md_health/Screens/main/controller/main_screen_controller.dart';
import 'package:md_health/constants/styles/colors.dart';
import 'package:md_health/test_widget.dart';
import 'package:md_health/widget/custom_appbar.dart';
import 'package:md_health/widget/custom_bottom_nav_bar.dart';
import 'package:md_health/widget/drawer.dart';
import 'package:provider/provider.dart';

class BaseScreen extends StatefulWidget {
  final Widget content;
  final int? currentTab;
  final Color? backgroundColor;
  final PreferredSizeWidget? appBar;
  final bool hasBouncingScrollPhysics;
  final ScrollPhysics? physics;
  final bool hasScrollView;
  final bool hasBottomNavBar;
  final Future<bool> Function()? onWillPop;
  // final Function(int) onTabPress;

  const BaseScreen({
    Key? key,
    this.currentTab,
    required this.content,
    this.backgroundColor,
    this.appBar,
    this.hasBouncingScrollPhysics = true,
    this.hasScrollView = true,
    this.hasBottomNavBar = true,
    this.physics,
    this.onWillPop,
    // required this.onTabPress,
  }) : super(key: key);

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: widget.onWillPop,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          extendBody: true,
          backgroundColor: widget.backgroundColor ?? Colors.black,
          appBar: widget.appBar ?? CustomAppBar(),
          drawer: AppDrawer(),
          body: widget.hasScrollView
              ? SingleChildScrollView(
                  physics: widget.hasBouncingScrollPhysics
                      ? widget.physics ?? BouncingScrollPhysics()
                      : null,
                  child: widget.content)
              : widget.content,
          bottomNavigationBar:
              widget.hasBottomNavBar ? CustomBottomNavBar() : null,
        ),
      ),
    );
  }
}

// class BaseScreen extends StatefulWidget {
//   final Widget content;
//   final int? currentTab;
//   final Color? backgroundColor;
//   final PreferredSizeWidget? appBar;
//   final bool hasBouncingScrollPhysics;
//   final ScrollPhysics? physics;
//   final bool hasScrollView;
//   final bool hasBottomNavBar;
//   final Future<bool> Function()? onWillPop;

//   const BaseScreen({
//     Key? key,
//     this.currentTab,
//     required this.content,
//     this.backgroundColor,
//     this.appBar,
//     this.hasBouncingScrollPhysics = true,
//     this.hasScrollView = true,
//     this.hasBottomNavBar = true,
//     this.physics,
//     this.onWillPop,
//   }) : super(key: key);

//   @override
//   State<BaseScreen> createState() => _BaseScreenState();
// }

// class _BaseScreenState extends State<BaseScreen> with TickerProviderStateMixin {
//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//       onWillPop: widget.onWillPop ??
//           () async {
//             // Default action if onWillPop is not provided
//             return handleBackPress(context);
//           },
//       child: Scaffold(
//         extendBody: true,
//         backgroundColor: widget.backgroundColor ?? Colors.black,
//         appBar: widget.appBar ?? CustomAppBar(),
//         drawer: AppDrawer(),
//         body: widget.hasScrollView
//             ? SingleChildScrollView(
//                 physics: widget.hasBouncingScrollPhysics
//                     ? widget.physics ?? const BouncingScrollPhysics()
//                     : widget.physics,
//                 child: widget.content,
//               )
//             : widget.content,
//         bottomNavigationBar:
//             widget.hasBottomNavBar ? CustomBottomNavBar() : null,
//       ),
//     );
//   }

//   // A separate method to handle back press
//   Future<bool> handleBackPress(BuildContext context) async {
//     if (Navigator.of(context).canPop()) {
//       Navigator.of(context).pop();
//     } else {
//       // Prevent app from closing if it’s the last screen in the stack
//       return Future.value(false);
//     }
//     return Future.value(false); // Ensures default back action is prevented
//   }
// }

// // import 'dart:ui';
// // import 'package:flutter/material.dart';
// // import 'package:flutter_svg/flutter_svg.dart';
// // import 'package:md_health/Screens/favourt/view/health_favt_pa_list_details.dart';
// // import 'package:md_health/Screens/main/controller/main_screen_controller.dart';
// // import 'package:md_health/Screens/health/search/view/search_view.dart';

// // import 'package:md_health/constants/styles/colors.dart';
// // import 'package:md_health/test_widget.dart';
// // import 'package:md_health/widget/custom_appbar.dart';
// // import 'package:md_health/widget/custom_bottom_nav_bar.dart';
// // import 'package:md_health/widget/drawer.dart';
// // import 'package:provider/provider.dart';

// // class BaseScreen extends StatefulWidget {
// //   final Widget content;
// //   final int? currentTab;
// //   final Color? backgroundColor;
// //   final PreferredSizeWidget? appBar;
// //   final bool hasBouncingScrollPhysics;
// //   final ScrollPhysics? physics;
// //   final bool hasScrollView;
// //   final bool hasBottomNavBar;
// //   final Future<bool> Function()? onWillpop;
// //   final bool? hasPopScope;
// //   // final Function(int) onTabPress;

// //   const BaseScreen({
// //     super.key,
// //     this.currentTab,
// //     required this.content,
// //     this.backgroundColor,
// //     this.appBar,
// //     this.hasBouncingScrollPhysics = true,
// //     this.hasScrollView = true,
// //     this.hasBottomNavBar = true,
// //     this.physics,
// //     this.onWillpop,
// //     this.hasPopScope,
// //     // required this.onTabPress,
// //   });

// //   @override
// //   State<BaseScreen> createState() => _BaseScreenState();
// // }

// // class _BaseScreenState extends State<BaseScreen> with TickerProviderStateMixin {
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       debugShowCheckedModeBanner: false,
// //       home: Scaffold(
// //         extendBody: true,
// //         backgroundColor: widget.backgroundColor ?? Colors.black,
// //         appBar: widget.appBar ?? CustomAppBar(),
// //         drawer: AppDrawer(),
// //         body: WillPopScope(
// //           // onWillPop: widget.onWillpop,
// //           onWillPop: () async {
// //             print("hufdsghuydsfgyudfsguyd");
//             // Navigator.push(
//             //   context,
//             //   SlidePageRoute(
//             //     page: FaviListDetailoView(
//             //       packageId: "watch.packageId.toString()",
//             //       // refresh: true,
//             //     ),
//             //     direction:
//             //         SlideDirection.left, // Specify the slide direction here
//             //     delay: const Duration(milliseconds: 5000),
//             //   ),
//             // );
// //             return false;
// //           },
// //           child: widget.hasScrollView
// //               ? SingleChildScrollView(
// //                   physics: widget.hasBouncingScrollPhysics
// //                       ? widget.physics ?? BouncingScrollPhysics()
// //                       : null,
// //                   child: widget.content)
// //               : widget.content,
// //                bottomNavigationBar:
// //             widget.hasBottomNavBar ? CustomBottomNavBar() : null,
// //         ),
// //         //     : widget.hasScrollView
// //         //         ? SingleChildScrollView(
// //         //             physics: widget.hasBouncingScrollPhysics
// //         //                 ? widget.physics ?? BouncingScrollPhysics()
// //         //                 : null,
// //         //             child: widget.content)
// //         //         : widget.content,
// //       ),
// //     );
// //   }
// // }
//////////////////////////////////9/11/2024////////////
// import 'package:flutter/material.dart';
// import 'package:md_health/Screens/favourt/view/health_favt_pa_list_details.dart';
// import 'package:md_health/Screens/main/controller/main_screen_controller.dart';
// import 'package:md_health/constants/styles/colors.dart';
// import 'package:md_health/test_widget.dart';
// import 'package:md_health/widget/custom_appbar.dart';
// import 'package:md_health/widget/custom_bottom_nav_bar.dart';
// import 'package:md_health/widget/drawer.dart';
// import 'package:provider/provider.dart';

// class BaseScreen extends StatefulWidget {
//   final Widget content;
//   final int? currentTab;
//   final Color? backgroundColor;
//   final PreferredSizeWidget? appBar;
//   final bool hasBouncingScrollPhysics;
//   final ScrollPhysics? physics;
//   final bool hasScrollView;
//   final bool hasBottomNavBar;
//   final Future<bool> Function()? onWillPop;

//   const BaseScreen({
//     Key? key,
//     this.currentTab,
//     required this.content,
//     this.backgroundColor,
//     this.appBar,
//     this.hasBouncingScrollPhysics = true,
//     this.hasScrollView = true,
//     this.hasBottomNavBar = true,
//     this.physics,
//     this.onWillPop,
//   }) : super(key: key);

//   @override
//   State<BaseScreen> createState() => _BaseScreenState();
// }

// class _BaseScreenState extends State<BaseScreen> with TickerProviderStateMixin {
//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//       onWillPop: widget.onWillPop ??
//           () async {
//             // Default action if onWillPop is not provided
//             return handleBackPress(context);
//           },
//       child: Scaffold(
//         extendBody: true,
//         backgroundColor: widget.backgroundColor ?? Colors.black,
//         appBar: widget.appBar ?? CustomAppBar(),
//         drawer: AppDrawer(),
//         body: widget.hasScrollView
//             ? SingleChildScrollView(
//                 physics: widget.hasBouncingScrollPhysics
//                     ? widget.physics ?? const BouncingScrollPhysics()
//                     : widget.physics,
//                 child: widget.content,
//               )
//             : widget.content,
//         bottomNavigationBar:
//             widget.hasBottomNavBar ? CustomBottomNavBar() : null,
//       ),
//     );
//   }

//   // A separate method to handle back press
//   Future<bool> handleBackPress(BuildContext context) async {
//     if (Navigator.of(context).canPop()) {
//       Navigator.of(context).pop();
//     } else {
//       // Prevent app from closing if it’s the last screen in the stack
//       return Future.value(false);
//     }
//     return Future.value(false); // Ensures default back action is prevented
//   }
// }



// import 'dart:ui';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:md_health/Screens/favourt/view/health_favt_pa_list_details.dart';
// import 'package:md_health/Screens/main/controller/main_screen_controller.dart';
// import 'package:md_health/Screens/health/search/view/search_view.dart';

// import 'package:md_health/constants/styles/colors.dart';
// import 'package:md_health/test_widget.dart';
// import 'package:md_health/widget/custom_appbar.dart';
// import 'package:md_health/widget/custom_bottom_nav_bar.dart';
// import 'package:md_health/widget/drawer.dart';
// import 'package:provider/provider.dart';

// class BaseScreen extends StatefulWidget {
//   final Widget content;
//   final int? currentTab;
//   final Color? backgroundColor;
//   final PreferredSizeWidget? appBar;
//   final bool hasBouncingScrollPhysics;
//   final ScrollPhysics? physics;
//   final bool hasScrollView;
//   final bool hasBottomNavBar;
//   final Future<bool> Function()? onWillpop;
//   final bool? hasPopScope;
//   // final Function(int) onTabPress;

//   const BaseScreen({
//     super.key,
//     this.currentTab,
//     required this.content,
//     this.backgroundColor,
//     this.appBar,
//     this.hasBouncingScrollPhysics = true,
//     this.hasScrollView = true,
//     this.hasBottomNavBar = true,
//     this.physics,
//     this.onWillpop,
//     this.hasPopScope,
//     // required this.onTabPress,
//   });

//   @override
//   State<BaseScreen> createState() => _BaseScreenState();
// }

// class _BaseScreenState extends State<BaseScreen> with TickerProviderStateMixin {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         extendBody: true,
//         backgroundColor: widget.backgroundColor ?? Colors.black,
//         appBar: widget.appBar ?? CustomAppBar(),
//         drawer: AppDrawer(),
//         body: WillPopScope(
//           // onWillPop: widget.onWillpop,
//           onWillPop: () async {
//             print("hufdsghuydsfgyudfsguyd");
            // Navigator.push(
            //   context,
            //   SlidePageRoute(
            //     page: FaviListDetailoView(
            //       packageId: "watch.packageId.toString()",
            //       // refresh: true,
            //     ),
            //     direction:
            //         SlideDirection.left, // Specify the slide direction here
            //     delay: const Duration(milliseconds: 5000),
            //   ),
            // );
//             return false;
//           },
//           child: widget.hasScrollView
//               ? SingleChildScrollView(
//                   physics: widget.hasBouncingScrollPhysics
//                       ? widget.physics ?? BouncingScrollPhysics()
//                       : null,
//                   child: widget.content)
//               : widget.content,
//                bottomNavigationBar:
//             widget.hasBottomNavBar ? CustomBottomNavBar() : null,
//         ),
//         //     : widget.hasScrollView
//         //         ? SingleChildScrollView(
//         //             physics: widget.hasBouncingScrollPhysics
//         //                 ? widget.physics ?? BouncingScrollPhysics()
//         //                 : null,
//         //             child: widget.content)
//         //         : widget.content,
//       ),
//     );
//   }
// }
