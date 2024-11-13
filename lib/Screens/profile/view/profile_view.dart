// // // import 'dart:math';

// // // import 'package:flutter/material.dart';
// // // import 'package:flutter/scheduler.dart';
// // // import 'package:flutter_screenutil/flutter_screenutil.dart';
// // // import 'package:flutter_svg/flutter_svg.dart';
// // // import 'package:md_health/Screens/profile/controller/profile_controller.dart';
// // // import 'package:md_health/constants/styles/colors.dart';
// // // import 'package:md_health/utils/utils.dart';
// // // import 'package:md_health/widget/base_screen.dart';
// // // import 'package:md_health/widget/buttons.dart';
// // // import 'package:md_health/widget/custom_appbar.dart';
// // // import 'package:md_health/widget/drop_down.dart';
// // // import 'package:md_health/widget/loader.dart';
// // // import 'package:md_health/widget/profile_app_bar.dart';
// // // import 'package:md_health/widget/text_field.dart';
// // // import 'package:provider/provider.dart';

// // // class ProfileView extends StatefulWidget {
// // //   const ProfileView({super.key});

// // //   @override
// // //   State<ProfileView> createState() => _ProfileViewState();
// // // }

// // // class _ProfileViewState extends State<ProfileView> {
// // //   @override
// // //   void initState() {
// // //     SchedulerBinding.instance.addPostFrameCallback((_) {
// // //       context.read<ProfileDetailController>().initState(context);
// // //     });
// // //   }

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     final read = context.read<ProfileDetailController>();
// // //     final watch = context.watch<ProfileDetailController>();

// // //     return BaseScreen(
// // //       backgroundColor: Color(0xffF5F5F5),
// // //       appBar: PreferredSize(
// // //         preferredSize: Size.fromHeight(120.h),
// // //         child: CustomAppBar(
// // //           drawerTitle: 'Profile',
// // //           // hasBackButton: true,
// // //           hasMdTitle: false,
// // //           // drawerTitle: "Orders",
// // //         ),
// // //       ),
// // //       content: watch.isLoading
// // //           ? Column(
// // //               mainAxisAlignment: MainAxisAlignment.end,
// // //               crossAxisAlignment: CrossAxisAlignment.end,
// // //               children: [
// // //                 SizedBox(
// // //                   height: 200.h,
// // //                 ),
// // //                 Loader(),
// // //               ],
// // //             )
// // //           : Builder(builder: (context) {
// // //               return Column(
// // //                 crossAxisAlignment: CrossAxisAlignment.center,
// // //                 children: [
// // //                   SizedBox(
// // //                     height: 27.h,
// // //                   ),
// // //                   // SizedBox(
// // //                   //   height: 21.h,
// // //                   // ),

// // //                   Padding(
// // //                     padding: EdgeInsets.only(left: 27.0.w, right: 23.w),
// // //                     child: PrimaryInformationTextFormField(
// // //                       textStyle: TextStyle(
// // //                           fontFamily: 'Campton',
// // //                           fontWeight: FontWeight.w600,
// // //                           fontSize: 16.sp,
// // //                           color: const Color(0xff8B8B8B)),
// // //                       controller: watch.firstNameController,
// // //                       borderColor: Color(0xffBFBFBF),

// // //                       // width: 48.w,
// // //                       // titleHeader: "*Patient Contact Number",
// // //                       hintText: "First Name",
// // //                     ),
// // //                   ),
// // //                   SizedBox(
// // //                     height: 20.h,
// // //                   ),
// // //                   Padding(
// // //                     padding: EdgeInsets.only(left: 27.0.w, right: 23.w),
// // //                     child: PrimaryInformationTextFormField(
// // //                       controller: watch.lastNameController,
// // //                       textStyle: TextStyle(
// // //                           fontFamily: 'Campton',
// // //                           fontWeight: FontWeight.w600,
// // //                           fontSize: 16.sp,
// // //                           color: const Color(0xff8B8B8B)),
// // //                       hintText: "Last Name",
// // //                     ),
// // //                   ),
// // //                   SizedBox(
// // //                     height: 20.h,
// // //                   ),
// // //                   Padding(
// // //                     padding: EdgeInsets.only(left: 27.0.w, right: 23.w),
// // //                     child: PrimaryInformationTextFormField(
// // //                       controller: watch.phoneNumberController,
// // //                       textStyle: TextStyle(
// // //                           fontFamily: 'Campton',
// // //                           fontWeight: FontWeight.w600,
// // //                           fontSize: 16.sp,
// // //                           color: const Color(0xff8B8B8B)),
// // //                       // color: Colors.red,
// // //                       // width: 48.w,
// // //                       // titleHeader: "*Patient Contact Number",
// // //                       hintText: "Phone Number",
// // //                     ),
// // //                   ),
// // //                   SizedBox(
// // //                     height: 20.h,
// // //                   ),
// // //                   Padding(
// // //                     padding: EdgeInsets.only(left: 27.0.w, right: 23.w),
// // //                     child: PrimaryInformationTextFormField(
// // //                       controller: watch.emailIdController,
// // //                       textStyle: TextStyle(
// // //                           fontFamily: 'Campton',
// // //                           fontWeight: FontWeight.w600,
// // //                           fontSize: 16.sp,
// // //                           color: const Color(0xff8B8B8B)),
// // //                       // color: Colors.red,
// // //                       // width: 48.w,
// // //                       // titleHeader: "*Patient Contact Number",
// // //                       hintText: "E-mail",
// // //                     ),
// // //                   ),
// // //                   // SizedBox(
// // //                   //   height: 20.h,
// // //                   // ),
// // //                   // Padding(
// // //                   //   padding: EdgeInsets.only(left: 20.0.w, right: 20.w),
// // //                   //   child: PrimaryInformationTextFormField(
// // //                   //     // color: Colors.red,
// // //                   //     // width: 48.w,
// // //                   //     // titleHeader: "*Patient Contact Number",
// // //                   //     hintText: "First Name",
// // //                   //   ),
// // //                   // ),
// // //                   SizedBox(
// // //                     height: 20.h,
// // //                   ),
// // //                   watch.showValueAreaField
// // //                       ? Padding(
// // //                           padding: EdgeInsets.only(left: 27.0.w, right: 23.w),
// // //                           child: ProfileDropDown(
// // //                             textEditingController: watch.areaSearchController,
// // //                             value: watch.countries,
// // //                             onChanged: (value) async {
// // //                               log(value[0]);
// // //                               read.onAreaSelected(value);
// // //                             },
// // //                             items: watch.countries
// // //                                 ?.map((item) => DropdownMenuItem<String>(
// // //                                       value: item.countryName.toString(),
// // //                                       child: Text(
// // //                                         item.countryName ?? "",
// // //                                         style: const TextStyle(
// // //                                           fontSize: 14,
// // //                                         ),
// // //                                       ),
// // //                                     ))
// // //                                 .toList(),
// // //                             hint: "Country",
// // //                             // titleHeader: "Area",
// // //                           ),
// // //                         )
// // //                       : Padding(
// // //                           padding: EdgeInsets.only(left: 27.0.w, right: 23.w),
// // //                           child: ProfileDropDown(
// // //                               textEditingController: watch.areaSearchController,
// // //                               onChanged: (value) async {
// // //                                 read.onAreaSelected(value);
// // //                               },
// // //                               items: watch.countries
// // //                                   ?.map((item) => DropdownMenuItem<String>(
// // //                                         value: item.countryName.toString(),
// // //                                         child: Text(
// // //                                           item.countryName ?? "",
// // //                                           style: TextStyle(
// // //                                               fontFamily: 'Campton',
// // //                                               fontWeight: FontWeight.w600,
// // //                                               fontSize: 16.sp,
// // //                                               color: const Color(0xff8B8B8B)),
// // //                                         ),
// // //                                       ))
// // //                                   .toList(),
// // //                               hint: watch.countryName
// // //                               // titleHeader: "Area",
// // //                               ),
// // //                         ),

// // //                   SizedBox(
// // //                     height: 20.w,
// // //                   ),
// // //                   watch.showValueCityField
// // //                       ? Padding(
// // //                           padding: EdgeInsets.only(left: 27.0.w, right: 23.w),
// // //                           child: ProfileDropDown(
// // //                               // height: 40.h,
// // //                               textEditingController: watch.citySearchController,
// // //                               value: watch.cityName,
// // //                               onChanged: (value) async {
// // //                                 read.onCitySelected(value);
// // //                                 // read.getCitiesList(context);/
// // //                               },
// // //                               items: watch.cities
// // //                                   ?.map((item) => DropdownMenuItem<String>(
// // //                                         value: item.cityName.toString(),
// // //                                         child: Text(
// // //                                           item.cityName ?? "",
// // //                                           style: TextStyle(
// // //                                               fontFamily: 'Campton',
// // //                                               fontWeight: FontWeight.w600,
// // //                                               fontSize: 16.sp,
// // //                                               color: const Color(0xff8B8B8B)),
// // //                                         ),
// // //                                       ))
// // //                                   .toList(),
// // //                               hint: "City"
// // //                               // titleHeader: "City",
// // //                               ),
// // //                         )
// // //                       : Padding(
// // //                           padding: EdgeInsets.only(left: 27.0.w, right: 23.w),
// // //                           child: ProfileDropDown(
// // //                               // height: 40.h,
// // //                               textEditingController: watch.citySearchController,
// // //                               onChanged: (value) async {
// // //                                 read.onCitySelected(value);
// // //                                 // read.getCitiesList(context);
// // //                               },
// // //                               items: watch.cities
// // //                                   ?.map((item) => DropdownMenuItem<String>(
// // //                                         value: item.cityName.toString(),
// // //                                         child: Text(
// // //                                           item.cityName ?? "",
// // //                                           style: TextStyle(
// // //                                               fontFamily: 'Campton',
// // //                                               fontWeight: FontWeight.w600,
// // //                                               fontSize: 16.sp,
// // //                                               color: const Color(0xff8B8B8B)),
// // //                                         ),
// // //                                       ))
// // //                                   .toList(),
// // //                               hint: watch.cityName
// // //                               // titleHeader: "City",
// // //                               ),
// // //                         ),

// // //                   SizedBox(
// // //                     height: 20.h,
// // //                   ),
// // //                   Padding(
// // //                     padding: EdgeInsets.only(left: 27.0.w, right: 23.w),
// // //                     child: PrimaryInformationTextFormFieldNEWADDRESS(
// // //                       controller: watch.addressController,
// // //                       maxLines: 100,
// // //                       textStyle: TextStyle(
// // //                           fontFamily: 'Campton',
// // //                           fontWeight: FontWeight.w600,
// // //                           fontSize: 16.sp,
// // //                           color: const Color(0xff8B8B8B)),
// // //                       // color: Colors.red,
// // //                       height: 100.w,
// // //                       // titleHeader: "*Patient Contact Number",
// // //                       hintText: "Address",
// // //                       contentPadding: EdgeInsets.only(top: 20, left: 15),
// // //                     ),
// // //                   ),
// // //                   SizedBox(
// // //                     height: 39.h,
// // //                   ),

// // //                   Padding(
// // //                     padding: EdgeInsets.only(left: 27.0.w, right: 23.w),
// // //                     child: PrimaryButton(
// // //                       width: 350.w,
// // //                       height: 40.h,
// // //                       // borderColor: black,
// // //                       borderRadius: 30,
// // //                       color: kDefaultActiveColor,
// // //                       onTap: () {
// // //                         read.UpdateProfile(context);
// // //                         Utils.showPrimarySnackbar(
// // //                             this.context, " result.message",
// // //                             type: SnackType.success);
// // //                       },
// // //                       child: Text(
// // //                         "Save Changes",
// // //                         style: TextStyle(
// // //                             fontFamily: 'Campton',
// // //                             color: black,
// // //                             fontSize: 16.sp,
// // //                             fontWeight: FontWeight.w600),
// // //                       ),
// // //                     ),
// // //                   ),

