// import 'dart:ui';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:md_health/Screens/auth/controller/login_view_controller.dart';
// import 'package:md_health/Screens/auth/view/successful_view.dart';
// import 'package:md_health/Screens/bottom_navigation/view/bottom_view.dart';
// import 'package:md_health/Screens/main/view/main_screen_view.dart';
// import 'package:md_health/utils/utils.dart';
// import 'package:md_health/widget/buttons.dart';
// import 'package:provider/provider.dart';

// class LoginOtoView extends StatefulWidget {
//   final String verificationId;

//   const LoginOtoView({super.key, required this.verificationId});

//   @override
//   State<LoginOtoView> createState() =>
//       _LoginOtoViewState(verificationId: verificationId);
// }

// class _LoginOtoViewState extends State<LoginOtoView> {
//   final String verificationId;
//   String verificationCode = '';
//   _LoginOtoViewState({required this.verificationId});

//   @override
//   Widget build(BuildContext context) {
//     final read = context.read<LoginViewController>();
//     final watch = context.watch<LoginViewController>();

//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: Stack(
//         children: [
//           Positioned(
//             child: _circle(),
//             bottom: -5,
//             right: -5,
//           ),
//           Positioned(
//             child: _circle(),
//             top: -5,
//             left: -5,
//           ),
//           BackdropFilter(
//             filter: ImageFilter.blur(sigmaX: 150, sigmaY: 150),
//             child: Container(
//               color: Colors.transparent,
//             ),
//           ),
//           Column(
//             children: [
//               SizedBox(
//                 height: 30.h,
//               ),
//               Image.asset(
//                 "assets/images/md_logo.png",
//                 width: 60.w,
//                 height: 70.h,
//                 // fit: BoxFit.fill,s
//               ),
//               SizedBox(
//                 height: 50.h,
//               ),
//               Text(
//                 "ENTER DIGIT CODE",
//                 style: TextStyle(
//                     color: Colors.white,
//                     letterSpacing: 3,
//                     fontSize: 10.sp,
//                     fontWeight: FontWeight.w500),
//               ),
//               SizedBox(
//                 height: 30.h,
//               ),
//               OtpTextField(
//                 fieldWidth: 45,
//                 borderWidth: 1.w,
//                 borderRadius: BorderRadius.circular(15),
//                 focusedBorderColor: const Color(0xff4CDB06),
//                 numberOfFields: 6,
//                 // borderColor: Color.fromARGB(255, 219, 6, 6),
//                 //set to true to show as box or false to show as dash
//                 showFieldAsBox: true,
//                 //runs when a code is typed in
//                 onCodeChanged: (String code) {
//                   //handle validation or checks here
//                 },
//                 textStyle: const TextStyle(
//                   color: Colors.white, // Set your desired text color
//                   fontSize: 16.0, // Set your desired font size
//                   fontWeight: FontWeight.bold, // Set your desired font weight
//                   // Add more text style properties as needed
//                 ),

//                 //runs when every textfield is filled
//                 onSubmit: (String code) {
//                   read.setVerificationCode(code);
//                 }, // end onSubmit
//                 // margin: EdgeInsets.symmetric(horizontal: 10.0),
//               ),
//               SizedBox(
//                 height: 40.h,
//               ),
//               Container(
//                 padding: EdgeInsets.only(
//                   // top: 21.w,
//                   bottom: 40.w,
//                 ),
//                 margin: EdgeInsets.only(
//                   left: 21.w,
//                   right: 17.w,
//                 ),
//                 child: PrimaryButton(
//                   width: 295.w,
//                   // borderRadius: BorderRadius.circular(),
//                   borderRadius: 30,
//                   // width: ScreenUtil().screenWidth,
//                   color: const Color(0xff4CDB06),
//                   onTap: () async {
//                     // if (watch.verificationCode != '') {
//                     //   try {
//                     //     debugPrint('I came in');
//                     //     PhoneAuthCredential credential =
//                     //         PhoneAuthProvider.credential(
//                     //       verificationId: widget.verificationId,
//                     //       smsCode: watch.verificationCode,
//                     //       // smsCode: '123456',
//                     //     );
//                     //     UserCredential userCredential = await FirebaseAuth
//                     //         .instance
//                     //         .signInWithCredential(credential);

//                     //     User? user = userCredential.user;
//                     //     if (user != null) {
//                     //       Navigator.push(
//                     //           context,
//                     //           MaterialPageRoute(
//                     //               builder: (context) => SuccessfulScreen()));
//                     //     } else {
//                     //       Utils.showPrimarySnackbar(
//                     //           context, 'Otp Verification Failed',
//                     //           type: SnackType.error);
//                     //     }
//                     //   } catch (e) {
//                     //     Utils.showPrimarySnackbar(context, e,
//                     //         type: SnackType.error);
//                     //   }
//                     // } else {
//                     //   showDialog(
//                     //     context: context,
//                     //     builder: (BuildContext context) => AlertDialog(
//                     //       title: Text('Please Enter The Otp'),
//                     //       actions: [
//                     //         GestureDetector(
//                     //           onTap: () => Navigator.pop(context),
//                     //           child: Container(
//                     //             padding: EdgeInsets.all(10.w),
//                     //             child: Text('Cancel'),
//                     //           ),
//                     //         )
//                     //       ],
//                     //     ),
//                     //   );
//                     // }
//                   },
//                   child: Text(
//                     "Confirm",
//                     style: TextStyle(
//                         color: Colors.black,
//                         // letterSpacing: .5,
//                         fontSize: 16.sp,
//                         fontWeight: FontWeight.w600),
//                   ),
//                 ),
//               ),
//               RichText(
//                 textAlign: TextAlign.center,
//                 text: TextSpan(
//                   text: "Didn't receive the SMS?\n",
//                   style: TextStyle(
//                       fontFamily: 'Campton',
//                       color: Colors.white,
//                       fontSize: 13.sp,
//                       letterSpacing: -1,
//                       fontWeight: FontWeight.w500),

//                   /*defining default style is optional */
//                   children: <TextSpan>[
//                     TextSpan(
//                       text: 'Click Here',
//                       style: TextStyle(
//                           fontFamily: 'Campton',
//                           decoration: TextDecoration.underline,
//                           color: const Color(0xff4CDB06),
//                           fontSize: 13.sp,
//                           fontWeight: FontWeight.w600),
//                       recognizer: new TapGestureRecognizer()
//                         ..onTap = () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //       builder: (context) =>
                          //           const NewMainScreenView()),
                          // );
//                         },
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

// Widget _circle() {
//   return Container(
//     height: 100,
//     width: 100,
//     decoration: const BoxDecoration(
//       shape: BoxShape.circle,
//       color: Color(0xff4CDB06),
//     ),
//   );
// }
