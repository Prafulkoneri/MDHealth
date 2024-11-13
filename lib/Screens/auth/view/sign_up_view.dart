// import 'dart:ui';
// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/scheduler.dart';
// import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:intl/intl.dart';
// import 'package:md_health/Screens/auth/controller/signup_view_controller.dart';
// import 'package:md_health/Screens/auth/view/login_view.dart';
// import 'package:md_health/constants/styles/colors.dart';
// import 'package:md_health/utils/utils.dart';
// import 'package:md_health/widget/buttons.dart';
// import 'package:md_health/widget/drop_down.dart';
// import 'package:md_health/widget/text_field.dart';
// import 'package:provider/provider.dart';

// class SignUpView extends StatefulWidget {
//   const SignUpView({super.key});

//   @override
//   State<SignUpView> createState() => _SignUpViewState();
// }

// class _SignUpViewState extends State<SignUpView> with TickerProviderStateMixin {
//   @override
//   void initState() {
//     super.initState();
//     SchedulerBinding.instance.addPostFrameCallback((_) {
//       context.read<SignupViewController>().initState(
//             context,
//           );
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final watch = context.watch<SignupViewController>();
//     final read = context.read<SignupViewController>();

//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: Stack(
//         children: [
//           Positioned(
//             bottom: -5,
//             right: -5,
//             child: _circle(),
//           ),
//           Positioned(
//             top: -5,
//             left: -5,
//             child: _circle(),
//           ),
//           BackdropFilter(
//             filter: ImageFilter.blur(sigmaX: 150, sigmaY: 150),
//             child: Container(
//               color: Colors.transparent,
//             ),
//           ),
//           SingleChildScrollView(
//             physics: const BouncingScrollPhysics(),
//             child: Column(
//               children: [
//                 SizedBox(
//                   height: 35.h,
//                 ),
//                 Image.asset(
//                   "assets/images/md_logo.png",
//                   width: 70.w,
//                   height: 60.h,
//                   // fit: BoxFit.fill,s
//                 ),
//                 SizedBox(
//                   height: 40.h,
//                 ),
//                 Padding(
//                   padding: EdgeInsets.only(left: 32.w, right: 32.w),
//                   child: PrimarySTextFormFieldNew(
//                     controller: watch.firstNameController,
//                     textCapitalization: TextCapitalization.words,
//                     titleHeader: "FIRST NAME",
//                     textInputAction: TextInputAction.next,
//                     onEditingComplete: read.onFirstNameEditingComplete,
//                     focusNode: watch.firstNameFocusNode,
//                     titleStyle: TextStyle(
//                       letterSpacing: 3,
//                       fontWeight: FontWeight.w500,
//                       fontSize: 10.sp,
//                       color: const Color(0xffFFFFFF),
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 25.h,
//                 ),
//                 Padding(
//                   padding: EdgeInsets.only(left: 32.w, right: 32.w),
//                   child: PrimarySTextFormFieldNew(
//                     controller: watch.lastNameController,
//                     textCapitalization: TextCapitalization.words,
//                     titleHeader: "LAST NAME",
//                     textInputAction: TextInputAction.next,
//                     onEditingComplete: read.onLastNameEditingComplete,
//                     focusNode: watch.lastNameFocusNode,
//                     titleStyle: TextStyle(
//                       letterSpacing: 3,
//                       fontWeight: FontWeight.w500,
//                       fontSize: 10.sp,
//                       color: const Color(0xffFFFFFF),
//                     ),
//                     //                 inputFormatters: [
//                     // FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]')),
//                     // ],
//                   ),
//                 ),
//                 SizedBox(
//                   height: 25.h,
//                 ),
//                 Padding(
//                   padding: EdgeInsets.only(left: 32.w, right: 32.w),
//                   child: MobileNoTextFormField(
//                     controller: watch.mobController,
//                     focusNode: watch.mobFocusNode,
//                     onEditingComplete: () {
//                       read.onMobEditingComplete(); // Your existing method

//                       // Validate the mobile number length
//                       if (watch.mobController.text.length != 10) {
//                         Utils.showPrimarySnackbar(
//                           context,
//                           'Please enter a valid 10-digit Mobile Number',
//                           type: SnackType.error,
//                         );
//                       }
//                     },
//                     textInputAction: TextInputAction.next,
//                     titleHeader: "YOUR MOBILE NUMBER",
//                     onChanged: (value) {},
//                     onCountryCodeChanged: (value) {},
//                     enableOrder: true,
//                   ),

