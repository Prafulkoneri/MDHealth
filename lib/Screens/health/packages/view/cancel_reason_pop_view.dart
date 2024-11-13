import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:md_health/Screens/health/packages/controller/packages_view_controller.dart';
import 'package:md_health/Screens/health/packages/view/packages_view.dart';
import 'package:md_health/constants/styles/colors.dart';
import 'package:md_health/utils/utils.dart';
import 'package:md_health/widget/buttons.dart';
import 'package:md_health/widget/check_box.dart';
import 'package:md_health/widget/text_field.dart';
import 'package:provider/provider.dart';

class PackageCancellationPopUp extends StatefulWidget {
  final String? purchaseId;
  final String? packageId;
  final String? cancelId;

  const PackageCancellationPopUp({
    super.key,
    this.purchaseId,
    this.packageId,
    this.cancelId,
  });

  @override
  State<PackageCancellationPopUp> createState() =>
      _PackageCancellationPopUpState();
}

class _PackageCancellationPopUpState extends State<PackageCancellationPopUp> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      context.read<PackageViewController>().initState(
          context, widget.packageId, widget.purchaseId, widget.cancelId);
    });
  }

  @override
  Widget build(BuildContext context) {
    final read = context.read<PackageViewController>();
    final watch = context.watch<PackageViewController>();
    return ClipRRect(
      borderRadius: BorderRadius.circular(15.0),
      child: Container(
        width: ScreenUtil().screenWidth,
        height: 450.h,
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(0.0))),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15), // Image border
                        child: SizedBox.fromSize(
                          child: Image(
                              image: AssetImage("assets/images/pop__new_.png")),
                        ),
                      ),
                    ),
                    Positioned(
                        top: 15,
                        right: 15,
                        // left: 0,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: SvgPicture.asset("assets/icons/red_close.svg"),
                        )),
                    Positioned(
                        top: 25,
                        right: 0,
                        left: 0,
                        child: SvgPicture.asset("assets/icons/sad.svg")),
                    Positioned(
                      top: 80,
                      right: 72.w,
                      // left: 0,
                      child: Center(
                        child: Text(
                          "Request Cancel",
                          style: TextStyle(
                              color: Colors.white,
                              // letterSpacing: .5,
                              fontSize: 22.sp,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 38.h,
                ),
                Container(
                  padding: EdgeInsets.only(left: 18.0.w),
                  child: Text(
                    "Cancellation Detail",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10.0.w, right: 10.w),
                  child: PrimaryInformationTextFormFieldreq(
                    borderRadius: 10.w,
                    controller: watch.reasonController,
                    maxLines: 100,
                    height: 100.w,
                    maxLength: 300,
                    hintText:
                        "Please write your treatment cancellation request in detail",
                    contentPadding: EdgeInsets.only(top: 20, left: 15),
                  ),
                ),
                SizedBox(
                  height: 28.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 18.0.w),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          read.onChecked();
                        },
                        child: Container(
                          margin: EdgeInsets.only(right: 5.w, bottom: 2.5.w),
                          height: 15.h,
                          width: 15.w,
                          decoration: BoxDecoration(
                            color: watch.isChecked
                                ? kDefaultActiveColor
                                : const Color(0xffD9D9D9),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(2)),
                          ),
                        ),
                      ),
                      Flexible(
                        child: Text(
                          " I confirm that I wish cancel my\n reservation",
                          style: TextStyle(
                              color: Colors.black,
                              // letterSpacing: .5,
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                Center(
                  child: PrimaryButton(
                    width: 265.w,
                    height: 50.w,
                    borderRadius: 30,
                    color: Color(0xffF55C5C),
                    onTap: () {
                      if (watch.isChecked &&
                          watch.reasonController.text.isNotEmpty) {
                        read.clearCancellationPopup();
                        Navigator.pop(context);

                        print("object");
                        read.packageDeleteActiveStatus(
                            context,
                            widget.cancelId.toString(),
                            widget.purchaseId.toString());

                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15.0))),
                                  contentPadding: EdgeInsets.only(top: 0.0),
                                  content: Container(
                                    width: ScreenUtil().screenWidth,
                                    height: 350.h,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Stack(
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(
                                                              15.0))),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        15), // Image border
                                                child: SizedBox.fromSize(
                                                  // size: Size.fromRadius(
                                                  //     10), // Image radius
                                                  child: Image(
                                                      image: AssetImage(
                                                          "assets/images/pop__new_.png")),
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                                top: 25,
                                                right: 0,
                                                left: 0,
                                                child: Column(
                                                  children: [
                                                    SvgPicture.asset(
                                                        "assets/icons/sad.svg"),
                                                    RichText(
                                                      text: TextSpan(
                                                        text: 'Thank',
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 30.sp,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w700),
                                                        children: <TextSpan>[
                                                          TextSpan(
                                                            text: ' You!',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 30.sp,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                )),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 38.h,
                                        ),
                                        Text(
                                          "Thank you for your request.",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Colors.black,
                                              // letterSpacing: .5,
                                              fontSize: 21.sp,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        SizedBox(
                                          height: 38.h,
                                        ),
                                        Text(
                                          'Our team will contact you as soon as possible \nregarding your cancellation request.',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Colors.black,
                                              // letterSpacing: .5,
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        SizedBox(
                                          height: 48.h,
                                        ),
                                        Container(
                                          padding: EdgeInsets.only(
                                              left: 22.w, right: 21.w),
                                          child: PrimaryButton(
                                            // width:
                                            //     125.w,
                                            // height:
                                            //     35.w,
                                            // borderRadius: BorderRadius.circular(),
                                            borderRadius: 25,
                                            // width: ScreenUtil().screenWidth,
                                            color: Color(0xffF55C5C),
                                            onTap: () {
                                              Navigator.pop(context);
                                              // Navigator.push(
                                              //   context,
                                              //   MaterialPageRoute(
                                              //       builder: (context) =>
                                              //           ChangeInformationFormView()),
                                              // );
                                            },
                                            child: Text(
                                              "Done",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  // letterSpacing: .5,
                                                  fontSize: 16.sp,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ));
                      } else {
                        Utils.showPrimarySnackbar(
                            context, 'Please check the box and enter a reason',
                            type: SnackType.error);
                      }
                    },
                    child: Text(
                      "Submit Cancel Request",
                      style: TextStyle(
                          color: Colors.white,
                          // letterSpacing: .5,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showSnackbar(String message, {SnackType type = SnackType.info}) {
    Utils.showPrimarySnackbar(
        _scaffoldKey.currentState as BuildContext, message,
        type: type);
  }
}
