import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:md_health/Screens/bottom_navigation/view/bottom_view.dart';
import 'package:md_health/Screens/food/diet_plan/view/diet_plan_view.dart';
import 'package:md_health/Screens/food/make_request/controller/food_make_request_controller.dart';
import 'package:md_health/Screens/home_services/home_page_services/view/hs_homepage_view.dart';
import 'package:md_health/Screens/home_services/make_request/controller/make_request_controller.dart';
import 'package:md_health/Screens/person_information/controller/person_information_form_controller.dart';
import 'package:md_health/constants/styles/colors.dart';
import 'package:md_health/test_widget.dart';
import 'package:md_health/widget/base_screen.dart';
import 'package:md_health/widget/buttons.dart';
import 'package:md_health/widget/check_box.dart';
import 'package:md_health/widget/custom_appbar.dart';
import 'package:md_health/widget/drop_down.dart';
import 'package:md_health/widget/text_field.dart';
import 'package:provider/provider.dart';

class FooDMakeRequestView extends StatefulWidget {
  const FooDMakeRequestView({super.key});

  @override
  State<FooDMakeRequestView> createState() => _FooDMakeRequestViewState();
}

class _FooDMakeRequestViewState extends State<FooDMakeRequestView> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      context.read<FoodRequestFormController>().initState(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    final read = context.read<FoodRequestFormController>();
    final watch = context.watch<FoodRequestFormController>();
    return BaseScreen(
      onWillPop: () async {
        Navigator.pushReplacement(
          context,
          SlidePageRoute(
            page: DietPlanView(

                // packageId: watch.packageId,
                ),
            direction: SlideDirection.left, // Specify the slide direction here
            delay: Duration(milliseconds: 5000),
          ),
          // MaterialPageRoute(
          //     builder: (context) => FooDMakeRequestView())
        );
        return false;
      },
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(125.h),
        child: CustomAppBar(
          drawerTitleFontWeight: FontWeight.w700,
          drawerTitleColor: Colors.green,
          drawerTitle: "Fill the Form",
          hasBackButton: true,
          onBackPressed: () {
            Navigator.push(
              context,
              SlidePageRoute(
                page: DietPlanView(

                    // packageId: watch.packageId,
                    ),
                direction:
                    SlideDirection.left, // Specify the slide direction here
                delay: Duration(milliseconds: 5000),
              ),
              // MaterialPageRoute(
              //     builder: (context) => FooDMakeRequestView())
            );
            // Navigator.pushReplacement(context,
            //     MaterialPageRoute(builder: (context) => NewMainScreenView()));
          },
          hasMdTitle: false,
          // drawerTitle: "Wallet",
        ),
      ),
      //  Navigator.push(
      //               context,
      //               MaterialPageRoute(
      //                   builder: (context) => LoginScreenView()),
      //             );
      content: Builder(builder: (context) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 15.h,
            ),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(left: 20.0.w, right: 20.w),
              child: Text(
                "Fill the form & get your desired food plan.",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: black,
                    fontFamily: 'Campton',
                    letterSpacing: -1,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400),
              ),
            ),
            SizedBox(
              height: 11.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.0.w, right: 20.w),
              child: PrimaryInformationTextFormField(
                controller: watch.firstNameController,
                // color: Colors.red,
                // width: 48.w,
                titleHeader: "First Name",
                hintText: "First Name",
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.0.w, right: 20.w),
              child: PrimaryInformationTextFormField(
                controller: watch.lastNameController,
                // color: Colors.red,
                // width: 48.w,
                titleHeader: "Last Name",
                hintText: "Last Name",
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.0.w, right: 20.w),
              child: PrimaryInformationTextFormField(
                titleHeader: 'E-mail',
                textCapitalization: TextCapitalization.none,
                controller: watch.emailIdController,
                borderColor: Color(0xff989898),
                hintText: "E-mail",
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    // Empty email is allowed (optional field)
                    return null;
                  }
                  // Regular expression for email validation
                  RegExp emailRegex =
                      RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');
                  if (!emailRegex.hasMatch(value)) {
                    return 'Enter a valid email address';
                  }
                  return null;
                },
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.0.w, right: 20.w),
              child: PrimaryInformationTextFormField(
                textInputType: TextInputType.number,
                lengthLimitingTextInputFormatter: LengthLimitingTextInputFormatter(10),
                controller: watch.phoneNumberController,
                // color: Colors.red,
                // width: 48.w,
                titleHeader: "Contact Number",
                hintText: "Contact Number",
              ),
            ),
            // SizedBox(
            //   height: 20.h,
            // ),
            Container(
              padding: EdgeInsets.only(left: 25.0.w, right: 20.w),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      PrimaryCheckBox(
                        onChanged: (value) {
                          read.onTravelvisaSelected();
                        },
                        value: watch.isTravelVisaYes,
                      ),
                      Text(
                        'Whatsapp',
                        style: TextStyle(
                            color: black,
                            // letterSpacing: .5,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 20.h,
                  ),
                  Row(
                    children: [
                      PrimaryCheckBox(
                        onChanged: (value) {
                          read.onTravelVisNotSelectedSelected();
                        },
                        value: watch.isTravelVisaNo,
                      ),
                      Text(
                        'Telegram',
                        style: TextStyle(
                            color: black,
                            // letterSpacing: .5,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.0.w, right: 20.w),
              child: PrimaryInformationTextFormField(
                controller: watch.foodNameController,
                // color: Colors.red,
                // width: 48.w,
                titleHeader: "Food Name",
                hintText: "Food Name",
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Padding(
                padding: EdgeInsets.only(left: 20.0.w, right: 20.w),
                child: watch.countryList == ""
                    ? SDropDownField(
                        titleHeader: "Country",
                        hint: "Country",
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
                                      // letterSpacing: isPasswordFeild ? 0 : -0.5
                                    ),
                                  ),
                                ))
                            .toList(),
                        onChanged: (value) async {
                          print(
                              '------------------------------------------------');
                          print(value.toString());
                          await read.onSelectCountryType(int.parse(value));
                          // await read.onSelectCoutryType(value);
                        },
                        value: watch.countryListId?.toString() ??
                            null, // Use null if the list is empty
                      )
                    : SDropDownField(
                        titleHeader: "Country",

                        hint: "Country",
                        items: watch.countryList
                            ?.map((item) => DropdownMenuItem<String>(
                                  value: item.id.toString(),
                                  child: Text(
                                    item.countryName ?? "",
                                    style: TextStyle(
                                      // letterSpacing: 3,
                                      color: Colors.black,
                                      fontFamily: 'Campton',
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w400,
                                      // letterSpacing: isPasswordFeild ? 0 : -0.5
                                    ),
                                  ),
                                ))
                            .toList(),

                        // titleHeader: "COUNTRY",
                        onChanged: (value) async {
                          print(value.toString());
                          await read.onSelectCountryType(int.parse(value));
                          // await read.onSelectCoutryType(value);
                        },
                        value: watch.countryListId?.toString() ??
                            null, // Use null if the list is empty
                      )),
            SizedBox(
              height: 10.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.0.w, right: 20.w),
              child: PrimaryInformationTextFormField(
                maxLines: 100,
                controller: watch.detailController,
                // color: Colors.red,
                height: 100.w,
                borderRadius: 20,
                titleHeader: "Details",
                hintText: "Details",
                contentPadding: EdgeInsets.only(top: 20, left: 15),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.0.w, right: 20.w),
              child: PrimaryInformationTextFormField(
                titleHeader: "When do you need the food?",
                controller: watch.whydoyouneeedFoodController,
                hintText: "When do you need the food?",
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.0.w, right: 20.w),
              child: PrimaryButton(
                width: double.infinity,
                height: 40.h,
                // borderColor: black,
                borderRadius: 30,
                color: black,
                onTap: () {
                  read.onChooseFiles(context);
                },
                child: Container(
                  padding: EdgeInsets.only(left: 20.0.w, right: 20.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Upload Your food Image ",
                            style: TextStyle(
                                fontFamily: 'Campton',
                                fontStyle: FontStyle.italic,
                                color: Colors.white,
                                // letterSpacing: .5,
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w400),
                          ),
                          Text(
                            "*Optional",
                            style: TextStyle(
                                fontFamily: 'Campton',
                                fontStyle: FontStyle.italic,
                                color: Colors.white,
                                // letterSpacing: .5,
                                fontSize: 8.sp,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      SvgPicture.asset(
                        'assets/icons/ep_upload-filled.svg',
                        height: 25.h,
                        width: 25.w,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 35.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.0.w, right: 20.w),
              child: PrimaryButton(
                width: 360.w,
                height: 45.h,
                // borderColor: black,
                borderRadius: 30,
                color: kDefaultActiveColor,
                onTap: () {
                  read.foodFillMakeRequest(context);
                },
                child: Text(
                  "Submit",
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
              height: 80.h,
            ),
          ],
        );
      }),
    );
  }
}
