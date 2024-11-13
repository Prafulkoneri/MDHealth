import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:md_health/Screens/health/home/controller/home_controller.dart';
import 'package:provider/provider.dart';
import 'home_section_one.dart';
import 'home_section_three.dart';
import 'home_section_two.dart';

class HomeView extends StatefulWidget {
  final String? countryId;
  final bool? refreshPage;
  // final String? route;

  const HomeView({
    Key? key,
    this.countryId,
    this.refreshPage,
    //  this.route
  });
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      context.read<HomeViewController>().initState(
            context,
            widget.countryId,
          );
    });
  }

  @override
  Widget build(BuildContext context) {
    final read = context.read<HomeViewController>();

    return RefreshIndicator(
      onRefresh: () async {
        read.refreshState(context);

        // Implement your refresh logic here
        // For example, you can fetch new data
        // await fetchData();
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.only(top: 5.w),
            child: Column(
              children: [
                RefreshIndicator(
                    onRefresh: () async {
                      read.refreshState(context);

                      // Implement your refresh logic here
                      // For example, you can fetch new data
                      // await fetchData();
                    },
                    child: const HomeScreenSectionOne()),
                const HomeScreenSectionTwo(),
                const HomeScreenSectionThree(),
                SizedBox(
                  height: 100.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
