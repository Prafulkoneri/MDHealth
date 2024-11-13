import 'package:flutter/material.dart';

class MdBookingHomeViewController extends ChangeNotifier {
  int selectedTab = 0;

  void initState(context) {
    notifyListeners();
  }

  void onSelectedTab(index) {
    selectedTab = index;
    notifyListeners();
  }
}
