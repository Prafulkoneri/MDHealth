import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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

class NewAddressView extends StatefulWidget {
  const NewAddressView({super.key});

  @override
  State<NewAddressView> createState() => _NewAddressViewState();
}

class _NewAddressViewState extends State<NewAddressView> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      context.read<AddressController>().initState(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    final read = context.read<AddressController>();
    final watch = context.watch<AddressController>();

    return BaseScreen(
      onWillPop: () async {
        print('Add Address');
        Navigator.pushReplacement(
          context,
          SlidePageRoute(
            page: AddressView(),
            direction: SlideDirection.left, // Specify the slide direction here
            delay: Duration(milliseconds: 5000),
          ),
        );
        return false;
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
          // drawerTitleColor: Colors.green,
          drawerTitle: 'Add Address',
          // hasBackButton: true,
          hasMdTitle: false,
          // drawerTitle: "Orders",
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
                borderColor: Colors.grey,
                // borderRadius: 10.w,
                // inputFormatters: [
                //   FilteringTextInputFormatter.digitsOnly,
                //   LengthLimitingTextInputFormatter(10),
                // ],

                // textInputType: TextInputType.number,
                controller: watch.addressNameController,
                // color: Colors.red,
                // width: 48.w,
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
                height: 39.h,
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
                  await read.getCitiesList(context);
                },
                textEditingController: null,
                hint: "Country",
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.0.w, right: 20.w),
              child: AddAddressDropDown(
                height: 39.h,
                hint: "City",
                titleHeader: "City",
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
                lengthLimitingTextInputFormatter:
                    LengthLimitingTextInputFormatter(10),
                textInputType: TextInputType.number,
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
                  read.addAddress(
                    context,
                  );
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