// // //                   SizedBox(
// // //                     height: 65.h,
// // //                   ),
// // //                   Container(
// // //                     padding: EdgeInsets.only(left: 27.0.w, right: 23.w),
// // //                     child: Text(
// // //                       "PASSWORD",
// // //                       style: TextStyle(
// // //                           fontFamily: 'Campton',
// // //                           // fontStyle: FontStyle.italic,
// // //                           color: black,
// // //                           letterSpacing: 5,
// // //                           fontSize: 21.sp,
// // //                           fontWeight: FontWeight.w700),
// // //                     ),
// // //                   ),
// // //                   SizedBox(
// // //                     height: 20.h,
// // //                   ),
// // //                   Padding(
// // //                     padding: EdgeInsets.only(left: 27.0.w, right: 23.w),
// // //                     child: PrimaryInformationTextFormField(
// // //                       textStyle: TextStyle(
// // //                           fontFamily: 'Campton',
// // //                           fontWeight: FontWeight.w600,
// // //                           fontSize: 16.sp,
// // //                           color: const Color(0xff8B8B8B)),
// // //                       controller: watch.passwordContyroller,
// // //                       // color: Colors.red,
// // //                       // width: 48.w,
// // //                       // titleHeader: "*Patient Contact Number",
// // //                       hintText: "Password",
// // //                     ),
// // //                   ),
// // //                   SizedBox(
// // //                     height: 20.h,
// // //                   ),
// // //                   Padding(
// // //                     padding: EdgeInsets.only(left: 27.0.w, right: 23.w),
// // //                     child: PrimaryInformationTextFormField(
// // //                       textStyle: TextStyle(
// // //                           fontFamily: 'Campton',
// // //                           fontWeight: FontWeight.w600,
// // //                           fontSize: 16.sp,
// // //                           color: const Color(0xff8B8B8B)),
// // //                       controller: watch.newPasswordController,
// // //                       // color: Colors.red,
// // //                       // width: 48.w,
// // //                       // titleHeader: "*Patient Contact Number",
// // //                       hintText: "New Password",
// // //                     ),
// // //                   ),
// // //                   SizedBox(
// // //                     height: 20.h,
// // //                   ),
// // //                   Padding(
// // //                     padding: EdgeInsets.only(left: 27.0.w, right: 23.w),
// // //                     child: PrimaryInformationTextFormField(
// // //                       textStyle: TextStyle(
// // //                           fontFamily: 'Campton',
// // //                           fontWeight: FontWeight.w600,
// // //                           fontSize: 16.sp,
// // //                           color: const Color(0xff8B8B8B)),
// // //                       controller: watch.re_TypePasswordContyroller,
// // //                       // color: Colors.red,
// // //                       // width: 48.w,
// // //                       // titleHeader: "*Patient Contact Number",
// // //                       hintText: "Re - New Password",
// // //                     ),
// // //                   ),
// // //                   SizedBox(
// // //                     height: 10.h,
// // //                   ),
// // //                   Padding(
// // //                     padding: EdgeInsets.only(left: 27.0.w, right: 23.w),
// // //                     child: PrimaryButton(
// // //                       width: 360.w,
// // //                       height: 40.h,
// // //                       // borderColor: black,
// // //                       borderRadius: 30,
// // //                       color: kDefaultActiveColor,
// // //                       onTap: () {
// // //                         read.CheckPassword(context);
// // //                         read.UpdatePassword(context);
// // //                         // Navigator.push(
// // //                         //   context,
// // //                         //   MaterialPageRoute(
// // //                         //       builder: (context) => LoginScreenView()),
// // //                         // );
// // //                       },
// // //                       child: Text(
// // //                         "Change Password",
// // //                         style: TextStyle(
// // //                             fontFamily: 'Campton',
// // //                             // fontStyle: FontStyle.italic,
// // //                             color: black,
// // //                             // letterSpacing: .5,
// // //                             fontSize: 16.sp,
// // //                             fontWeight: FontWeight.w600),
// // //                       ),
// // //                     ),
// // //                   ),
// // //                   SizedBox(
// // //                     height: 100.h,
// // //                   ),
// // //                 ],
// // //               );
// // //             }),
// // //     );
// // //   }
// // // }
// // import 'dart:math';

// // import 'package:flutter/material.dart';
// // import 'package:flutter/scheduler.dart';
// // import 'package:flutter/services.dart';
// // import 'package:flutter_screenutil/flutter_screenutil.dart';
// // import 'package:flutter_svg/flutter_svg.dart';
// // import 'package:md_health/Screens/profile/controller/profile_controller.dart';
// // import 'package:md_health/constants/styles/colors.dart';
// // import 'package:md_health/utils/utils.dart';
// // import 'package:md_health/widget/base_screen.dart';
// // import 'package:md_health/widget/buttons.dart';
// // import 'package:md_health/widget/custom_appbar.dart';
// // import 'package:md_health/widget/drop_down.dart';
// // import 'package:md_health/widget/loader.dart';
// // import 'package:md_health/widget/profile_app_bar.dart';
// // import 'package:md_health/widget/text_field.dart';
// // import 'package:provider/provider.dart';

// // class ProfileView extends StatefulWidget {
// //   const ProfileView({super.key});

// //   @override
// //   State<ProfileView> createState() => _ProfileViewState();
// // }

// // class _ProfileViewState extends State<ProfileView> {
// //   @override
// //   void initState() {
// //     SchedulerBinding.instance.addPostFrameCallback((_) {
// //       context.read<ProfileDetailController>().initState(context);
// //     });
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     final read = context.read<ProfileDetailController>();
// //     final watch = context.watch<ProfileDetailController>();

// //     return BaseScreen(
// //       backgroundColor: const Color(0xffF5F5F5),
// //       appBar: PreferredSize(
// //         preferredSize: Size.fromHeight(120.h),
// //         child: CustomAppBar(
// //           drawerTitle: 'Profile',
// //           // hasBackButton: true,
// //           hasMdTitle: false,
// //           // drawerTitle: "Orders",
// //         ),
// //       ),
// //       content: watch.isLoading
// //           ? Column(
// //               mainAxisAlignment: MainAxisAlignment.end,
// //               crossAxisAlignment: CrossAxisAlignment.end,
// //               children: [
// //                 SizedBox(
// //                   height: 200.h,
// //                 ),
// //                 const Loader(),
// //               ],
// //             )
// //           : Builder(builder: (context) {
// //               return Column(
// //                 crossAxisAlignment: CrossAxisAlignment.center,
// //                 children: [
// //                   SizedBox(
// //                     height: 27.h,
// //                   ),
// //                   Padding(
// //                     padding: EdgeInsets.only(left: 27.0.w, right: 23.w),
// //                     child: Container(
// //                       height: 43.h,
// //                       padding: EdgeInsets.only(left: 20.0.w),
// //                       decoration: BoxDecoration(
// //                         color: Colors.white,
// //                         border: Border.all(color: Colors.grey),
// //                         borderRadius: const BorderRadius.all(
// //                           Radius.circular(30),
// //                         ),
// //                       ),
// //                       child: TextFormField(
// //                         controller: watch.firstNameController,
// //                         style: TextStyle(
// //                             fontFamily: 'Campton',
// //                             fontWeight: FontWeight.w600,
// //                             fontSize: 16.sp,
// //                             color: const Color(0xff8B8B8B)),
// //                         decoration: InputDecoration(
// //                           labelText: "First Name",
// //                           border: InputBorder.none,
// //                           labelStyle: TextStyle(
// //                               fontFamily: 'Campton',
// //                               fontWeight: FontWeight.w400,
// //                               fontSize: 13.sp,
// //                               color: Colors.black),
// //                         ),
// //                       ),
// //                     ),
// //                   ),
// //                   SizedBox(
// //                     height: 20.h,
// //                   ),
// //                   Padding(
// //                     padding: EdgeInsets.only(left: 27.0.w, right: 23.w),
// //                     child: Container(
// //                       height: 43.h,
// //                       padding: EdgeInsets.only(left: 20.0.w),
// //                       decoration: BoxDecoration(
// //                         color: Colors.white,
// //                         border: Border.all(color: Colors.grey),
// //                         borderRadius: const BorderRadius.all(
// //                           Radius.circular(30),
// //                         ),
// //                       ),
// //                       child: TextFormField(
// //                         controller: watch.lastNameController,
// //                         style: TextStyle(
// //                             fontFamily: 'Campton',
// //                             fontWeight: FontWeight.w600,
// //                             fontSize: 16.sp,
// //                             color: const Color(0xff8B8B8B)),
// //                         decoration: InputDecoration(
// //                           labelText: "Last Name",
// //                           border: InputBorder.none,
// //                           labelStyle: TextStyle(
// //                               fontFamily: 'Campton',
// //                               fontWeight: FontWeight.w400,
// //                               fontSize: 13.sp,
// //                               color: Colors.black),
// //                         ),
// //                       ),
// //                     ),
// //                   ),
// //                   SizedBox(
// //                     height: 20.h,
// //                   ),
// //                   Padding(
// //                     padding: EdgeInsets.only(left: 27.0.w, right: 23.w),
// //                     child: Container(
// //                       height: 43.h,
// //                       padding: EdgeInsets.only(left: 20.0.w),
// //                       decoration: BoxDecoration(
// //                         color: Colors.white,
// //                         border: Border.all(color: Colors.grey),
// //                         borderRadius: BorderRadius.all(
// //                           Radius.circular(30),
// //                         ),
// //                       ),
// //                       child: TextFormField(
// //                         controller: watch.phoneNumberController,
// //                         keyboardType: TextInputType.phone,
// //                         inputFormatters: [
// //                           FilteringTextInputFormatter.digitsOnly,
// //                           LengthLimitingTextInputFormatter(10),
// //                         ],
// //                         style: TextStyle(
// //                             fontFamily: 'Campton',
// //                             fontWeight: FontWeight.w600,
// //                             fontSize: 16.sp,
// //                             color: Color(0xff8B8B8B)),
// //                         decoration: InputDecoration(
// //                           labelText: "Phone Number",
// //                           border: InputBorder.none,
// //                           labelStyle: TextStyle(
// //                               fontFamily: 'Campton',
// //                               fontWeight: FontWeight.w400,
// //                               fontSize: 13.sp,
// //                               color: Colors.black),
// //                         ),
// //                       ),
// //                     ),
// //                   ),
// //                   SizedBox(
// //                     height: 20.h,
// //                   ),
// //                   Padding(
// //                     padding: EdgeInsets.only(left: 27.0.w, right: 23.w),
// //                     child: Container(
// //                       height: 43.h,
// //                       padding: EdgeInsets.only(left: 20.0.w),
// //                       decoration: BoxDecoration(
// //                         color: Colors.white,
// //                         border: Border.all(color: Colors.grey),
// //                         borderRadius: const BorderRadius.all(
// //                           Radius.circular(30),
// //                         ),
// //                       ),
// //                       child: TextFormField(
// //                         controller: watch.emailIdController,
// //                         style: TextStyle(
// //                             fontFamily: 'Campton',
// //                             fontWeight: FontWeight.w600,
// //                             fontSize: 16.sp,
// //                             color: Color(0xff8B8B8B)),
// //                         decoration: InputDecoration(
// //                           labelText: "E-mail",
// //                           border: InputBorder.none,
// //                           labelStyle: TextStyle(
// //                               fontFamily: 'Campton',
// //                               fontWeight: FontWeight.w400,
// //                               fontSize: 13.sp,
// //                               color: Colors.black),
// //                         ),
// //                       ),
// //                     ),
// //                   ),
// //                   SizedBox(
// //                     height: 20.h,
// //                   ),
// //                   watch.showValueAreaField
// //                       ? Padding(
// //                           padding: EdgeInsets.only(left: 27.0.w, right: 23.w),
// //                           child: ProfileDropDown(
// //                               textEditingController: watch.areaSearchController,
// //                               value: watch.selectedCountryId,
// //                               onChanged: (value) async {
// //                                 log(value[0]);
// //                                 read.onAreaSelected(value);
// //                               },
// //                               items: watch.countries
// //                                   ?.map((item) => DropdownMenuItem<String>(
// //                                         value: item.countryName.toString(),
// //                                         child: Text(
// //                                           watch.countryName,
// //                                           style: const TextStyle(
// //                                             fontSize: 14,
// //                                           ),
// //                                         ),
// //                                       ))
// //                                   .toList(),
// //                               // hint: "Country",
// //                               hint: watch.selectedCountryId

