import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:md_health/Screens/bottom_navigation/controller/bottom_controller.dart';
import 'package:md_health/Screens/health/payment/controller/payment_controller.dart';
import 'package:md_health/Screens/shop/md_shop_home_page/view/md_shop_home_page.dart';
import 'package:md_health/Screens/order_details/view/md_shop_view.dart';
import 'package:md_health/constants/styles/colors.dart';
import 'package:md_health/test_widget.dart';
import 'package:md_health/widget/base_screen.dart';
import 'package:md_health/widget/buttons.dart';
import 'package:md_health/widget/custom_appbar.dart';
import 'package:provider/provider.dart';

class ShopPaymentCompletedView extends StatefulWidget {
  final String? PackageId;
  const ShopPaymentCompletedView({super.key, this.PackageId});

  @override
  State<ShopPaymentCompletedView> createState() =>
      _ShopPaymentCompletedViewState();
}

class _ShopPaymentCompletedViewState extends State<ShopPaymentCompletedView> {
  @override
  Widget build(BuildContext context) {
    final watchPayment = context.watch<PaymentController>();
    // final read = context.read<SearchViewController>();
    // final watch = context.watch<SearchViewController>();
    final readMain = context.watch<NewMainScreenController>();
    return BaseScreen(
      onWillPop: () async {
        // Navigator.push(
        //   context,
        //   SlidePageRoute(
        //     page: MdShopHomePageView(),
        //     direction: SlideDirection.left, // Specify the slide direction here
        //     delay: Duration(milliseconds: 2000),
        //   ),
        // );
        // Navigator.push(
        //   context,
        //   SlidePageRoute(
        //     page: ShopCartScreenView(

        //         // price: watch.salePrice,
        //         ),
        //     direction:
        //         SlideDirection.right, // Specify the slide direction here
        //     delay: Duration(milliseconds: 5000),
        //   ),
        // );
        return true;
      },
      backgroundColor: const Color(0xffF5F5F5),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(122.w),
        child: CustomAppBar(
          hasMdTitle: false,
          // hasBackButton: true,

          drawerTitle: "MDShop",
          // onBackPressed: () {
          //   Navigator.pushReplacement(
          //       context,
          //       MaterialPageRoute(
          //           builder: (context) => PaymentView(
          //                 id: widget.PackageId,
          //               )));
          // },
          // hasBackButton: true,
          // hasMdTitle: true,
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
            Image.asset(
              'assets/images/katman_1.png',
              height: 89.h,
              width: 100.w,
              // fit: BoxFit.fitWidth,
            ),
            SizedBox(
              height: 20.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Your payment has been\ncompleted successfully",
                  style: TextStyle(
                      fontFamily: 'Campton',
                      color: black,
                      // letterSpacing: .5,
                      fontSize: 26.sp,
                      fontWeight: FontWeight.w700),
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
                    text: watchPayment.orderIdsho,
                    style: TextStyle(
                        fontFamily: 'Campton',
                        color: kDefaultActiveColor,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w700),
                    recognizer: new TapGestureRecognizer()
                      ..onTap = () {
                        // Navigator.push(
                        //   context,
                        //   SlidePageRoute(
                        //     page: SearchView(
                        //       cityName: watch.cityName,
                        //       packageId: watch.packageId.toString(),
                        //       refresh: true,
                        //       // price: watch.salePrice,
                        //     ),
                        //     direction: SlideDirection
                        //         .right, // Specify the slide direction here
                        //     delay: Duration(milliseconds: 5000),
                        //   ),
                        //   // MaterialPageRoute(
                        //   //     builder: (context) => SearchDetailsView(
                        //   //           packageId: watch.packageId,
                        //   //         ))
                        // );
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
              height: 20.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                RichText(
                  // textAlign: TextAlign.start,
                  text: TextSpan(
                    text: 'You can visit the orders page to view your ',
                    style: TextStyle(
                        fontFamily: 'Campton',
                        color: Colors.black,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500),

                    /*defining default style is optional */
                    children: <TextSpan>[
                      TextSpan(
                        text: '"Orders"',
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
                                page: OrderMdShopView(
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
                        text:
                            ', \n        or you can request order by visiting the \n     ',
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
                        text: 'Shop HomePage',
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
                                page: MdShopHomePageView(),
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
                      TextSpan(
                        text: ' to see your shop products.',
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
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 40.h,
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
                  MaterialPageRoute(builder: (context) => MdShopHomePageView()),
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
