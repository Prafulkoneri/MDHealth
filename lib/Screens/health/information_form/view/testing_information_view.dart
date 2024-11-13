// import 'package:datepicker_dropdown/datepicker_dropdown.dart';
// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/scheduler.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:intl/intl.dart';
// import 'package:md_health/Screens/information_form/controller/information_form_controller.dart';
// import 'package:md_health/Screens/payment_details/view/payment_details_view.dart';
// import 'package:md_health/Screens/search/view/search_details_view.dart';
// import 'package:md_health/Screens/health/search/view/search_view.dart';

// import 'package:md_health/test_widget.dart';
// import 'package:md_health/widget/base_screen.dart';
// import 'package:md_health/widget/buttons.dart';
// import 'package:md_health/widget/custom_appbar.dart';
// import 'package:md_health/widget/date_picker.dart';
// import 'package:md_health/widget/drop_down.dart';
// import 'package:md_health/widget/text_field.dart';
// import 'package:provider/provider.dart';

// class InformationFormView extends StatefulWidget {
//   final String? packageId;
//   final String? cityName;
//   final String? screenName;
//   const InformationFormView(
//       {super.key, this.packageId, this.cityName, this.screenName});

//   @override
//   State<InformationFormView> createState() => _InformationFormViewState();
// }

// class _InformationFormViewState extends State<InformationFormView> {
//   void initState() {
//     SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
//       // log(widget.packageId ?? '');
//       context
//           .read<InformationFormController>()
//           .initState(context, widget.packageId);
//     });
//   }

//   final GlobalKey<FormState> formKey = GlobalKey<FormState>();
//   AutovalidateMode _autovalidate = AutovalidateMode.disabled;
//   int _selectedDay = 14;
//   int _selectedMonth = 10;
//   int _selectedYear = 1993;

//   @override
//   Widget build(BuildContext context) {
//     final read = context.read<InformationFormController>();
//     final watch = context.watch<InformationFormController>();
//     return BaseScreen(
//       onWillPop: () async {
//         Navigator.pushReplacement(
//           context,
//           SlidePageRoute(
//             page: SearchDetailsView(
//               packageId: watch.packageId,
//               // packageId: watch.packageId,
//             ),
//             direction: SlideDirection.left, // Specify the slide direction here
//             delay: Duration(milliseconds: 5000),
//           ),
//           // MaterialPageRoute(
//           //     builder: (context) => SearchView(
//           // packageId: watch.packageId,
//           // refresh: true,
//           // cityName: widget.cityName
//           // ))
//         );