// //                               // titleHeader: "Area",
// //                               ),
// //                         )
// //                       : Padding(
// //                           padding: EdgeInsets.only(left: 27.0.w, right: 23.w),
// //                           child: ProfileDropDown(
// //                               textEditingController: watch.areaSearchController,
// //                               // value: watch.selectedCountryId,
// //                               onChanged: (value) async {
// //                                 read.onAreaSelected(value);
// //                               },
// //                               items: watch.countries
// //                                   ?.map((item) => DropdownMenuItem<String>(
// //                                         value: item.countryName.toString(),
// //                                         child: Text(
// //                                           watch.countryName,
// //                                           style: TextStyle(
// //                                               fontFamily: 'Campton',
// //                                               fontWeight: FontWeight.w600,
// //                                               fontSize: 16.sp,
// //                                               color: const Color(0xff8B8B8B)),
// //                                         ),
// //                                       ))
// //                                   .toList(),
// //                               hint: watch.selectedCountryId
// //                               // titleHeader: "Area",
// //                               ),
// //                         ),
// //                   SizedBox(
// //                     height: 20.w,
// //                   ),
// //                   watch.showValueCityField
// //                       ? Padding(
// //                           padding: EdgeInsets.only(left: 27.0.w, right: 23.w),
// //                           child: ProfileDropDown(
// //                               // height: 40.h,
// //                               textEditingController: null,
// //                               value: watch.selectedCityId,
// //                               onChanged: (value) async {
// //                                 read.onCitySelected(value);
// //                                 // read.getCitiesList(context);/
// //                               },
// //                               items: watch.cities
// //                                   ?.map((item) => DropdownMenuItem<String>(
// //                                         value: item.cityName.toString(),
// //                                         child: Text(
// //                                           watch.selectedCityId,
// //                                           style: TextStyle(
// //                                               fontFamily: 'Campton',
// //                                               fontWeight: FontWeight.w600,
// //                                               fontSize: 16.sp,
// //                                               color: const Color(0xff8B8B8B)),
// //                                         ),
// //                                       ))
// //                                   .toList(),
// //                               // hint: "City"
// //                               hint: watch.selectedCityId

// //                               // titleHeader: "City",
// //                               ),
// //                         )
// //                       : Padding(
// //                           padding: EdgeInsets.only(left: 27.0.w, right: 23.w),
// //                           child: ProfileDropDown(
// //                               // height: 40.h,
// //                               textEditingController: watch.citySearchController,
// //                               onChanged: (value) async {
// //                                 read.onCitySelected(value);
// //                                 // read.getCitiesList(context);
// //                               },
// //                               items: watch.cities
// //                                   ?.map((item) => DropdownMenuItem<String>(
// //                                         value: item.cityName.toString(),
// //                                         child: Text(
// //                                           watch.selectedCityId,
// //                                           style: TextStyle(
// //                                               fontFamily: 'Campton',
// //                                               fontWeight: FontWeight.w600,
// //                                               fontSize: 16.sp,
// //                                               color: const Color(0xff8B8B8B)),
// //                                         ),
// //                                       ))
// //                                   .toList(),
// //                               hint: watch.selectedCityId
// //                               // titleHeader: "City",
// //                               ),
// //                         ),
// //                   SizedBox(
// //                     height: 20.h,
// //                   ),
// //                   Padding(
// //                     padding: EdgeInsets.only(left: 27.0.w, right: 23.w),
// //                     child: Container(
// //                       padding: EdgeInsets.only(left: 20.0.w),
// //                       decoration: BoxDecoration(
// //                         color: Colors.white,
// //                         border: Border.all(color: Colors.grey),
// //                         borderRadius: const BorderRadius.all(
// //                           Radius.circular(17),
// //                         ),
// //                       ),
// //                       child: TextFormField(
// //                         style: TextStyle(
// //                             fontFamily: 'Campton',
// //                             fontWeight: FontWeight.w600,
// //                             fontSize: 16.sp,
// //                             color: const Color(0xff8B8B8B)),
// //                         controller: watch.addressController,
// //                         maxLines: 4,
// //                         decoration: const InputDecoration(
// //                             labelText: "Address",
// //                             border: InputBorder.none,
// //                             labelStyle: TextStyle(color: Colors.black)),
// //                       ),
// //                     ),
// //                   ),
// //                   SizedBox(
// //                     height: 39.h,
// //                   ),
// //                   Padding(
// //                     padding: EdgeInsets.only(left: 27.0.w, right: 23.w),
// //                     child: PrimaryButton(
// //                       width: 350.w,
// //                       height: 40.h,
// //                       // borderColor: black,
// //                       borderRadius: 30,
// //                       color: kDefaultActiveColor,
// //                       onTap: () {
// //                         read.UpdateProfile(context);
// //                         Utils.showPrimarySnackbar(
// //                             this.context, " result.message",
// //                             type: SnackType.success);
// //                       },
// //                       child: Text(
// //                         "Save Changes",
// //                         style: TextStyle(
// //                             fontFamily: 'Campton',
// //                             color: black,
// //                             fontSize: 16.sp,
// //                             fontWeight: FontWeight.w600),
// //                       ),
// //                     ),
// //                   ),
// //                   SizedBox(
// //                     height: 65.h,
// //                   ),
// //                   Container(
// //                     padding: EdgeInsets.only(left: 27.0.w, right: 23.w),
// //                     child: Text(
// //                       "PASSWORD",
// //                       style: TextStyle(
// //                           fontFamily: 'Campton',
// //                           fontWeight: FontWeight.w600,
// //                           fontSize: 16.sp,
// //                           color: Color(0xff8B8B8B)),
// //                     ),
// //                   ),
// //                   SizedBox(
// //                     height: 20.h,
// //                   ),
// //                   Padding(
// //                     padding: EdgeInsets.only(left: 27.0.w, right: 23.w),
// //                     child: Container(
// //                       height: 43.h,
// //                       padding: EdgeInsets.only(left: 20.0.w),
// //                       decoration: BoxDecoration(
// //                         color: Colors.white,
// //                         border: Border.all(color: Colors.grey),
// //                         borderRadius: const BorderRadius.all(
// //                           Radius.circular(30),
// //                         ),
// //                       ),
// //                       child: TextFormField(
// //                         controller: watch.passwordContyroller,
// //                         style: TextStyle(
// //                             fontFamily: 'Campton',
// //                             fontWeight: FontWeight.w600,
// //                             fontSize: 16.sp,
// //                             color: Color(0xff8B8B8B)),
// //                         decoration: InputDecoration(
// //                           labelText: "Password",
// //                           border: InputBorder.none,
// //                           labelStyle: TextStyle(
// //                               fontFamily: 'Campton',
// //                               fontWeight: FontWeight.w400,
// //                               fontSize: 13.sp,
// //                               color: Colors.black),
// //                         ),
// //                       ),
// //                     ),
// //                   ),
// //                   SizedBox(
// //                     height: 20.h,
// //                   ),
// //                   Padding(
// //                     padding: EdgeInsets.only(left: 27.0.w, right: 23.w),
// //                     child: Container(
// //                       height: 43.h,
// //                       padding: EdgeInsets.only(left: 20.0.w),
// //                       decoration: BoxDecoration(
// //                         color: Colors.white,
// //                         border: Border.all(color: Colors.grey),
// //                         borderRadius: const BorderRadius.all(
// //                           Radius.circular(30),
// //                         ),
// //                       ),
// //                       child: TextFormField(
// //                         controller: watch.newPasswordController,
// //                         style: TextStyle(
// //                             fontFamily: 'Campton',
// //                             fontWeight: FontWeight.w600,
// //                             fontSize: 16.sp,
// //                             color: Color(0xff8B8B8B)),
// //                         decoration: InputDecoration(
// //                           labelText: "New Password",
// //                           border: InputBorder.none,
// //                           labelStyle: TextStyle(
// //                               fontFamily: 'Campton',
// //                               fontWeight: FontWeight.w400,
// //                               fontSize: 13.sp,
// //                               color: Colors.black),
// //                         ),
// //                       ),
// //                     ),
// //                   ),
// //                   SizedBox(
// //                     height: 20.h,
// //                   ),
// //                   Padding(
// //                     padding: EdgeInsets.only(left: 27.0.w, right: 23.w),
// //                     child: Container(
// //                       height: 43.h,
// //                       padding: EdgeInsets.only(left: 20.0.w),
// //                       decoration: BoxDecoration(
// //                         color: Colors.white,
// //                         border: Border.all(color: Colors.grey),
// //                         borderRadius: const BorderRadius.all(
// //                           Radius.circular(30),
// //                         ),
// //                       ),
// //                       child: TextFormField(
// //                         controller: watch.re_TypePasswordContyroller,
// //                         style: TextStyle(
// //                             fontFamily: 'Campton',
// //                             fontWeight: FontWeight.w600,
// //                             fontSize: 16.sp,
// //                             color: Color(0xff8B8B8B)),
// //                         decoration: InputDecoration(
// //                           labelText: "Re-New Password",
// //                           border: InputBorder.none,
// //                           labelStyle: TextStyle(
// //                               fontFamily: 'Campton',
// //                               fontWeight: FontWeight.w400,
// //                               fontSize: 13.sp,
// //                               color: Colors.black),
// //                         ),
// //                       ),
// //                     ),
// //                   ),
// //                   SizedBox(
// //                     height: 10.h,
// //                   ),
// //                   Padding(
// //                     padding: EdgeInsets.only(left: 27.0.w, right: 23.w),
// //                     child: PrimaryButton(
// //                       width: 360.w,
// //                       height: 40.h,
// //                       // borderColor: black,
// //                       borderRadius: 30,
// //                       color: kDefaultActiveColor,
// //                       onTap: () {
// //                         read.CheckPassword(context);
// //                         read.UpdatePassword(context);
// //                         // Navigator.push(
// //                         //   context,
// //                         //   MaterialPageRoute(
// //                         //       builder: (context) => LoginScreenView()),
// //                         // );
// //                       },
// //                       child: Text(
// //                         "Change Password",
// //                         style: TextStyle(
// //                             fontFamily: 'Campton',
// //                             // fontStyle: FontStyle.italic,
// //                             color: black,
// //                             // letterSpacing: .5,
// //                             fontSize: 16.sp,
// //                             fontWeight: FontWeight.w600),
// //                       ),
// //                     ),
// //                   ),
// //                   SizedBox(
// //                     height: 100.h,
// //                   ),
// //                 ],
// //               );
// //             }),
// //     );
// //   }
// // }
// import 'dart:math';

// import 'package:flutter/material.dart';
// import 'package:flutter/scheduler.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:md_health/Screens/profile/controller/profile_controller.dart';
// import 'package:md_health/constants/styles/colors.dart';
// import 'package:md_health/utils/utils.dart';
// import 'package:md_health/widget/base_screen.dart';
// import 'package:md_health/widget/buttons.dart';
// import 'package:md_health/widget/custom_appbar.dart';
// import 'package:md_health/widget/drop_down.dart';
// import 'package:md_health/widget/loader.dart';
// import 'package:md_health/widget/profile_app_bar.dart';
// import 'package:md_health/widget/text_field.dart';
// import 'package:md_health/constants/styles/colors.dart';
// import 'package:provider/provider.dart';

// class ProfileView extends StatefulWidget {
//   const ProfileView({super.key});

//   @override
//   State<ProfileView> createState() => _ProfileViewState();
// }

// class _ProfileViewState extends State<ProfileView> {
//   @override
//   void initState() {
//     SchedulerBinding.instance.addPostFrameCallback((_) {
//       context.read<ProfileDetailController>().initState(context);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final read = context.read<ProfileDetailController>();
//     final watch = context.watch<ProfileDetailController>();

//     return BaseScreen(
//       onWillPop: () async {
//         // Navigator.pushReplacement(
//         //   context,
//         //   SlidePageRoute(
//         //     page: ReportView(

//         //         // packageId: watch.packageId,
//         //         ),
//         //     direction: SlideDirection.left, // Specify the slide direction here
//         //     delay: Duration(milliseconds: 5000),
//         //   ),
//         //   // MaterialPageRoute(
//         //   //     builder: (context) => InformationFormView
//         //   //             // SearchDetailsView
//         //   //             (
//         //   //           packageId: watch.packageId,
//         //   //           screenName: "infotmation",
//         //   //           // packageId: watch.packageId,
//         //   //         ))
//         // );
//         // Navigator.pushReplacement(
//         //   context,
//         //   SlidePageRoute(
//         //     page: SearchDetailsView(
//         //       packageId: widget.packageId,

//         //       // packageId: watch.packageId,
//         //     ),
//         //     direction: SlideDirection.left, // Specify the slide direction here
//         //     delay: Duration(milliseconds: 5000),
//         //   ),
//         //   // MaterialPageRoute(
//         //   //     builder: (context) => SearchDetailsView(
//         //   //           packageId: watch.packageId,
//         //   //         ))
//         // );
//         Navigator.pop(context);

