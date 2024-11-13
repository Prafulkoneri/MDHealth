import 'dart:developer';
import 'package:flip_card/flip_card.dart';
import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:md_health/Screens/home_services/hs_payment/controller/hs_payment_controller.dart';
import 'package:md_health/Screens/home_services/hs_payment/view/card_processing_view.dart';
import 'package:md_health/Screens/home_services/purchase_details/view/purchase_details_view.dart';
import 'package:md_health/Screens/order_details/view/hs_list_details_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:md_health/constants/styles/colors.dart';
import 'package:md_health/test_widget.dart';
import 'package:md_health/utils/utils.dart';
import 'package:md_health/widget/base_screen.dart';
import 'package:md_health/widget/buttons.dart';
import 'package:md_health/widget/custom_appbar.dart';
import 'package:md_health/widget/text_field.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';
// import 'package:iyzico/iyzico.dart';
// import 'package:iyzico/iyzico.dart';

// import 'package:flutter_credit_card/flutter_credit_card.dart';

class HSardPaymentView extends StatefulWidget {
  final String? screenName;
  final String? paymentType;
  final String? platformType;
  final String? patientID;
  final String? randNumber;
  final String? purchaseType;
  final String? packageId;
  final String? puchesId;
  final String? pendingAmount;
  final String? percetagePrise;
  final String? percetage;
  final String? price;
  final String? bankName;
  final String? packageName;
  final List<String>? selectedNames; // Add this parameter
  final String? orderId;

  HSardPaymentView({
    super.key,
    this.packageId,
    this.price,
    this.percetagePrise,
    this.percetage,
    this.selectedNames,
    this.screenName,
    this.puchesId,
    this.pendingAmount,
    this.platformType,
    this.patientID,
    this.purchaseType,
    this.bankName,
    this.packageName,
    this.randNumber,
    this.paymentType,
    this.orderId,
  });

  @override
  State<HSardPaymentView> createState() => _HSardPaymentViewState();
}

class _HSardPaymentViewState extends State<HSardPaymentView> {
  final FocusNode _cardNameFocusNode = FocusNode();
  final FocusNode _cardNumberFocusNode = FocusNode();
  final FocusNode _expiryDateFocusNode = FocusNode();
  final FocusNode _cvvFocusNode = FocusNode();
  final FlipCardController _flipCardController = FlipCardController();

