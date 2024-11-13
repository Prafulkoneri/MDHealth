import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:md_health/Screens/order_details/controller/shop_details_controller.dart';
// import 'package:md_health/Screens/packages/controller/packages_view_controller.dart';
// import 'package:md_health/Screens/packages/view/packages_view.dart';
import 'package:md_health/constants/styles/colors.dart';
import 'package:md_health/utils/utils.dart';
import 'package:md_health/widget/buttons.dart';
import 'package:md_health/widget/check_box.dart';
import 'package:md_health/widget/drop_down.dart';
import 'package:md_health/widget/text_field.dart';
import 'package:provider/provider.dart';

class ChnageInvoiceAddressPopUpView extends StatefulWidget {
  final String? orderId;
  const ChnageInvoiceAddressPopUpView({
    super.key,
    required this.orderId,
  });

  @override
  State<ChnageInvoiceAddressPopUpView> createState() =>
      _ChnageInvoiceAddressPopUpViewState();
}

class _ChnageInvoiceAddressPopUpViewState
    extends State<ChnageInvoiceAddressPopUpView> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      context.read<ShopListDetailsController>().initState(context, "", '', '');
    });
  }

  // String? selectedCountry;

  @override
  Widget build(BuildContext context) {
    final read = context.read<ShopListDetailsController>();
    final watch = context.watch<ShopListDetailsController>();
    return ClipRRect(
      borderRadius: BorderRadius.circular(15.0),
      child: Container(
        width: ScreenUtil().screenWidth,
        height: 500.h,
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15.0))),
                          child: ClipRRect(
                            borderRadius:
                                BorderRadius.circular(15), // Image border
                            child: SizedBox.fromSize(
                              // size: Size.fromRadius(
                              //     10), // Image radius
                              child: Image(
                                  image: AssetImage(
                                      "assets/images/green_pop_up.png")),
                            ),
                          ),

                          // Image(
                          //     image: AssetImage(
                          //         "assets/images/pop__new_.png")),
                        ),
                        Positioned(
                            top: 15,
                            right: 15,
                            // left: 0,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //       builder: (context) =>
                                //           FoodOrderDetailsOrderView()),
                                // );
                                // Now using the context obtained from the builder
                              },
                              child: SvgPicture.asset(
                                  "assets/icons/red_close.svg"),
                            )),
                        Positioned(
                          top: 25,
                          right: 135,
                          // left: 0,
                          child: SvgPicture.asset("assets/icons/Group 64.svg"),
                          width: 40.w,
                          height: 40.w,
                        ),
                        Positioned(
                          top: 80,
                          right: 55,
                          // left: 0,
                          child: Text(
                            "Invoice Address",
                            style: TextStyle(
                                color: Colors.black,
                                // letterSpacing: .5,
                                fontSize: 25.sp,
                                fontWeight: FontWeight.w700),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 38.h,
                    ),
                    Text(
                      "Change Invoice Address",
                      style: TextStyle(
                          color: Colors.black,
                          // letterSpacing: .5,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20.0.w, right: 20.w),
                      child: GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('Choose Country'),
                                content: Container(
                                  width: 200.0, // Adjust the width as needed
                                  height: 100.0, // Adjust the height as needed
                                  child: SizedBox(
                                    height: 100.w,
                                    child: ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: watch.countryList?.length,
                                      itemBuilder: (context, index) {
                                        final element =
                                            watch.countryList?[index];
                                        return Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                print(element?.countryName);
                                                print(element?.id);
                                                // return;
                                                read.selectCountry(
                                                    // element?.id.toString() ??
                                                    //     '',
                                                    element?.countryName ??
                                                        'Choose Country');
                                                read.getCities(context,
                                                    element?.id.toString());

                                                Navigator.of(context).pop();
                                              },
                                              child: Text(
                                                "${element?.countryName}",
                                                style: TextStyle(
                                                  fontFamily: 'Campton',
                                                  color: Colors.black,
                                                  fontSize: 19.sp,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                            ),
                                          ],
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        child: Container(
                          height: 45.w,
                          width: ScreenUtil().screenWidth,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            border: Border.all(color: Colors.black),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(left: 18.0.w, top: 12.w),
                            child: Text(
                              watch.selectedCountry ?? 'Choose Country',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontFamily: 'Campton',
                                color: Colors.black,
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),

                    //

                    Padding(
                      padding:
                          EdgeInsets.only(left: 20.0.w, top: 25.w, right: 20.w),
                      child: GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('Choose City'),
                                content: Container(
                                  width: 200.0, // Adjust the width as needed
                                  height: 100.0, // Adjust the height as needed
                                  child: SizedBox(
                                    height: 100.w,
                                    child: ListView.builder(
                                      // physics: NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      itemCount: watch.cityList?.length,
                                      itemBuilder: (context, index) {
                                        final element = watch.cityList?[index];
                                        return Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                // setState(() {
                                                read.selectedCity =
                                                    element?.cityName ?? "";
                                                // });
                                                read.selectCity(
                                                    // element?.id.toString() ??
                                                    //     '',
                                                    element?.cityName ?? '');

                                                Navigator.of(context).pop();
                                              },
                                              child: Text(
                                                "${element?.cityName ?? "city"}",
                                                style: TextStyle(
                                                    fontFamily: 'Campton',
                                                    color: Colors.black,
                                                    fontSize: 19.sp,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                            ),
                                          ],
                                        );
                                      },
                                    ),
                                  ),
                                ),
                                // actions: <Widget>[
                                //   TextButton(
                                //     onPressed: () {
                                //       // Close the dialog
                                //       Navigator.of(context).pop();
                                //     },
                                //     child: SizedBox(
                                //       height: 36.h,
                                //       child: TextField(
                                //         onChanged: (value) {
                                //           // Assuming `read.canceledSearchList` is a valid method
                                //           // read.canceledSearchList(context);
                                //         },
                                //         controller:
                                //             TextEditingController(), // Provide your controller here
                                //         decoration: InputDecoration(
                                //           enabledBorder: OutlineInputBorder(
                                //             borderSide: const BorderSide(
                                //                 width: 1,
                                //                 color: Colors.black),
                                //             borderRadius:
                                //                 BorderRadius.circular(8.w),
                                //           ),
                                //           focusedBorder: OutlineInputBorder(
                                //             borderSide: const BorderSide(
                                //                 width: 1,
                                //                 color: Colors
                                //                     .blue), // Adjust color as needed
                                //             borderRadius:
                                //                 BorderRadius.circular(8.w),
                                //           ),
                                //           hintText: 'Search Packages.......',
                                //           hintStyle: TextStyle(
                                //             color: Colors.black,
                                //             fontSize: 11,
                                //             fontWeight: FontWeight.w400,
                                //           ),
                                //           prefixIcon: IconButton(
                                //             icon: Icon(Icons
                                //                 .search), // Replace with your search icon
                                //             onPressed: () {
                                //               // Perform the search here
                                //             },
                                //           ),
                                //         ),
                                //       ),
                                //     ),
                                //   ),
                                // ],
                              );
                            },
                          );
                        },
                        child: Container(
                          height: 45.w,
                          width: ScreenUtil().screenWidth,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            border: Border.all(color: Colors.black),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(left: 18.0.w, top: 12.w),
                            child: Text(
                              watch.selectedCity ?? 'Choose City',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontFamily: 'Campton',
                                color: Colors.black,
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(left: 20.0.w, top: 25.w, right: 20.w),
                      child: PrimaryInformationTextFormField(
                        controller: watch.chnageAddressController,
                        // color: Colors.red,
                        // width: 48.w,
                        // titleHeader: "*Patient Contact Number",
                        hintText: "Your Address",
                      ),
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    Container(
                      // padding: EdgeInsets.only(left: 18.0.w),
                      child: PrimaryButton(
                        // borderColor: Colors.black,
                        width: 250.w,
                        height: 50.w,

                        borderRadius: 30,

                        color: Color(0xff4CDB06),
                        // color: kDefaultActiveColor,
                        onTap: () {
                          print(watch.selectedCountry);
                          print(watch.selectedCity);
                          print(watch.chnageAddressController);
                          print(watch.orderId);
                          // return;
                          read.chnageAddress(
                              context,
                              watch.selectedCountry,
                              watch.selectedCity,
                              watch.chnageAddressController.text,
                              watch.orderId);

                          // Navigator.pop(context);

                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(builder: (context) => SignUpView()),
                          // );
                        },
                        child: Text(
                          "Save Changes",
                          style: TextStyle(
                              color: Colors.black,
                              // letterSpacing: .5,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showSnackbar(String message, {SnackType type = SnackType.info}) {
    Utils.showPrimarySnackbar(
        _scaffoldKey.currentState as BuildContext, message,
        type: type);
  }
}