//         return false;
//       },
//       backgroundColor: Color(0xffF5F5F5),
//       appBar: PreferredSize(
//         preferredSize: Size.fromHeight(130.h),
//         child: CustomAppBar(
//           // drawerTitleColor: Colors.green,
//           drawerTitle: 'Profile',
//           // hasBackButton: true,
//           hasMdTitle: false,
//           // drawerTitle: "Orders",
//         ),
//       ),
//       content: Builder(builder: (context) {
//         return Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             SizedBox(
//               height: 27.h,
//             ),
//             Padding(
//               padding: EdgeInsets.only(left: 27.0.w, right: 23.w),
//               child: Container(
//                 height: 43.h,
//                 padding: EdgeInsets.only(left: 20.0.w),
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   border: Border.all(color: Colors.grey),
//                   borderRadius: const BorderRadius.all(
//                     Radius.circular(30),
//                   ),
//                 ),
//                 child: TextFormField(
//                   controller: watch.firstNameController,
//                   style: TextStyle(
//                       fontFamily: 'Campton',
//                       fontWeight: FontWeight.w600,
//                       fontSize: 16.sp,
//                       color: const Color(0xff8B8B8B)),
//                   decoration: InputDecoration(
//                     labelText: "First Name",
//                     border: InputBorder.none,
//                     labelStyle: TextStyle(
//                         fontFamily: 'Campton',
//                         fontWeight: FontWeight.w400,
//                         fontSize: 13.sp,
//                         color: Colors.black),
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 20.h,
//             ),
//             Padding(
//               padding: EdgeInsets.only(left: 27.0.w, right: 23.w),
//               child: Container(
//                 height: 43.h,
//                 padding: EdgeInsets.only(left: 20.0.w),
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   border: Border.all(color: Colors.grey),
//                   borderRadius: const BorderRadius.all(
//                     Radius.circular(30),
//                   ),
//                 ),
//                 child: TextFormField(
//                   controller: watch.lastNameController,
//                   style: TextStyle(
//                       fontFamily: 'Campton',
//                       fontWeight: FontWeight.w600,
//                       fontSize: 16.sp,
//                       color: const Color(0xff8B8B8B)),
//                   decoration: InputDecoration(
//                     labelText: "Last Name",
//                     border: InputBorder.none,
//                     labelStyle: TextStyle(
//                         fontFamily: 'Campton',
//                         fontWeight: FontWeight.w400,
//                         fontSize: 13.sp,
//                         color: Colors.black),
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 20.h,
//             ),
//             Padding(
//               padding: EdgeInsets.only(left: 27.0.w, right: 23.w),
//               child: Container(
//                 height: 43.h,
//                 padding: EdgeInsets.only(left: 20.0.w),
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   border: Border.all(color: Colors.grey),
//                   borderRadius: BorderRadius.all(
//                     Radius.circular(30),
//                   ),
//                 ),
//                 child: TextFormField(
//                   controller: watch.phoneNumberController,
//                   keyboardType: TextInputType.phone,
//                   inputFormatters: [
//                     FilteringTextInputFormatter.digitsOnly,
//                     LengthLimitingTextInputFormatter(10),
//                   ],
//                   style: TextStyle(
//                       fontFamily: 'Campton',
//                       fontWeight: FontWeight.w600,
//                       fontSize: 16.sp,
//                       color: Color(0xff8B8B8B)),
//                   decoration: InputDecoration(
//                     labelText: "Phone Number",
//                     border: InputBorder.none,
//                     labelStyle: TextStyle(
//                         fontFamily: 'Campton',
//                         fontWeight: FontWeight.w400,
//                         fontSize: 13.sp,
//                         color: Colors.black),
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 20.h,
//             ),
//             Padding(
//               padding: EdgeInsets.only(left: 27.0.w, right: 23.w),
//               child: Container(
//                 height: 43.h,
//                 padding: EdgeInsets.only(left: 20.0.w),
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   border: Border.all(color: Colors.grey),
//                   borderRadius: const BorderRadius.all(
//                     Radius.circular(30),
//                   ),
//                 ),
//                 child: TextFormField(
//                   controller: watch.emailIdController,
//                   style: TextStyle(
//                       fontFamily: 'Campton',
//                       fontWeight: FontWeight.w600,
//                       fontSize: 16.sp,
//                       color: Color(0xff8B8B8B)),
//                   decoration: InputDecoration(
//                     labelText: "E-mail",
//                     border: InputBorder.none,
//                     labelStyle: TextStyle(
//                         fontFamily: 'Campton',
//                         fontWeight: FontWeight.w400,
//                         fontSize: 13.sp,
//                         color: Colors.black),
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 20.h,
//             ),
//             Padding(
//               padding: EdgeInsets.only(left: 27.0.w, right: 23.w),
//               child: Container(
//                 height: 43.h,
//                 padding: EdgeInsets.only(left: 20.0.w),
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   border: Border.all(color: Colors.grey),
//                   borderRadius: const BorderRadius.all(
//                     Radius.circular(30),
//                   ),
//                 ),
//                 child: TextFormField(
//                   controller: watch.birthDateController,
//                   style: TextStyle(
//                       fontFamily: 'Campton',
//                       fontWeight: FontWeight.w600,
//                       fontSize: 16.sp,
//                       color: Color(0xff8B8B8B)),
//                   decoration: InputDecoration(
//                     labelText: "Birth Date",
//                     border: InputBorder.none,
//                     labelStyle: TextStyle(
//                         fontFamily: 'Campton',
//                         fontWeight: FontWeight.w400,
//                         fontSize: 13.sp,
//                         color: Colors.black),
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 20.h,
//             ),
//             Padding(
//               padding: EdgeInsets.only(left: 27.0.w, right: 23.w),
//               child: Container(
//                 height: 43.h,
//                 padding: EdgeInsets.only(left: 20.0.w),
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   border: Border.all(color: Colors.grey),
//                   borderRadius: const BorderRadius.all(
//                     Radius.circular(30),
//                   ),
//                 ),
//                 child: TextFormField(
//                   controller: watch.genderController,
//                   style: TextStyle(
//                       fontFamily: 'Campton',
//                       fontWeight: FontWeight.w600,
//                       fontSize: 16.sp,
//                       color: Color(0xff8B8B8B)),
//                   decoration: InputDecoration(
//                     labelText: "Gender",
//                     border: InputBorder.none,
//                     labelStyle: TextStyle(
//                         fontFamily: 'Campton',
//                         fontWeight: FontWeight.w400,
//                         fontSize: 13.sp,
//                         color: Colors.black),
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 20.h,
//             ),
//             watch.showValueAreaField
//                 ? Padding(
//                     padding: EdgeInsets.only(left: 0.0.w, right: 23.w),
//                     child: Container(
//                       height: 45.h,
//                       padding: EdgeInsets.only(left: 20.0.w),
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         border: Border.all(color: Colors.grey),
//                         borderRadius: const BorderRadius.all(
//                           Radius.circular(30),
//                         ),
//                       ),
//                       child: ProfileDropDown(
//                         textEditingController: null,
//                         value: watch.countries,
//                         onChanged: (value) async {
//                           log(value[0]);
//                           read.onAreaSelected(value, context);
//                         },
//                         items: watch.countries
//                             ?.map((item) => DropdownMenuItem<String>(
//                                   value: item.countryName.toString(),
//                                   child: Text(
//                                     item.countryName ?? "",
//                                     style: const TextStyle(
//                                       fontSize: 14,
//                                     ),
//                                   ),
//                                 ))
//                             .toList(),
//                         hint: watch.countryName,
//                         // labelText: "Select Country", // Add label text here
//                         height: 18.w, // Adjust the height as needed
//                         // titleHeader: "Area",
//                       ),
//                     ),
//                   )
//                 : Padding(
//                     padding: EdgeInsets.only(left: 27.0.w, right: 23.w),
//                     child: Container(
//                       height: 45.h,
//                       padding: EdgeInsets.only(left: 20.0.w),
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         border: Border.all(color: Colors.grey),
//                         borderRadius: const BorderRadius.all(
//                           Radius.circular(30),
//                         ),
//                       ),
//                       child: Padding(
//                         padding: EdgeInsets.only(top: 10.0.w, right: 20.w),
//                         child: ProfileDropDown(
//                           textEditingController: null,
//                           onChanged: (value) async {
//                             read.onAreaSelected(value, context);
//                           },
//                           items: watch.countries
//                               ?.map((item) => DropdownMenuItem<String>(
//                                     value: item.countryName.toString(),
//                                     child: Text(
//                                       item.countryName ?? "",
//                                       style: const TextStyle(
//                                         fontSize: 14,
//                                       ),
//                                     ),
//                                   ))
//                               .toList(),
//                           hint: watch.countryName,
//                           labelText: "Select Country",
//                           height: 18.w, // Adjust the height as needed
//                         ),
//                       ),
//                     ),
//                   ),
//             SizedBox(
//               height: 20.w,
//             ),
//             watch.showValueCityField
//                 ? Padding(
//                     padding: EdgeInsets.only(left: 27.0.w, right: 23.w),
//                     child: Container(
//                       height: 43.h,
//                       padding: EdgeInsets.only(left: 20.0.w),
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         border: Border.all(color: Colors.grey),
//                         borderRadius: const BorderRadius.all(
//                           Radius.circular(30),
//                         ),
//                       ),
//                       child: Padding(
//                         padding: EdgeInsets.only(top: 10.0.w, right: 10.w),
//                         child: ProfileDropDown(
//                             labelText: "Select City",
//                             height: 18.w, // Adjust the height as needed
//                             textEditingController: null,
//                             value: watch.cityName,
//                             onChanged: (value) async {
//                               read.onCitySelected(value);
//                               read.getCitiesList(context);
//                             },
//                             items: watch.cityList
//                                 ?.map((item) => DropdownMenuItem<String>(
//                                       value: item.cityName.toString(),
//                                       child: Text(
//                                         item.cityName ?? "",
//                                         style: const TextStyle(
//                                           fontSize: 14,
//                                         ),
//                                       ),
//                                     ))
//                                 .toList(),
//                             hint: watch.cityName

