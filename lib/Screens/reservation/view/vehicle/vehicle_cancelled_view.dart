import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:md_health/widget/drop_down.dart';

class VehicleCancelledView extends StatelessWidget {
  const VehicleCancelledView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
            left: 10.w,
            right: 10.w,
          ),
          child: PackageDropDownSearchList(
            textEditingController: null,
            iconPadding: EdgeInsets.only(right: 32),
            // titleHeader: "*Patient Country",
            onChanged: (value) {
              // read.onSelectAccountType(value);
            },
            hint: "List for date",
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
        ),
        Container(
          // margin: EdgeInsets.only(left: 18.w, right: 18.w),
          child: ListView.builder(
              padding: EdgeInsets.only(left: 10.w, right: 10.w, top: 20.w),
              itemCount: 1,
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (BuildContext, index) {
                return GestureDetector(
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(
                        color:Colors.white,
                        borderRadius:
                        const BorderRadius.all(Radius.circular(10)),
                        // border: Border.all(color: const Color(0xffEFEFEF)),
                        boxShadow: [
                          BoxShadow( color: Colors.black.withOpacity(0.1),
                              spreadRadius: 1,
                              blurRadius: 10,
                              blurStyle: BlurStyle.outer)]
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(10.w),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(30)),
                                  ),
                                  margin: EdgeInsets.symmetric(
                                      vertical: 15.h, horizontal: 15.w),
                                  child: Image.asset(
                                    'assets/images/image 39.png',
                                    height: 109.h,
                                    width: 109.w,
                                    fit: BoxFit.fitWidth,
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(
                                    bottom: 30.h,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    // mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Padding(
                                        padding:
                                        EdgeInsets.only(bottom: 7.w),
                                        child: Text(
                                          'Sixt Rental',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontFamily: 'Campton',
                                              // letterSpacing: -1,
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.w700),
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          SvgPicture.asset(
                                            'assets/icons/mdi_location.svg',
                                            height: 11.25.h,
                                            width: 12.w,
                                          ),
                                          SizedBox(
                                            width: 5.w,
                                          ),
                                          RichText(
                                            text: TextSpan(
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontFamily: 'Campton',
                                                    letterSpacing: -1,
                                                    fontSize: 14.sp,
                                                    fontWeight:
                                                    FontWeight.w400),
                                                children: const [
                                                  TextSpan(
                                                      text:
                                                      'Besiktas / Istanbul'),
                                                ]),
                                          )
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          SvgPicture.asset(
                                            'assets/icons/uiw_date.svg',
                                            height: 11.25.h,
                                            width: 12.w,
                                          ),
                                          SizedBox(
                                            width: 5.w,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(top:3.0,left:5),
                                            child: RichText(
                                              text: TextSpan(
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontFamily: 'Campton',
                                                      letterSpacing: -1,
                                                      fontSize: 14.sp,
                                                      fontWeight:
                                                      FontWeight.w400),
                                                  children: const [
                                                    TextSpan(
                                                        text:
                                                        '12 Dec 2023 - 19 Dec 2023')
                                                  ]),
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left : 15.0.w),
                            child: RichText(
                                text: TextSpan(
                                    style: TextStyle(
                                      fontFamily: 'Campton',
                                      color: Colors.black,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w700,
                                    ),
                                    children: [
                                      TextSpan(text: 'Status: '),
                                      TextSpan(
                                        text: "Cancelled",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 20.sp,
                                            color: Colors.red),
                                      ),
                                    ])),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
        ),
      ],
    );
  }
}