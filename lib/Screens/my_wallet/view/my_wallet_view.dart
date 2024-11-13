import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:md_health/Screens/my_wallet/controller/my_wallet_controller.dart';
import 'package:md_health/Screens/my_wallet/view/invite_frients_view.dart';
import 'package:md_health/constants/styles/colors.dart';
import 'package:md_health/test_widget.dart';
import 'package:md_health/widget/base_screen.dart';
import 'package:md_health/widget/buttons.dart';
import 'package:md_health/widget/custom_appbar.dart';
import 'package:provider/provider.dart';

class MyWalletScreenView extends StatefulWidget {
  const MyWalletScreenView({super.key});

  @override
  State<MyWalletScreenView> createState() => _MyWalletScreenViewState();
}

class _MyWalletScreenViewState extends State<MyWalletScreenView> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<MyWalletScreenController>().initState(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    // final watchcoin = context.watch<PaymentController>();
    final read = context.watch<MyWalletScreenController>();
    final watch = context.watch<MyWalletScreenController>();
    return BaseScreen(
      onWillPop: () async {
        //  Navigator.pushReplacement(context,
        //     MaterialPageRoute(builder: (context) => NewMainScreenView()));

        return false;
      },
      backgroundColor: const Color(0xffFBFBFB),
      //  backgroundColor: Color(0xffF5F5F5),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(130.w),
        child: CustomAppBar(
          // hasBackButton: true,
          // onBackPressed: () {
          //   Navigator.pushReplacement(context,
          //       MaterialPageRoute(builder: (context) => PaymentDetailsView()));
          // },
          hasMdTitle: false,
          drawerTitle: "Wallet",
        ),
      ),
      content: Column(
        children: [
          SizedBox(
            height: 28.h,
          ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     Text(
          //       'MDcoin',
          //   style: TextStyle(
          //       fontFamily: 'Campton',
          //       fontSize: 29,
          //       color: kDefaultActiveColor,
          //       fontWeight: FontWeight.w700,
          //       letterSpacing: -1),
          // ),
          //   ],
          // ),
          // SizedBox(
          //   height: 15.h,
          // ),
          RichText(
            // textAlign: TextAlign.start,
            text: TextSpan(
              text: "1 MD",
              style: TextStyle(
                  fontFamily: 'Campton',
                  color: Colors.black,
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w700),

              /*defining default style is optional */
              children: <TextSpan>[
                TextSpan(
                  text: 'coin ',
                  style: TextStyle(
                      fontFamily: 'Campton',
                      color: Colors.black,
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w400),
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
                  text: '= 1 Turkish Lira',
                  style: TextStyle(
                      fontFamily: 'Campton',
                      color: Colors.black,
                      fontSize: 16.sp,
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

          Container(
            padding: EdgeInsets.only(left: 20.w, top: 17.w, right: 20.w),
            child: Stack(
              children: [
                Image.asset("assets/images/Rectangle.png"),
                Positioned(
                  left: 20.w,
                  // right: 5,
                  top: 50.w,
                  // bottom: 0,
                  child:
                      // Text("data")
                      RichText(
                    // textAlign: TextAlign.start,
                    text: TextSpan(
                      text: "Available",
                      style: TextStyle(
                          fontFamily: 'Campton',
                          color: Colors.black,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w500),

                      /*defining default style is optional */
                      children: <TextSpan>[
                        TextSpan(
                          text: ' MD',
                          style: TextStyle(
                              fontFamily: 'Campton',
                              color: Colors.black,
                              fontSize: 20.sp,
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
                          text: 'coins\n',
                          style: TextStyle(
                              fontFamily: 'Campton',
                              color: Colors.black,
                              fontSize: 16.sp,
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
                          text: '${watch.coins ?? 0}',
                          style: TextStyle(
                              fontFamily: 'Campton',
                              color: Colors.black,
                              fontSize: 34.sp,
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
                ),
                Positioned(
                  right: 10,
                  bottom: 10,
                  child: Image.asset(
                    "assets/images/md coin 3d.png",
                    height: 154.h,
                    width: 154.w,
                  ),
                ),
                Positioned(
                  bottom: 30.w,
                  left: 15.w,
                  child: PrimaryButton(
                    width: 130.w,
                    height: 35.h,
                    borderColor: Colors.black,
                    borderRadius: 30,
                    color: Colors.transparent,
                    onTap: () {
                      // showDialog(
                      //     context: context,
                      //     builder: (BuildContext context) {
                      //       return AlertDialog(
                      //           backgroundColor: Color(0xff4CDB06),
                      //           shape: RoundedRectangleBorder(
                      //               borderRadius: BorderRadius.all(
                      //                   Radius.circular(15.0))),
                      //           // insetPadding:
                      //           //    EdgeInsets.all(0),
                      //           // contentPadding: EdgeInsets.only(top: 0.0),/
                      //           content: Container(
                      //             child: Column(
                      //               crossAxisAlignment: CrossAxisAlignment.end,
                      //               mainAxisSize: MainAxisSize.min,
                      //               children: [
                      //                 Row(
                      //                   mainAxisAlignment:
                      //                       MainAxisAlignment.end,
                      //                   crossAxisAlignment:
                      //                       CrossAxisAlignment.start,
                      //                   children: [
                      //                     Image.asset(
                      //                       "assets/images/md coin 3d.png",
                      //                       height: 154.h,
                      //                       width: 154.w,
                      //                     ),
                      //                     SizedBox(
                      //                       width: 20.w,
                      //                     ),
                      //                     GestureDetector(
                      //                       onTap: () {
                      //                         Navigator.pop(context);
                      //                       },
                      //                       child: SvgPicture.asset(
                      //                           "assets/icons/red_close.svg"),
                      //                     ),
                      //                   ],
                      //                 ),
                      //                 Center(
                      //                   child: Text(
                      //                     "You don't have enough MDCoin. You can earn MDCoin by inviting friends.",
                      //                     textAlign: TextAlign.center,
                      //                     style: TextStyle(
                      //                         fontFamily: 'Campton',
                      //                         color: Colors.black,
                      //                         // letterSpacing: .5,
                      //                         fontSize: 19.sp,
                      //                         fontWeight: FontWeight.w600),
                      //                   ),
                      //                 ),
                      //                 SizedBox(
                      //                   height: 30.h,
                      //                 ),
                      //                 Container(
                      //                   padding: EdgeInsets.only(
                      //                       left: 18.0.w, right: 18.0.w),
                      //                   child: PrimaryButton(
                      //                     // borderColor: Colors.black,
                      //                     width: 352.w,
                      //                     height: 40.w,

                      //                     borderRadius: 30,

                      //                     color: black,
                      //                     // color: kDefaultActiveColor,
                      //                     onTap: () {
                      //                       Navigator.pop(context);

                      //                       Navigator.push(
                      //                         context,
                      //                         MaterialPageRoute(
                      //                             builder: (context) =>
                      //                                 InviteFriendsView()),
                      //                       );
                      //                     },
                      //                     child: Text(
                      //                       "Invite Friends",
                      //                       style: TextStyle(
                      //                           fontFamily: 'Campton',
                      //                           color: Colors.white,
                      //                           // letterSpacing: .5,
                      //                           fontSize: 16.sp,
                      //                           fontWeight: FontWeight.w600),
                      //                     ),
                      //                   ),
                      //                 ),
                      //               ],
                      //             ),
                      //           ));
                      //     });
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //       builder: (context) => LoginScreenView()),
                      // );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Use My MD",
                          style: TextStyle(
                              fontFamily: 'Campton',
                              color: Colors.black,
                              // letterSpacing: .5,
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w700),
                        ),
                        Text(
                          "coin",
                          style: TextStyle(
                              fontFamily: 'Campton',
                              color: Colors.black,
                              // letterSpacing: .5,
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 37.h,
          ),
          Text(
            'invite your friends',
            style: TextStyle(
                fontFamily: 'Campton',
                fontSize: 36.sp,
                color: black,
                fontWeight: FontWeight.w500,
                letterSpacing: -1),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize:
                MainAxisSize.min, // Set mainAxisSize to minimize space

            children: [
              RichText(
                // textAlign: TextAlign.start,
                text: TextSpan(
                  text: "and ",
                  style: TextStyle(
                      fontFamily: 'Campton',
                      color: Colors.black,
                      fontSize: 35.sp,
                      fontWeight: FontWeight.w700),

                  /*defining default style is optional */
                  children: <TextSpan>[
                    TextSpan(
                      text: 'earn ',
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: kDefaultActiveColor,
                          fontSize: 35.sp,
                          fontFamily: 'Campton',
                          fontWeight: FontWeight.bold),
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
              Text(
                "MD",
                textAlign: TextAlign.center, // Align "MD" within its own space

                style: TextStyle(
                    fontFamily: 'Campton',
                    color: Colors.black,
                    fontSize: 47.sp,
                    fontWeight: FontWeight.w700),
              ),
              Text(
                "coin.",
                textAlign: TextAlign.left, // Align "MD" within its own space

                style: TextStyle(
                    fontFamily: 'Campton',
                    color: Colors.black,
                    fontSize: 36.sp,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),

          SizedBox(
            height: 32.h,
          ),
          PrimaryButton(
            width: 200.w,
            height: 40.h,
            borderColor: kDefaultActiveColor,
            borderRadius: 30,
            color: Colors.transparent,
            onTap: () {
              Navigator.push(
                context,
                SlidePageRoute(
                  page: InviteFriendsView(
                      // packageId:
                      //     widget.packageId,
                      ),
                  direction:
                      SlideDirection.right, // Specify the slide direction here
                  delay: Duration(milliseconds: 5000),
                ),
                // MaterialPageRoute(builder: (context) => InviteFriendsView()),
              );
            },
            child: Text(
              "Invite Friends",
              style: TextStyle(
                  fontFamily: 'Campton',
                  color: Colors.black,
                  // letterSpacing: .5,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w700),
            ),
          ),
          SizedBox(
            height: 100.h,
          ),
        ],
      ),
    );
  }
}
