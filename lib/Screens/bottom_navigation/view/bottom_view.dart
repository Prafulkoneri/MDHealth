import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:md_health/Screens/bottom_navigation/controller/bottom_controller.dart';
import 'package:md_health/constants/styles/colors.dart';
import 'package:md_health/widget/custom_appbar.dart';
import 'package:md_health/widget/drawer.dart';
import 'package:provider/provider.dart';

class NewMainScreenView extends StatefulWidget {
  final bool? isRefresh;
  final Widget? screenName;
  final int? index;
  final Color? color;

  const NewMainScreenView(
      {Key? key, this.isRefresh, this.screenName, this.index, this.color})
      : super(key: key);

  @override
  _NewMainScreenViewState createState() => _NewMainScreenViewState();
}

class _NewMainScreenViewState extends State<NewMainScreenView>
    with TickerProviderStateMixin {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      context.read<NewMainScreenController>().initState(context, "", "");
    });

    SchedulerBinding.instance.addPostFrameCallback((_) {
      context.read<NewMainScreenController>().initState(
            context,
            widget.index,
            widget.screenName,
          );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final read = context.read<NewMainScreenController>();
    final watch = context.watch<NewMainScreenController>();

    getAppBar() {
      switch (watch.currentTab) {
        case 0:
          return CustomAppBar(
            hasHiText: true,
          );
        case 1:
          return CustomAppBar(
            drawerTitle: 'Messages',
            hasMdTitle: false,
          );
        case 2:
          return CustomAppBar(
            drawerTitle: 'Purchased Items',
            hasMdTitle: false,
          );
        case 3:
          return CustomAppBar(
            hasHiText: true,
            hasMdTitle: false,
          );
        default:
          return CustomAppBar(
            hasHiText: true,
            hasMdTitle: false,
          );
      }
    }

    return Scaffold(
      appBar: getAppBar(),
      extendBody: true,

      backgroundColor: widget.color ?? Colors.black,
      drawer: const AppDrawer(),
      // floatingActionButton: ,

      bottomNavigationBar: Visibility(
        visible: !watch.hideBottomNavigation ? true : false,
        child: Container(
          padding: const EdgeInsets.all(16),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(50)),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 100, sigmaY: 100),
              child: Container(
                child: TabBar(
                  labelColor: const Color(0xff4CDB06),
                  padding: const EdgeInsets.only(bottom: 20, top: 20),
                  indicator: const UnderlineTabIndicator(
                      borderSide:
                          BorderSide(color: Colors.transparent, width: 0.0)),
                  tabs: <Widget>[
                    GestureDetector(
                      onTap: read.onHomeScreenPress,
                      child: SvgPicture.asset(
                        'assets/icons/Vector_1.svg',
                        height: 23.h,
                        colorFilter: watch.currentTab == 0
                            ? const ColorFilter.mode(
                                kDefaultActiveColor, BlendMode.srcIn)
                            : const ColorFilter.mode(
                                Colors.grey, BlendMode.srcIn),
                      ),
                    ),
                    GestureDetector(
                      onTap: read.onChartScreenPress,
                      child: SvgPicture.asset(
                        'assets/icons/Chart.svg',
                        height: 23.h,
                        colorFilter: watch.currentTab == 1
                            ? const ColorFilter.mode(
                                kDefaultActiveColor, BlendMode.srcIn)
                            : const ColorFilter.mode(
                                Colors.grey, BlendMode.srcIn),
                      ),
                    ),
                    GestureDetector(
                      onTap: read.onTicketScreenPress,
                      child: SvgPicture.asset(
                        'assets/icons/Ticket.svg',
                        height: 23.h,
                        colorFilter: watch.currentTab == 2
                            ? const ColorFilter.mode(
                                kDefaultActiveColor, BlendMode.srcIn)
                            : const ColorFilter.mode(
                                Colors.grey, BlendMode.srcIn),
                      ),
                    ),
                    GestureDetector(
                      onTap: read.onDiscoverScreenPress,
                      child: SvgPicture.asset(
                        'assets/icons/Discovery.svg',
                        height: 23.h,
                        colorFilter: watch.currentTab == 3
                            ? const ColorFilter.mode(
                                kDefaultActiveColor, BlendMode.srcIn)
                            : const ColorFilter.mode(
                                Colors.grey, BlendMode.srcIn),
                      ),
                    ),
                  ],
                  controller: TabController(vsync: this, length: 4),
                ),
              ),
            ),
          ),
        ),
      ),
      body: watch.currentScreen,
    );
  }
}
