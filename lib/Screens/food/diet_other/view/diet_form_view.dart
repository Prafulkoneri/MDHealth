import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:md_health/Screens/food/diet_other/controller/diet_other_form_controller.dart';
import 'package:md_health/Screens/food/diet_plan/view/deit_plan_result.dart';
import 'package:md_health/test_widget.dart';
import 'package:md_health/utils/utils.dart';
import 'package:md_health/widget/base_screen.dart';
import 'package:md_health/widget/buttons.dart';
import 'package:md_health/widget/custom_appbar.dart';
import 'package:md_health/widget/drop_down.dart';
import 'package:md_health/widget/text_field.dart';
import 'package:provider/provider.dart';

class DietOtherInformationView extends StatefulWidget {
  final String? foodpackageId;
  final String? birthDateController;
  final String? subscriptionType;
  final String? type;
  final String? salePrices;

  const DietOtherInformationView(
      {super.key,
      required this.foodpackageId,
      required this.birthDateController,
      required this.subscriptionType,
      required this.type,
      required this.salePrices});

  @override
  State<DietOtherInformationView> createState() => _InformationFormViewState();
}

class _InformationFormViewState extends State<DietOtherInformationView> {
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      // log(widget.packageId ?? '');
      context.read<DietOtherFormController>().initState(
          context,
          widget.foodpackageId,
          widget.birthDateController,
          widget.subscriptionType,
          widget.salePrices);
    });
  }