//         return false;
//       },
//       backgroundColor: const Color(0xffF5F5F5),
//       appBar: PreferredSize(
//         preferredSize: Size.fromHeight(120.w),
//         child: CustomAppBar(
//           onBackPressed: () {
//             Navigator.pushReplacement(
//               context,
//               SlidePageRoute(
//                 page: SearchDetailsView(
//                   packageId: watch.packageId,
//                   // packageId: watch.packageId,
//                 ),
//                 direction:
//                     SlideDirection.left, // Specify the slide direction here
//                 delay: Duration(milliseconds: 5000),
//               ),
//               // MaterialPageRoute(
//               //     builder: (context) => SearchView(
//               // packageId: watch.packageId,
//               // refresh: true,
//               // cityName: widget.cityName
//               // ))
//             );
//           },
//           hasBackButton: true,
//           // hasMdTitle: false,
//           // drawerTitle: "Orders",
//         ),
//       ),
//       content: Builder(builder: (context) {
//         return Column(
//           children: [
//             SizedBox(
//               height: 20.h,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text(
//                   "Please fill the\n patient information",
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                     fontFamily: 'Campton',
//                     color: Colors.black,
//                     fontSize: 24.sp,
//                     fontWeight: FontWeight.w700,
//                   ),
//                   // style: TextStyle(
//                   //     color: textColor ?? Colors.white,
//                   //     fontWeight: fontWeight ?? FontWeight.w700,
//                   //     fontSize: fontSize ?? 14.sp),
//                 ),
//               ],
//             ),
//             Card(
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(15.0),
//               ),
//               margin: const EdgeInsets.all(20.0),
//               child: Column(
//                 children: [
//                   Padding(
//                     padding:
//                         EdgeInsets.only(left: 20.0.w, top: 20.w, right: 20.w),
//                     // : const EdgeInsets.all(20.0),
//                     child: PrimaryInformationTextFormField(
//                       controller: watch.patientFullNameController,
//                       // color: Colors.red,
//                       // width: 48.w,
//                       titleHeader: "*Patient First Name",
//                       hintText: "First Name",
//                       // allowCommasAndDotsAndSpaces: false,
//                       // allowOnlyDigits: false,
//                     ),
//                   ),
//                   SizedBox(
//                     height: 10.h,
//                   ),
//                   Padding(
//                     padding: EdgeInsets.only(left: 20.0.w, right: 20.w),
//                     // : const EdgeInsets.all(20.0),
//                     child: PrimaryInformationTextFormField(
//                       controller: watch.patientLastNameController,
//                       // color: Colors.red,
//                       // width: 48.w,
//                       titleHeader: "*Patient Last Name",
//                       hintText: "Last Name",
//                       // allowCommasAndDotsAndSpaces: false,
//                       // allowOnlyDigits: false,
//                     ),
//                   ),
//                   SizedBox(
//                     height: 10.h,
//                   ),
//                   Padding(
//                     padding: EdgeInsets.only(left: 20.0.w, right: 20.w),
//                     child: PrimaryInformationTextFormField(
//                       controller: watch.patientRelationController,
//                       // color: Colors.red,
//                       // width: 48.w,
//                       titleHeader: "*Relationship To You",
//                       hintText: "Relationship To You",
//                       // allowCommasAndDotsAndSpaces: false,
//                       // allowOnlyDigits: false,
//                     ),
//                   ),
//                   SizedBox(
//                     height: 10.h,
//                   ),
//                   Padding(
//                     padding: EdgeInsets.only(left: 20.0.w, right: 20.w),
//                     child: PrimaryInformationTextFormField(
//                       controller: watch.patientEmailController,
//                       // color: Colors.red,
//                       // width: 48.w,
//                       titleHeader: "Patient E-mail  *optional",
//                       hintText: " E-mail",
//                     ),
//                   ),
//                   SizedBox(
//                     height: 10.h,
//                   ),
//                   Padding(
//                     padding: EdgeInsets.only(left: 20.0.w, right: 20.w),
//                     child: PrimaryInformationTextFormField(
//                       controller: watch.patientNumberController,
//                       // color: Colors.red,
//                       // width: 48.w,
//                       titleHeader: "*Patient Contact Number",
//                       hintText: "Contact Number",
//                       textInputType: TextInputType.number,
//                       lengthLimitingTextInputFormatter:
//                           LengthLimitingTextInputFormatter(10),
//                       // allowOnlyDigits: true,
//                     ),
//                   ),
//                   SizedBox(
//                     height: 10.h,
//                   ),
//                   // DropdownDatePicker(
//                   //   inputDecoration: InputDecoration(
//                   //     enabledBorder: OutlineInputBorder(
//                   //       borderSide: BorderSide(color: Colors.grey, width: 1.0),
//                   //       borderRadius:
//                   //           BorderRadius.circular(20.0), // Set border radius
//                   //     ),
//                   //     border: OutlineInputBorder(
//                   //       borderRadius:
//                   //           BorderRadius.circular(20.0), // Set border radius
//                   //     ),
//                   //   ),
//                   //   isDropdownHideUnderline: true,
//                   //   isFormValidator: true,
//                   //   startYear: 1900,
//                   //   endYear: 2020,
//                   //   width: 5,
//                   //   selectedMonth: 10,
//                   //   selectedYear: 1993,
//                   //   onChangedDay: (value) => print('onChangedDay: $value'),
//                   //   onChangedMonth: (value) => print('onChangedMonth: $value'),
//                   //   onChangedYear: (value) => print('onChangedYear: $value'),
//                   // ),
//                   // Padding(
//                   //   padding: EdgeInsets.only(left: 20.0.w, right: 20.w),
//                   //   child: PrimaryInformationTextFormField(
//                   //     controller: watch.BirthDateController,
//                   //     // color: Colors.red,
//                   //     // width: 48.w,
//                   //     titleHeader: "*Patient Birth Date",
//                   //     hintText: "Date",
//                   //   ),
//                   // ),
//                   // SizedBox(
//                   //   height: 10.h,
//                   // ),
//                   // Padding(
//                   //   padding: EdgeInsets.only(left: 20.0.w, right: 20.w),
//                   //   child: Column(
//                   //     crossAxisAlignment: CrossAxisAlignment.start,
//                   //     children: [
//                   //       Text(
//                   //         '*Patient Birth Date',
//                   //         style: TextStyle(
//                   //             fontFamily: 'Campton',
//                   //             fontWeight: FontWeight.w500,
//                   //             fontSize: 14.sp,
//                   //             color: const Color(0xff3A3A3A)),
//                   //       ),
//                   //       SizedBox(height: 8),
//                   //       DropdownDatePicker(
//                   //         locale: "en",
//                   //         inputDecoration: InputDecoration(
//                   //           enabledBorder: OutlineInputBorder(
//                   //             borderSide:
//                   //                 BorderSide(color: Colors.grey, width: 1.0),
//                   //             borderRadius: BorderRadius.circular(
//                   //                 35), // Set the border radius here
//                   //           ),
//                   //           helperText: '',
//                   //           contentPadding:
//                   //               EdgeInsets.zero, // Set contentPadding to zero
//                   //           border: OutlineInputBorder(
//                   //             borderRadius: BorderRadius.circular(
//                   //                 35), // Set the border radius here as well
//                   //           ),
//                   //           suffixIcon:
//                   //               null, // Set suffixIcon to null to remove the space
//                   //         ),
//                   //         isDropdownHideUnderline: true,
//                   //         isFormValidator: true,
//                   //         startYear: 1900,
//                   //         endYear: 2020,
//                   //         width: 8,
//                   //         selectedDay: _selectedDay,
//                   //         selectedMonth: _selectedMonth,
//                   //         selectedYear: _selectedYear,
//                   //         hintDay: 'DD', // Add hint text for day
//                   //         hintMonth: 'MM', // Add hint text for month
//                   //         hintYear: 'YY',
//                   //         onChangedDay: (value) {
//                   //           _selectedDay = int.parse(value!);
//                   //           print('onChangedDay: $value');
//                   //         },
//                   //         onChangedMonth: (value) {
//                   //           _selectedMonth = int.parse(value!);
//                   //           print('onChangedMonth: $value');
//                   //         },
//                   //         onChangedYear: (value) {
//                   //           _selectedYear = int.parse(value!);
//                   //           print('onChangedYear: $value');
//                   //         },
//                   //       ),
//                   //     ],
//                   //   ),
//                   // ),
//                   Padding(
//                     padding: EdgeInsets.only(left: 20.0.w, right: 20.w),
//                     child: GestureDetector(
//                       child: PrimaryInformationTextFormField(
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
//                           // ScaffoldMessenger.of(context).showSnackBar(snackBar);
//                         },
//                         controller: watch.BirthDateController,
//                         titleHeader: "*Patient Birth Date",
//                         hintText: "Date of Birth",
//                         suffix: GestureDetector(
//                           onTap: () async {
//                             var datePicked =
//                                 await DatePicker.showSimpleDatePicker(
//                               context,
//                               initialDate: DateTime(2020),
//                               firstDate: DateTime(1900),
//                               lastDate: DateTime(2090),
//                               dateFormat: "dd-MMMM-yyyy",
//                               locale: DateTimePickerLocale.en_us,
//                               looping: true,
//                             );
//                             if (datePicked != null) {
//                               String date = DateFormat('dd-MM-yyy')
//                                   .format(datePicked ?? DateTime.now());
//                               read.onDateSelected(date);
//                             }
//                             // final snackBar = SnackBar(
//                             //     content: Text("Date Picked $datePicked"));
//                             // ScaffoldMessenger.of(context)
//                             //     .showSnackBar(snackBar);
//                           },
//                           child: const Icon(Icons.calendar_today_outlined,
//                               color: Colors.green),
//                         ),
//                       ),
//                     ),
//                   ),