//                   //
//                 ),
//                 SizedBox(
//                   height: 25.h,
//                 ),
//                 Padding(
//                   padding: EdgeInsets.only(left: 32.w, right: 32.w),
//                   child: PrimarySTextFormField(
//                     // isOptional: true,
//                     controller: watch.emailIdController,
//                     focusNode: watch.emailIdFocusNode,
//                     onEditingComplete: read.onEmailIdEditingComplete,
//                     textInputAction: TextInputAction.next,
//                     titleHeader: "E-MAIL", isOptional: true,
//                   ),
//                 ),
//                 SizedBox(
//                   height: 25.h,
//                 ),
//                 Padding(
//                   padding: EdgeInsets.only(left: 32.w, right: 32.w),
//                   child: PrimarySTextFormField(
//                     isOptional: false,
//                     controller: watch.passwordController,
//                     focusNode: watch.passwordFocusNode,
//                     onEditingComplete: () {
//                       read.onPasswordEditingComplete(); // Your existing method

//                       // Validate the password length
//                       if (watch.passwordController.text.length != 8) {
//                         Utils.showPrimarySnackbar(
//                           context,
//                           'Password must be exactly 8 characters long',
//                           type: SnackType.error,
//                         );
//                       }
//                     },
//                     textInputAction: TextInputAction.next,
//                     isPasswordFeild: true,
//                     titleHeader: "PASSWORD ",
//                   ),
//                 ),
//                 SizedBox(
//                   height: 25.h,
//                 ),
//                 Padding(
//                   padding: EdgeInsets.only(left: 32.w, right: 32.w),
//                   child: PrimarySTextFormFieldNew(
//                     // isOptional: false,
//                     controller: watch.repasswordController,
//                     focusNode: watch.repasswordFocusNode,
//                     onEditingComplete: read.onRepasswordEditingComplete,
//                     textInputAction: TextInputAction.next,
//                     isPasswordFeild: true,
//                     titleHeader: "RE-PASSWORD",
//                   ),
//                 ),
//                 SizedBox(
//                   height: 25.h,
//                 ),
//                 Padding(
//                   padding: EdgeInsets.only(left: 32.w, right: 32.w),
//                   child: GestureDetector(
//                     child: PrimarySTextFormField(
//                       isOptional: true,
//                       onTap: () async {
//                         var datePicked = await DatePicker.showSimpleDatePicker(
//                           context,
//                           initialDate: DateTime(2020),
//                           firstDate: DateTime(1900),
//                           lastDate: DateTime(2090),
//                           dateFormat: "dd-MMMM-yyyy",
//                           locale: DateTimePickerLocale.en_us,
//                           looping: true,
//                         );
//                         if (datePicked != null) {
//                           String date = DateFormat('dd-MM-yyy')
//                               .format(datePicked ?? DateTime.now());
//                           read.onDateSelected(date);
//                         }
//                         // final snackBar = SnackBar(
//                         //     content: Text("Date Picked $datePicked"));
//                         // ScaffoldMessenger.of(context).showSnackBar(snackBar);
//                       },
//                       controller: watch.birthDateController,
//                       titleHeader: "Birth Date",
//                       // hintText: "Date of Birth",
//                       suffix: GestureDetector(
//                         onTap: () async {
//                           var datePicked =
//                               await DatePicker.showSimpleDatePicker(
//                             context,
//                             initialDate: DateTime(2020),
//                             firstDate: DateTime(1900),
//                             lastDate: DateTime(2090),
//                             dateFormat: "dd-MMMM-yyyy",
//                             locale: DateTimePickerLocale.en_us,
//                             looping: true,
//                           );
//                           if (datePicked != null) {
//                             String date = DateFormat('dd-MM-yyy')
//                                 .format(datePicked ?? DateTime.now());
//                             read.onDateSelected(date);
//                           }
//                           // final snackBar = SnackBar(
//                           //     content: Text("Date Picked $datePicked"));
//                           // ScaffoldMessenger.of(context)
//                           //     .showSnackBar(snackBar);
//                         },
//                         child: const Icon(Icons.calendar_today_outlined,
//                             color: Colors.white),
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 25.h,
//                 ),
//                 Padding(
//                   padding: EdgeInsets.only(left: 32.w, right: 32.w),
//                   child: SignUpDropDown(
//                     optionalText:
//                         "(optional)", // Specify the optional text here

//                     focusNode: watch.genderFocusNode,
//                     titleHeader: "GENDER ",
//                     onChanged: (value) {
//                       read.onSelectGender(value);
//                     },
//                     hint: "Male",
//                     // Replace with your actual value
//                     value:
//                         read.selectedGender, // Replace with your actual value