//                             // titleHeader: "City",
//                             ),
//                       ),
//                     ),
//                   )
//                 : Padding(
//                     padding: EdgeInsets.only(left: 27.0.w, right: 23.w),
//                     child: Container(
//                       height: 45.h,
//                       padding: EdgeInsets.only(left: 20.0.w),
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         border: Border.all(color: Colors.grey),
//                         borderRadius: const BorderRadius.all(
//                           Radius.circular(30),
//                         ),
//                       ),
//                       child: Padding(
//                         padding: EdgeInsets.only(top: 10.0.w, right: 10.w),
//                         child: ProfileDropDown(
//                             labelText: "Select City",
//                             height: 18.h,
//                             textEditingController: null,
//                             onChanged: (value) async {
//                               read.onCitySelected(value);
//                               read.getCitiesList(context);
//                             },
//                             items: watch.cityList
//                                 ?.map((item) => DropdownMenuItem<String>(
//                                       value: item.cityName.toString(),
//                                       child: Text(
//                                         item.cityName ?? "",
//                                         style: const TextStyle(
//                                           fontSize: 14,
//                                         ),
//                                       ),
//                                     ))
//                                 .toList(),
//                             hint: watch.cityName
//                             // titleHeader: "City",
//                             ),
//                       ),
//                     ),
//                   ),
//             SizedBox(
//               height: 20.h,
//             ),
//             Padding(
//               padding: EdgeInsets.only(left: 27.0.w, right: 23.w),
//               child: Container(
//                 padding: EdgeInsets.only(left: 20.0.w),
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   border: Border.all(color: Colors.grey),
//                   borderRadius: const BorderRadius.all(
//                     Radius.circular(17),
//                   ),
//                 ),
//                 child: TextFormField(
//                   style: TextStyle(
//                       fontFamily: 'Campton',
//                       fontWeight: FontWeight.w600,
//                       fontSize: 16.sp,
//                       color: const Color(0xff8B8B8B)),
//                   controller: watch.addressController,
//                   maxLines: 4,
//                   decoration: const InputDecoration(
//                       labelText: "Address",
//                       border: InputBorder.none,
//                       labelStyle: TextStyle(color: Colors.black)),
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 39.h,
//             ),
//             Padding(
//               padding: EdgeInsets.only(left: 27.0.w, right: 23.w),
//               child: PrimaryButton(
//                 width: 350.w,
//                 height: 40.h,
//                 // borderColor: black,
//                 borderRadius: 30,
//                 color: kDefaultActiveColor,
//                 onTap: () {
//                   read.UpdateProfile(
//                     context,
//                   );
//                   Utils.showPrimarySnackbar(this.context, " result.message",
//                       type: SnackType.success);
//                 },
//                 child: Text(
//                   "Save Changes",
//                   style: TextStyle(
//                       fontFamily: 'Campton',
//                       color: black,
//                       fontSize: 16.sp,
//                       fontWeight: FontWeight.w600),
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 65.h,
//             ),
//             Container(
//               padding: EdgeInsets.only(left: 27.0.w, right: 23.w),
//               child: Text(
//                 "PASSWORD",
//                 style: TextStyle(
//                     fontFamily: 'Campton',
//                     // fontStyle: FontStyle.italic,
//                     color: black,
//                     // letterSpacing: 5,
//                     fontSize: 21.sp,
//                     fontWeight: FontWeight.w700),
//               ),
//             ),
//             SizedBox(
//               height: 20.h,
//             ),
//             Padding(
//               padding: EdgeInsets.only(left: 27.0.w, right: 23.w),
//               child: Container(
//                 height: 43.h,
//                 padding: EdgeInsets.only(left: 20.0.w),
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   border: Border.all(color: Colors.grey),
//                   borderRadius: const BorderRadius.all(
//                     Radius.circular(30),
//                   ),
//                 ),
//                 child: TextFormField(
//                   onChanged: (value) {
//                     read.CheckPassword(context);
//                   },
//                   controller: watch.passwordContyroller,
//                   style: TextStyle(
//                       fontFamily: 'Campton',
//                       fontWeight: FontWeight.w600,
//                       fontSize: 16.sp,
//                       color: Color(0xff8B8B8B)),
//                   decoration: InputDecoration(
//                     labelText: "Password",
//                     border: InputBorder.none,
//                     labelStyle: TextStyle(
//                         fontFamily: 'Campton',
//                         fontWeight: FontWeight.w400,
//                         fontSize: 13.sp,
//                         color: Colors.black),
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 20.h,
//             ),
//             Padding(
//               padding: EdgeInsets.only(left: 27.0.w, right: 23.w),
//               child: Container(
//                 height: 43.h,
//                 padding: EdgeInsets.only(left: 20.0.w),
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   border: Border.all(color: Colors.grey),
//                   borderRadius: const BorderRadius.all(
//                     Radius.circular(30),
//                   ),
//                 ),
//                 child: TextFormField(
//                   controller: watch.newPasswordController,
//                   style: TextStyle(
//                       fontFamily: 'Campton',
//                       fontWeight: FontWeight.w600,
//                       fontSize: 16.sp,
//                       color: Color(0xff8B8B8B)),
//                   decoration: InputDecoration(
//                     labelText: "New Password",
//                     border: InputBorder.none,
//                     labelStyle: TextStyle(
//                         fontFamily: 'Campton',
//                         fontWeight: FontWeight.w400,
//                         fontSize: 13.sp,
//                         color: Colors.black),
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 20.h,
//             ),
//             Padding(
//               padding: EdgeInsets.only(left: 27.0.w, right: 23.w),
//               child: Container(
//                 height: 43.h,
//                 padding: EdgeInsets.only(left: 20.0.w),
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   border: Border.all(color: Colors.grey),
//                   borderRadius: const BorderRadius.all(
//                     Radius.circular(30),
//                   ),
//                 ),
//                 child: TextFormField(
//                   controller: watch.re_TypePasswordContyroller,
//                   style: TextStyle(
//                       fontFamily: 'Campton',
//                       fontWeight: FontWeight.w600,
//                       fontSize: 16.sp,
//                       color: Color(0xff8B8B8B)),
//                   decoration: InputDecoration(
//                     // labelText: "Re-New Password",
//                     labelText: "Confirm Password",
//                     border: InputBorder.none,
//                     labelStyle: TextStyle(
//                         fontFamily: 'Campton',
//                         fontWeight: FontWeight.w400,
//                         fontSize: 13.sp,
//                         color: Colors.black),
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 10.h,
//             ),
//             Padding(
//               padding: EdgeInsets.only(left: 27.0.w, right: 23.w),
//               child: PrimaryButton(
//                 width: 360.w,
//                 height: 40.h,
//                 // borderColor: black,
//                 borderRadius: 30,
//                 color: kDefaultActiveColor,
//                 onTap: () {
//                   read.UpdatePassword(context);

//                   // Navigator.push(
//                   //   context,
//                   //   MaterialPageRoute(
//                   //       builder: (context) => LoginScreenView()),
//                   // );
//                 },
//                 child: Text(
//                   "Change Password",
//                   style: TextStyle(
//                       fontFamily: 'Campton',
//                       // fontStyle: FontStyle.italic,
//                       color: black,
//                       // letterSpacing: .5,
//                       fontSize: 16.sp,
//                       fontWeight: FontWeight.w600),
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 100.h,
//             ),
//           ],
//         );
//       }),
//     );
//   }
// }
// // import 'dart:math';

// // import 'package:flutter/material.dart';
// // import 'package:flutter/scheduler.dart';
// // import 'package:flutter_screenutil/flutter_screenutil.dart';
// // import 'package:flutter_svg/flutter_svg.dart';
// // import 'package:md_health/Screens/profile/controller/profile_controller.dart';
// // import 'package:md_health/constants/styles/colors.dart';
// // import 'package:md_health/utils/utils.dart';
// // import 'package:md_health/widget/base_screen.dart';
// // import 'package:md_health/widget/buttons.dart';
// // import 'package:md_health/widget/custom_appbar.dart';
// // import 'package:md_health/widget/drop_down.dart';
// // import 'package:md_health/widget/loader.dart';
// // import 'package:md_health/widget/profile_app_bar.dart';
// // import 'package:md_health/widget/text_field.dart';
// // import 'package:provider/provider.dart';

// // class ProfileView extends StatefulWidget {
// //   const ProfileView({super.key});

// //   @override
// //   State<ProfileView> createState() => _ProfileViewState();
// // }

// // class _ProfileViewState extends State<ProfileView> {
// //   @override
// //   void initState() {
// //     SchedulerBinding.instance.addPostFrameCallback((_) {
// //       context.read<ProfileDetailController>().initState(context);
// //     });
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     final read = context.read<ProfileDetailController>();
// //     final watch = context.watch<ProfileDetailController>();

// //     return BaseScreen(
// //       backgroundColor: Color(0xffF5F5F5),
// //       appBar: PreferredSize(
// //         preferredSize: Size.fromHeight(120.h),
// //         child: CustomAppBar(
// //           drawerTitle: 'Profile',
// //           // hasBackButton: true,
// //           hasMdTitle: false,
// //           // drawerTitle: "Orders",
// //         ),
// //       ),
// //       content: watch.isLoading
// //           ? Column(
// //               mainAxisAlignment: MainAxisAlignment.end,
// //               crossAxisAlignment: CrossAxisAlignment.end,
// //               children: [
// //                 SizedBox(
// //                   height: 200.h,
// //                 ),
// //                 Loader(),
// //               ],
// //             )
// //           : Builder(builder: (context) {
// //               return Column(
// //                 crossAxisAlignment: CrossAxisAlignment.center,
// //                 children: [
// //                   SizedBox(
// //                     height: 27.h,
// //                   ),
// //                   // SizedBox(
// //                   //   height: 21.h,
// //                   // ),

// //                   Padding(
// //                     padding: EdgeInsets.only(left: 27.0.w, right: 23.w),
// //                     child: PrimaryInformationTextFormField(
// //                       textStyle: TextStyle(
// //                           fontFamily: 'Campton',
// //                           fontWeight: FontWeight.w600,
// //                           fontSize: 16.sp,
// //                           color: const Color(0xff8B8B8B)),
// //                       controller: watch.firstNameController,
// //                       borderColor: Color(0xffBFBFBF),

// //                       // width: 48.w,
// //                       // titleHeader: "*Patient Contact Number",
// //                       hintText: "First Name",
// //                     ),
// //                   ),
// //                   SizedBox(
// //                     height: 20.h,
// //                   ),
// //                   Padding(
// //                     padding: EdgeInsets.only(left: 27.0.w, right: 23.w),
// //                     child: PrimaryInformationTextFormField(
// //                       controller: watch.lastNameController,
// //                       textStyle: TextStyle(
// //                           fontFamily: 'Campton',
// //                           fontWeight: FontWeight.w600,
// //                           fontSize: 16.sp,
// //                           color: const Color(0xff8B8B8B)),
// //                       hintText: "Last Name",
// //                     ),
// //                   ),
// //                   SizedBox(
// //                     height: 20.h,
// //                   ),
// //                   Padding(
// //                     padding: EdgeInsets.only(left: 27.0.w, right: 23.w),
// //                     child: PrimaryInformationTextFormField(
// //                       controller: watch.phoneNumberController,
// //                       textStyle: TextStyle(
// //                           fontFamily: 'Campton',
// //                           fontWeight: FontWeight.w600,
// //                           fontSize: 16.sp,
// //                           color: const Color(0xff8B8B8B)),
// //                       // color: Colors.red,
// //                       // width: 48.w,
// //                       // titleHeader: "*Patient Contact Number",
// //                       hintText: "Phone Number",
// //                     ),
// //                   ),
// //                   SizedBox(
// //                     height: 20.h,
// //                   ),
// //                   Padding(
// //                     padding: EdgeInsets.only(left: 27.0.w, right: 23.w),
// //                     child: PrimaryInformationTextFormField(
// //                       controller: watch.emailIdController,
// //                       textStyle: TextStyle(
// //                           fontFamily: 'Campton',
// //                           fontWeight: FontWeight.w600,
// //                           fontSize: 16.sp,
// //                           color: const Color(0xff8B8B8B)),
// //                       // color: Colors.red,
// //                       // width: 48.w,
// //                       // titleHeader: "*Patient Contact Number",
// //                       hintText: "E-mail",
// //                     ),
// //                   ),
// //                   // SizedBox(
// //                   //   height: 20.h,
// //                   // ),
// //                   // Padding(
// //                   //   padding: EdgeInsets.only(left: 20.0.w, right: 20.w),
// //                   //   child: PrimaryInformationTextFormField(
// //                   //     // color: Colors.red,
// //                   //     // width: 48.w,
// //                   //     // titleHeader: "*Patient Contact Number",
// //                   //     hintText: "First Name",
// //                   //   ),
// //                   // ),
// //                   SizedBox(
// //                     height: 20.h,
// //                   ),
// //                   watch.showValueAreaField
// //                       ? Padding(
// //                           padding: EdgeInsets.only(left: 27.0.w, right: 23.w),
// //                           child: ProfileDropDown(
// //                             textEditingController: watch.areaSearchController,
// //                             value: watch.countries,
// //                             onChanged: (value) async {
// //                               log(value[0]);
// //                               read.onAreaSelected(value);
// //                             },
// //                             items: watch.countries
// //                                 ?.map((item) => DropdownMenuItem<String>(
// //                                       value: item.countryName.toString(),
// //                                       child: Text(
// //                                         item.countryName ?? "",
// //                                         style: const TextStyle(
// //                                           fontSize: 14,
// //                                         ),
// //                                       ),
// //                                     ))
// //                                 .toList(),
// //                             hint: "Country",
// //                             // titleHeader: "Area",
// //                           ),
// //                         )
// //                       : Padding(
// //                           padding: EdgeInsets.only(left: 27.0.w, right: 23.w),
// //                           child: ProfileDropDown(
// //                               textEditingController: watch.areaSearchController,
// //                               onChanged: (value) async {
// //                                 read.onAreaSelected(value);
// //                               },
// //                               items: watch.countries
// //                                   ?.map((item) => DropdownMenuItem<String>(
// //                                         value: item.countryName.toString(),
// //                                         child: Text(
// //                                           item.countryName ?? "",
// //                                           style: TextStyle(
// //                                               fontFamily: 'Campton',
// //                                               fontWeight: FontWeight.w600,
// //                                               fontSize: 16.sp,
// //                                               color: const Color(0xff8B8B8B)),
// //                                         ),
// //                                       ))
// //                                   .toList(),
// //                               hint: watch.countryName
// //                               // titleHeader: "Area",
// //                               ),
// //                         ),

// //                   SizedBox(
// //                     height: 20.w,
// //                   ),
// //                   watch.showValueCityField
// //                       ? Padding(
// //                           padding: EdgeInsets.only(left: 27.0.w, right: 23.w),
// //                           child: ProfileDropDown(
// //                               // height: 40.h,
// //                               textEditingController: watch.citySearchController,
// //                               value: watch.cityName,
// //                               onChanged: (value) async {
// //                                 read.onCitySelected(value);
// //                                 // read.getCitiesList(context);/
// //                               },
// //                               items: watch.cities
// //                                   ?.map((item) => DropdownMenuItem<String>(
// //                                         value: item.cityName.toString(),
// //                                         child: Text(
// //                                           item.cityName ?? "",
// //                                           style: TextStyle(
// //                                               fontFamily: 'Campton',
// //                                               fontWeight: FontWeight.w600,
// //                                               fontSize: 16.sp,
// //                                               color: const Color(0xff8B8B8B)),
// //                                         ),
// //                                       ))
// //                                   .toList(),
// //                               hint: "City"
// //                               // titleHeader: "City",
// //                               ),
// //                         )
// //                       : Padding(
// //                           padding: EdgeInsets.only(left: 27.0.w, right: 23.w),
// //                           child: ProfileDropDown(
// //                               // height: 40.h,
// //                               textEditingController: watch.citySearchController,
// //                               onChanged: (value) async {
// //                                 read.onCitySelected(value);
// //                                 // read.getCitiesList(context);
// //                               },
// //                               items: watch.cities
// //                                   ?.map((item) => DropdownMenuItem<String>(
// //                                         value: item.cityName.toString(),
// //                                         child: Text(
// //                                           item.cityName ?? "",
// //                                           style: TextStyle(
// //                                               fontFamily: 'Campton',
// //                                               fontWeight: FontWeight.w600,
// //                                               fontSize: 16.sp,
// //                                               color: const Color(0xff8B8B8B)),
// //                                         ),
// //                                       ))
// //                                   .toList(),
// //                               hint: watch.cityName
// //                               // titleHeader: "City",
// //                               ),
// //                         ),