//                   // Padding(
//                   //   padding: EdgeInsets.only(left: 20.0.w, right: 20.w),
//                   //   child: PrimaryInformationTextFormField(
//                   //     hintText: "Date",
//                   //     controller: watch.planToStartController,
//                   //     titleHeader: "*Patient Birth Date",
//                   //     readOnly: true,
//                   //     onTap: () async {
//                   //       var pickedDate = await showDatePicker(
//                   //         builder: (BuildContext, child) {
//                   //           return Theme(
//                   //             data: Theme.of(context).copyWith(
//                   //               colorScheme: const ColorScheme.light(
//                   //                 primary: Color(0xff1767B1),
//                   //                 // <-- SEE HERE
//                   //                 onPrimary: Colors.white,
//                   //                 // <-- SEE HERE
//                   //                 onSurface: Colors.black, // <-- SEE HERE
//                   //               ),
//                   //               textButtonTheme: TextButtonThemeData(
//                   //                 style: TextButton.styleFrom(
//                   //                   foregroundColor: const Color(
//                   //                       0xff1767B1), // button text color
//                   //                 ),
//                   //               ),
//                   //             ),
//                   //             child: child!,
//                   //           );
//                   //         },
//                   //         context: context,
//                   //         initialDate: DateTime.now(),
//                   //         firstDate: DateTime(1, 1998),
//                   //         lastDate: DateTime(2100),
//                   //       );
//                   //       if (pickedDate != null) {
//                   //         String date = DateFormat('dd-MM-yyy')
//                   //             .format(pickedDate ?? DateTime.now());
//                   //         read.onToDateSelected(date);
//                   //       }
//                   //     },
//                   //     suffix: GestureDetector(
//                   //       onTap: () async {
//                   //         var pickedDate = await showDatePicker(
//                   //           builder: (BuildContext, child) {
//                   //             return Theme(
//                   //               data: Theme.of(context).copyWith(
//                   //                 colorScheme: const ColorScheme.light(
//                   //                   primary: Color(0xff1767B1),
//                   //                   // <-- SEE HERE
//                   //                   onPrimary: Colors.white,
//                   //                   // <-- SEE HERE
//                   //                   onSurface: Colors.black, // <-- SEE HERE
//                   //                 ),
//                   //                 textButtonTheme: TextButtonThemeData(
//                   //                   style: TextButton.styleFrom(
//                   //                     foregroundColor: const Color(
//                   //                         0xff1767B1), // button text color
//                   //                   ),
//                   //                 ),
//                   //               ),
//                   //               child: child!,
//                   //             );
//                   //           },
//                   //           context: context,
//                   //           initialDate: DateTime.now(),
//                   //           firstDate: DateTime(1, 1998),
//                   //           lastDate: DateTime(2100),
//                   //         );
//                   //         if (pickedDate != null) {
//                   //           String date = DateFormat('dd-MM-yyy')
//                   //               .format(pickedDate ?? DateTime.now());
//                   //           read.onToDateSelected(date);
//                   //         }
//                   //       },
//                   //       child: SizedBox(
//                   //         width: 15.h,
//                   //         height: 17.w,
//                   //         child: Center(
//                   //           child: SvgPicture.asset(
//                   //             "assets/icons/shop_cal.svg",
//                   //             color: Colors.green,
//                   //           ),
//                   //         ),
//                   //       ),
//                   //     ),
//                   //     // hintFontSize: 15.sp,
//                   //   ),
//                   // ),
//                   SizedBox(
//                     height: 10.h,
//                   ),
//                   Padding(
//                     padding: EdgeInsets.only(left: 20.0.w, right: 20.w),
//                     child: ProfileDropDownInformation(
//                       height: 39.h,
//                       hint: "Country",
//                       items: watch.countryList
//                           ?.map((item) => DropdownMenuItem<String>(
//                                 value: item.id.toString(),
//                                 child: Text(
//                                   item.countryName ?? "",
//                                   style: TextStyle(
//                                       fontSize: 14.sp, color: Colors.black),
//                                 ),
//                               ))
//                           .toList(),
//                       titleHeader: "*Patient Country",
//                       onChanged: (value) async {
//                         print(value.toString());
//                         await read.onSelectCountryType(int.parse(value));
//                         await read.getCities(context);
//                       },
//                       textEditingController: null,
//                     ),
//                   ),

