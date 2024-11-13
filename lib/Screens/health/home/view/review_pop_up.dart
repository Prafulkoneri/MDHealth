import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:md_health/Screens/health/home/view/home_view.dart';
import 'package:md_health/Screens/health/packages/controller/packages_view_controller.dart';
import 'package:md_health/Screens/health/packages/view/completed_packages_view.dart';
import 'package:md_health/Screens/health/packages/view/packages_view.dart';
import 'package:md_health/constants/styles/colors.dart';
import 'package:md_health/test_widget.dart';
import 'package:provider/provider.dart';

class ReviewPopUpView extends StatefulWidget {
  final String? selectedIndex;
  const ReviewPopUpView({
    super.key,
    this.selectedIndex,
  });

  @override
  State<ReviewPopUpView> createState() => _ReviewPopUpViewState();
}

class _ReviewPopUpViewState extends State<ReviewPopUpView> {
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
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              alignment: Alignment.center,
              height: MediaQuery.of(context).size.height * 0.6,
              decoration: const BoxDecoration(
                // color: Colors.red,
                borderRadius: BorderRadius.all(
                  Radius.circular(20.0),
                ),
                // color: Colors.red,
              ),
            ),
            // Container()
            Positioned(
              top: 80,
              right: 1,
              left: 1,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10.w),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                ),
                // height: 700.h,
                padding: EdgeInsets.only(bottom: 20.w, right: 10.w, left: 10.w),
                // width: 331.w,
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 120.h,
                    ),
                    Text(
                      'Thank you for your feedback.',
                      style: TextStyle(
                        fontFamily: 'Campton',
                        color: Colors.black,
                        fontSize: 21.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: 60.w, right: 60.w, bottom: 50.w),
                      child: Text(
                        'Our team will get back to you as soon as possible.',
                        style: TextStyle(
                          fontFamily: 'Campton',
                          color: Colors.black,
                          fontSize: 17.sp,
                          fontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            // Navigator.pop(context);
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomeView()));
                          },
                          child: Container(
                            width: 150.w,
                            height: 45.h,
                            decoration: BoxDecoration(
                              color: kDefaultActiveColor,
                              borderRadius: BorderRadius.circular(30.w),
                              // border: Border.all(color: borderColor ?? Colors.transparent)
                            ),
                            child: Center(
                              child: Text(
                                "Done",
                                style: TextStyle(
                                  fontFamily: 'Campton',
                                  color: Colors.black,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                                // style: TextStyle(
                                //     color: textColor ?? Colors.white,
                                //     fontWeight: fontWeight ?? FontWeight.w700,
                                //     fontSize: fontSize ?? 14.sp),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            // Navigator.pop(context);
                            Navigator.push(
                              context,
                              SlidePageRoute(
                                page: PackageSView(
                                  selectedIndex:
                                      1, // Pass the index you want to open
                                ),
                                direction: SlideDirection.right,
                                delay: Duration(milliseconds: 5000),
                              ),
                            );
                          },
                          child: Container(
                            width: 150.w,
                            height: 45.h,
                            decoration: BoxDecoration(
                              color: kDefaultActiveColor,
                              borderRadius: BorderRadius.circular(30.w),
                              // border: Border.all(color: borderColor ?? Colors.transparent)
                            ),
                            child: Center(
                              child: Text(
                                "Done",
                                style: TextStyle(
                                  fontFamily: 'Campton',
                                  color: Colors.black,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                                // style: TextStyle(
                                //     color: textColor ?? Colors.white,
                                //     fontWeight: fontWeight ?? FontWeight.w700,
                                //     fontSize: fontSize ?? 14.sp),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                // child: ,
              ),
            ),
            Positioned(
              child: Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 11.w),
                child: SvgPicture.asset(
                  'assets/icons/BG.svg',
                  color: kDefaultActiveColor,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Positioned(
              top: 25,
              right: 1,
              left: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/icons/material-symbols_person-celebrate.svg',
                    height: 53.h,
                    width: 53.w,
                    // alignment: Alignment.topRight,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 8.0.w),
                    child: RichText(
                        text: TextSpan(
                            style: TextStyle(
                              fontFamily: 'Campton',
                              color: Colors.black,
                              fontSize: 30.sp,
                              fontWeight: FontWeight.w700,
                            ),
                            children: [
                          TextSpan(
                              text: 'Thank',
                              style: TextStyle(color: Colors.white)),
                          TextSpan(
                              text: 'You!',
                              style: TextStyle(fontWeight: FontWeight.w500)),
                        ])),
                  ),
                ],
              ),
            ),

            // Positioned(
            //   top: 110,
            //   right: 1,
            //   left: 1,
            //   child:
            // ),
            Positioned(
              top: 0,
              right: 0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 260.0, bottom: 110, top: 4),
                    child: SvgPicture.asset(
                      'assets/icons/CloseSquare.svg',
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