//                     items: [
//                       DropdownMenuItem(
//                         value: "male",
//                         child: Text(
//                           "Male",
//                           style: TextStyle(
//                             letterSpacing: 3,
//                             color: Colors.white,
//                             fontFamily: 'Campton',
//                             fontSize: 18.sp,
//                             fontWeight: FontWeight.w400,
//                             // letterSpacing: isPasswordFeild ? 0 : -0.5
//                           ),
//                         ),
//                       ),
//                       DropdownMenuItem(
//                         value: "female",
//                         child: Text(
//                           "Female",
//                           style: TextStyle(
//                             letterSpacing: 3,
//                             color: Colors.white,
//                             fontFamily: 'Campton',
//                             fontSize: 18.sp,
//                             fontWeight: FontWeight.w400,
//                             // letterSpacing: isPasswordFeild ? 0 : -0.5
//                           ),
//                         ),
//                       ),
//                       DropdownMenuItem(
//                         value: "other",
//                         child: Text(
//                           "Other",
//                           style: TextStyle(
//                             letterSpacing: 3,
//                             color: Colors.white,
//                             fontFamily: 'Campton',
//                             fontSize: 18.sp,
//                             fontWeight: FontWeight.w400,
//                             // letterSpacing: isPasswordFeild ? 0 : -0.5
//                           ),
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//                 SizedBox(
//                   height: 25.h,
//                 ),
//                 Padding(
//                     padding: EdgeInsets.only(left: 32.w, right: 32.w),
//                     child: watch.countryList == ""
//                         ? SignUpDropDown(
//                             items: watch.countryList
//                                 ?.map((item) => DropdownMenuItem<String>(
//                                       value: item.id.toString(),
//                                       child: Text(
//                                         item.countryName ?? "",
//                                         style: TextStyle(
//                                           letterSpacing: 3,
//                                           color: Colors.white,
//                                           fontFamily: 'Campton',
//                                           fontSize: 18.sp,
//                                           fontWeight: FontWeight.w400,
//                                           // letterSpacing: isPasswordFeild ? 0 : -0.5
//                                         ),
//                                       ),
//                                     ))
//                                 .toList(),
//                             titleHeader: "COUNTRY",
//                             onChanged: (value) async {
//                               print(value.toString());
//                               await read.onSelectCountryType(int.parse(value));
//                               read.getCities(context);
//                               // await read.onSelectCoutryType(value);
//                             },
//                             value: watch.countryListId?.toString() ??
//                                 null, // Use null if the list is empty
//                           )
//                         : SignUpDropDown(
//                             items: watch.countryList
//                                 ?.map((item) => DropdownMenuItem<String>(
//                                       value: item.id.toString(),
//                                       child: Text(
//                                         item.countryName ?? "",
//                                         style: TextStyle(
//                                           letterSpacing: 3,
//                                           color: Colors.white,
//                                           fontFamily: 'Campton',
//                                           fontSize: 18.sp,
//                                           fontWeight: FontWeight.w400,
//                                           // letterSpacing: isPasswordFeild ? 0 : -0.5
//                                         ),
//                                       ),
//                                     ))
//                                 .toList(),
//                             titleHeader: "COUNTRY",
//                             onChanged: (value) async {
//                               print(value.toString());
//                               await read.onSelectCountryType(int.parse(value));
//                               read.getCities(context);
//                               // await read.onSelectCoutryType(value);
//                             },
//                             value: watch.countryListId?.toString() ??
//                                 null, // Use null if the list is empty
//                           )),
//                 SizedBox(
//                   height: 25.h,
//                 ),
//                 Padding(
//                   padding: EdgeInsets.only(left: 32.w, right: 32.w),
//                   child: SignUpDropDown(
//                     items: watch.cityList
//                         ?.map((item) => DropdownMenuItem<String>(
//                               value: item.id.toString(),
//                               child: Text(
//                                 item.cityName ?? "",
//                                 style: TextStyle(
//                                   letterSpacing: 3,
//                                   color: Colors.white,
//                                   fontFamily: 'Campton',
//                                   fontSize: 18.sp,
//                                   fontWeight: FontWeight.w400,
//                                 ),
//                               ),
//                             ))
//                         .toList(),
//                     titleHeader: "CITY",
//                     onChanged: (value) {
//                       print(value.toString());
//                       read.onSelectCityType(int.parse(value));
//                       // await read.onSelectCoutryType(value);
//                     },
//                     value: watch.cityListId?.toString() ?? null,
//                   ),
//                 ),
//                 SizedBox(
//                   height: 25.h,
//                 ),
//                 Padding(
//                   padding: EdgeInsets.only(left: 32.w, right: 32.w),
//                   child:
//                       // PrimarySTextFormField(
//                       //   controller: watch.emailIdController,
//                       //   focusNode: watch.emailIdFocusNode,
//                       //   onEditingComplete: read.onEmailIdEditingComplete,
//                       //   textInputAction: TextInputAction.next,
//                       //   titleHeader: "E-MAIL",
//                       // ),
//                       PrimarySTextFormField(
//                     isOptional: true,
//                     focusNode: watch.addresFocusNode,
//                     onEditingComplete: read.onAddressEditingCompleted,
//                     controller: watch.addressController,
//                     textCapitalization: TextCapitalization.words,
//                     titleHeader: "ADDRESS",
//                   ),
//                 ),
//                 SizedBox(
//                   height: 40.h,
//                 ),
//                 Container(
//                   margin: EdgeInsets.only(
//                     left: 35.w,
//                     right: 32.w,
//                   ),
//                   child: RichText(
//                     text: TextSpan(
//                       style: TextStyle(
//                           fontFamily: 'Campton',
//                           letterSpacing: -1,
//                           fontWeight: FontWeight.w500,
//                           fontSize: 14.sp,
//                           color: Colors.white),
//                       children: [
//                         WidgetSpan(
//                           child: GestureDetector(
//                             onTap: () {
//                               read.onChecked();
//                             },
//                             child: Container(
//                               margin:
//                                   EdgeInsets.only(right: 5.w, bottom: 2.5.w),
//                               height: 13.h,
//                               width: 16.w,
//                               decoration: BoxDecoration(
//                                   color: watch.isChecked
//                                       ? kDefaultActiveColor
//                                       : const Color(0xffD9D9D9),
//                                   borderRadius: const BorderRadius.all(
//                                       Radius.circular(2))),
//                             ),
//                           ),
//                         ),
//                         const TextSpan(
//                           text: ' I accept ',
//                         ),
//                         TextSpan(
//                           recognizer: TapGestureRecognizer()
//                             ..onTap = () {
//                               read.launchTermsAndConditionURL();
//                               print('Login Text Clicked');
//                             },
//                           children: [],
//                           text: 'Terms and Condition ',
//                           style: TextStyle(
//                               fontFamily: 'Campton',
//                               color: kDefaultActiveColor,
//                               decoration: TextDecoration.underline),
//                         ),
//                         const TextSpan(
//                           text: '& I agree to the ',
//                         ),
//                         TextSpan(
//                           recognizer: TapGestureRecognizer()
//                             ..onTap = () {
//                               read.launchPrivacyPolicyURL();
//                               print('Login Text Clicked');
//                             },
//                           text: 'User Data Consent.',
//                           style: TextStyle(
//                               fontFamily: 'Campton',
//                               color: kDefaultActiveColor,
//                               decoration: TextDecoration.underline),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 40.h,
//                 ),
//                 PrimaryButton(
//                   width: 300.w,
//                   // borderRadius: BorderRadius.circular(),
//                   borderRadius: 30,
//                   height: 45.h,
//                   // width: ScreenUtil().screenWidth,
//                   color: const Color(0xff4CDB06),
//                   // style: style,
//                   // onTap: () async {
//                   //   await read.NewRegistration(context).then((value) async {
//                   //     // if (watch.isLoginBtnEnabled) {
//                   //     //   return;
//                   //     // }
//                   //     if (watch.mobController.text.length < 10) {
//                   //       return;
//                   //     }
//                   //   });
//                   // },
//                   onTap: () async {
//                     if (watch.firstNameController.text.isEmpty) {
//                       Utils.showPrimarySnackbar(context, 'Enter First Name',
//                           type: SnackType.error);
//                     } else if (watch.lastNameController.text.isEmpty) {
//                       Utils.showPrimarySnackbar(context, 'Enter Last Name',
//                           type: SnackType.error);
//                     } else if (watch.mobController.text.isEmpty ||
//                         watch.mobController.text.length < 10) {
//                       Utils.showPrimarySnackbar(
//                           context, 'Enter 10 Digits Mobile Number',
//                           type: SnackType.error);
//                     } else {
//                       await read.NewRegistration(context)
//                           .then((value) async {});
//                     }
//                   },
//                   child: Text(
//                     "Sign Up",
//                     style: TextStyle(
//                         fontFamily: 'Campton',
//                         color: Colors.black,
//                         // letterSpacing: .5,
//                         fontSize: 16.sp,
//                         fontWeight: FontWeight.w600),
//                   ),
//                 ),

