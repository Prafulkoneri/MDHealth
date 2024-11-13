import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:md_health/Screens/health/packages/controller/packages_view_controller.dart';
import 'package:md_health/Screens/health/packages/view/active_packages_view.dart';
import 'package:md_health/Screens/health/packages/view/cancel_packages_view.dart';
import 'package:md_health/Screens/health/packages/view/completed_packages_view.dart';
import 'package:md_health/widget/base_screen.dart';
import 'package:md_health/widget/custom_appbar.dart';
import 'package:md_health/widget/custome_indicator.dart';
import 'package:md_health/widget/loader.dart';
import 'package:provider/provider.dart';

class PackageSView extends StatefulWidget {
  final int? selectedIndex;
  final String? packageId;
  final String? patientID;
  final String? id;
  final String? index;
  final String? purchaseId;
  final String? cancelId;

  const PackageSView({
    Key? key,
    this.selectedIndex,
    this.packageId,
    this.id,
    this.patientID,
    this.index,
    this.purchaseId,
    this.cancelId,
  }) : super(key: key);

  @override
  _PackageSViewState createState() => _PackageSViewState();
}

class _PackageSViewState extends State<PackageSView>
    with TickerProviderStateMixin {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      print("9999");
      context
          .read<PackageViewController>()
          .initState(context, widget.selectedIndex, "", "");
    });
  }

  @override
  Widget build(BuildContext context) {
    final read = context.read<PackageViewController>();
    final watch = context.watch<PackageViewController>();
    // final readMainScreen = context.read<SMainScreenController>();
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: BaseScreen(
        onWillPop: () async {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //       builder: (context) => PackageSView(
          //             packageId: watch.packageId.toString(),
          //           )),
          // );

          return false;
        },
        hasScrollView: false,
        backgroundColor: Color(0xffF5F5F5),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(120.h),
          child: CustomAppBar(
            drawerTitle: 'Packages',
            // hasBackButton: true,
            hasMdTitle: false,
            // drawerTitle: "Orders",
          ),
        ),
        content:
            //  watch.isLoading
            // ? Column(
            //   crossAxisAlignment: CrossAxisAlignment.center,
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     SizedBox(height: 100.h),
            //     const Loader(),
            //   ]
            // )
            // :
            Column(
          children: [
            TabBar(
              physics: const NeverScrollableScrollPhysics(),
              splashBorderRadius: BorderRadius.circular(20),
              indicator:
                  CustomIndicator(color: Colors.transparent, radius: 0.w),
              padding: EdgeInsets.only(top: 20.w),
              labelPadding: EdgeInsets.only(bottom: 0.w),
              tabs: <Widget>[
                Tab(
                  child: Container(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 6,
                        ),
                        Text(
                          "Active",
                          style: TextStyle(
                              fontFamily: 'Campton',
                              fontSize: 16.sp,
                              fontWeight: watch.selectedIndex == 0
                                  ? FontWeight.w700
                                  : FontWeight.w400,
                              color: const Color(0xff3A3A3A)),
                        ),
                        SizedBox(
                          height: 5.w,
                        ),
                        watch.selectedIndex == 0
                            ? Container(
                                width: 72.w,
                                height: 5.w,
                                decoration: BoxDecoration(
                                  color: const Color(0xff4CDB06),
                                ),
                              )
                            : Container(),
                      ],
                    ),
                  ),
                ),
                Tab(
                  child: Container(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 6,
                        ),
                        Text(
                          "Completed",
                          style: TextStyle(
                              fontFamily: 'Campton',
                              fontSize: 16.sp,
                              fontWeight: watch.selectedIndex == 1
                                  ? FontWeight.w700
                                  : FontWeight.w400,
                              color: const Color(0xff3A3A3A)),
                        ),
                        SizedBox(
                          height: 5.w,
                        ),
                        watch.selectedIndex == 1
                            ? Container(
                                width: 95.w,
                                height: 5.w,
                                decoration: BoxDecoration(
                                  color: const Color(0xff4CDB06),
                                ),
                              )
                            : Container(),
                      ],
                    ),
                  ),
                ),
                Tab(
                  child: Container(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 6,
                        ),
                        Text(
                          "Canceled",
                          // canceled
                          style: TextStyle(
                              fontFamily: 'Campton',
                              fontSize: 16.sp,
                              fontWeight: watch.selectedIndex == 2
                                  ? FontWeight.w700
                                  : FontWeight.w400,
                              color: const Color(0xff3A3A3A)),
                        ),
                        SizedBox(
                          height: 5.w,
                        ),
                        watch.selectedIndex == 2
                            ? Container(
                                width: 80.w,
                                height: 5.w,
                                decoration: BoxDecoration(
                                  color: const Color(0xff4CDB06),
                                ),
                              )
                            : Container(),
                      ],
                    ),
                  ),
                ),
              ],
              onTap: (index) {
                read.onTabClicked(index);
              },
            ),
            Expanded(
              child: ListView(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                children: [
                  IndexedStack(
                    index: watch.selectedIndex,
                    children: <Widget>[
                      Visibility(
                        maintainState: true,
                        visible: watch.selectedIndex == 0,
                        child: const AcitvePackageView(),
                      ),
                      Visibility(
                        maintainState: true,
                        visible: watch.selectedIndex == 1,
                        child: const CompletedPackageView(),
                      ),
                      Visibility(
                        maintainState: true,
                        visible: watch.selectedIndex == 2,
                        child: const CancelPackageView(),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
