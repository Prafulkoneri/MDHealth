import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:md_health/Screens/bottom_navigation/controller/bottom_controller.dart';
import 'package:md_health/Screens/bottom_navigation/view/bottom_view.dart';
import 'package:md_health/Screens/health/home/view/home_view.dart';
import 'package:md_health/Screens/main/controller/main_screen_controller.dart';
import 'package:md_health/Screens/main/view/main_screen_view.dart';
import 'package:provider/provider.dart';
import '../constants/styles/colors.dart';

class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({
    super.key,
  });

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final read = context.watch<NewMainScreenController>();
    return Container(
      padding: EdgeInsets.all(16.w),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(50)),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
          child: Container(
            color: Colors.transparent,
            child: TabBar(
              labelColor: const Color(0xff4CDB06),
              padding: const EdgeInsets.only(bottom: 20, top: 20),
              indicator: const UnderlineTabIndicator(
                  borderSide:
                      BorderSide(color: Colors.transparent, width: 0.0)),
              tabs: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => NewMainScreenView()));
                    read.setCurrentScreen(0);
                  },
                  child: SvgPicture.asset(
                    'assets/icons/Vector_1.svg',
                    height: 23.h,
                    colorFilter:
                        const ColorFilter.mode(Colors.grey, BlendMode.srcIn),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => NewMainScreenView()));
                    read.setCurrentScreen(1);
                  },
                  child: SvgPicture.asset(
                    'assets/icons/Chart.svg',
                    height: 23.h,
                    colorFilter:
                        const ColorFilter.mode(Colors.grey, BlendMode.srcIn),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => NewMainScreenView()));
                    read.setCurrentScreen(2);
                  },
                  child: SvgPicture.asset(
                    'assets/icons/Ticket.svg',
                    height: 18.h,
                    colorFilter:
                        const ColorFilter.mode(Colors.grey, BlendMode.srcIn),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => NewMainScreenView()));
                    read.setCurrentScreen(3);
                  },
                  child: SvgPicture.asset(
                    'assets/icons/Discovery.svg',
                    height: 23.h,
                    colorFilter:
                        const ColorFilter.mode(Colors.grey, BlendMode.srcIn),
                  ),
                ),
              ],
              controller: TabController(vsync: this, length: 4),
            ),
          ),
        ),
      ),
    );
  }
}