//                   Padding(
//                     padding: EdgeInsets.only(left: 20.0.w, right: 20.w),
//                     child: ProfileDropDownInformation(
//                       height: 39.h,
//                       hint: "City",
//                       items: watch.cityListErrorMessage != null
//                           ? [
//                               DropdownMenuItem<String>(
//                                 value: null,
//                                 child: Text(
//                                   watch.cityListErrorMessage!,
//                                   style: TextStyle(
//                                       fontSize: 14.sp, color: Colors.black),
//                                 ),
//                               )
//                             ]
//                           : watch.cityList
//                               ?.map((item) => DropdownMenuItem<String>(
//                                     value: item.id.toString(),
//                                     child: Text(
//                                       item.cityName ?? "",
//                                       style: TextStyle(
//                                           fontSize: 14.sp, color: Colors.black),
//                                     ),
//                                   ))
//                               .toList(),
//                       titleHeader: "*Patient City",
//                       onChanged: (value) {
//                         if (value != null) {
//                           print(value.toString());
//                           read.onSelectCityType(int.parse(value));
//                         }
//                       },
//                       value: watch.cityListId?.toString(),
//                       textEditingController: null,
//                     ),
//                   ),

//                   // Padding(
//                   //   padding: EdgeInsets.only(left: 20.0.w, right: 20.w),
//                   //   child: ProfileDropDownInformation(
//                   //     height: 39.h,
//                   //     hint: "Country",
//                   //     items: watch.countryList
//                   //         ?.map((item) => DropdownMenuItem<String>(
//                   //               value: item.id.toString(),
//                   //               child: Text(
//                   //                 item.countryName ?? "",
//                   //                 style: TextStyle(
//                   //                     fontSize: 14.sp, color: Colors.black),
//                   //               ),
//                   //             ))
//                   //         .toList(),
//                   //     titleHeader: "*Patient Country",
//                   //     onChanged: (value) async {
//                   //       print(value.toString());
//                   //       await read.onSelectCountryType(int.parse(value));
//                   //       read.getCities(context);
//                   //       // await read.onSelectCoutryType(value);
//                   //     },
//                   //     textEditingController: null,
//                   //   ),
//                   // ),
//                   // SizedBox(
//                   //   height: 10.h,
//                   // ),
//                   // // Padding(
//                   // //   padding: EdgeInsets.only(left: 20.0.w, right: 20.w),
//                   // //   child: SDropDownField(
//                   // //     titleHeader: "*Patient City",
//                   // //     onChanged: (value) {
//                   // //       // read.onSelectAccountType(value);
//                   // //     },
//                   // //     hint: "City",
//                   // //     items: [
//                   // //       DropdownMenuItem(
//                   // //         value: "current",
//                   // //         child: Text(
//                   // //           "Current",
//                   // //           style: TextStyle(
//                   // //             fontSize: 14.sp,
//                   // //           ),
//                   // //         ),
//                   // //       ),
//                   // //       DropdownMenuItem(
//                   // //         value: "saving",
//                   // //         child: Text(
//                   // //           "Saving",
//                   // //           style: TextStyle(
//                   // //             fontSize: 14.sp,
//                   // //           ),
//                   // //         ),
//                   // //       )
//                   // //     ],
//                   // //   ),
//                   // // ),
//                   // Padding(
//                   //   padding: EdgeInsets.only(left: 20.0.w, right: 20.w),
//                   //   child: ProfileDropDownInformation(
//                   //     height: 39.h,
//                   //     hint: "City",
//                   //     items: watch.cityList
//                   //         ?.map((item) => DropdownMenuItem<String>(
//                   //               value: item.id.toString(),
//                   //               child: Text(
//                   //                 item.cityName ?? "",
//                   //                 style: TextStyle(
//                   //                     fontSize: 14.sp, color: Colors.black),
//                   //               ),
//                   //             ))
//                   //         .toList(),
//                   //     titleHeader: "*Patient City",
//                   //     onChanged: (value) {
//                   //       print(value.toString());
//                   //       read.onSelectCityType(int.parse(value));
//                   //       // await read.onSelectCoutryType(value);
//                   //     },
//                   //     value: watch.cityListId?.toString() ?? null,
//                   //     textEditingController: null,
//                   //   ),
//                   // ),
//                   SizedBox(
//                     height: 20.h,
//                   ),
//                   Padding(
//                     padding: EdgeInsets.only(left: 18.0.w, right: 18.w),
//                     child: RichText(
//                       // textAlign: TextAlign.start,
//                       text: TextSpan(
//                         text:
//                             "*You can also change the patient information\n  from",
//                         style: TextStyle(
//                             fontFamily: 'Campton',
//                             color: Colors.black,
//                             fontSize: 13.sp,
//                             fontWeight: FontWeight.w500),

