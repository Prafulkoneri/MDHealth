import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:md_health/Screens/address/controller/add_address_controller.dart';
import 'package:md_health/Screens/address/controller/address_controller.dart';
import 'package:md_health/Screens/address/view/address_view.dart';
import 'package:md_health/constants/styles/colors.dart';
import 'package:md_health/test_widget.dart';
import 'package:md_health/widget/base_screen.dart';
import 'package:md_health/widget/buttons.dart';
import 'package:md_health/widget/custom_appbar.dart';
import 'package:md_health/widget/drop_down.dart';
import 'package:md_health/widget/text_field.dart';
import 'package:provider/provider.dart';

class EditAddressView extends StatefulWidget {
  final String? id;
  const EditAddressView({super.key, this.id});

  @override
  State<EditAddressView> createState() => _EditAddressViewState();
}

class _EditAddressViewState extends State<EditAddressView> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      context.read<EditAddAddressController>().initState(context, widget.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    final read = context.read<EditAddAddressController>();
    final watch = context.watch<EditAddAddressController>();

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
        // Navigator.pop(context);
        Navigator.pushReplacement(
          context,
          SlidePageRoute(
            page: AddressView(
                // packageId: widget.packageId,

                // packageId: watch.packageId,
                ),
            direction: SlideDirection.left, // Specify the slide direction here
            delay: Duration(milliseconds: 5000),
          ),
        );
        print('ytfdhfhdtftdft');
        return true;
      },
      backgroundColor: const Color(0xffF5F5F5),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(130.h),
        child: CustomAppBar(
          onBackPressed: () {
            Navigator.pushReplacement(
              context,
              SlidePageRoute(
                page: AddressView(
                    // packageId: widget.packageId,

                    // packageId: watch.packageId,
                    ),
                direction:
                    SlideDirection.left, // Specify the slide direction here
                delay: Duration(milliseconds: 5000),
              ),
            );
          },
          hasBackButton: true,
          drawerTitle: 'Edit Address',
          hasMdTitle: false,
        ),
      ),
      content: Builder(builder: (context) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 30.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.0.w, right: 20.w),
              child: PrimaryCTextFormField(
                controller: watch.addressNameController,
                borderColor: Colors.grey,

                titleHeader: "Address Name",
                hintText: "Address Name",
                // allowCommasAndDotsAndSpaces: false,
                // allowOnlyDigits: false,
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.0.w, right: 20.w),
              child: PrimaryCTextFormField(
                maxLines: 100,
                height: 100.w,
                // maxLength: 300,
                borderColor: Colors.grey,
                // borderRadius: 10.w,
                // inputFormatters: [
                //   FilteringTextInputFormatter.digitsOnly,
                //   LengthLimitingTextInputFormatter(10),
                // ],

                // textInputType: TextInputType.number,
                controller: watch.addressController,
                // color: Colors.red,
                // width: 48.w,
                titleHeader: "Address",
                hintText: "Address",
                // allowCommasAndDotsAndSpaces: false,
                // allowOnlyDigits: false,
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.0.w, right: 20.w),
              child: AddAddressDropDown(
                // height: 39.h,
                items: watch.countryList
                    ?.map((item) => DropdownMenuItem<String>(
                          value: item.id.toString(),
                          child: Text(
                            item.countryName ?? "",
                            style:
                                TextStyle(fontSize: 14.sp, color: Colors.black),
                          ),
                        ))
                    .toList(),
                titleHeader: "Country",
                onChanged: (value) async {
                  print(value.toString());
                  await read.onSelectCountryType(int.parse(value));
                  read.getCities(context);
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
              ),
              // items: watch.countryList
              //     ?.map((item) => DropdownMenuItem<String>(
              //           value: item.id.toString(),
              //           child: Text(
              //             item.countryName ?? "",
              //             style: TextStyle(
              //                 fontSize: 14.sp, color: Colors.black),
              //           ),
              //         ))
              //     .toList(),
              // titleHeader: "Country",
              // onChanged: (value) async {
              //   print(value.toString());
              //   await read.onSelectCountryType(int.parse(value));
              //   await read.getCitiesList(context);
              // },
              // textEditingController: null,
              // hint: watch.countryName),
            ),
            SizedBox(
              height: 10.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.0.w, right: 20.w),
              child: AddAddressDropDown(
                // hintSize: 29,
                hint: watch.cityName,
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
                titleHeader: "*Patient City",
                onChanged: (value) {
                  // if (value != null && value != 'City') {
                  print(value.toString());
                  read.onSelectCityType(int.parse(value));
                  // }
                },
                value: watch.cityList == null
                    ? 'City'
                    : watch.cityListId?.toString(),
                textEditingController: null,
              ),
            ),
            // Padding(
            //   padding: EdgeInsets.only(left: 20.0.w, right: 20.w),
            //   child: AddAddressDropDown(
            //     height: 39.h,
            //     hint: watch.cityName,
            //     titleHeader: "City",
            //     items: watch.cityList == null
            //         ? [
            //             DropdownMenuItem<String>(
            //               value: 'City',
            //               child: Text(
            //                 "City",
            //                 style: TextStyle(
            //                   fontSize: 14.sp,
            //                   color: Colors.black,
            //                 ),
            //               ),
            //             )
            //           ]
            //         : watch.cityList
            //                 ?.map((item) => DropdownMenuItem<String>(
            //                       value: item.id.toString(),
            //                       child: Text(
            //                         item.cityName ?? "",
            //                         style: TextStyle(
            //                           fontSize: 14.sp,
            //                           color: Colors.black,
            //                         ),
            //                       ),
            //                     ))
            //                 .toList() ??
            //             [],
            //     onChanged: (value) {
            //       if (value != null && value != 'City') {
            //         print(value.toString());
            //         read.onSelectCityType(int.parse(value));
            //       }
            //     },
            //     value: watch.cityList == null
            //         ? 'City'
            //         : watch.cityListId?.toString(),
            //     textEditingController: null,
            //   ),
            // ),
            SizedBox(
              height: 10.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.0.w, right: 20.w),
              child: PrimaryCTextFormField(
                borderColor: Colors.grey,
                // borderRadius: 10.w,
                // inputFormatters: [
                //   FilteringTextInputFormatter.digitsOnly,
                //   LengthLimitingTextInputFormatter(10),
                // ],

                // textInputType: TextInputType.number,
                controller: watch.postalcodeController,
                // color: Colors.red,
                // width: 48.w,
                titleHeader: "Postal code",
                hintText: "Postal code",
                // allowCommasAndDotsAndSpaces: false,
                // allowOnlyDigits: false,
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.0.w, right: 20.w),
              child: PrimaryCTextFormField(
                borderColor: Colors.grey,
                // borderRadius: 10.w,
                // inputFormatters: [
                //   FilteringTextInputFormatter.digitsOnly,
                //   LengthLimitingTextInputFormatter(10),
                // ],

                // textInputType: TextInputType.number,
                controller: watch.phoneNumberController,
                // color: Colors.red,
                // width: 48.w,
                titleHeader: "Phone Number",
                hintText: "Phone Number",
                // allowCommasAndDotsAndSpaces: false,
                // allowOnlyDigits: false,
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.0.w, right: 20.w),
              child: PrimaryButton(
                // width: 350.w,
                height: 40.h,
                // borderColor: black,
                borderRadius: 30,
                color: kDefaultActiveColor,
                onTap: () {
                  read.submitEdit(context);
                  // Utils.showPrimarySnackbar(this.context, " result.message",
                  //     type: SnackType.success);
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
              height: 100.h,
            )
          ],
        );
      }),
    );
  }
}