//                 SizedBox(
//                   height: 36.h,
//                 ),
//                 // Text(
//                 //   "You have already account?\n",
//                 // style: TextStyle(
//                 //     fontFamily: 'Campton',
//                 //     color: Colors.white,
//                 //     fontSize: 13.sp,
//                 //     // letterSpacing: -1,
//                 //     fontWeight: FontWeight.w400),
//                 // ),
//                 Text(
//                   "You have already account?",
//                   style: TextStyle(
//                       fontFamily: 'Campton',
//                       color: Colors.white,
//                       fontSize: 14.sp,
//                       // letterSpacing: -1,
//                       fontWeight: FontWeight.w400),
//                 ),
//                 SizedBox(
//                   height: 5.h,
//                 ),
//                 GestureDetector(
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) => const LoginScreenView()),
//                     );
//                   },
//                   child: Text(
//                     "Click Here",
//                     style: TextStyle(
//                         fontFamily: 'Campton',
//                         decoration: TextDecoration.underline,
//                         color: const Color(0xff4CDB06),
//                         fontSize: 16.sp,
//                         fontWeight: FontWeight.w700),
//                   ),
//                 ),
//                 // RichText(
//                 //   textAlign: TextAlign.center,
//                 //   text: TextSpan(
//                 //     text: 'You have already account?\n',
//                 //     style: TextStyle(
//                 //         fontFamily: 'Campton',
//                 //         color: Colors.white,
//                 //         fontSize: 14.sp,
//                 //         letterSpacing: -1,
//                 //         fontWeight: FontWeight.w400),
//                 //     /*defining default style is optional */
//                 //     children: <TextSpan>[
//                 //       TextSpan(
//                 //         text: 'Click Here',
//                 //         style: TextStyle(
//                 //             color: const Color(0xff4CDB06),
//                 //             fontSize: 14.sp,
//                 //             // letterSpacing: -1,/
//                 //             fontFamily: 'Campton',
//                 //             decoration: TextDecoration.underline,
//                 //             fontWeight: FontWeight.w700),
//                 //         recognizer: new TapGestureRecognizer()
//                 //           ..onTap = () {
//                 // Navigator.push(
//                 //   context,
//                 //   MaterialPageRoute(
//                 //       builder: (context) =>
//                 //           const LoginScreenView()),
//                 // );
//                 //           },
//                 //       ),
//                 //     ],
//                 //   ),
//                 // ),
//                 SizedBox(
//                   height: 50.h,
//                 ),
//               ],
//             ),
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
import 'dart:ui';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:md_health/Screens/auth/controller/signup_view_controller.dart';
import 'package:md_health/Screens/auth/view/login_view.dart';
import 'package:md_health/constants/styles/colors.dart';
import 'package:md_health/utils/utils.dart';
import 'package:md_health/widget/buttons.dart';
import 'package:md_health/widget/drop_down.dart';
import 'package:md_health/widget/text_field.dart';
import 'package:provider/provider.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      context.read<SignupViewController>().initState(
            context,
          );
    });
  }

  void validateMobileNumber(String phoneNumber, String countryCode) {
    Map<String, int> countryPhoneLengths = {
      '+91': 10, // India
      // Add other country codes and their lengths here
    };

    if (countryPhoneLengths.containsKey(countryCode)) {
      if (phoneNumber.length != countryPhoneLengths[countryCode]) {
        Utils.showPrimarySnackbar(
          context,
          'Please enter a valid ${countryPhoneLengths[countryCode]}-digit Mobile Number',
          type: SnackType.error,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final watch = context.watch<SignupViewController>();
    final read = context.read<SignupViewController>();

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Positioned(
            bottom: -5,
            right: -5,
            child: _circle(),
          ),
          Positioned(
            top: -5,
            left: -5,
            child: _circle(),
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 150, sigmaY: 150),
            child: Container(
              color: Colors.transparent,
            ),
          ),
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                SizedBox(
                  height: 35.h,
                ),
                Image.asset(
                  "assets/images/md_logo.png",
                  width: 70.w,
                  height: 60.h,
                  // fit: BoxFit.fill,s
                ),
                SizedBox(
                  height: 40.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 32.w, right: 32.w),
                  child: PrimarySTextFormFieldNew(
                    controller: watch.firstNameController,
                    textCapitalization: TextCapitalization.words,
                    titleHeader: "FIRST NAME",
                    textInputAction: TextInputAction.next,
                    onEditingComplete: read.onFirstNameEditingComplete,
                    focusNode: watch.firstNameFocusNode,
                    titleStyle: TextStyle(
                      letterSpacing: 3,
                      fontWeight: FontWeight.w500,
                      fontSize: 10.sp,
                      color: const Color(0xffFFFFFF),
                    ),
                  ),
                ),
                SizedBox(
                  height: 25.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 32.w, right: 32.w),
                  child: PrimarySTextFormFieldNew(
                    controller: watch.lastNameController,
                    textCapitalization: TextCapitalization.words,
                    titleHeader: "LAST NAME",
                    textInputAction: TextInputAction.next,
                    onEditingComplete: read.onLastNameEditingComplete,
                    focusNode: watch.lastNameFocusNode,
                    titleStyle: TextStyle(
                      letterSpacing: 3,
                      fontWeight: FontWeight.w500,
                      fontSize: 10.sp,
                      color: const Color(0xffFFFFFF),
                    ),
                    //                 inputFormatters: [
                    // FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]')),
                    // ],
                  ),
                ),
                SizedBox(
                  height: 25.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 32.w, right: 32.w),
                  child: MobileNoTextFormField(
                    controller: watch.mobController,
                    focusNode: watch.mobFocusNode,
                    onEditingComplete: () {
                      read.onMobEditingComplete(); // Your existing method

                      validateMobileNumber(
                          watch.mobController.text, watch.selectedCountryCode);
                    },
                    textInputAction: TextInputAction.next,
                    titleHeader: "YOUR MOBILE NUMBER",
                    onChanged: (value) {},
                    onCountryCodeChanged: (countryCode) {
                      // Update the selected country code
                      watch.selectedCountryCode = countryCode.dialCode ??
                          ''; // Save the selected country code
                    },
                    enableOrder: true,
                  ),
                ),
                SizedBox(
                  height: 25.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 32.w, right: 32.w),
                  child: PrimarySTextFormField(
                    // isOptional: true,
                    controller: watch.emailIdController,
                    focusNode: watch.emailIdFocusNode,
                    onEditingComplete: read.onEmailIdEditingComplete,
                    textInputAction: TextInputAction.next,
                    titleHeader: "E-MAIL",
                  ),
                ),
                SizedBox(
                  height: 25.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 32.w, right: 32.w),
                  child: PrimarySTextFormField(
                    // isOptional: true,
                    controller: watch.passwordController,
                    focusNode: watch.passwordFocusNode,
                    onEditingComplete: () {
                      read.onPasswordEditingComplete(); // Your existing method

                      // Validate the password length
                      if (watch.passwordController.text.length != 8) {
                        Utils.showPrimarySnackbar(
                          context,
                          'Password must be exactly 8 characters long',
                          type: SnackType.error,
                        );
                      }
                    },
                    textInputAction: TextInputAction.next,
                    isPasswordField: true,
                    titleHeader: "PASSWORD ",
                  ),
                ),
                SizedBox(
                  height: 25.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 32.w, right: 32.w),
                  child: PrimarySTextFormField(
                    // isOptional: true,
                    controller: watch.repasswordController,
                    focusNode: watch.repasswordFocusNode,
                    onEditingComplete: read.onRepasswordEditingComplete,
                    textInputAction: TextInputAction.next,
                    isPasswordField: true,
                    titleHeader: "RE-PASSWORD",
                  ),
                ),
                SizedBox(
                  height: 25.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 32.w, right: 32.w),
                  child: GestureDetector(
                    child: PrimarySTextFormField(
                      readOnly: true,
                      // isOptional: true,
                      onTap: () async {
                        var datePicked = await DatePicker.showSimpleDatePicker(
                          context,
                          initialDate: DateTime(2020),
                          firstDate: DateTime(1900),
                          lastDate: DateTime(2090),
                          dateFormat: "dd-MMMM-yyyy",
                          locale: DateTimePickerLocale.en_us,
                          looping: true,
                        );
                        if (datePicked != null) {
                          String date = DateFormat('dd-MM-yyy')
                              .format(datePicked ?? DateTime.now());
                          read.onDateSelected(date);
                        }
                        // final snackBar = SnackBar(
                        //     content: Text("Date Picked $datePicked"));
                        // ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      },
                      controller: watch.birthDateController,
                      titleHeader: "BIRTH DATE",
                      // hintText: "Date of Birth",
                      suffix: GestureDetector(
                        onTap: () async {
                          var datePicked =
                              await DatePicker.showSimpleDatePicker(
                            context,
                            initialDate: DateTime(2020),
                            firstDate: DateTime(1900),
                            lastDate: DateTime(2090),
                            dateFormat: "dd-MMMM-yyyy",
                            locale: DateTimePickerLocale.en_us,
                            looping: true,
                          );
                          if (datePicked != null) {
                            String date = DateFormat('dd-MM-yyy')
                                .format(datePicked ?? DateTime.now());
                            read.onDateSelected(date);
                          }
                        },
                        child: const Icon(Icons.calendar_today_outlined,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 25.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 32.w, right: 32.w),
                  child: SignUpDropDown(
                    focusNode: watch.genderFocusNode,
                    titleHeader: "GENDER",
                    onChanged: (value) {
                      read.onSelectGender(value);
                    },
                    hint: "Male",
                    // Replace with your actual value
                    value:
                        read.selectedGender, // Replace with your actual value

                    items: [
                      DropdownMenuItem(
                        value: "male",
                        child: Text(
                          "Male",
                          style: TextStyle(
                            letterSpacing: 3,
                            color: Colors.white,
                            fontFamily: 'Campton',
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w400,
                            // letterSpacing: isPasswordFeild ? 0 : -0.5
                          ),
                        ),
                      ),
                      DropdownMenuItem(
                        value: "female",
                        child: Text(
                          "Female",
                          style: TextStyle(
                            letterSpacing: 3,
                            color: Colors.white,
                            fontFamily: 'Campton',
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w400,
                            // letterSpacing: isPasswordFeild ? 0 : -0.5
                          ),
                        ),
                      ),
                      DropdownMenuItem(
                        value: "other",
                        child: Text(
                          "Other",
                          style: TextStyle(
                            letterSpacing: 3,
                            color: Colors.white,
                            fontFamily: 'Campton',
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w400,
                            // letterSpacing: isPasswordFeild ? 0 : -0.5
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 25.h,
                ),
                Padding(
                    padding: EdgeInsets.only(left: 32.w, right: 32.w),
                    child: SignUpDropDown(
                      items: watch.countryList
                          ?.map((item) => DropdownMenuItem<String>(
                                value: item.id.toString(),
                                child: Text(
                                  item.countryName ?? "",
                                  style: TextStyle(
                                    letterSpacing: 3,
                                    color: Colors.white,
                                    fontFamily: 'Campton',
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ))
                          .toList(),
                      titleHeader: "COUNTRY",
                      onChanged: (value) async {
                        print(value.toString());
                        await read.onSelectCountryType(int.parse(value));
                        read.getCities(context);
                        // await read.onSelectCoutryType(value);
                      },
                      textEditingController: null,
                    )),
                SizedBox(
                  height: 25.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 32.w, right: 32.w),
                  child: SignUpDropDown(
                    items: watch.cityList == null
                        ? [
                            DropdownMenuItem<String>(
                              value: 'City',
                              child: Text(
                                "City",
                                style: TextStyle(
                                  letterSpacing: 3,
                                  color: Colors.white,
                                  fontFamily: 'Campton',
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            )
                          ]
                        : watch.cityList
                                ?.map((item) => DropdownMenuItem<String>(
                                      value: item.id.toString(),
                                      child: Text(
                                        item.cityName ?? "",
                                        style: TextStyle(
                                          letterSpacing: 3,
                                          color: Colors.white,
                                          fontFamily: 'Campton',
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ))
                                .toList() ??
                            [],
                    titleHeader: "CITY",
                    onChanged: (value) {
                      if (value != null && value != 'City') {
                        print(value.toString());
                        read.onSelectCityType(int.parse(value));
                      }
                    },
                    value: watch.cityList == null
                        ? 'City'
                        : watch.cityListId?.toString(),
                    textEditingController: null,
                  ),
                ),
                SizedBox(
                  height: 25.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 32.w, right: 32.w),
                  child:
                      // PrimarySTextFormField(
                      //   controller: watch.emailIdController,
                      //   focusNode: watch.emailIdFocusNode,
                      //   onEditingComplete: read.onEmailIdEditingComplete,
                      //   textInputAction: TextInputAction.next,
                      //   titleHeader: "E-MAIL",
                      // ),
                      PrimarySTextFormField(
                    // isOptional: true,
                    focusNode: watch.addresFocusNode,
                    onEditingComplete: read.onAddressEditingCompleted,
                    controller: watch.addressController,
                    textCapitalization: TextCapitalization.words,
                    titleHeader: "ADDRESS",
                  ),
                ),
                SizedBox(
                  height: 40.h,
                ),
                Container(
                  margin: EdgeInsets.only(
                    left: 35.w,
                    right: 32.w,
                  ),
                  child: RichText(
                    text: TextSpan(
                      style: TextStyle(
                          fontFamily: 'Campton',
                          letterSpacing: -1,
                          fontWeight: FontWeight.w500,
                          fontSize: 14.sp,
                          color: Colors.white),
                      children: [
                        WidgetSpan(
                          child: GestureDetector(
                            onTap: () {
                              read.onChecked();
                            },
                            child: Container(
                              margin:
                                  EdgeInsets.only(right: 5.w, bottom: 2.5.w),
                              height: 13.h,
                              width: 16.w,
                              decoration: BoxDecoration(
                                  color: watch.isChecked
                                      ? kDefaultActiveColor
                                      : const Color(0xffD9D9D9),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(2))),
                            ),
                          ),
                        ),
                        const TextSpan(
                          text: ' I accept ',
                        ),
                        TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              read.launchTermsAndConditionURL();
                              print('Login Text Clicked ');
                            },
                          children: [],
                          text: 'Terms and Condition  ',
                          style: TextStyle(
                              fontFamily: 'Campton',
                              color: kDefaultActiveColor,
                              decoration: TextDecoration.underline),
                        ),
                        // const TextSpan(
                        //   text: 'Terms and Condition ',
                        //   style: TextStyle(
                        // fontFamily: 'Campton',
                        // color: kDefaultActiveColor,
                        // decoration: TextDecoration.underline),
                        // ),
                        const TextSpan(
                          text: '& I agree to the ',
                        ),
                        TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              read.launchPrivacyPolicyURL();
                              print('Login Text Clicked');
                            },
                          text: ' User Data Consent.',
                          style: TextStyle(
                              fontFamily: 'Campton',
                              color: kDefaultActiveColor,
                              decoration: TextDecoration.underline),
                        ),
                        // const TextSpan(
                        //   text: 'User Data Consent.',
                        //   style: TextStyle(
                        // fontFamily: 'Campton',
                        // color: kDefaultActiveColor,
                        // decoration: TextDecoration.underline),
                        // ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 40.h,
                ),
                PrimaryButton(
                  width: 300.w,
                  // borderRadius: BorderRadius.circular(),
                  borderRadius: 30,
                  height: 45.h,
                  // width: ScreenUtil().screenWidth,
                  color: const Color(0xff4CDB06),
                  // style: style,
                  // onTap: () async {
                  //   await read.NewRegistration(context).then((value) async {
                  //     // if (watch.isLoginBtnEnabled) {
                  //     //   return;
                  //     // }
                  //     if (watch.mobController.text.length < 10) {
                  //       return;
                  //     }
                  //   });
                  // },
                  onTap: () async {
                    if (watch.firstNameController.text.isEmpty) {
                      Utils.showPrimarySnackbar(context, 'Enter First Name',
                          type: SnackType.error);
                    } else if (watch.lastNameController.text.isEmpty) {
                      Utils.showPrimarySnackbar(context, 'Enter Last Name',
                          type: SnackType.error);
                    } else if (watch.mobController.text.isEmpty ||
                        watch.mobController.text.length < 10) {
                      Utils.showPrimarySnackbar(
                          context, 'Enter 10 Digits Mobile Number',
                          type: SnackType.error);
                    } else if (watch.emailIdController.text.isEmpty) {
                      Utils.showPrimarySnackbar(context, 'Enter Email',
                          type: SnackType.error);
                    } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                        .hasMatch(watch.emailIdController.text)) {
                      Utils.showPrimarySnackbar(context, 'Enter a valid Email',
                          type: SnackType.error);
                    } else {
                      // await read.NewRegistration(context)
                      //     .then((value) async {});
                      await watch.sendOtpToFirebase(
                          watch.mobController.text,
                          watch
                              .selectedCountryCode, // Pass the dynamic country code here
                          context);
                    }
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
                  height: 36.h,
                ),
                // Text(
                //   "You have already account?\n",
                // style: TextStyle(
                //     fontFamily: 'Campton',
                //     color: Colors.white,
                //     fontSize: 13.sp,
                //     // letterSpacing: -1,
                //     fontWeight: FontWeight.w400),
                // ),
                Text(
                  "You already have an account?",
                  style: TextStyle(
                      fontFamily: 'Campton',
                      color: Colors.white,
                      fontSize: 14.sp,
                      // letterSpacing: -1,
                      fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: 5.h,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginScreenView()),
                    );
                  },
                  child: Text(
                    "Click Here",
                    style: TextStyle(
                        fontFamily: 'Campton',
                        decoration: TextDecoration.underline,
                        color: const Color(0xff4CDB06),
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                // RichText(
                //   textAlign: TextAlign.center,
                //   text: TextSpan(
                //     text: 'You have already account?\n',
                //     style: TextStyle(
                //         fontFamily: 'Campton',
                //         color: Colors.white,
                //         fontSize: 14.sp,
                //         letterSpacing: -1,
                //         fontWeight: FontWeight.w400),
                //     /*defining default style is optional */
                //     children: <TextSpan>[
                //       TextSpan(
                //         text: 'Click Here',
                //         style: TextStyle(
                //             color: const Color(0xff4CDB06),
                //             fontSize: 14.sp,
                //             // letterSpacing: -1,/
                //             fontFamily: 'Campton',
                //             decoration: TextDecoration.underline,
                //             fontWeight: FontWeight.w700),
                //         recognizer: new TapGestureRecognizer()
                //           ..onTap = () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //       builder: (context) =>
                //           const LoginScreenView()),
                // );
                //           },
                //       ),
                //     ],
                //   ),
                // ),
                SizedBox(
                  height: 50.h,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget _circle() {
  return Container(
    height: 100,
    width: 100,
    decoration: const BoxDecoration(
      shape: BoxShape.circle,
      color: Color(0xff4CDB06),
    ),
  );
}
