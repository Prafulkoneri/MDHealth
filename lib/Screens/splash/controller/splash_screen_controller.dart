import 'dart:async';

import 'package:flutter/material.dart';
import 'package:md_health/Screens/auth/view/login_sign_up_view.dart';
import 'package:md_health/Screens/bottom_navigation/view/bottom_view.dart';
import 'package:md_health/Screens/main/view/main_screen_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreenController extends ChangeNotifier {
  late AnimationController motionController;
  late Animation motionAnimation;
  double size = 5;

  void initState(context, controller) {
    setAnimationController(controller);

    motionAnimation = CurvedAnimation(
      parent: motionController,
      curve: Curves.ease,
    );

    motionController.forward();
    motionController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        motionController.reverse();
        notifyListeners();
      } else if (status == AnimationStatus.dismissed) {
        motionController.forward();
        notifyListeners();
      }
    });

    motionController.addListener(() {
      size = motionController.value * 150;
      notifyListeners();
    });
    // motionController.repeat();
    Timer(const Duration(milliseconds: 1500), () {
      // Use Navigator to push the next page onto the navigation stack
      getUserLoggedInState(context);
      // (Route<dynamic> route) => false
    });
  }

  void dispose() {
    motionController.dispose();
    super.dispose();
  }

  Future<void> getUserLoggedInState(context) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    final token = pref.getString("successToken");
    print('//////////////Sharedreferences/////////////////');
    print(token);
    print('//////////////Sharedreferences/////////////////');
    await const Duration(milliseconds: 1500);
    if (token != null) {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => NewMainScreenView()));
    } else {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => const SignUpLoginScreenView()));
    }
  }

  void setAnimationController(AnimationController controller) {
    motionController = controller;
    notifyListeners();
  }
}