// //                   SizedBox(
// //                     height: 20.h,
// //                   ),
// //                   Padding(
// //                     padding: EdgeInsets.only(left: 27.0.w, right: 23.w),
// //                     child: PrimaryInformationTextFormFieldNEWADDRESS(
// //                       controller: watch.addressController,
// //                       maxLines: 100,
// //                       textStyle: TextStyle(
// //                           fontFamily: 'Campton',
// //                           fontWeight: FontWeight.w600,
// //                           fontSize: 16.sp,
// //                           color: const Color(0xff8B8B8B)),
// //                       // color: Colors.red,
// //                       height: 100.w,
// //                       // titleHeader: "*Patient Contact Number",
// //                       hintText: "Address",
// //                       contentPadding: EdgeInsets.only(top: 20, left: 15),
// //                     ),
// //                   ),
// //                   SizedBox(
// //                     height: 39.h,
// //                   ),

// //                   Padding(
// //                     padding: EdgeInsets.only(left: 27.0.w, right: 23.w),
// //                     child: PrimaryButton(
// //                       width: 350.w,
// //                       height: 40.h,
// //                       // borderColor: black,
// //                       borderRadius: 30,
// //                       color: kDefaultActiveColor,
// //                       onTap: () {
// //                         read.UpdateProfile(context);
// //                         Utils.showPrimarySnackbar(
// //                             this.context, " result.message",
// //                             type: SnackType.success);
// //                       },
// //                       child: Text(
// //                         "Save Changes",
// //                         style: TextStyle(
// //                             fontFamily: 'Campton',
// //                             color: black,
// //                             fontSize: 16.sp,
// //                             fontWeight: FontWeight.w600),
// //                       ),
// //                     ),
// //                   ),

// //                   SizedBox(
// //                     height: 65.h,
// //                   ),
// //                   Container(
// //                     padding: EdgeInsets.only(left: 27.0.w, right: 23.w),
// //                     child: Text(
// //                       "PASSWORD",
// //                       style: TextStyle(
// //                           fontFamily: 'Campton',
// //                           // fontStyle: FontStyle.italic,
// //                           color: black,
// //                           letterSpacing: 5,
// //                           fontSize: 21.sp,
// //                           fontWeight: FontWeight.w700),
// //                     ),
// //                   ),
// //                   SizedBox(
// //                     height: 20.h,
// //                   ),
// //                   Padding(
// //                     padding: EdgeInsets.only(left: 27.0.w, right: 23.w),
// //                     child: PrimaryInformationTextFormField(
// //                       textStyle: TextStyle(
// //                           fontFamily: 'Campton',
// //                           fontWeight: FontWeight.w600,
// //                           fontSize: 16.sp,
// //                           color: const Color(0xff8B8B8B)),
// //                       controller: watch.passwordContyroller,
// //                       // color: Colors.red,
// //                       // width: 48.w,
// //                       // titleHeader: "*Patient Contact Number",
// //                       hintText: "Password",
// //                     ),
// //                   ),
// //                   SizedBox(
// //                     height: 20.h,
// //                   ),
// //                   Padding(
// //                     padding: EdgeInsets.only(left: 27.0.w, right: 23.w),
// //                     child: PrimaryInformationTextFormField(
// //                       textStyle: TextStyle(
// //                           fontFamily: 'Campton',
// //                           fontWeight: FontWeight.w600,
// //                           fontSize: 16.sp,
// //                           color: const Color(0xff8B8B8B)),
// //                       controller: watch.newPasswordController,
// //                       // color: Colors.red,
// //                       // width: 48.w,
// //                       // titleHeader: "*Patient Contact Number",
// //                       hintText: "New Password",
// //                     ),
// //                   ),
// //                   SizedBox(
// //                     height: 20.h,
// //                   ),
// //                   Padding(
// //                     padding: EdgeInsets.only(left: 27.0.w, right: 23.w),
// //                     child: PrimaryInformationTextFormField(
// //                       textStyle: TextStyle(
// //                           fontFamily: 'Campton',
// //                           fontWeight: FontWeight.w600,
// //                           fontSize: 16.sp,
// //                           color: const Color(0xff8B8B8B)),
// //                       controller: watch.re_TypePasswordContyroller,
// //                       // color: Colors.red,
// //                       // width: 48.w,
// //                       // titleHeader: "*Patient Contact Number",
// //                       hintText: "Re - New Password",
// //                     ),
// //                   ),
// //                   SizedBox(
// //                     height: 10.h,
// //                   ),
// //                   Padding(
// //                     padding: EdgeInsets.only(left: 27.0.w, right: 23.w),
// //                     child: PrimaryButton(
// //                       width: 360.w,
// //                       height: 40.h,
// //                       // borderColor: black,
// //                       borderRadius: 30,
// //                       color: kDefaultActiveColor,
// //                       onTap: () {
// //                         read.CheckPassword(context);
// //                         read.UpdatePassword(context);
// //                         // Navigator.push(
// //                         //   context,
// //                         //   MaterialPageRoute(
// //                         //       builder: (context) => LoginScreenView()),
// //                         // );
// //                       },
// //                       child: Text(
// //                         "Change Password",
// //                         style: TextStyle(
// //                             fontFamily: 'Campton',
// //                             // fontStyle: FontStyle.italic,
// //                             color: black,
// //                             // letterSpacing: .5,
// //                             fontSize: 16.sp,
// //                             fontWeight: FontWeight.w600),
// //                       ),
// //                     ),
// //                   ),
// //                   SizedBox(
// //                     height: 100.h,
// //                   ),
// //                 ],
// //               );
// //             }),
// //     );
// //   }
// // }
// import 'dart:math';

// import 'package:flutter/material.dart';
// import 'package:flutter/scheduler.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:md_health/Screens/profile/controller/profile_controller.dart';
// import 'package:md_health/constants/styles/colors.dart';
// import 'package:md_health/utils/utils.dart';
// import 'package:md_health/widget/base_screen.dart';
// import 'package:md_health/widget/buttons.dart';
// import 'package:md_health/widget/custom_appbar.dart';
// import 'package:md_health/widget/drop_down.dart';
// import 'package:md_health/widget/loader.dart';
// import 'package:md_health/widget/profile_app_bar.dart';
// import 'package:md_health/widget/text_field.dart';
// import 'package:provider/provider.dart';

// class ProfileView extends StatefulWidget {
//   const ProfileView({super.key});

//   @override
//   State<ProfileView> createState() => _ProfileViewState();
// }

// class _ProfileViewState extends State<ProfileView> {
//   @override
//   void initState() {
//     SchedulerBinding.instance.addPostFrameCallback((_) {
//       context.read<ProfileDetailController>().initState(context);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final read = context.read<ProfileDetailController>();
//     final watch = context.watch<ProfileDetailController>();

//     return BaseScreen(
//       backgroundColor: const Color(0xffF5F5F5),
//       appBar: PreferredSize(
//         preferredSize: Size.fromHeight(120.h),
//         child: CustomAppBar(
//           drawerTitle: 'Profile',
//           // hasBackButton: true,
//           hasMdTitle: false,
//           // drawerTitle: "Orders",
//         ),
//       ),
//       content: watch.isLoading
//           ? Column(
//               mainAxisAlignment: MainAxisAlignment.end,
//               crossAxisAlignment: CrossAxisAlignment.end,
//               children: [
//                 SizedBox(
//                   height: 200.h,
//                 ),
//                 const Loader(),
//               ],
//             )
//           : Builder(builder: (context) {
//               return Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   SizedBox(
//                     height: 27.h,
//                   ),
//                   Padding(
//                     padding: EdgeInsets.only(left: 27.0.w, right: 23.w),
//                     child: Container(
//                       height: 43.h,
//                       padding: EdgeInsets.only(left: 20.0.w),
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         border: Border.all(color: Colors.grey),
//                         borderRadius: const BorderRadius.all(
//                           Radius.circular(30),
//                         ),
//                       ),
//                       child: TextFormField(
//                         controller: watch.firstNameController,
//                         style: TextStyle(
//                             fontFamily: 'Campton',
//                             fontWeight: FontWeight.w600,
//                             fontSize: 16.sp,
//                             color: const Color(0xff8B8B8B)),
//                         decoration: InputDecoration(
//                           labelText: "First Name",
//                           border: InputBorder.none,
//                           labelStyle: TextStyle(
//                               fontFamily: 'Campton',
//                               fontWeight: FontWeight.w400,
//                               fontSize: 13.sp,
//                               color: Colors.black),
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 20.h,
//                   ),
//                   Padding(
//                     padding: EdgeInsets.only(left: 27.0.w, right: 23.w),
//                     child: Container(
//                       height: 43.h,
//                       padding: EdgeInsets.only(left: 20.0.w),
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         border: Border.all(color: Colors.grey),
//                         borderRadius: const BorderRadius.all(
//                           Radius.circular(30),
//                         ),
//                       ),
//                       child: TextFormField(
//                         controller: watch.lastNameController,
//                         style: TextStyle(
//                             fontFamily: 'Campton',
//                             fontWeight: FontWeight.w600,
//                             fontSize: 16.sp,
//                             color: const Color(0xff8B8B8B)),
//                         decoration: InputDecoration(
//                           labelText: "Last Name",
//                           border: InputBorder.none,
//                           labelStyle: TextStyle(
//                               fontFamily: 'Campton',
//                               fontWeight: FontWeight.w400,
//                               fontSize: 13.sp,
//                               color: Colors.black),
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 20.h,
//                   ),
//                   Padding(
//                     padding: EdgeInsets.only(left: 27.0.w, right: 23.w),
//                     child: Container(
//                       height: 43.h,
//                       padding: EdgeInsets.only(left: 20.0.w),
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         border: Border.all(color: Colors.grey),
//                         borderRadius: BorderRadius.all(
//                           Radius.circular(30),
//                         ),
//                       ),
//                       child: TextFormField(
//                         controller: watch.phoneNumberController,
//                         keyboardType: TextInputType.phone,
//                         inputFormatters: [
//                           FilteringTextInputFormatter.digitsOnly,
//                           LengthLimitingTextInputFormatter(10),
//                         ],
//                         style: TextStyle(
//                             fontFamily: 'Campton',
//                             fontWeight: FontWeight.w600,
//                             fontSize: 16.sp,
//                             color: Color(0xff8B8B8B)),
//                         decoration: InputDecoration(
//                           labelText: "Phone Number",
//                           border: InputBorder.none,
//                           labelStyle: TextStyle(
//                               fontFamily: 'Campton',
//                               fontWeight: FontWeight.w400,
//                               fontSize: 13.sp,
//                               color: Colors.black),
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 20.h,
//                   ),
//                   Padding(
//                     padding: EdgeInsets.only(left: 27.0.w, right: 23.w),
//                     child: Container(
//                       height: 43.h,
//                       padding: EdgeInsets.only(left: 20.0.w),
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         border: Border.all(color: Colors.grey),
//                         borderRadius: const BorderRadius.all(
//                           Radius.circular(30),
//                         ),
//                       ),
//                       child: TextFormField(
//                         controller: watch.emailIdController,
//                         style: TextStyle(
//                             fontFamily: 'Campton',
//                             fontWeight: FontWeight.w600,
//                             fontSize: 16.sp,
//                             color: Color(0xff8B8B8B)),
//                         decoration: InputDecoration(
//                           labelText: "E-mail",
//                           border: InputBorder.none,
//                           labelStyle: TextStyle(
//                               fontFamily: 'Campton',
//                               fontWeight: FontWeight.w400,
//                               fontSize: 13.sp,
//                               color: Colors.black),
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 20.h,
//                   ),
//                   watch.showValueAreaField
//                       ? Padding(
//                           padding: EdgeInsets.only(left: 27.0.w, right: 23.w),
//                           child: ProfileDropDown(
//                               textEditingController: watch.areaSearchController,
//                               value: watch.selectedCountryId,
//                               onChanged: (value) async {
//                                 log(value[0]);
//                                 read.onAreaSelected(value);
//                               },
//                               items: watch.countries
//                                   ?.map((item) => DropdownMenuItem<String>(
//                                         value: item.countryName.toString(),
//                                         child: Text(
//                                           watch.countryName,
//                                           style: const TextStyle(
//                                             fontSize: 14,
//                                           ),
//                                         ),
//                                       ))
//                                   .toList(),
//                               // hint: "Country",
//                               hint: watch.selectedCountryId

