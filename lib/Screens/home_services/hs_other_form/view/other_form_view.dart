import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:md_health/Screens/home_services/hs_other_form/controller/hs_other_controller.dart';
import 'package:md_health/Screens/health/search/view/search_details_view.dart';
import 'package:md_health/test_widget.dart';
import 'package:md_health/widget/base_screen.dart';
import 'package:md_health/widget/buttons.dart';
import 'package:md_health/widget/custom_appbar.dart';
import 'package:md_health/widget/drop_down.dart';
import 'package:md_health/widget/text_field.dart';
import 'package:provider/provider.dart';

class HSotherFormView extends StatefulWidget {
  final String? packageId;
  final String? cityName;
  final String? screenName;
  final String? selectedDate;
  const HSotherFormView(
      {super.key,
      required this.packageId,
      this.cityName,
      this.screenName,
      this.selectedDate});

  @override
  State<HSotherFormView> createState() => _HSotherFormViewState();
}

class _HSotherFormViewState extends State<HSotherFormView> {
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      // log(widget.packageId ?? '');
      context
          .read<HsOtherFormController>()
          .initState(context, widget.packageId, widget.selectedDate);
    });
    print('***********${widget.selectedDate}');
  }

  @override
  Widget build(BuildContext context) {
    final read = context.read<HsOtherFormController>();
    final watch = context.watch<HsOtherFormController>();
    return BaseScreen(
      onWillPop: () async {
        Navigator.pushReplacement(
          context,
          SlidePageRoute(
            page: SearchDetailsView(
              packageId: watch.packageId,
              // packageId: watch.packageId,
            ),
            direction: SlideDirection.left, // Specify the slide direction here
            delay: Duration(milliseconds: 5000),
          ),
          // MaterialPageRoute(
          //     builder: (context) => SearchView(
          // packageId: watch.packageId,
          // refresh: true,
          // cityName: widget.cityName
          // ))
        );

        return false;
      },
      backgroundColor: const Color(0xffF5F5F5),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(120.w),
        child: CustomAppBar(
          // hasMdTitle: false,
          mdTitle: "service",

          onBackPressed: () {
            Navigator.pushReplacement(
              context,
              SlidePageRoute(
                page: SearchDetailsView(
                  packageId: watch.packageId,
                  // packageId: watch.packageId,
                ),
                direction:
                    SlideDirection.left, // Specify the slide direction here
                delay: Duration(milliseconds: 5000),
              ),
              // MaterialPageRoute(
              //     builder: (context) => SearchView(
              // packageId: watch.packageId,
              // refresh: true,
              // cityName: widget.cityName
              // ))
            );
          },
          hasBackButton: true,
          // hasMdTitle: false,
          // drawerTitle: "Orders",
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
                  "Please fill the\n patient information",
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
                      controller: watch.hspatientFirstNameController,
                      // color: Colors.red,
                      // width: 48.w,
                      titleHeader: "*Patient First Name",
                      hintText: "First Name",
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
                      controller: watch.hspatientLastNameController,
                      // color: Colors.red,
                      // width: 48.w,
                      titleHeader: "*Patient Last Name",
                      hintText: "Last Name",
                      // allowCommasAndDotsAndSpaces: false,
                      // allowOnlyDigits: false,
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20.0.w, right: 20.w),
                    child: PrimaryInformationTextFormField(
                      controller: watch.hsPatientRelationController,
                      // color: Colors.red,
                      // width: 48.w,
                      titleHeader: "*Relationship To You",
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
                    child: PrimaryInformationTextFormField(
                      controller: watch.hspatientEmailController,
                      // color: Colors.red,
                      // width: 48.w,
                      titleHeader: "Patient E-mail  *optional",
                      hintText: " E-mail",
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20.0.w, right: 20.w),
                    child: PrimaryInformationTextFormField(
                      controller: watch.hspatientNumberController,
                      // color: Colors.red,
                      // width: 48.w,
                      titleHeader: "*Patient Contact Number",
                      hintText: "Contact Number",
                      textInputType: TextInputType.number,
                      lengthLimitingTextInputFormatter:
                          LengthLimitingTextInputFormatter(10),
                      // allowOnlyDigits: true,
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20.0.w, right: 20.w),
                    child: GestureDetector(
                      child: PrimaryInformationTextFormField(
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
                        controller: watch.hspatientbirthDateController,
                        titleHeader: "*Patient Birth Date",
                        hintText: "Date of Birth",
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
                            // final snackBar = SnackBar(
                            //     content: Text("Date Picked $datePicked"));
                            // ScaffoldMessenger.of(context)
                            //     .showSnackBar(snackBar);
                          },
                          child: const Icon(Icons.calendar_today_outlined,
                              color: Colors.green),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20.0.w, right: 20.w),
                    child: ProfileDropDownInformation(
                      height: 39.h,
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
                      titleHeader: "*Patient Country",
                      onChanged: (value) async {
                        if (value != null && value != '') {
                          print(value.toString());
                          await read.onSelectCountryType(int.parse(value));
                          read.getCities(context);
                        }
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
                    child: ProfileDropDownInformation(
                      height: 39.h,
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
                                color: Color(0xff4CDB06),
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
                      print("hfdg yurgut");
                      // print(watch.BirthDateController);
                      print("hfdg yurgut");
                      read.hsOtherForm(
                        // watch.packageId,
                        context,
                      );
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
