// import 'package:flutter/material.dart';
// import 'package:md_health/Screens/bottom_message/bottom_message_view.dart';
// import 'package:md_health/Screens/chart/view/chart_view.dart';
// import 'package:md_health/Screens/discover/view/discover_view.dart';
// import 'package:md_health/Screens/purches_items/view/purches_item_view.dart';
// import 'package:md_health/Screens/tickets/view/ticket_view.dart';
// import 'package:md_health/Screens/home/view/home_view.dart';

// class MainScreenController extends ChangeNotifier {
//   Widget currentScreen = HomeView();
//   int currentIndex = 0;
//   int currentTab = 0;

//   void initState(context, index, currentScreen) async {
//     notifyListeners();
//   }

//   onHomeScreenPress() {
//     currentTab = 0;
//     currentScreen = HomeView();
//     debugPrint('<<<<<<<<<<Home>>>>>>>>>');
//     notifyListeners();
//   }

//   void setCurrentScreen(int index) {
//     switch (index) {
//       case 0:
//         {
//           currentScreen = HomeView();
//           currentTab = 0;
//           break;
//         }
//       case 1:
//         {
//           currentScreen = MessageListViewBottom();
//           currentTab = 1;
//           break;
//         }
//       case 2:
//         {
//           currentScreen = PurchesItemView();
//           currentTab = 2;
//           break;
//         }
//       case 3:
//         {
//           currentScreen = DiscoverView();
//           currentTab = 3;
//           break;
//         }
//     }
//   }

//   onChartScreenPress() {
//     currentTab = 1;
//     currentScreen = MessageListViewBottom();
//     debugPrint('<<<<<<<<<<Chart>>>>>>>>>');
//     notifyListeners();
//   }

//   onTicketScreenPress() {
//     currentTab = 2;
//     currentScreen = PurchesItemView();
//     debugPrint('<<<<<<<<<<Ticket>>>>>>>>>');
//     notifyListeners();
//   }

//   onDiscoverScreenPress() {
//     currentTab = 3;
//     currentScreen = DiscoverView();
//     debugPrint('<<<<<<<<<<Discover>>>>>>>>>');
//     notifyListeners();
//   }
// }