//                               // titleHeader: "Area",
//                               ),
//                         )
//                       : Padding(
//                           padding: EdgeInsets.only(left: 27.0.w, right: 23.w),
//                           child: ProfileDropDown(
//                               textEditingController: watch.areaSearchController,
//                               // value: watch.selectedCountryId,
//                               onChanged: (value) async {
//                                 read.onAreaSelected(value);
//                               },
//                               items: watch.countries
//                                   ?.map((item) => DropdownMenuItem<String>(
//                                         value: item.countryName.toString(),
//                                         child: Text(
//                                           watch.countryName,
//                                           style: TextStyle(
//                                               fontFamily: 'Campton',
//                                               fontWeight: FontWeight.w600,
//                                               fontSize: 16.sp,
//                                               color: const Color(0xff8B8B8B)),
//                                         ),
//                                       ))
//                                   .toList(),
//                               hint: watch.selectedCountryId
//                               // titleHeader: "Area",
//                               ),
//                         ),
//                   SizedBox(
//                     height: 20.w,
//                   ),
//                   watch.showValueCityField
//                       ? Padding(
//                           padding: EdgeInsets.only(left: 27.0.w, right: 23.w),
//                           child: ProfileDropDown(
//                               // height: 40.h,
//                               textEditingController: null,
//                               value: watch.selectedCityId,
//                               onChanged: (value) async {
//                                 read.onCitySelected(value);
//                                 // read.getCitiesList(context);/
//                               },
//                               items: watch.cities
//                                   ?.map((item) => DropdownMenuItem<String>(
//                                         value: item.cityName.toString(),
//                                         child: Text(
//                                           watch.selectedCityId,
//                                           style: TextStyle(
//                                               fontFamily: 'Campton',
//                                               fontWeight: FontWeight.w600,
//                                               fontSize: 16.sp,
//                                               color: const Color(0xff8B8B8B)),
//                                         ),
//                                       ))
//                                   .toList(),
//                               // hint: "City"
//                               hint: watch.selectedCityId

