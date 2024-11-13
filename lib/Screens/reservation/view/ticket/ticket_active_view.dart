import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:md_health/Screens/reservation/controller/reservation_controller.dart';
import 'package:md_health/constants/styles/colors.dart';
import 'package:md_health/widget/drop_down.dart';

import 'package:md_health/widget/star_rating.dart';

class TicketActiveView extends StatelessWidget {
  const TicketActiveView({
    super.key,
    required this.padh,
    required this.dekh,
  });

  final ReservationController padh;
  final ReservationController dekh;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
            left: 10.w,
            right: 10.w,
          ),
          child: CustomDropDownSearchList(
            textEditingController: null,
            iconPadding: const EdgeInsets.only(right: 32),
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
        ListView.builder(
            padding: EdgeInsets.only(
              left: 10.w,
              right: 10.w,
              top: 20.w,
            ),
            itemCount: 1,
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (BuildContext, index) {
              return Container(
                padding: EdgeInsets.only(bottom: 20.w),
                child: GestureDetector(
                  onTap: () {},
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color:Colors.white,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          // border: Border.all(color: const Color(0xffEFEFEF)),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                spreadRadius: 1,
                                blurRadius: 10,
                                blurStyle: BlurStyle.outer)
                          ],
                        ),
                        padding: EdgeInsets.fromLTRB(20.w, 15.w, 15.w, 25.w),
                        child: Container(
                          // color: Colors.amber,
                          child: Column(
                            children: [
                              Container(
                                // color: Colors.grey,
                                height:
                                    MediaQuery.of(context).size.height * 0.2,
                                // padding: EdgeInsets.fromLTRB(20.w, 15.w, 15.w, 25.w),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: Container(
                                        // margin: EdgeInsets.symmetric(
                                        //     vertical: 15.h, horizontal: 15.w),
                                        child: Container(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Stockholm Airport',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontFamily: 'Campton',
                                                    letterSpacing: -0.5,
                                                    fontSize: 12.sp,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(top: 3.0.w),
                                                child: Text(
                                                  'ARN',
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontFamily: 'Campton',
                                                      letterSpacing: -0.5,
                                                      fontSize: 20.sp,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                              ),
                                              SvgPicture.asset(
                                                'assets/icons/Group_17.svg',
                                                height: 25.h,
                                              ),
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(top: 3.0.w),
                                                child: Text(
                                                  'IST',
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontFamily: 'Campton',
                                                      letterSpacing: -0.5,
                                                      fontSize: 20.sp,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                              ),
                                              Text(
                                                'Istanbul Airport',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontFamily: 'Campton',
                                                    letterSpacing: -0.5,
                                                    fontSize: 12.sp,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 5,
                                      child: Container(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Expanded(
                                              flex: 1,
                                              child: Container(
                                                  // color:Colors.green,
                                                  ),
                                            ),
                                            Expanded(
                                              flex: 7,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        bottom: 20.0.h),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.end,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  right: 2.5.w),
                                                          child: Text('Via'),
                                                        ),
                                                        Image.asset(
                                                          'assets/images/image 44.png',
                                                          width: 60.w,
                                                          height: 15.h,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Container(
                                                        padding:
                                                            EdgeInsets.only(
                                                                bottom: 10.w),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .baseline,
                                                          textBaseline:
                                                              TextBaseline
                                                                  .alphabetic,
                                                          children: [
                                                            SvgPicture.asset(
                                                              'assets/icons/Vector_13.svg',
                                                              height: 12.h,
                                                            ),
                                                            RichText(
                                                              text: TextSpan(
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .black,
                                                                    fontFamily:
                                                                        'Campton',
                                                                    letterSpacing:
                                                                        0,
                                                                    fontSize:
                                                                        16.sp,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600),
                                                                children: [
                                                                  TextSpan(
                                                                      text:
                                                                          'Stockholm'),
                                                                  TextSpan(
                                                                    text:
                                                                        ' to ',
                                                                    style:
                                                                        TextStyle(
                                                                      color:
                                                                          kDefaultActiveColor,
                                                                    ),
                                                                  ),
                                                                  TextSpan(
                                                                      text:
                                                                          'Istanbul'),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Container(
                                                        padding:
                                                            EdgeInsets.only(
                                                                bottom: 10.w),
                                                        child: Row(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .baseline,
                                                          textBaseline:
                                                              TextBaseline
                                                                  .alphabetic,
                                                          children: [
                                                            SvgPicture.asset(
                                                              'assets/icons/uiw_date.svg',
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
                                                                      fontSize: 12.sp,
                                                                      fontWeight: FontWeight.w400),
                                                                  children: const [
                                                                    TextSpan(
                                                                        text:
                                                                            '12 Dec 2023 - 16:30')
                                                                  ]),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                      Container(
                                                        // color: Colors.brown,
                                                        padding:
                                                            EdgeInsets.only(
                                                                bottom: 10.w),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                                style: TextStyle(
                                                                    color:
                                                                        kDefaultActiveColor,
                                                                    fontFamily:
                                                                        'Campton',
                                                                    letterSpacing:
                                                                        -0.5,
                                                                    fontSize:
                                                                        14.sp,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600),
                                                                'Direct Flight'),
                                                            SizedBox(
                                                              width: 20.w,
                                                            ),
                                                            Row(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .end,
                                                              children: [
                                                                SvgPicture
                                                                    .asset(
                                                                  'assets/icons/solar_suitcase-bold.svg',
                                                                  height: 14.h,
                                                                  width: 14.w,
                                                                ),
                                                                SizedBox(
                                                                  width: 5.w,
                                                                ),
                                                                Text(
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .black,
                                                                        fontFamily:
                                                                            'Campton',
                                                                        letterSpacing:
                                                                            -1,
                                                                        fontSize: 14
                                                                            .sp,
                                                                        fontWeight:
                                                                            FontWeight.w400),
                                                                    '1 x 15 KG'),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                // color : Colors.lightBlue,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        padh.onExpanded();
                                      },
                                      child: Container(
                                          height: 30.h,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.45,
                                          alignment: Alignment.center,
                                          decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(5)),
                                            color: Colors.black,
                                          ),
                                          child: Text(
                                            dekh.isExpanded
                                                ? 'Close Details'
                                                : 'Ticket Details',
                                            style: TextStyle(
                                              fontFamily: 'Campton',
                                              fontSize: 14.sp,
                                              letterSpacing: -0.5,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          )),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      dekh.isExpanded
                          ? Container(
                              margin: EdgeInsets.symmetric(vertical: 20.w),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color:Colors.white,
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black.withOpacity(0.1),
                                      spreadRadius: 1,
                                      blurRadius: 10,
                                      blurStyle: BlurStyle.outer)
                                ]
                              ),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20.w, vertical: 20.w),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      // padding: EdgeInsets.only(bottom: 5.w),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'PNR No',
                                                style: TextStyle(
                                                    color: kDefaultActiveColor,
                                                    fontFamily: 'Campton',
                                                    // letterSpacing: -1,
                                                    fontSize: 16.sp,
                                                    fontWeight: FontWeight.w600),
                                              ),
                                              Text(
                                                'TK38473',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontFamily: 'Campton',
                                                    // letterSpacing: -1,
                                                    fontSize: 24.sp,
                                                    fontWeight: FontWeight.w700),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            width: 50.w,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Seat',
                                                style: TextStyle(
                                                    color: kDefaultActiveColor,
                                                    fontFamily: 'Campton',
                                                    // letterSpacing: -1,
                                                    fontSize: 16.sp,
                                                    fontWeight: FontWeight.w600),
                                              ),
                                              Text(
                                                '9 F',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontFamily: 'Campton',
                                                    // letterSpacing: -1,
                                                    fontSize: 24.sp,
                                                    fontWeight: FontWeight.w700),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(top: 8.w,bottom: 25.w),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Ticket Price',
                                            style: TextStyle(
                                                color: kDefaultActiveColor,
                                                fontFamily: 'Campton',
                                                // letterSpacing: -1,
                                                fontSize: 16.sp,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          Text(
                                            '2.100,00 ₺',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontFamily: 'Campton',
                                                // letterSpacing: -1,
                                                fontSize: 24.sp,
                                                fontWeight: FontWeight.w700),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(top: 8.0.w,bottom:5.w),
                                      child: Text(
                                        'Flight Info',
                                        style: TextStyle(
                                            color: kDefaultActiveColor,
                                            fontFamily: 'Campton',
                                            // letterSpacing: -1,
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(top: 8.w,bottom:5.w),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Departure Time:',
                                            style: TextStyle(
                                                color: kDefaultActiveColor,
                                                fontFamily: 'Campton',
                                                // letterSpacing: -1,
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          Container(
                                            padding:
                                                EdgeInsets.only(top: 8.0.w,),
                                            child: Text(
                                              '12 December 2023 / 12:00',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontFamily: 'Campton',
                                                  // letterSpacing: -1,
                                                  fontSize: 16.sp,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(top: 4.w),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Departure Airport:',
                                            style: TextStyle(
                                                color: Colors.red,
                                                fontFamily: 'Campton',
                                                // letterSpacing: -1,
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          Container(
                                            padding:
                                                EdgeInsets.only(top: 8.0.w),
                                            child: Text(
                                              'Stockholm Airport (ARN)',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontFamily: 'Campton',
                                                  // letterSpacing: -1,
                                                  fontSize: 16.sp,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                        padding: EdgeInsets.only(top: 25.w),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(bottom: 8.w),
                                              child: Text(
                                                'Airport Address',
                                                style: TextStyle(
                                                    color: kDefaultActiveColor,
                                                    fontFamily: 'Campton',
                                                    // letterSpacing: -1,
                                                    fontSize: 16.sp,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                            ),
                                            Text(
                                              '190 45 Stockholm-Arlanda, Sweden',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontFamily: 'Campton',
                                                  // letterSpacing: -1,
                                                  fontSize: 16.sp,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ],
                                        )),
                                    Padding(
                                      padding: EdgeInsets.only(top: 20.0.w,bottom:5.w),
                                      child: Column(
                                        children: [
                                          GestureDetector(
                                            onTap: () {},
                                            child: Container(
                                              width: double.infinity,
                                              height: 45.h,
                                              alignment: Alignment.center,
                                              decoration: const BoxDecoration(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(30)),
                                                color: Color(0xffF3771D),
                                              ),
                                              child: Text(
                                                'Print E-Ticket',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontFamily: 'Campton',
                                                    // letterSpacing: -1,
                                                    fontSize: 16.sp,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ]),
                            )
                          : Container(),
                    ],
                  ),
                ),
              );
            }),
      ],
    );
  }
}

class RoomDetailsWidget extends StatelessWidget {
  final String text;
  final String icon;

  const RoomDetailsWidget({
    super.key,
    required this.text,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.0.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SvgPicture.asset(
            icon,
            width: 11.w,
            height: 10.h,
          ),
          SizedBox(
            width: 2.5.w,
          ),
          Text(
            text,
            style: TextStyle(
                color: Colors.black,
                fontFamily: 'Campton',
                // letterSpacing: -1,
                fontSize: 12.sp,
                fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