  bool isCvvFieldFocused = false;
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      log(widget.packageId ?? '');
      print("jhihjfsf ************************************ jhihjfsf");
      print(widget.paymentType ?? '');
      print("jhihjfsf ************************************ jhihjfsf");
      print("-------------------${widget.puchesId}");
      context.read<HsPaymentLastController>().initState(
            context,
            // widget.packageId, //
            // widget.price, //
            // widget.percetagePrise, //
            // widget.percetage, //
            // widget.selectedNames,
            // widget.puchesId, //
            // widget.patientID, //
            // widget.purchaseType, //
            // widget.bankName, //
            // widget.paymentType, //
            // widget.puchesId, //
            // widget.patientID, //
            // widget.orderId, //

            widget.packageId,
            widget.price,
            widget.percetagePrise,
            widget.percetage,
            widget.selectedNames, // add on services
            widget.puchesId,
            widget.patientID,
            widget.purchaseType,
            widget.bankName,
            widget.paymentType,
            widget.puchesId,
            widget.patientID,
            widget.orderId,
          );
    });
    _cardNumberFocusNode.addListener(() {
      if (_cardNumberFocusNode.hasFocus) {
        _handleFocusChange(false);
      }
    });
    _cardNameFocusNode.addListener(() {
      if (_cardNameFocusNode.hasFocus) {
        _handleFocusChange(false);
      }
    });

    _expiryDateFocusNode.addListener(() {
      if (_expiryDateFocusNode.hasFocus) {
        _handleFocusChange(false);
      }
    });

    _cvvFocusNode.addListener(() {
      if (_cvvFocusNode.hasFocus) {
        _handleFocusChange(true);
      }
    });
  }

  void _handleFocusChange(bool isCvvFocused) {
    if (isCvvFieldFocused != isCvvFocused) {
      setState(() {
        isCvvFieldFocused = isCvvFocused;
      });
      _flipCardController.toggleCard();
    }
  }

  @override
  void dispose() {
    // Dispose the focus nodes when the widget is removed
    _cardNumberFocusNode.dispose();
    _expiryDateFocusNode.dispose();
    _cvvFocusNode.dispose();
    super.dispose();
  }

  bool isLightTheme = false;
  String cardNumber = '';

  String cardHolderName = '';
  String cvvCode = '';
  String expiryDate = '';
  bool isCvvFocused = false;
  bool useGlassMorphism = false;
  bool useBackgroundImage = false;
  bool useFloatingAnimation = true;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String text = '';
  TextEditingController expiryFieldCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final read = context.read<HsPaymentLastController>();
    final watch = context.watch<HsPaymentLastController>();
    // bool isCvvFieldFocused = false; // Manage which side of the card to show

    Widget _buildBackContent() {
      return Stack(
        children: [
          Container(
            padding: EdgeInsets.only(left: 19.w, right: 19.w, top: 19.w),
            child: Image.asset("assets/images/Group 74 (1).png"),
            // ... (other back content)
          ),
          Positioned(
            bottom: 55.w,
            right: 1.w,
            child: SizedBox(
              width: 100.w,
              child: Text(
                textAlign: TextAlign.left,
                '*' *
                    watch.cvvn
                        .length, // Display asterisks based on the length of cvvn
                style: TextStyle(
                  fontFamily: 'Campton',
                  fontSize: 25.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ),
          )
        ],
      );
    }

    Widget _buildFrontContent() {
      final watch = context.watch<HsPaymentLastController>();

      return Stack(
        children: [
          Container(
            padding: EdgeInsets.only(left: 19.w, right: 19.w, top: 19.w),
            child: Image.asset("assets/images/Rectangle 277 (1).png"),
          ),
          Positioned(
            top: 40.w,
            left: 40.w,
            child: Image.asset(
              'assets/images/mdd.png', // Replace with the path to your image
              height: 21.w,
              width: 111.h,
            ),
          ),
          Positioned(
            bottom: 75.w,
            left: 40.w,
            child: Text(
              watch.formattedAccountNumber,
              style: TextStyle(
                fontFamily: 'Campton',
                color: Colors.white,
                fontSize: 20.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Positioned(
            bottom: 50.w,
            left: 40.w,
            child: Text(
              watch.nameaccount,
              style: TextStyle(
                fontFamily: 'Campton',
                color: Colors.white,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Positioned(
            bottom: 20.w,
            left: 40.w,
            child: Text(
              watch.expiryDate,
              style: TextStyle(
                fontFamily: 'Campton',
                color: Colors.white,
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Positioned(
            bottom: 10.w,
            right: 40.w,
            child: watch.cardType != ""
                ? Image.asset(
                    watch.cardType,
                    width: 80.w,
                  )
                : Container(),
          ),
        ],
      );
    }

    return BaseScreen(
        onWillPop: () async {
          widget.screenName != "PackageDetailView"
              ? Navigator.push(
                  context,
                  SlidePageRoute(
                    page: HSPurchaseDetailsView(
                      purchaseType: widget.purchaseType,
                      packageId: watch.packageId.toString(),
                      // price: watch.salePrice,
                    ),
                    direction: SlideDirection
                        .right, // Specify the slide direction here
                    delay: const Duration(milliseconds: 5000),
                  ),
                )
              : Navigator.push(
                  context,
                  SlidePageRoute(
                    page: HsOderDetailsOrderView(
                      hsOrderId: widget.orderId,

                      // type: "",
                      // purchesId: widget.puchesId,
                      // purchaseType: widget.purchaseType,
                      // packageId: watch.packageId.toString(),
                      // price: watch.salePrice,
                    ),
                    direction: SlideDirection
                        .right, // Specify the slide direction here
                    delay: const Duration(milliseconds: 5000),
                  ),
                );

          return false;
        },
        backgroundColor: Colors.white,
        appBar: CustomAppBar(
          onBackPressed: () {
            widget.screenName != "PackageDetailView"
                ? Navigator.push(
                    context,
                    SlidePageRoute(
                      page: HSPurchaseDetailsView(
                        purchaseType: widget.purchaseType,
                        packageId: watch.packageId.toString(),
                        // price: watch.salePrice,
                      ),
                      direction: SlideDirection
                          .right, // Specify the slide direction here
                      delay: const Duration(milliseconds: 5000),
                    ),
                  )
                : Navigator.push(
                    context,
                    SlidePageRoute(
                      page: HsOderDetailsOrderView(
                        hsOrderId: widget.orderId,

                        // type: "",
                        // purchesId: widget.puchesId,
                        // purchaseType: widget.purchaseType,
                        // packageId: watch.packageId.toString(),
                        // price: watch.salePrice,
                      ),
                      direction: SlideDirection
                          .right, // Specify the slide direction here
                      delay: const Duration(milliseconds: 5000),
                    ),
                  );
          },
          hasBackButton: true,
          hasMdTitle: false,
          // drawerTitle: "Orders",
        ),
        content:
            //  watch.isLoading
            //     ? Container(
            //         height: ScreenUtil().screenHeight, child: const Loader())
            //     :
            Builder(builder: (context) {
          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                SizedBox(
                  height: 28.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "PAYMENT",
                      style: TextStyle(
                        fontFamily: 'Campton',
                        color: kDefaultActiveColor,
                        fontSize: 29.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 21.h,
                ),
                Container(
                  padding: EdgeInsets.only(left: 10.w, right: 10.w),
                  decoration: BoxDecoration(
                      // color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromARGB(255, 230, 230, 230)
                              .withOpacity(0.60),
                          offset: Offset(2, 2),
                          blurRadius: 10.0,
                        ),
                      ]),
                  child: Card(
                    elevation: 2.0,
                    color: Color.fromARGB(255, 255, 254, 254),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.only(
                              left: 18.w, top: 21.w, right: 20.w),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 5.h,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "${watch.purchaseDetailsDataLast?.treatmentName}",
                                    // "${widget.packageName}",
                                    style: TextStyle(
                                      fontFamily: 'Campton',
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  RichText(
                                    text: TextSpan(
                                        text:
                                            "${watch.purchaseDetailsDataLast?.salePrice}",
                                        style: TextStyle(
                                          fontFamily: 'Campton',
                                          color: Colors.black,
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w700,
                                        ),
                                        children: [
                                          TextSpan(
                                            text: ' ₺',
                                            style: GoogleFonts.inter(
                                              textStyle: TextStyle(
                                                fontFamily: 'Campton',
                                                color: Colors.black,
                                                fontSize: 16.sp,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          ),
                                        ]),
                                  ),
                                  // Text(
                                  //   "${watch.purchaseDetailsDataLast?.salePrice}",
                                  //   style: TextStyle(
                                  //     fontFamily: 'Campton',
                                  //     color: Colors.black,
                                  //     fontSize: 16.sp,
                                  //     fontWeight: FontWeight.w700,
                                  //   ),
                                  // ),
                                ],
                              ),
                              Container(
                                child: ListView.builder(
                                  padding: EdgeInsets.zero,
                                  shrinkWrap: true,
                                  itemCount: watch.otherServices?.length ?? 0,
                                  itemBuilder: (context, index) {
                                    final element = watch.otherServices?[index];
                                    return Container(
                                        child: Row(
                                      children: [
                                        Text(
                                          "${element?.title}",
                                          style: TextStyle(
                                            fontFamily: 'Campton',
                                            color: kDefaultActiveColor,
                                            fontSize: 19.sp,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        Text(
                                          "${element?.pricePercentage}",
                                          style: TextStyle(
                                            fontFamily: 'Campton',
                                            color: kDefaultActiveColor,
                                            fontSize: 19.sp,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ],
                                    ));
                                  },
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 31.h,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Color(0xffF1F1F1),
                            borderRadius: BorderRadius.vertical(
                              bottom: Radius.circular(20.0),
                            ),
                          ),
                          // width: 400.w,
                          height: 61.w,
                          child: Padding(
                            padding: EdgeInsets.only(left: 20.w, right: 20.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Total Payment",
                                  style: TextStyle(
                                    fontFamily: 'Campton',
                                    color: kDefaultActiveColor,
                                    fontSize: 19.sp,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    RichText(
                                      text: TextSpan(
                                          text: "${widget.percetagePrise}",
                                          style: TextStyle(
                                            fontFamily: 'Campton',
                                            color: black,
                                            fontSize: 26.sp,
                                            fontWeight: FontWeight.w700,
                                          ),
                                          children: [
                                            TextSpan(
                                              text: ' ₺',
                                              style: GoogleFonts.inter(
                                                textStyle: TextStyle(
                                                  // fontFamily: 'Campton',
                                                  color: black,
                                                  fontSize: 26.sp,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                            ),
                                          ]),
                                    ),
                                    // Text(
                                    //   "            ${widget.percetagePrise}",
                                    //   style: TextStyle(
                                    //     fontFamily: 'Campton',
                                    //     color: black,
                                    //     fontSize: 26,
                                    //     fontWeight: FontWeight.w700,
                                    //   ),
                                    // ),
                                    Text(
                                      "${widget.percetage}% of the amount",
                                      style: TextStyle(
                                        fontFamily: 'Campton',
                                        color: black,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 21.h,
                ),
                Container(
                  padding: EdgeInsets.only(left: 10.w, right: 10.w),
                  child: Card(
                    elevation: 2,
                    child: Column(
                      children: [
                        FlipCard(
                            controller: _flipCardController,
                            fill: Fill
                                .fillBack, // Fill the back side of the card to make in the same size as the front.
                            direction: FlipDirection.HORIZONTAL, // default
                            side: isCvvFieldFocused
                                ? CardSide.BACK
                                : CardSide.FRONT,
                            front: _buildFrontContent(),
                            // back: _buildBackContent(),
                            //  Stack(
                            //   children: [
                            //     Container(
                            //         padding: EdgeInsets.only(
                            //             left: 19.w, right: 19.w, top: 19.w),
                            //         child: Image.asset(
                            //             "assets/images/Rectangle 277 (1).png")),
                            //     Positioned(
                            //       top: 40.w,
                            //       left: 40.w,
                            //       child: Image.asset(
                            //         'assets/images/mdd.png', // Replace with the path to your image
                            //         height: 21.w, // Adjust the height as needed
                            //         width: 111.h, // Adjust the width as needed
                            //       ),
                            //     ),
                            //     Positioned(
                            //       bottom: 75.w,
                            //       left: 40.w,
                            //       child: Text(
                            //         // "${watch.number}",
                            //         watch.formattedAccountNumber,
                            //         style: TextStyle(
                            //           fontFamily: 'Campton',
                            //           color: Colors.white,
                            //           fontSize: 20.sp,
                            //           fontWeight: FontWeight.w500,
                            //         ),
                            //       ),
                            //     ),
                            //     Positioned(
                            //       bottom: 50.w,
                            //       left: 40.w,
                            //       child: Text(
                            //         watch.nameaccount,
                            //         style: TextStyle(
                            //           fontFamily: 'Campton',
                            //           color: Colors.white,
                            //           fontSize: 14.sp,
                            //           fontWeight: FontWeight.w500,
                            //         ),
                            //       ),
                            //     ),
                            //     Positioned(
                            //       bottom: 20.w,
                            //       left: 40.w,
                            //       child: Text(
                            //         watch.expiryDate,
                            //         style: TextStyle(
                            //           fontFamily: 'Campton',
                            //           color: Colors.white,
                            //           fontSize: 16.sp,
                            //           fontWeight: FontWeight.w500,
                            //         ),
                            //       ),
                            //     ),
                            //     Positioned(
                            //         bottom: 10.w,
                            //         right: 40.w,
                            //         child: watch.cardType != ""
                            //             ? Image.asset(
                            //                 watch.cardType,
                            //                 width: 80.w,
                            //               )
                            //             : Container())
                            //   ],
                            // ),
                            back: _buildBackContent()),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 20.0.w, top: 20.w, right: 20.w),
                          child: PrimaryInformationTextFormField(
                            focusNode: _cardNameFocusNode,

                            // allowOnlyDigits: true,
                            // allowCommasAndDotsAndSpaces: true,
                            controller: watch.cardNameController,
                            hintText: "Card Holder Name",
                            onChanged: (value) => watch.accountName(value),
                          ),
                          //  PrimaryInformationTextFormField(
                          //   hintText: "Card Holder Name",
                          //   onChanged: (value) => watch.accountName(value),
                          // ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 20.0.w, top: 20.w, right: 20.w),
                          child: PrimaryInformationTextFormFieldNumber(
                            focusNode: _cardNumberFocusNode,
                            controller: watch.accountNumberController,
                            hintText: "Card Number",
                            textInputType: TextInputType.number,
                            lengthLimitingTextInputFormatter:
                                LengthLimitingTextInputFormatter(19),
                            onChanged: (value) {
                              watch.formatAccountNumber();
                              watch
                                  .updateCardType(); // Update card type when account number changes
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 20.0.w, top: 20.w, right: 20.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Expanded(
                                child: PrimaryInformationTextFormField(
                                  focusNode: _expiryDateFocusNode,

                                  // onTap: () {
                                  //   setState(() {
                                  //     isCvvFieldFocused = false;
                                  //     _flipCardController
                                  //         .toggleCard(); // Flip to front if needed
                                  //   });
                                  // },
                                  // allowOnlyDigits: true,
                                  // allowCommasAndDotsAndSpaces: false,
                                  textInputType: TextInputType.number,
                                  hintText: "MM/YY",
                                  controller: watch.expiryFieldCtrl,
                                  lengthLimitingTextInputFormatter:
                                      LengthLimitingTextInputFormatter(5),
                                  onChanged: (value) {
                                    print('random print');

                                    watch.handleExpiryDateChange(value);
                                  },
                                ),
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              Expanded(
                                child: CVVPrimaryInformationTextFormField(
                                  // allowOnlyDigits: true,
                                  controller: watch.cvvController,
                                  onTap: () {
                                    setState(() {
                                      isCvvFieldFocused = true;
                                      _flipCardController
                                          .toggleCard(); // Flip to front if needed
                                    });
                                  },
                                  obscureText: true,
                                  textInputType: TextInputType.number,
                                  lengthLimitingTextInputFormatter:
                                      LengthLimitingTextInputFormatter(3),
                                  hintText: "CVV",
                                  onChanged: (value) {
                                    setState(() {
                                      // Update the CVV value in the state
                                      watch.cvvn = value;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20.w,
                        ),
                        PrimaryButton(
                          height: 40.h,
                          width: 310.w,
                          borderRadius: 30,
                          color: const Color(0xff4CDB06),
                          onTap: () async {
                            print(widget.paymentType);
                            // return;
                            if (watch.cardNameController.text.isEmpty) {
                              Utils.showPrimarySnackbar(
                                  context, 'Enter Card Holder Name',
                                  type: SnackType.error);
                            } else if (watch
                                    .accountNumberController.text.isEmpty ||
                                watch.accountNumberController.text.length <
                                    19) {
                              Utils.showPrimarySnackbar(context,
                                  'Enter Valid 16 digits Card Number Number',
                                  type: SnackType.error);
                            } else if (watch.expiryFieldCtrl.text.isEmpty ||
                                watch.expiryFieldCtrl.text.length < 5) {
                              Utils.showPrimarySnackbar(
                                  context, 'Enter valid Month and year',
                                  type: SnackType.error);
                            } else if (watch.cvvController.text.isEmpty ||
                                watch.cvvController.text.length < 3) {
                              Utils.showPrimarySnackbar(
                                  context, 'Enter Valid 3 digits CVV Number',
                                  type: SnackType.error);
                            } else {
                              read.paymentDone(
                                  context,
                                  widget.puchesId ?? "",
                                  widget.patientID ?? "",
                                  widget.purchaseType,
                                  watch.otherService,
                                  widget.paymentType,
                                  widget.randNumber,
                                  '',
                                  '',
                                  '',
                                  '',
                                  '',
                                  watch.accountNumberController.text,
                                  watch.cardNameController.text,
                                  watch.expiryFieldCtrl.text,
                                  watch.cvvController.text);
                              // return;
                              Navigator.push(
                                context,
                                SlidePageRoute(
                                  page: HsCardPaymentCompletedView(),
                                  direction: SlideDirection
                                      .right, // Specify the slide direction here
                                  delay: const Duration(milliseconds: 5000),
                                ),
                              );
                            }
                          },
                          child: Text(
                            "Proceed Payment",
                            style: TextStyle(
                                color: Colors.black,
                                // letterSpacing: .5,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        SizedBox(
                          height: 30.w,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 100.h,
                )
              ],
            ),
          );
        }));
  }
}

class CardNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue previousValue,
    TextEditingValue nextValue,
  ) {
    var inputText = nextValue.text;

    if (nextValue.selection.baseOffset == 0) {
      return nextValue;
    }

    var bufferString = StringBuffer();
    for (int i = 0; i < inputText.length; i++) {
      bufferString.write(inputText[i]);
      var nonZeroIndexValue = i + 1;
      if (nonZeroIndexValue % 4 == 0 && nonZeroIndexValue != inputText.length) {
        bufferString.write(' ');
      }
    }

    var string = bufferString.toString();
    return nextValue.copyWith(
      text: string,
      selection: TextSelection.collapsed(
        offset: string.length,
      ),
    );
  }
}