//                               // titleHeader: "City",
//                               ),
//                         )
//                       : Padding(
//                           padding: EdgeInsets.only(left: 27.0.w, right: 23.w),
//                           child: ProfileDropDown(
//                               // height: 40.h,
//                               textEditingController: watch.citySearchController,
//                               onChanged: (value) async {
//                                 read.onCitySelected(value);
//                                 // read.getCitiesList(context);
//                               },
//                               items: watch.cities
//                                   ?.map((item) => DropdownMenuItem<String>(
//                                         value: item.cityName.toString(),
//                                         child: Text(
//                                           watch.selectedCityId,
//                                           style: TextStyle(
//                                               fontFamily: 'Campton',
//                                               fontWeight: FontWeight.w600,
//                                               fontSize: 16.sp,
//                                               color: const Color(0xff8B8B8B)),
//                                         ),
//                                       ))
//                                   .toList(),
//                               hint: watch.selectedCityId
//                               // titleHeader: "City",
//                               ),
//                         ),
//                   SizedBox(
//                     height: 20.h,
//                   ),
//                   Padding(
//                     padding: EdgeInsets.only(left: 27.0.w, right: 23.w),
//                     child: Container(
//                       padding: EdgeInsets.only(left: 20.0.w),
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         border: Border.all(color: Colors.grey),
//                         borderRadius: const BorderRadius.all(
//                           Radius.circular(17),
//                         ),
//                       ),
//                       child: TextFormField(
//                         style: TextStyle(
//                             fontFamily: 'Campton',
//                             fontWeight: FontWeight.w600,
//                             fontSize: 16.sp,
//                             color: const Color(0xff8B8B8B)),
//                         controller: watch.addressController,
//                         maxLines: 4,
//                         decoration: const InputDecoration(
//                             labelText: "Address",
//                             border: InputBorder.none,
//                             labelStyle: TextStyle(color: Colors.black)),
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 39.h,
//                   ),
//                   Padding(
//                     padding: EdgeInsets.only(left: 27.0.w, right: 23.w),
//                     child: PrimaryButton(
//                       width: 350.w,
//                       height: 40.h,
//                       // borderColor: black,
//                       borderRadius: 30,
//                       color: kDefaultActiveColor,
//                       onTap: () {
//                         read.UpdateProfile(context);
//                         Utils.showPrimarySnackbar(
//                             this.context, " result.message",
//                             type: SnackType.success);
//                       },
//                       child: Text(
//                         "Save Changes",
//                         style: TextStyle(
//                             fontFamily: 'Campton',
//                             color: black,
//                             fontSize: 16.sp,
//                             fontWeight: FontWeight.w600),
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 65.h,
//                   ),
//                   Container(
//                     padding: EdgeInsets.only(left: 27.0.w, right: 23.w),
//                     child: Text(
//                       "PASSWORD",
//                       style: TextStyle(
//                           fontFamily: 'Campton',
//                           fontWeight: FontWeight.w600,
//                           fontSize: 16.sp,
//                           color: Color(0xff8B8B8B)),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 20.h,
//                   ),
//                   Padding(
//                     padding: EdgeInsets.only(left: 27.0.w, right: 23.w),
//                     child: Container(
//                       height: 43.h,
//                       padding: EdgeInsets.only(left: 20.0.w),
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         border: Border.all(color: Colors.grey),
//                         borderRadius: const BorderRadius.all(
//                           Radius.circular(30),
//                         ),
//                       ),
//                       child: TextFormField(
//                         controller: watch.passwordContyroller,
//                         style: TextStyle(
//                             fontFamily: 'Campton',
//                             fontWeight: FontWeight.w600,
//                             fontSize: 16.sp,
//                             color: Color(0xff8B8B8B)),
//                         decoration: InputDecoration(
//                           labelText: "Password",
//                           border: InputBorder.none,
//                           labelStyle: TextStyle(
//                               fontFamily: 'Campton',
//                               fontWeight: FontWeight.w400,
//                               fontSize: 13.sp,
//                               color: Colors.black),
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 20.h,
//                   ),
//                   Padding(
//                     padding: EdgeInsets.only(left: 27.0.w, right: 23.w),
//                     child: Container(
//                       height: 43.h,
//                       padding: EdgeInsets.only(left: 20.0.w),
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         border: Border.all(color: Colors.grey),
//                         borderRadius: const BorderRadius.all(
//                           Radius.circular(30),
//                         ),
//                       ),
//                       child: TextFormField(
//                         controller: watch.newPasswordController,
//                         style: TextStyle(
//                             fontFamily: 'Campton',
//                             fontWeight: FontWeight.w600,
//                             fontSize: 16.sp,
//                             color: Color(0xff8B8B8B)),
//                         decoration: InputDecoration(
//                           labelText: "New Password",
//                           border: InputBorder.none,
//                           labelStyle: TextStyle(
//                               fontFamily: 'Campton',
//                               fontWeight: FontWeight.w400,
//                               fontSize: 13.sp,
//                               color: Colors.black),
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 20.h,
//                   ),
//                   Padding(
//                     padding: EdgeInsets.only(left: 27.0.w, right: 23.w),
//                     child: Container(
//                       height: 43.h,
//                       padding: EdgeInsets.only(left: 20.0.w),
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         border: Border.all(color: Colors.grey),
//                         borderRadius: const BorderRadius.all(
//                           Radius.circular(30),
//                         ),
//                       ),
//                       child: TextFormField(
//                         controller: watch.re_TypePasswordContyroller,
//                         style: TextStyle(
//                             fontFamily: 'Campton',
//                             fontWeight: FontWeight.w600,
//                             fontSize: 16.sp,
//                             color: Color(0xff8B8B8B)),
//                         decoration: InputDecoration(
//                           labelText: "Re-New Password",
//                           border: InputBorder.none,
//                           labelStyle: TextStyle(
//                               fontFamily: 'Campton',
//                               fontWeight: FontWeight.w400,
//                               fontSize: 13.sp,
//                               color: Colors.black),
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 10.h,
//                   ),
//                   Padding(
//                     padding: EdgeInsets.only(left: 27.0.w, right: 23.w),
//                     child: PrimaryButton(
//                       width: 360.w,
//                       height: 40.h,
//                       // borderColor: black,
//                       borderRadius: 30,
//                       color: kDefaultActiveColor,
//                       onTap: () {
//                         read.CheckPassword(context);
//                         read.UpdatePassword(context);
//                         // Navigator.push(
//                         //   context,
//                         //   MaterialPageRoute(
//                         //       builder: (context) => LoginScreenView()),
//                         // );
//                       },
//                       child: Text(
//                         "Change Password",
//                         style: TextStyle(
//                             fontFamily: 'Campton',
//                             // fontStyle: FontStyle.italic,
//                             color: black,
//                             // letterSpacing: .5,
//                             fontSize: 16.sp,
//                             fontWeight: FontWeight.w600),
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 100.h,
//                   ),
//                 ],
//               );
//             }),
//     );
//   }
// }
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:md_health/Screens/profile/controller/profile_controller.dart';
import 'package:md_health/constants/styles/colors.dart';
import 'package:md_health/utils/utils.dart';
import 'package:md_health/widget/base_screen.dart';
import 'package:md_health/widget/buttons.dart';
import 'package:md_health/widget/custom_appbar.dart';
import 'package:md_health/widget/drop_down.dart';
import 'package:md_health/widget/loader.dart';
import 'package:md_health/widget/profile_app_bar.dart';
import 'package:md_health/widget/text_field.dart';
import 'package:md_health/constants/styles/colors.dart';
import 'package:provider/provider.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      context.read<ProfileDetailController>().initState(context);
    });
  }

  bool passwordVisible = true;
  bool passwordVisible1 = true;
  bool passwordVisible2 = true;

  @override
  Widget build(BuildContext context) {
    final read = context.read<ProfileDetailController>();
    final watch = context.watch<ProfileDetailController>();

    return BaseScreen(
      onWillPop: () async {
        // Navigator.pushReplacement(
        //   context,
        //   SlidePageRoute(
        //     page: ReportView(

        //         // packageId: watch.packageId,
        //         ),
        //     direction: SlideDirection.left, // Specify the slide direction here
        //     delay: Duration(milliseconds: 5000),
        //   ),
        //   // MaterialPageRoute(
        //   //     builder: (context) => InformationFormView
        //   //             // SearchDetailsView
        //   //             (
        //   //           packageId: watch.packageId,
        //   //           screenName: "infotmation",
        //   //           // packageId: watch.packageId,
        //   //         ))
        // );
        // Navigator.pushReplacement(
        //   context,
        //   SlidePageRoute(
        //     page: SearchDetailsView(
        //       packageId: widget.packageId,

        //       // packageId: watch.packageId,
        //     ),
        //     direction: SlideDirection.left, // Specify the slide direction here
        //     delay: Duration(milliseconds: 5000),
        //   ),
        //   // MaterialPageRoute(
        //   //     builder: (context) => SearchDetailsView(
        //   //           packageId: watch.packageId,
        //   //         ))
        // );
        Navigator.pop(context);

        return false;
      },
      backgroundColor: Color(0xffF5F5F5),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(130.h),
        child: CustomAppBar(
          // drawerTitleColor: Colors.green,
          drawerTitle: 'Profile',
          // hasBackButton: true,
          hasMdTitle: false,
          // drawerTitle: "Orders",
        ),
      ),
      content: Builder(builder: (context) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 27.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 27.0.w, right: 23.w),
              child: Container(
                height: 43.h,
                padding: EdgeInsets.only(left: 20.0.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(30),
                  ),
                ),
                child: TextFormField(
                  controller: watch.firstNameController,
                  style: TextStyle(
                      fontFamily: 'Campton',
                      fontWeight: FontWeight.w600,
                      fontSize: 16.sp,
                      color: const Color(0xff8B8B8B)),
                  decoration: InputDecoration(
                    labelText: "First Name",
                    border: InputBorder.none,
                    labelStyle: TextStyle(
                        fontFamily: 'Campton',
                        fontWeight: FontWeight.w400,
                        fontSize: 13.sp,
                        color: Colors.black),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 27.0.w, right: 23.w),
              child: Container(
                height: 43.h,
                padding: EdgeInsets.only(left: 20.0.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(30),
                  ),
                ),
                child: TextFormField(
                  controller: watch.lastNameController,
                  style: TextStyle(
                      fontFamily: 'Campton',
                      fontWeight: FontWeight.w600,
                      fontSize: 16.sp,
                      color: const Color(0xff8B8B8B)),
                  decoration: InputDecoration(
                    labelText: "Last Name",
                    border: InputBorder.none,
                    labelStyle: TextStyle(
                        fontFamily: 'Campton',
                        fontWeight: FontWeight.w400,
                        fontSize: 13.sp,
                        color: Colors.black),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 27.0.w, right: 23.w),
              child: Container(
                height: 43.h,
                padding: EdgeInsets.only(left: 20.0.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.all(
                    Radius.circular(30),
                  ),
                ),
                child: TextFormField(
                  controller: watch.phoneNumberController,
                  keyboardType: TextInputType.phone,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(10),
                  ],
                  style: TextStyle(
                      fontFamily: 'Campton',
                      fontWeight: FontWeight.w600,
                      fontSize: 16.sp,
                      color: Color(0xff8B8B8B)),
                  decoration: InputDecoration(
                    labelText: "Phone Number",
                    border: InputBorder.none,
                    labelStyle: TextStyle(
                        fontFamily: 'Campton',
                        fontWeight: FontWeight.w400,
                        fontSize: 13.sp,
                        color: Colors.black),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 27.0.w, right: 23.w),
              child: Container(
                height: 43.h,
                padding: EdgeInsets.only(left: 20.0.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(30),
                  ),
                ),
                child: TextFormField(
                  controller: watch.emailIdController,
                  style: TextStyle(
                      fontFamily: 'Campton',
                      fontWeight: FontWeight.w600,
                      fontSize: 16.sp,
                      color: Color(0xff8B8B8B)),
                  decoration: InputDecoration(
                    labelText: "E-mail",
                    border: InputBorder.none,
                    labelStyle: TextStyle(
                        fontFamily: 'Campton',
                        fontWeight: FontWeight.w400,
                        fontSize: 13.sp,
                        color: Colors.black),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 27.0.w, right: 23.w),
              child: Container(
                height: 43.h,
                padding: EdgeInsets.only(left: 20.0.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(30),
                  ),
                ),
                child: TextFormField(
                  readOnly: true,
                  controller: watch.birthDateController,
                  style: TextStyle(
                      fontFamily: 'Campton',
                      fontWeight: FontWeight.w600,
                      fontSize: 16.sp,
                      color: Color(0xff8B8B8B)),
                  decoration: InputDecoration(
                    labelText: "Birth Date",
                    border: InputBorder.none,
                    labelStyle: TextStyle(
                        fontFamily: 'Campton',
                        fontWeight: FontWeight.w400,
                        fontSize: 13.sp,
                        color: Colors.black),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 27.0.w, right: 23.w),
              child: Container(
                height: 43.h,
                padding: EdgeInsets.only(left: 20.0.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(30),
                  ),
                ),
                child: TextFormField(
                  controller: watch.genderController,
                  // textCapitalization: TextCapitalization
                  //     .sentences, // Capitalizes first letter of each sentence.

                  style: TextStyle(
                      fontFamily: 'Campton',
                      fontWeight: FontWeight.w600,
                      fontSize: 16.sp,
                      color: Color(0xff8B8B8B)),
                  decoration: InputDecoration(
                    labelText: "Gender",
                    border: InputBorder.none,
                    labelStyle: TextStyle(
                        fontFamily: 'Campton',
                        fontWeight: FontWeight.w400,
                        fontSize: 13.sp,
                        color: Colors.black),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            // watch.showValueAreaField
            //     ?
            Padding(
              padding: EdgeInsets.only(left: 27.0.w, right: 23.w),
              child: Container(
                height: 43.h,
                padding: EdgeInsets.only(top: 8.0.w, left: 20.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(30),
                  ),
                ),
                child: ProfileDropDown(
                  height: 15.w, // Adjust the height as neede

                  items: watch.countries
                      ?.map((item) => DropdownMenuItem<String>(
                            value: item.id.toString(),
                            child: Text(
                              item.countryName ?? "",
                              style: TextStyle(
                                  fontSize: 14.sp, color: Colors.black),
                            ),
                          ))
                      .toList(),
                  titleHeader: "*Select Country",
                  onChanged: (value) async {
                    print(value.toString());
                    await read.onSelectCountryType(int.parse(value));
                    await read.getCitiesList(context);
                    // await read.onSelectCoutryType(value);
                  },
                  textEditingController: null,
                  // textEditingController: null,
                  // value: watch.countries,
                  // onChanged: (value) async {
                  //   log(value[0]);
                  //   read.onAreaSelected(value, context);
                  // },
                  // items: watch.countries
                  //     ?.map((item) => DropdownMenuItem<String>(
                  //           value: item.countryName.toString(),
                  //           child: Text(
                  //             item.countryName ?? "",
                  //             style: const TextStyle(
                  //               fontSize: 14,
                  //             ),
                  //           ),
                  //         ))
                  //     .toList(),
                  hint: watch.countryName,
                  labelText: "Select Country", // Add label text here
                  // height: 18.w, // Adjust the height as needed
                  // // titleHeader: "Area",
                ),
              ),
            ),
            // : Padding(
            //     padding: EdgeInsets.only(left: 27.0.w, right: 23.w),
            //     child: Container(
            //       height: 45.h,
            //       padding: EdgeInsets.only(left: 20.0.w),
            //       decoration: BoxDecoration(
            //         color: Colors.white,
            //         border: Border.all(color: Colors.grey),
            //         borderRadius: const BorderRadius.all(
            //           Radius.circular(30),
            //         ),
            //       ),
            //       child: Padding(
            //         padding: EdgeInsets.only(top: 10.0.w, right: 20.w),
            //         child: ProfileDropDown(
            //           textEditingController: null,
            //           onChanged: (value) async {
            //             read.onAreaSelected(value, context);
            //           },
            //           items: watch.countries
            //               ?.map((item) => DropdownMenuItem<String>(
            //                     value: item.countryName.toString(),
            //                     child: Text(
            //                       item.countryName ?? "",
            //                       style: const TextStyle(
            //                         fontSize: 14,
            //                       ),
            //                     ),
            //                   ))
            //               .toList(),
            //           hint: watch.countryName,
            // labelText: "Select Country",
            //           height: 18.w, // Adjust the height as needed
            //         ),
            //       ),
            //     ),
            //   ),
            SizedBox(
              height: 20.w,
            ),
            // watch.showValueCityField
            //     ?
            Padding(
              padding: EdgeInsets.only(left: 27.0.w, right: 23.w),
              child: Container(
                height: 43.h,
                padding: EdgeInsets.only(left: 20.0.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(30),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.only(top: 10.0.w, right: 10.w),
                  child: ProfileDropDown(
                      height: 15.w, // Adjust the height as neede
                      items: watch.cityList == null
                          ? [
                              DropdownMenuItem<String>(
                                value: 'City',
                                child: Text(
                                  watch.cityName,
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    color: Colors.black,
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
                                            fontSize: 14.sp,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ))
                                  .toList() ??
                              [],
                      titleHeader: "City",
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
                      labelText: "Select City",
                      hint: watch.cityName
                      // titleHeader: "City",
                      ),
                ),
              ),
            ),

            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 27.0.w, right: 23.w),
              child: Container(
                padding: EdgeInsets.only(left: 20.0.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(17),
                  ),
                ),
                child: TextFormField(
                  style: TextStyle(
                      fontFamily: 'Campton',
                      fontWeight: FontWeight.w600,
                      fontSize: 16.sp,
                      color: const Color(0xff8B8B8B)),
                  controller: watch.addressController,
                  maxLines: 4,
                  decoration: InputDecoration(
                      labelText: "Address",
                      border: InputBorder.none,
                      labelStyle: TextStyle(
                          fontFamily: 'Campton',
                          fontWeight: FontWeight.w400,
                          fontSize: 13.sp,
                          color: Colors.black)),
                ),
              ),
            ),
            SizedBox(
              height: 39.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 27.0.w, right: 23.w),
              child: PrimaryButton(
                width: 350.w,
                height: 40.h,
                // borderColor: black,
                borderRadius: 30,
                color: kDefaultActiveColor,
                onTap: () {
                  read.UpdateProfile(
                    context,
                  );
                  Utils.showPrimarySnackbar(this.context, " result.message",
                      type: SnackType.success);
                },
                child: Text(
                  "Save Changes",
                  style: TextStyle(
                      fontFamily: 'Campton',
                      color: black,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
            SizedBox(
              height: 65.h,
            ),
            Container(
              padding: EdgeInsets.only(left: 27.0.w, right: 23.w),
              child: Text(
                "PASSWORD",
                style: TextStyle(
                    fontFamily: 'Campton',
                    // fontStyle: FontStyle.italic,
                    color: black,
                    // letterSpacing: 5,
                    fontSize: 21.sp,
                    fontWeight: FontWeight.w700),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 27.0.w, right: 23.w),
              child: Container(
                height: 43.h,
                padding: EdgeInsets.only(left: 20.0.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(30),
                  ),
                ),
                child: TextFormField(
                  onChanged: (value) {
                    read.CheckPassword(context);
                  },
                  obscureText: passwordVisible,
                  controller: watch.passwordContyroller,
                  style: TextStyle(
                      fontFamily: 'Campton',
                      fontWeight: FontWeight.w600,
                      fontSize: 16.sp,
                      color: Color(0xff8B8B8B)),
                  decoration: InputDecoration(
                    labelText: "Password",
                    border: InputBorder.none,
                    labelStyle: TextStyle(
                        fontFamily: 'Campton',
                        fontWeight: FontWeight.w400,
                        fontSize: 13.sp,
                        color: Colors.black),
                    suffixIcon: IconButton(
                      icon: Icon(passwordVisible
                          ? Icons.visibility_off
                          : Icons.visibility),
                      onPressed: () {
                        setState(
                          () {
                            passwordVisible = !passwordVisible;
                          },
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 27.0.w, right: 23.w),
              child: Container(
                height: 43.h,
                padding: EdgeInsets.only(left: 20.0.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(30),
                  ),
                ),
                child: TextFormField(
                  obscureText: passwordVisible1,
                  controller: watch.newPasswordController,
                  style: TextStyle(
                      fontFamily: 'Campton',
                      fontWeight: FontWeight.w600,
                      fontSize: 16.sp,
                      color: Color(0xff8B8B8B)),
                  decoration: InputDecoration(
                    labelText: "New Password",
                    border: InputBorder.none,
                    labelStyle: TextStyle(
                        fontFamily: 'Campton',
                        fontWeight: FontWeight.w400,
                        fontSize: 13.sp,
                        color: Colors.black),
                    suffixIcon: IconButton(
                      icon: Icon(passwordVisible1
                          ? Icons.visibility_off
                          : Icons.visibility),
                      onPressed: () {
                        setState(
                          () {
                            passwordVisible1 = !passwordVisible1;
                          },
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 27.0.w, right: 23.w),
              child: Container(
                height: 43.h,
                padding: EdgeInsets.only(left: 20.0.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(30),
                  ),
                ),
                child: TextFormField(
                  obscureText: passwordVisible2,
                  controller: watch.re_TypePasswordContyroller,
                  style: TextStyle(
                      fontFamily: 'Campton',
                      fontWeight: FontWeight.w600,
                      fontSize: 16.sp,
                      color: Color(0xff8B8B8B)),
                  decoration: InputDecoration(
                    // labelText: "Re-New Password",
                    labelText: "Confirm Password",
                    border: InputBorder.none,
                    labelStyle: TextStyle(
                        fontFamily: 'Campton',
                        fontWeight: FontWeight.w400,
                        fontSize: 13.sp,
                        color: Colors.black),
                    suffixIcon: IconButton(
                      icon: Icon(passwordVisible2
                          ? Icons.visibility_off
                          : Icons.visibility),
                      onPressed: () {
                        setState(
                          () {
                            passwordVisible2 = !passwordVisible2;
                          },
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 27.0.w, right: 23.w),
              child: PrimaryButton(
                width: 360.w,
                height: 40.h,
                // borderColor: black,
                borderRadius: 30,
                color: kDefaultActiveColor,
                onTap: () {
                  read.UpdatePassword(context);

                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //       builder: (context) => LoginScreenView()),
                  // );
                },
                child: Text(
                  "Change Password",
                  style: TextStyle(
                      fontFamily: 'Campton',
                      // fontStyle: FontStyle.italic,
                      color: black,
                      // letterSpacing: .5,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
            SizedBox(
              height: 100.h,
            ),
          ],
        );
      }),
    );
  }
}
