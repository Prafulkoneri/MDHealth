import 'dart:async';

import 'package:flutter/material.dart';
import 'package:md_health/Screens/bottom_message/bottom_message_view.dart';
import 'package:md_health/Screens/food/discover/view/discover_view.dart';
import 'package:md_health/Screens/health/home/view/home_view.dart';
import 'package:md_health/Screens/purches_items/view/purches_item_view.dart';

class NewMainScreenController extends ChangeNotifier {
  int currentIndex = 0;
  int currentAppBar = 0;
  int currentTab = 0;
  bool isDrawerOpen = false;
  void toggleDrawer() {
    isDrawerOpen = !isDrawerOpen;
    notifyListeners();
  }

  bool stackLoaderVisible = false;

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = const HomeView(
    refreshPage: false,
  );

  bool hideBottomNavigation = false;

  bool isInititalNotification = false;

  void initState(
    context,
    index,
    currentScreen,
  ) async {
    notifyListeners();
  }

  void setCurrentScreen(value) {
    switch (value) {
      case 0:
        onHomeScreenPress();
      case 1:
        onChartScreenPress();
      case 2:
        onTicketScreenPress();
      case 3:
        onDiscoverScreenPress();
    }
    notifyListeners();
  }

  onNavigation(
    index,
    screen,
    context,
  ) {
    currentScreen = screen;
    currentTab = index;
    notifyListeners();
  }

  ////New///////

//////

//////////

  void onBottomNavChanged(index) {
    currentIndex = index;
    notifyListeners();
  }

  showStackLoader(value) {
    stackLoaderVisible = value;
    notifyListeners();
  }

  void onHomeScreenPress() {
    currentTab = 0;
    currentAppBar = 0;
    currentScreen = const HomeView(
        // refreshPage: false,
        );
    notifyListeners();
  }

  showBottomNavigationBar() {
    hideBottomNavigation = false;
    notifyListeners();
  }

  hideBottomNavigationBar() {
    hideBottomNavigation = true;
    notifyListeners();
  }

  void onChartScreenPress() {
    currentTab = 1;
    currentAppBar = 1;
    currentScreen = const MessageListViewBottom(
        // refreshPage: true,
        // isSearchFocus: false,
        );
    notifyListeners();
  }

  void onTicketScreenPress() {
    currentTab = 2;
    currentAppBar = 2;
    currentScreen = const PurchesItemView();
    // getCartCount(newBudget);
    notifyListeners();
  }

  void onDiscoverScreenPress() {
    currentTab = 3;
    currentAppBar = 3;
    currentScreen = const DiscoverView();
    notifyListeners();
  }

  // void onAccountPressed() {
  //   currentTab = 4;
  //   currentScreen = const ProfileScreenView(
  //     isRefreshed: true,
  //   );
  //   notifyListeners();
  // }

  Future<void> navigation(tabIndex, screenName) async {
    print("${tabIndex}tabIndex");
    currentTab = tabIndex;
    currentScreen = screenName;
    notifyListeners();
  }
}
