import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:md_health/Screens/bottom_navigation/controller/bottom_controller.dart';
import 'package:md_health/Screens/bottom_navigation/view/bottom_view.dart';
import 'package:md_health/Screens/health/packages/view/packages_view.dart';
import 'package:md_health/Screens/health/payment/controller/payment_controller.dart';
import 'package:md_health/Screens/health/search/controller/search_view_controller.dart';
import 'package:md_health/constants/styles/colors.dart';
import 'package:md_health/test_widget.dart';
import 'package:md_health/widget/base_screen.dart';
import 'package:md_health/widget/buttons.dart';
import 'package:md_health/widget/custom_appbar.dart';
import 'package:provider/provider.dart';

class BankCompletedView extends StatefulWidget {
  final String? PackageId;
  const BankCompletedView({super.key, this.PackageId});

  @override
  State<BankCompletedView> createState() => _BankCompletedViewState();
}

class _BankCompletedViewState extends State<BankCompletedView> {
  @override
  Widget build(BuildContext context) {
    final watchPayment = context.watch<PaymentController>();
    final read = context.read<SearchViewController>();
    final watch = context.watch<SearchViewController>();
    final readMain = context.watch<NewMainScreenController>();
    return BaseScreen(
      onWillPop: () async {
        print("object");
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => NewMainScreenView(),
          ),
        );
        return false; // Allow the back button press
      },
      backgroundColor: const Color(0xffF5F5F5),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(120.h),
        child: CustomAppBar(
          hasMdTitle: true,
          // drawerTitle: "Orders",
        ),
      ),
      content: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(
              height: 28.h,
            ),
            Text(
              "COMPLETED",
              style: TextStyle(
                  fontFamily: 'Campton',
                  color: Color(0xff4CDB06),
                  // letterSpacing: .5,
                  fontSize: 25.sp,
                  fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: 20.h,
            ),
            SvgPicture.asset('assets/icons/Group_5.svg'),
            SizedBox(
              height: 28.h,
            ),
            RichText(
              text: TextSpan(
                text: 'Your order no ',
                style: TextStyle(
                    fontFamily: 'Campton',
                    color: Colors.black,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w700),
                children: <TextSpan>[
                  TextSpan(
                    text: watchPayment.newOrderid,
                    style: TextStyle(
                        fontFamily: 'Campton',
                        color: kDefaultActiveColor,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w700),
                    recognizer: new TapGestureRecognizer()..onTap = () {},
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                RichText(
                  // textAlign: TextAlign.start,
                  text: TextSpan(
                    text: 'You can view your  ',
                    style: TextStyle(
                        fontFamily: 'Campton',
                        color: Colors.black,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500),

                    /*defining default style is optional */
                    children: <TextSpan>[
                      TextSpan(
                        text: '"Packages"',
                        style: TextStyle(
                            fontFamily: 'Campton',
                            decoration: TextDecoration.underline,
                            color: Colors.black,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w700),
                        recognizer: new TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.push(
                              context,
                              SlidePageRoute(
                                page: PackageSView(
                                    // treatmentName: watch.tretmentName,
                                    // cityName: watch.cityName,
                                    // packageId: watch.packageId.toString(),
                                    // refresh: true,
                                    // price: watch.salePrice,
                                    ),
                                direction: SlideDirection
                                    .left, // Specify the slide direction here
                                delay: Duration(milliseconds: 5000),
                              ),
                              // MaterialPageRoute(
                              //     builder: (context) => SearchDetailsView(
                              //           packageId: watch.packageId,
                              //         ))
                            );
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //       builder: (context) => SignUpView()),
                            // );
                          },
                      ),
                      TextSpan(
                        text: ' under profile tab or\n    ',
                        style: TextStyle(
                            fontFamily: 'Campton',
                            // fontStyle: FontStyle.italic,
                            color: Colors.black,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500),
                        recognizer: new TapGestureRecognizer()
                          ..onTap = () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //       builder: (context) => SignUpView()),
                            // );
                          },
                      ),
                      TextSpan(
                        text: '            explore more in ',
                        style: TextStyle(
                            fontFamily: 'Campton',
                            // fontStyle: FontStyle.italic,
                            color: Colors.black,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500),
                        recognizer: new TapGestureRecognizer()
                          ..onTap = () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //       builder: (context) => SignUpView()),
                            // );
                          },
                      ),
                      TextSpan(
                        text: 'Home Page',
                        style: TextStyle(
                            fontFamily: 'Campton',
                            decoration: TextDecoration.underline,
                            color: Colors.black,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w700),
                        recognizer: new TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.push(
                              context,
                              SlidePageRoute(
                                page: NewMainScreenView(),
                                direction: SlideDirection
                                    .left, // Specify the slide direction here
                                delay: Duration(milliseconds: 2000),
                              ),
                            );
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //       builder: (context) => SignUpView()),
                            // );
                          },
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            Divider(
              indent: 40,
              endIndent: 40,
              thickness: 1,
              color: Color(0xff4CDB06),
              // height: height,
            ),
            SizedBox(
              height: 20.h,
            ),
            Text(
              "Attention",
              style: TextStyle(
                  fontFamily: 'Campton',
                  color: Colors.red,
                  // letterSpacing: .5,
                  fontSize: 23.sp,
                  fontWeight: FontWeight.w700),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                RichText(
                  // textAlign: TextAlign.start,
                  text: TextSpan(
                    text:
                        'You must make your payments by money transfer\n                            as soon as possible.',
                    style: TextStyle(
                        fontFamily: 'Campton',
                        color: Colors.black,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500),

                    /*defining default style is optional */
                    children: <TextSpan>[
                      // TextSpan(
                      //   text: '"Packages"',
                      //   style: TextStyle(
                      //       fontFamily: 'Campton',
                      //       decoration: TextDecoration.underline,
                      //       color: Colors.black,
                      //       fontSize: 12.sp,
                      //       fontWeight: FontWeight.w700),
                      //   recognizer: new TapGestureRecognizer()
                      //     ..onTap = () {
                      //       Navigator.push(
                      //         context,
                      //         SlidePageRoute(
                      //           page: PackageSView(
                      //               // treatmentName: watch.tretmentName,
                      //               // cityName: watch.cityName,
                      //               // packageId: watch.packageId.toString(),
                      //               // refresh: true,
                      //               // price: watch.salePrice,
                      //               ),
                      //           direction: SlideDirection
                      //               .left, // Specify the slide direction here
                      //           delay: Duration(milliseconds: 5000),
                      //         ),
                      //         // MaterialPageRoute(
                      //         //     builder: (context) => SearchDetailsView(
                      //         //           packageId: watch.packageId,
                      //         //         ))
                      //       );
                      //       // Navigator.push(
                      //       //   context,
                      //       //   MaterialPageRoute(
                      //       //       builder: (context) => SignUpView()),
                      //       // );
                      //     },
                      // ),
                      // TextSpan(
                      //   text: ' page or the\n    ',
                      //   style: TextStyle(
                      //       fontFamily: 'Campton',
                      //       // fontStyle: FontStyle.italic,
                      //       color: Colors.black,
                      //       fontSize: 12.sp,
                      //       fontWeight: FontWeight.w500),
                      //   recognizer: new TapGestureRecognizer()
                      //     ..onTap = () {
                      //       // Navigator.push(
                      //       //   context,
                      //       //   MaterialPageRoute(
                      //       //       builder: (context) => SignUpView()),
                      //       // );
                      //     },
                      // ),
                      // TextSpan(
                      //   text: 'Home Page',
                      //   style: TextStyle(
                      //       fontFamily: 'Campton',
                      //       decoration: TextDecoration.underline,
                      //       color: Colors.black,
                      //       fontSize: 12.sp,
                      //       fontWeight: FontWeight.w700),
                      //   recognizer: new TapGestureRecognizer()
                      //     ..onTap = () {
                      //       Navigator.push(
                      //         context,
                      //         SlidePageRoute(
                      //           page: NewMainScreenView(),
                      //           direction: SlideDirection
                      //               .left, // Specify the slide direction here
                      //           delay: Duration(milliseconds: 2000),
                      //         ),
                      //       );
                      //       // Navigator.push(
                      //       //   context,
                      //       //   MaterialPageRoute(
                      //       //       builder: (context) => SignUpView()),
                      //       // );
                      //     },
                      // ),
                      // TextSpan(
                      //   text: ' to see your reservations.',
                      //   style: TextStyle(
                      //       fontFamily: 'Campton',
                      //       // fontStyle: FontStyle.italic,
                      //       color: Colors.black,
                      //       fontSize: 12.sp,
                      //       fontWeight: FontWeight.w500),
                      //   recognizer: new TapGestureRecognizer()
                      //     ..onTap = () {
                      //       // Navigator.push(
                      //       //   context,
                      //       //   MaterialPageRoute(
                      //       //       builder: (context) => SignUpView()),
                      //       // );
                      //     },
                      // ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                RichText(
                  // textAlign: TextAlign.start,
                  text: TextSpan(
                    text:
                        'If payment is not made within 3 days,\n           the order will be cancelled.',
                    style: TextStyle(
                        fontFamily: 'Campton',
                        color: Colors.black,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500),

                    /*defining default style is optional */
                    children: <TextSpan>[
                      // TextSpan(
                      //   text: '"Packages"',
                      //   style: TextStyle(
                      //       fontFamily: 'Campton',
                      //       decoration: TextDecoration.underline,
                      //       color: Colors.black,
                      //       fontSize: 12.sp,
                      //       fontWeight: FontWeight.w700),
                      //   recognizer: new TapGestureRecognizer()
                      //     ..onTap = () {
                      //       Navigator.push(
                      //         context,
                      //         SlidePageRoute(
                      //           page: PackageSView(
                      //               // treatmentName: watch.tretmentName,
                      //               // cityName: watch.cityName,
                      //               // packageId: watch.packageId.toString(),
                      //               // refresh: true,
                      //               // price: watch.salePrice,
                      //               ),
                      //           direction: SlideDirection
                      //               .left, // Specify the slide direction here
                      //           delay: Duration(milliseconds: 5000),
                      //         ),
                      //         // MaterialPageRoute(
                      //         //     builder: (context) => SearchDetailsView(
                      //         //           packageId: watch.packageId,
                      //         //         ))
                      //       );
                      //       // Navigator.push(
                      //       //   context,
                      //       //   MaterialPageRoute(
                      //       //       builder: (context) => SignUpView()),
                      //       // );
                      //     },
                      // ),
                      // TextSpan(
                      //   text: ' page or the\n    ',
                      //   style: TextStyle(
                      //       fontFamily: 'Campton',
                      //       // fontStyle: FontStyle.italic,
                      //       color: Colors.black,
                      //       fontSize: 12.sp,
                      //       fontWeight: FontWeight.w500),
                      //   recognizer: new TapGestureRecognizer()
                      //     ..onTap = () {
                      //       // Navigator.push(
                      //       //   context,
                      //       //   MaterialPageRoute(
                      //       //       builder: (context) => SignUpView()),
                      //       // );
                      //     },
                      // ),
                      // TextSpan(
                      //   text: 'Home Page',
                      //   style: TextStyle(
                      //       fontFamily: 'Campton',
                      //       decoration: TextDecoration.underline,
                      //       color: Colors.black,
                      //       fontSize: 12.sp,
                      //       fontWeight: FontWeight.w700),
                      //   recognizer: new TapGestureRecognizer()
                      //     ..onTap = () {
                      //       Navigator.push(
                      //         context,
                      //         SlidePageRoute(
                      //           page: NewMainScreenView(),
                      //           direction: SlideDirection
                      //               .left, // Specify the slide direction here
                      //           delay: Duration(milliseconds: 2000),
                      //         ),
                      //       );
                      //       // Navigator.push(
                      //       //   context,
                      //       //   MaterialPageRoute(
                      //       //       builder: (context) => SignUpView()),
                      //       // );
                      //     },
                      // ),
                      // TextSpan(
                      //   text: ' to see your reservations.',
                      //   style: TextStyle(
                      //       fontFamily: 'Campton',
                      //       // fontStyle: FontStyle.italic,
                      //       color: Colors.black,
                      //       fontSize: 12.sp,
                      //       fontWeight: FontWeight.w500),
                      //   recognizer: new TapGestureRecognizer()
                      //     ..onTap = () {
                      //       // Navigator.push(
                      //       //   context,
                      //       //   MaterialPageRoute(
                      //       //       builder: (context) => SignUpView()),
                      //       // );
                      //     },
                      // ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30.h,
            ),
            PrimaryButton(
              width: 300.h,
              // borderRadius: BorderRadius.circular(),
              borderRadius: 30,
              // width: ScreenUtil().screenWidth,
              color: Color(0xff4CDB06),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NewMainScreenView()),
                );
              },
              child: Text(
                "Done",
                style: TextStyle(
                    fontFamily: 'Campton',
                    color: Colors.black,
                    // letterSpacing: .5,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(
              height: 100.h,
            ),
          ],
        ),
      ),
    );
  }
}
