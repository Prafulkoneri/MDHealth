import 'package:datepicker_dropdown/datepicker_dropdown.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:md_health/Screens/hotel/view/hotel_view.dart';
import 'package:md_health/constants/styles/colors.dart';
import 'package:md_health/widget/buttons.dart';
import 'package:md_health/widget/drop_down.dart';
import 'package:md_health/widget/text_field.dart';

class FormPopUp extends StatefulWidget {
  const FormPopUp({super.key});

  @override
  State<FormPopUp> createState() => _FormPopUpState();
}

class _FormPopUpState extends State<FormPopUp> {
  final List<String> list =
      List<String>.generate(30, (index) => (index + 1).toString());
  final List<String> monthList =
      List<String>.generate(12, (index) => (index + 1).toString());
  final List<String> yearsList = List<String>.generate(
      2023 - 1980 + 1, (index) => (1980 + index).toString());

  @override
  Widget build(BuildContext context) {
    String dropdownValue = list.first;
    String monthDropdownValue = monthList.first;
    String yearDropdownValue = yearsList.first;

    return Material(
      color: Colors.transparent,
      child: Container(
        decoration: const BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.all(Radius.circular(15))),
        margin: EdgeInsets.symmetric(vertical: 10.w, horizontal: 15.w),
        child: Stack(
          children: [
            Container(
                // color: Colors.blue,
                ),
            Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                color: Colors.white,
              ),
              margin: EdgeInsets.symmetric(horizontal: 7.w),
              padding: EdgeInsets.only(top: 150.w),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    SizedBox(
                      height: 20.h,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Do you want hotel reservations?",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Campton',
                            color: Colors.black,
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      // margin:  EdgeInsets.symmetric(vertical: 20.w),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                        child: Column(
                          children: [
                            SDropDownField(
                              titleHeader: "",
                              onChanged: (value) {
                                // read.onSelectAccountType(value);
                              },
                              hint: "Cities",
                              items: [
                                DropdownMenuItem(
                                  value: "current",
                                  child: Text(
                                    "Current",
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                    ),
                                  ),
                                ),
                                DropdownMenuItem(
                                  value: "saving",
                                  child: Text(
                                    "Saving",
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            SDropDownField(
                              titleHeader: "",
                              onChanged: (value) {
                                // read.onSelectAccountType(value);
                              },
                              hint: "4 or less stars",
                              items: [
                                DropdownMenuItem(
                                  value: "current",
                                  child: Text(
                                    "Current",
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                    ),
                                  ),
                                ),
                                DropdownMenuItem(
                                  value: "saving",
                                  child: Text(
                                    "Saving",
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            Padding(
                              padding: EdgeInsets.only(bottom: 10.0.w),
                              child: Text(
                                'Enter Date',
                                style: TextStyle(
                                  fontFamily: 'Campton',
                                  color: kDefaultActiveColor,
                                  fontSize: 17.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  margin: EdgeInsets.zero,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: const Color(0xffEFEFEF),
                                        width: 1.0.w),
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16.0),
                                    child: DropdownButton(
                                      value: dropdownValue,
                                      icon: Padding(
                                        padding: EdgeInsets.only(left: 8.0.w),
                                        child: SvgPicture.asset(
                                          'assets/icons/iconamoon_arrow-up-2.svg',
                                          color: const Color(0xff989898),
                                        ),
                                      ),
                                      style: const TextStyle(
                                          color: Color(0xff989898)),
                                      underline: const SizedBox.shrink(),
                                      onChanged: (String? value) {
                                        // This is called when the user selects an item.
                                        setState(() {
                                          dropdownValue = value!;
                                        });
                                      },
                                      items: list.map<DropdownMenuItem<String>>(
                                          (String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.zero,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: const Color(0xffEFEFEF),
                                        width: 1.0.w),
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16.0),
                                    child: DropdownButton(
                                      value: monthDropdownValue,
                                      icon: Padding(
                                        padding: EdgeInsets.only(left: 8.0.w),
                                        child: SvgPicture.asset(
                                          'assets/icons/iconamoon_arrow-up-2.svg',
                                          color: const Color(0xff989898),
                                        ),
                                      ),
                                      style: const TextStyle(
                                          color: Color(0xff989898)),
                                      underline: const SizedBox.shrink(),
                                      onChanged: (String? value) {
                                        // This is called when the user selects an item.
                                        setState(() {
                                          monthDropdownValue = value!;
                                        });
                                      },
                                      items: monthList
                                          .map<DropdownMenuItem<String>>(
                                              (String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.zero,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: const Color(0xffEFEFEF),
                                        width: 1.0.w),
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16.0),
                                    child: DropdownButton(
                                      value: yearDropdownValue,
                                      icon: Padding(
                                        padding: EdgeInsets.only(left: 8.0.w),
                                        child: SvgPicture.asset(
                                          'assets/icons/iconamoon_arrow-up-2.svg',
                                          color: const Color(0xff989898),
                                        ),
                                      ),
                                      style: const TextStyle(
                                          color: Color(0xff989898)),
                                      underline: const SizedBox.shrink(),
                                      onChanged: (String? value) {
                                        // This is called when the user selects an item.
                                        setState(() {
                                          yearDropdownValue = value!;
                                        });
                                      },
                                      items: yearsList
                                          .map<DropdownMenuItem<String>>(
                                              (String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            Padding(
                              padding: EdgeInsets.only(bottom: 10.0.w),
                              child: Text(
                                'Enter Date',
                                style: TextStyle(
                                  fontFamily: 'Campton',
                                  color: kDefaultActiveColor,
                                  fontSize: 17.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  margin: EdgeInsets.zero,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: const Color(0xffEFEFEF),
                                        width: 1.0.w),
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16.0),
                                    child: DropdownButton(
                                      value: dropdownValue,
                                      icon: Padding(
                                        padding: EdgeInsets.only(left: 8.0.w),
                                        child: SvgPicture.asset(
                                          'assets/icons/iconamoon_arrow-up-2.svg',
                                          color: const Color(0xff989898),
                                        ),
                                      ),
                                      style: const TextStyle(
                                          color: Color(0xff989898)),
                                      underline: const SizedBox.shrink(),
                                      onChanged: (String? value) {
                                        // This is called when the user selects an item.
                                        setState(() {
                                          dropdownValue = value!;
                                        });
                                      },
                                      items: list.map<DropdownMenuItem<String>>(
                                          (String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.zero,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: const Color(0xffEFEFEF),
                                        width: 1.0.w),
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16.0),
                                    child: DropdownButton(
                                      value: monthDropdownValue,
                                      icon: Padding(
                                        padding: EdgeInsets.only(left: 8.0.w),
                                        child: SvgPicture.asset(
                                          'assets/icons/iconamoon_arrow-up-2.svg',
                                          color: const Color(0xff989898),
                                        ),
                                      ),
                                      style: const TextStyle(
                                          color: Color(0xff989898)),
                                      underline: const SizedBox.shrink(),
                                      onChanged: (String? value) {
                                        // This is called when the user selects an item.
                                        setState(() {
                                          monthDropdownValue = value!;
                                        });
                                      },
                                      items: monthList
                                          .map<DropdownMenuItem<String>>(
                                              (String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.zero,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: const Color(0xffEFEFEF),
                                        width: 1.0.w),
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16.0),
                                    child: DropdownButton(
                                      value: yearDropdownValue,
                                      icon: Padding(
                                        padding: EdgeInsets.only(left: 8.0.w),
                                        child: SvgPicture.asset(
                                          'assets/icons/iconamoon_arrow-up-2.svg',
                                          color: const Color(0xff989898),
                                        ),
                                      ),
                                      style: const TextStyle(
                                          color: Color(0xff989898)),
                                      underline: const SizedBox.shrink(),
                                      onChanged: (String? value) {
                                        // This is called when the user selects an item.
                                        setState(() {
                                          yearDropdownValue = value!;
                                        });
                                      },
                                      items: yearsList
                                          .map<DropdownMenuItem<String>>(
                                              (String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 40.0.w),
                              child: PrimaryButton(
                                width: 300,
                                // borderRadius: BorderRadius.circular(),
                                borderRadius: 30,
                                // width: ScreenUtil().screenWidth,
                                color: kDefaultActiveColor,
                                onTap: () {
                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(builder: (context) => HotelView()),
                                  // );
                                },
                                child: Text(
                                  "Check Hotels",
                                  style: TextStyle(
                                      color: Colors.black,
                                      // letterSpacing: .5,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.only(top: 10.0.w, bottom: 10.0.w),
                              child: PrimaryButton(
                                width: double.infinity,
                                // borderRadius: BorderRadius.circular(),
                                borderRadius: 30,
                                // width: ScreenUtil().screenWidth,
                                color: Colors.black,
                                onTap: () {
                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(builder: (context) => SignUpView()),
                                  // );
                                },
                                child: Text(
                                  "Don’t Want",
                                  style: TextStyle(
                                      color: Colors.white,
                                      // letterSpacing: .5,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SvgPicture.asset(
              'assets/icons/Vector_2.svg',
              fit: BoxFit.contain,
              alignment: Alignment.topCenter,
            ),
            // Container(
            // color: Colors.blue,

            Container(
              // color: Colors.blue,
              width: double.infinity,
              padding: EdgeInsets.only(top: 30.w),
              child: Column(
                children: [
                  Image.asset(
                    'assets/icons/katman_1.png',
                    height: 45.h,
                    width: 65.w,
                  ),
                  RichText(
                    text: const TextSpan(
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                            fontFamily: 'Campton',
                            letterSpacing: -1),
                        children: [
                          TextSpan(
                              text: 'MD',
                              style: TextStyle(fontWeight: FontWeight.w700)),
                          TextSpan(text: 'booking'),
                        ]),
                  )
                ],
              ),
            ),
            // SizedBox(width: 30.w,),
            Positioned(
              right: 0,
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  padding: const EdgeInsets.only(
                      right: 20, left: 20, bottom: 20, top: 15),
                  child: SvgPicture.asset(
                    'assets/icons/CloseSquare.svg',
                    height: 29.5.h,
                    width: 29.5.w,
                  ),
                ),
                // ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DatePickerDropDown extends StatefulWidget {
  const DatePickerDropDown({super.key});

  @override
  State<DatePickerDropDown> createState() => _DatePickerDropDownState();
}

class _DatePickerDropDownState extends State<DatePickerDropDown> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
