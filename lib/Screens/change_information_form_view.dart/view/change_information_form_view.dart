import 'package:datepicker_dropdown/datepicker_dropdown.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:md_health/Screens/change_information_form_view.dart/controller/change_information_controller.dart';
import 'package:md_health/Screens/health/packages/view/packages_view.dart';
import 'package:md_health/widget/base_screen.dart';
import 'package:md_health/widget/buttons.dart';
import 'package:md_health/widget/custom_appbar.dart';
import 'package:md_health/widget/drop_down.dart';
import 'package:md_health/widget/text_field.dart';
import 'package:provider/provider.dart';

class ChangeInformationFormView extends StatefulWidget {
  final String? packageId;
  final String? purchaseId;
  final String? patientId;
  final String? type;
  const ChangeInformationFormView(
      {super.key, this.packageId, this.purchaseId, this.patientId, this.type});

  @override
  State<ChangeInformationFormView> createState() =>
      _ChangeInformationFormViewState();
}

class _ChangeInformationFormViewState extends State<ChangeInformationFormView> {
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      // log(widget.packageId ?? '');
      context.read<ChnagePatientController>().initState(context,
          widget.packageId, widget.purchaseId, widget.patientId, widget.type);
    });
  }

  @override
  Widget build(BuildContext context) {
    final read = context.read<ChnagePatientController>();
    final watch = context.watch<ChnagePatientController>();
    return BaseScreen(
      onWillPop: () async {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => PackageSView(
                      packageId: watch.packageId.toString(),
                      // packageId:
                    )));

        return false;
      },
      backgroundColor: const Color(0xffF5F5F5),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(110.w),
        child: CustomAppBar(
          onBackPressed: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => PackageSView(
                          packageId: watch.packageId.toString(),
                          // packageId:
                        )));
          },
          hasBackButton: true,
          hasMdTitle: false,
        ),
      ),
      content: Column(
        children: [
          SizedBox(
            height: 20.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Change Patient \n Information",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Campton',
                  color: Colors.black,
                  fontSize: 24,
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
                  padding: const EdgeInsets.all(20.0),
                  // : const EdgeInsets.all(20.0),
                  child: PrimaryInformationTextFormFieldNew(
                    controller: watch.patientFullNameController,
                    // color: Colors.red,
                    // width: 48.w,
                    titleHeader: "*Patient First Name",
                    hintText: "First Name",
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20.0.w, right: 20.w),
                  child: PrimaryInformationTextFormFieldNew(
                    controller: watch.patientLastNameController,
                    // color: Colors.red,
                    // width: 48.w,
                    titleHeader: "*Patient Last Name",
                    hintText: "Last Name",
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20.0.w, right: 20.w),
                  child: PrimaryInformationTextFormFieldNew(
                    controller: watch.patientRelationController,
                    // color: Colors.red,
                    // width: 48.w,
                    titleHeader: "*Relationship To You",
                    hintText: "Relationship To You",
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20.0.w, right: 20.w),
                  child: PrimaryInformationTextFormFieldNew(
                    controller: watch.patientEmailController,
                    // color: Colors.red,
                    // width: 48.w,
                    titleHeader: "Patient E-mail  *optional",
                    hintText: "E-mail",
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20.0.w, right: 20.w),
                  child: PrimaryInformationTextFormFieldNew(
                    controller: watch.patientNumberController,
                    // color: Colors.red,
                    // width: 48.w,
                    titleHeader: "*Patient Contact Number",
                    hintText: "Contact Number",
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                // DropdownDatePicker(
                //   inputDecoration: InputDecoration(
                //     enabledBorder: OutlineInputBorder(
                //       borderSide: BorderSide(color: Colors.grey, width: 1.0),
                //       borderRadius:
                //           BorderRadius.circular(20.0), // Set border radius
                //     ),
                //     border: OutlineInputBorder(
                //       borderRadius:
                //           BorderRadius.circular(20.0), // Set border radius
                //     ),
                //   ),
                //   isDropdownHideUnderline: true,
                //   isFormValidator: true,
                //   startYear: 1900,
                //   endYear: 2020,
                //   width: 5,
                //   selectedMonth: 10,
                //   selectedYear: 1993,
                //   onChangedDay: (value) => print('onChangedDay: $value'),
                //   onChangedMonth: (value) => print('onChangedMonth: $value'),
                //   onChangedYear: (value) => print('onChangedYear: $value'),
                // ),
                // Padding(
                //   padding: EdgeInsets.only(left: 20.0.w, right: 20.w),
                //   child: PrimaryInformationTextFormField(
                //     // color: Colors.red,
                //     // width: 48.w,
                //     titleHeader: "*Patient Full Name",
                //     hintText: "Full Name",
                //   ),
                // ),
                Padding(
                  padding: EdgeInsets.only(left: 20.0.w, right: 20.w),
                  child: PrimaryInformationTextFormFieldNew(
                    hintText: "Date",
                    controller: watch.BirthDateController,
                    titleHeader: "*Patient Birth Date",
                    readOnly: true,
                    onTap: () async {
                      var datePicked = await DatePicker.showSimpleDatePicker(
                        context,
                        initialDate: DateTime(2020),
                        firstDate: DateTime(1900),
                        lastDate: DateTime(2090),
                        dateFormat: "dd-MM-yyyy",
                        locale: DateTimePickerLocale.en_us,
                        looping: true,
                      );
                      if (datePicked != null) {
                        String date = DateFormat('dd-MM-yyy')
                            .format(datePicked ?? DateTime.now());
                        read.onToDateSelected(date);
                      }
                      // final snackBar = SnackBar(
                      //     content: Text("Date Picked $datePicked"));
                      // ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    },
                    suffix: GestureDetector(
                      onTap: () async {
                        var datePicked = await DatePicker.showSimpleDatePicker(
                          context,
                          initialDate: DateTime(2020),
                          firstDate: DateTime(1900),
                          lastDate: DateTime(2090),
                          dateFormat: "dd-MM-yyyy",
                          locale: DateTimePickerLocale.en_us,
                          looping: true,
                        );
                        if (datePicked != null) {
                          String date = DateFormat('dd-MM-yyy')
                              .format(datePicked ?? DateTime.now());
                          read.onToDateSelected(date);
                        }
                      },
                      child: const Icon(Icons.calendar_today_outlined,
                          color: Colors.green),
                    ),
                    // hintFontSize: 15.sp,
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20.0.w, right: 20.w),
                  child: ChangeDropDownInformation(
                    hint: watch.countryName,
                    // items: watch.countryList
                    //     ?.map((item) => DropdownMenuItem<String>(
                    //           value: item.id.toString(),
                    //           child: Text(
                    //             item.countryName ?? "",
                    //             style: TextStyle(
                    //                 fontFamily: 'Campton',
                    //                 fontSize: 14.sp,
                    //                 color: Colors.black),
                    //           ),
                    //         ))
                    //     .toList(),
                    // titleHeader: "*Patient Country",
                    // onChanged: (value) async {
                    //   print(value.toString());
                    //   await read.onSelectCountryType(int.parse(value));
                    //   read.getCities(context);
                    //   print("object");
                    //   // await read.onSelectCoutryType(value);
                    // },
                    // textEditingController: null,
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
                    titleHeader: "*Patient Country",
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
                    hint: watch.cityName,
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
                    titleHeader: "*Patient City",
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
                  height: 20.h,
                ),
                RichText(
                  text: TextSpan(
                    text:
                        "*You can also change the patient information\n  from",
                    style: TextStyle(
                        fontFamily: 'Campton',
                        color: Colors.black,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500),

                    /*defining default style is optional */
                    children: <TextSpan>[
                      TextSpan(
                        text: ' panel ',
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
                      TextSpan(
                        text: '>',
                        style: TextStyle(
                            color: Color(0xff4CDB06),
                            fontSize: 16.sp,
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
                            fontFamily: 'Campton',
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
                SizedBox(
                  height: 36.h,
                ),
                widget.type == "other"
                    ? Padding(
                        padding: EdgeInsets.only(left: 20.0.w, right: 20.w),
                        child: PrimaryButton(
                          width: ScreenUtil().screenWidth,
                          borderRadius: 30,
                          color: Color(0xff4CDB06),
                          onTap: () {
                            print(watch.patientId);

                            read.updateChangeInfo(
                              context,
                            );
                          },
                          child: Text(
                            "Change Patient",
                            style: TextStyle(
                                fontFamily: 'Campton',
                                color: Color(0xff000000),
                                // letterSpacing: .5,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      )
                    : Container(),
                SizedBox(
                  height: 20.h,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 80.h,
          ),
        ],
      ),
    );
  }
}
