import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:md_health/Screens/payment/view/payment_view.dart';
import 'package:md_health/constants/styles/colors.dart';
import 'package:md_health/widget/base_screen.dart';
import 'package:md_health/widget/buttons.dart';
import 'package:md_health/widget/custom_appbar.dart';

class PaymentCompletedViewTwo extends StatefulWidget {
  const PaymentCompletedViewTwo({super.key});

  @override
  State<PaymentCompletedViewTwo> createState() =>
      _PaymentCompletedViewTwoState();
}

class _PaymentCompletedViewTwoState extends State<PaymentCompletedViewTwo> {
  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      onWillPop: () async {
        // widget.screenName != "PackageDetailView"
        //     ? Navigator.push(
        //         context,
        //         SlidePageRoute(
        //           page: PaymentDetailsView(
        //             purchaseType: widget.purchaseType,
        //             packageId: watch.packageId.toString(),
        //             // price: watch.salePrice,
        //           ),
        //           direction: SlideDirection
        //               .right, // Specify the slide direction here
        //           delay: Duration(milliseconds: 5000),
        //         ),
        //       )
        //     : Navigator.push(
        //         context,
        //         SlidePageRoute(
        //           page: PackageDetailView(
        //             type: "",
        //             purchesId: widget.puchesId,
        //             // purchaseType: widget.purchaseType,
        //             packageId: watch.packageId.toString(),
        //             // price: watch.salePrice,
        //           ),
        //           direction: SlideDirection
        //               .right, // Specify the slide direction here
        //           delay: Duration(milliseconds: 5000),
        //         ),
        //       );

        return false;
      },
      backgroundColor: const Color(0xffF5F5F5),
      appBar: CustomAppBar(
        onBackPressed: () {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => PaymentView()));
        },
        hasBackButton: true,
        hasMdTitle: false,
        // drawerTitle: "Orders",
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
                  fontSize: 29.sp,
                  fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: 28.h,
            ),
            SvgPicture.asset('assets/icons/Group_5.svg'),
            SizedBox(
              height: 28.h,
            ),
            RichText(
              // textAlign: TextAlign.start,
              text: TextSpan(
                text: 'Your order no',
                style: TextStyle(
                    fontFamily: 'Campton',
                    color: Colors.black,
                    fontSize: 23.sp,
                    fontWeight: FontWeight.w700),

                /*defining default style is optional */
                children: <TextSpan>[
                  TextSpan(
                    text: '#MD829',
                    style: TextStyle(
                        fontFamily: 'Campton',
                        color: kDefaultActiveColor,
                        fontSize: 23.sp,
                        fontWeight: FontWeight.w700),
                    recognizer: new TapGestureRecognizer()
                      ..onTap = () {
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
            SizedBox(
              height: 28.h,
            ),
            RichText(
              // textAlign: TextAlign.start,
              text: TextSpan(
                text: 'You can view your  ',
                style: TextStyle(
                    fontFamily: 'Campton',
                    color: Colors.black,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w500),

                /*defining default style is optional */
                children: <TextSpan>[
                  TextSpan(
                    text: '"Packages"',
                    style: TextStyle(
                        fontFamily: 'Campton',
                        decoration: TextDecoration.underline,
                        color: Colors.black,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w700),
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
                    text: ' under profile tab or\n',
                    style: TextStyle(
                        fontFamily: 'Campton',
                        // fontStyle: FontStyle.italic,
                        color: Colors.black,
                        fontSize: 15.sp,
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
                    text: '                explore more in ',
                    style: TextStyle(
                        fontFamily: 'Campton',
                        // fontStyle: FontStyle.italic,
                        color: Colors.black,
                        fontSize: 15.sp,
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
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w700),
                    recognizer: new TapGestureRecognizer()
                      ..onTap = () {
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
            SizedBox(
              height: 28.h,
            ),
            Divider(
              indent: 40,
              endIndent: 40,
              thickness: 1,
              color: Color(0xff4CDB06),
              // height: height,
            ),
            SizedBox(
              height: 28.h,
            ),
            Text(
              "Attention",
              style: TextStyle(
                  color: Color(0xffF31D1D),
                  // letterSpacing: .5,
                  fontSize: 23.sp,
                  fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: 20.h,
            ),
            Text(
              "You must make your payments by money transfer\n as soon as possible.",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: black,
                  // letterSpacing: .5,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 20.h,
            ),
            Text(
              "If payment is not made within 3 days,\nthe order will be cancelled",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: black,
                  fontFamily: 'Campton',

                  // letterSpacing: .5,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 70.h,
            ),
            PrimaryButton(
              width: 250.h,
              // borderRadius: BorderRadius.circular(),
              borderRadius: 30,
              // width: ScreenUtil().screenWidth,
              color: Color(0xff4CDB06),
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => SignUpView()),
                // );
              },
              child: Text(
                "Sign Up",
                style: TextStyle(
                    fontFamily: 'Campton',
                    color: Colors.black,
                    // letterSpacing: .5,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(
              height: 50.h,
            ),
          ],
        ),
      ),
    );
  }
}
