import 'package:flutter/material.dart';

class ReservationController extends ChangeNotifier{

  int currentIndex = 0;
  int childIndex = 0;
  bool isExpanded = false;

  void initState(context){
    notifyListeners();
  }

  void onExpanded(){
    isExpanded = !isExpanded;
    notifyListeners();
  }


  void setCurrentIndex(int index) {
   currentIndex = index;
   childIndex = 0;
   notifyListeners();
  }

  void setChildIndex(int index){
    childIndex = index;
    notifyListeners();
  }
}
