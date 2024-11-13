import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:md_health/Screens/splash/controller/splash_screen_controller.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  bool isUserLoggedIn = false;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: Duration(milliseconds: 500),
      vsync: this,
      lowerBound: 0.5,
    );
    SchedulerBinding.instance.addPostFrameCallback((_) {
      context.read<SplashScreenController>().initState(context, controller);
    });
  }

  // @override
  // void dispose() {
  //   super.dispose();
  //   context.watch<SplashScreenController>().motionController.dispose();
  //   context.read<SplashScreenController>().dispose();
  //   controller.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    final watch = context.watch<SplashScreenController>();

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Positioned(
            child: _circle(),
            bottom: -5,
            right: -5,
          ),
          Positioned(
            child: _circle(),
            top: -5,
            left: -5,
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 150, sigmaY: 150),
            child: Container(
              color: Colors.transparent,
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/md_logo.png",
                      // md_logo
                      height: watch.size,
                      alignment: Alignment.center,
                      // width: 87.81,
                      // height: 70.61,
                      // fit: BoxFit.fill,s
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

Widget _circle() {
  return Container(
    height: 100,
    width: 100,
    decoration: const BoxDecoration(
      shape: BoxShape.circle,
      color: Color(0xff4CDB06),
    ),
  );
}