//                         /*defining default style is optional */
//                         children: <TextSpan>[
//                           TextSpan(
//                             text: ' panel ',
//                             style: TextStyle(
//                                 color: Colors.black,
//                                 fontSize: 14.sp,
//                                 fontFamily: 'Campton',
//                                 fontWeight: FontWeight.w700),
//                             recognizer: new TapGestureRecognizer()
//                               ..onTap = () {
//                                 // Navigator.push(
//                                 //   context,
//                                 //   MaterialPageRoute(
//                                 //       builder: (context) => SignUpView()),
//                                 // );
//                               },
//                           ),
//                           TextSpan(
//                             text: '>',
//                             style: TextStyle(
//                                 color: Color(0xff4CDB06),
//                                 fontSize: 14.sp,
//                                 fontFamily: 'Campton',
//                                 fontWeight: FontWeight.w700),
//                             recognizer: new TapGestureRecognizer()
//                               ..onTap = () {
//                                 // Navigator.push(
//                                 //   context,
//                                 //   MaterialPageRoute(
//                                 //       builder: (context) => SignUpView()),
//                                 // );
//                               },
//                           ),
//                           TextSpan(
//                             text: ' packages ',
//                             style: TextStyle(
//                                 color: Colors.black,
//                                 fontSize: 14.sp,
//                                 fontFamily: 'Campton',
//                                 fontWeight: FontWeight.w700),
//                             recognizer: new TapGestureRecognizer()
//                               ..onTap = () {
//                                 // Navigator.push(
//                                 //   context,
//                                 //   MaterialPageRoute(
//                                 //       builder: (context) => SignUpView()),
//                                 // );
//                               },
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),

//                   SizedBox(
//                     height: 36.h,
//                   ),
//                   PrimaryButton(
//                     width: 300.w,
//                     // borderRadius: BorderRadius.circular(),
//                     borderRadius: 30,
//                     // width: ScreenUtil().screenWidth,
//                     color: const Color(0xff4CDB06),
//                     onTap: () {
//                       print("hfdg yurgut");
//                       print(watch.BirthDateController);
//                       print("hfdg yurgut");
//                       read.getInfotmationDetails(
//                         // watch.packageId,
//                         context,
//                       );
//                     },
//                     child: Text(
//                       "Go Payment Page",
//                       style: TextStyle(
//                           fontFamily: 'Campton',
//                           color: Colors.black,
//                           // letterSpacing: .5,
//                           fontSize: 16.sp,
//                           fontWeight: FontWeight.w600),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 106.h,
//                   ),
//                 ],
//               ),
//             )
//           ],
//         );
//       }),
//     );
//   }
// }

// DateTime? _dateTime(int? day, int? month, int? year) {
//   if (day != null && month != null && year != null) {
//     return DateTime(year, month, day);
//   }
//   return null;
// }