//
  @override
  Widget build(BuildContext context) {
    final read = context.read<DietOtherFormController>();
    final watch = context.watch<DietOtherFormController>();
    return BaseScreen(
      onWillPop: () async {
        Navigator.pushReplacement(
          context,
          SlidePageRoute(
            page: const DietPlanResult(
              subscriptionType: "",
              food: "",
              calories: "",
              // packageId: watch.packageId,
            ),
            direction: SlideDirection.left, // Specify the slide direction here
            delay: const Duration(milliseconds: 5000),
          ),
        );

        return false;
      },
      backgroundColor: const Color(0xffF5F5F5),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(120.w),
        child: CustomAppBar(
          // hasHiText: true,
          mdTitle: 'food',
          onBackPressed: () {
            Navigator.pushReplacement(
              context,
              SlidePageRoute(
                page: const DietPlanResult(
                  subscriptionType: "",
                  food: "",
                  calories: "",
                  // packageId: watch.packageId,
                ),
                direction:
                    SlideDirection.left, // Specify the slide direction here
                delay: const Duration(milliseconds: 5000),
              ),
            );
          },
          hasBackButton: true,
        ),
      ),
      content: Builder(builder: (context) {
        return Column(
          children: [
            SizedBox(
              height: 20.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Please fill the\n person  information",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Campton',
                    color: Colors.black,
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w700,
                  ),
                  // style: TextStyle(
                  //     color: textColor ?? Colors.white,
                  //     fontWeight: fontWeight ?? FontWeight.w700,
                  //     fontSize: fontSize ?? 14.sp),
                ),
              ],
            ),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              margin: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Padding(
                    padding:
                        EdgeInsets.only(left: 20.0.w, top: 20.w, right: 20.w),
                    // : const EdgeInsets.all(20.0),
                    child: PrimaryInformationTextFormField(
                      controller: watch.rpatientFullNameController,
                      // color: Colors.red,
                      // width: 48.w,
                      titleHeader: "*Name",
                      hintText: "First Name",
                      // allowCommasAndDotsAndSpaces: false,
                      // allowOnlyDigits: false,
                    ),
                  ),
                  // SizedBox(
                  //   height: 10.h,
                  // ),
                  Padding(
                    padding:
                        EdgeInsets.only(left: 20.0.w, top: 20.w, right: 20.w),
                    // : const EdgeInsets.all(20.0),
                    child: PrimaryInformationTextFormField(
                      controller: watch.rpatientRelationtoYuController,
                      // color: Colors.red,
                      // width: 48.w,
                      titleHeader: "Relationship To You",
                      hintText: "Relationship To You",
                      // allowCommasAndDotsAndSpaces: false,
                      // allowOnlyDigits: false,
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20.0.w, right: 20.w),
                    // : const EdgeInsets.all(20.0),
                    child: PrimaryInformationTextFormField(
                      controller: watch.rpatientEmailController,
                      // color: Colors.red,
                      // width: 48.w,
                      titleHeader: "* E-mail",
                      hintText: "Email",
                      // allowCommasAndDotsAndSpaces: false,
                      // allowOnlyDigits: false,
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20.0.w, right: 20.w),
                    child: MDaitePrimaryInformationTextFormField(
                      lengthLimitingTextInputFormatter:
                          LengthLimitingTextInputFormatter(10),
                      // inputFormatters: [
                      //   FilteringTextInputFormatter.digitsOnly,
                      //   LengthLimitingTextInputFormatter(10),
                      // ],

                      textInputType: TextInputType.number,
                      controller: watch.rpatientNumberController,
                      // color: Colors.red,
                      // width: 48.w,
                      titleHeader: "*Contact Mobile",
                      hintText: "Contact Number",
                      // allowCommasAndDotsAndSpaces: false,
                      // allowOnlyDigits: false,
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  // Padding(
                  //   padding: EdgeInsets.only(left: 20.0.w, right: 20.w),
                  //   child: PrimaryInformationTextFormField(
                  //     controller: watch.patientEmailController,
                  //     // color: Colors.red,
                  //     // width: 48.w,
                  //     titleHeader: "Patient E-mail  *optional",
                  //     hintText: " E-mail",
                  //   ),
                  // ),
                  // SizedBox(
                  //   height: 10.h,
                  // ),
                  // Padding(
                  //   padding: EdgeInsets.only(left: 20.0.w, right: 20.w),
                  //   child: PrimaryInformationTextFormField(
                  //     controller: watch.patientNumberController,
                  //     // color: Colors.red,
                  //     // width: 48.w,
                  //     titleHeader: "*Patient Contact Number",
                  //     hintText: "Contact Number",
                  //     textInputType: TextInputType.number,
                  //     lengthLimitingTextInputFormatter:
                  //         LengthLimitingTextInputFormatter(10),
                  //     // allowOnlyDigits: true,
                  //   ),
                  // ),
                  // SizedBox(
                  //   height: 10.h,
                  // ),
                  // Padding(
                  //   padding: EdgeInsets.only(left: 20.0.w, right: 20.w),
                  //   child: GestureDetector(
                  //     child: PrimaryInformationTextFormField(
                  //       onTap: () async {
                  //         var datePicked =
                  //             await DatePicker.showSimpleDatePicker(
                  //           context,
                  //           initialDate: DateTime(2020),
                  //           firstDate: DateTime(1900),
                  //           lastDate: DateTime(2090),
                  //           dateFormat: "dd-MMMM-yyyy",
                  //           locale: DateTimePickerLocale.en_us,
                  //           looping: true,
                  //         );
                  //         if (datePicked != null) {
                  //           String date = DateFormat('dd-MM-yyy')
                  //               .format(datePicked ?? DateTime.now());
                  //           read.onDateSelected(date);
                  //         }
                  //       },
                  //       controller: watch.BirthDateController,
                  //       titleHeader: "*Patient Birth Date",
                  //       hintText: "Date of Birth",
                  //       suffix: GestureDetector(
                  //         onTap: () async {
                  //           var datePicked =
                  //               await DatePicker.showSimpleDatePicker(
                  //             context,
                  //             initialDate: DateTime(2020),
                  //             firstDate: DateTime(1900),
                  //             lastDate: DateTime(2090),
                  //             dateFormat: "dd-MMMM-yyyy",
                  //             locale: DateTimePickerLocale.en_us,
                  //             looping: true,
                  //           );
                  //           if (datePicked != null) {
                  //             String date = DateFormat('dd-MM-yyy')
                  //                 .format(datePicked ?? DateTime.now());
                  //             read.onDateSelected(date);
                  //           }
                  //         },
                  //         child: const Icon(Icons.calendar_today_outlined,
                  //             color: Colors.green),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  // SizedBox(
                  //   height: 10.h,
                  // ),
                  // Padding(
                  //   padding: EdgeInsets.only(left: 20.0.w, right: 20.w),
                  //   child: ProfileDropDownInformation(
                  //     height: 39.h,
                  //     hint: "Country",
                  //     items: watch.countryList
                  //         ?.map((item) => DropdownMenuItem<String>(
                  //               value: item.id.toString(),
                  //               child: Text(
                  //                 item.countryName ?? "",
                  //                 style: TextStyle(
                  //                     fontSize: 14.sp, color: Colors.black),
                  //               ),
                  //             ))
                  //         .toList(),
                  //     titleHeader: "*Receipent Country",
                  //     onChanged: (value) async {
                  //       print(value.toString());
                  //       await read.onSelectCountryType(int.parse(value));
                  //       read.getCities(context);
                  //       // await read.onSelectCoutryType(value);
                  //     },
                  //     textEditingController: null,
                  //   ),
                  // ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20.0.w, right: 20.w),
                    child: ChangeDropDownInformation(
                      hint: "Country",
                      items: watch.countryList
                          ?.map((item) => DropdownMenuItem<String>(
                                value: item.id.toString(),
                                child: Text(
                                  item.countryName ?? "",
                                  style: TextStyle(
                                      fontSize: 14.sp, color: Colors.black),
                                ),
                              ))
                          .toList(),
                      titleHeader: "*Country",
                      onChanged: (value) async {
                        print(value.toString());
                        await read.onSelectCountryType(int.parse(value));
                        read.getCities(context);
                        // await read.onSelectCoutryType(value);
                      },
                      textEditingController: null,
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),

                  Padding(
                    padding: EdgeInsets.only(left: 20.0.w, right: 20.w),
                    child: ChangeDropDownInformation(
                      hintSize: 29,
                      hint: "City",
                      items: watch.cityList == null
                          ? [
                              DropdownMenuItem<String>(
                                value: 'City',
                                child: Text(
                                  "City",
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
                      titleHeader: "*City",
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
                  // Padding(
                  //   padding: EdgeInsets.only(left: 20.0.w, right: 20.w),
                  //   child: ProfileDropDownInformation(
                  //     height: 39.h,
                  //     hint: "City",
                  //     items: watch.cityList
                  //         ?.map((item) => DropdownMenuItem<String>(
                  //               value: item.id.toString(),
                  //               child: Text(
                  //                 item.cityName ?? "",
                  //                 style: TextStyle(
                  //                     fontSize: 14.sp, color: Colors.black),
                  //               ),
                  //             ))
                  //         .toList(),
                  //     titleHeader: "*Receipent City",
                  //     onChanged: (value) {
                  //       print(value.toString());
                  //       read.onSelectCityType(int.parse(value));
                  //       // await read.onSelectCoutryType(value);
                  //     },
                  //     value: watch.cityListId?.toString() ?? null,
                  //     textEditingController: null,
                  //   ),
                  // ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20.0.w, right: 20.w),
                    child: PrimaryInformationTextFormField(
                      // height: 100,
                      // maxLines: 2000,
                      controller: watch.postalcodeController,
                      // color: Colors.red,
                      // width: 48.w,
                      titleHeader: "*Postal Code",
                      hintText: "Postal Code",
                      textInputType: TextInputType.number,
                      lengthLimitingTextInputFormatter:
                          LengthLimitingTextInputFormatter(6),
                      // allowOnlyDigits: true,
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20.0.w, right: 20.w),
                    child: PrimaryInformationTextFormField(
                      height: 100,
                      maxLines: 100,
                      controller: watch.rpatientAddressController,
                      // color: Colors.red,
                      // width: 48.w,
                      titleHeader: "*Full Address",
                      hintText: "Full Address",
                      // textInputType: TextInputType.number,
                      // lengthLimitingTextInputFormatter:
                      //     LengthLimitingTextInputFormatter(10),
                      // allowOnlyDigits: true,
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),

                  Padding(
                    padding: EdgeInsets.only(left: 20.0.w, right: 20.w),
                    child: PrimaryInformationTextFormField(
                      height: 100,
                      maxLines: 100,
                      controller: watch.rpatientNotesController,
                      // color: Colors.red,
                      // width: 48.w,
                      titleHeader: "Gift Notes (*Optional)",
                      hintText: "Write here",
                      // textInputType: TextInputType.number,
                      // lengthLimitingTextInputFormatter:
                      //     LengthLimitingTextInputFormatter(10),
                      // allowOnlyDigits: true,
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 18.0.w, right: 18.w),
                    child: RichText(
                      // textAlign: TextAlign.start,
                      text: TextSpan(
                        text:
                            "*You can also change the patient information\n  from",
                        style: TextStyle(
                            fontFamily: 'Campton',
                            color: Colors.black,
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w500),

                        /*defining default style is optional */
                        children: <TextSpan>[
                          TextSpan(
                            text: ' panel ',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14.sp,
                                fontFamily: 'Campton',
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
                            text: '>',
                            style: TextStyle(
                                color: const Color(0xff4CDB06),
                                fontSize: 14.sp,
                                fontFamily: 'Campton',
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
                            text: ' packages ',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14.sp,
                                fontFamily: 'Campton',
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
                  SizedBox(
                    height: 36.h,
                  ),
                  PrimaryButton(
                    width: 300.w,
                    // borderRadius: BorderRadius.circular(),
                    borderRadius: 30,
                    // width: ScreenUtil().screenWidth,
                    color: const Color(0xff4CDB06),
                    onTap: () {
                      // return;
                      if (watch.rpatientNumberController.text.length < 10) {
                        Utils.showPrimarySnackbar(
                            context, "Please Enter Mobile Number",
                            type: SnackType.error);
                        return;
                      }
                      // if (watch.rpatientNumberController.text.length < 10) {
                      //   return;
                      // }
                      read.dietOtherForm(
                        context,
                        widget.foodpackageId,
                        widget.birthDateController,
                        widget.subscriptionType,
                        widget.salePrices,
                        // watch.packageId,
                      );
                      // Navigator.push(
                      //   context,
                      //   SlidePageRoute(
                      //     page: PaymentDetailsViewDiet(
                      //       type: "gift",
                      //       foodPackageId: widget.foodpackageId,
                      //       subscriptionType: widget.subscriptionType,
                      //       subscriptionStartDate: widget.birthDateController,
                      //     ),
                      //     direction: SlideDirection.right,
                      //     delay: Duration(milliseconds: 5000),
                      //   ),
                      // );
                    },
                    child: Text(
                      "Go Payment Page",
                      style: TextStyle(
                          fontFamily: 'Campton',
                          color: Colors.black,
                          // letterSpacing: .5,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  SizedBox(
                    height: 106.h,
                  ),
                ],
              ),
            )
          ],
        );
      }),
    );
  }
}

DateTime? _dateTime(int? day, int? month, int? year) {
  if (day != null && month != null && year != null) {
    return DateTime(year, month, day);
  }
  return null;
}
