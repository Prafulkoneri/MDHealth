import 'package:flip_card/flip_card.dart';
import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:md_health/Screens/food/card_diet/view/payment_processing.dart';
import 'package:md_health/Screens/food/diet_plan%20_payment/view/payment_view_diet.dart';
import 'package:md_health/Screens/health/payment/controller/payment_controller.dart';
import 'package:md_health/constants/styles/colors.dart';
import 'package:md_health/test_widget.dart';
import 'package:md_health/utils/utils.dart';
import 'package:md_health/widget/base_screen.dart';
import 'package:md_health/widget/buttons.dart';
import 'package:md_health/widget/custom_appbar.dart';
import 'package:md_health/widget/text_field.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';

class CardDietPaymentView extends StatefulWidget {
  final String? foodPackageId;
  final String? foodPackageName;
  final String? foodPackageSalePrice;
  final String? subscriptionType;
  final String? subscriptionStartDate;
  final String? subscriptionEndDate;
  final String? patientId;
  final String? paymentMethod;
  final String? platformType;
  final String? type;
  final String? daysInWords;
  CardDietPaymentView({
    super.key,
    required this.foodPackageId,
    required this.subscriptionStartDate,
    this.patientId,
    required this.type,
    required this.foodPackageName,
    required this.foodPackageSalePrice,
    required this.subscriptionEndDate,
    required this.paymentMethod,
    required this.platformType,
    required this.subscriptionType,
    required this.daysInWords,
  });

  @override
  State<CardDietPaymentView> createState() => _CardDietPaymentViewState();
}

class _CardDietPaymentViewState extends State<CardDietPaymentView> {
  final FocusNode _cardNameFocusNode = FocusNode();
  final FocusNode _cardNumberFocusNode = FocusNode();
  final FocusNode _expiryDateFocusNode = FocusNode();
  final FocusNode _cvvFocusNode = FocusNode();
  final FlipCardController _flipCardController = FlipCardController();
  bool isCvvFieldFocused = false;
  @override
  void initState() {
    // print('************ card patient id ${widget.patientId}');

    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      context
          .read<PaymentController>()
          .initState(context, '', '', '', '', '', '', '', '', '', '', '');
    });

    void _handleFocusChange(bool isCvvFocused) {
      if (isCvvFieldFocused != isCvvFocused) {
        setState(() {
          isCvvFieldFocused = isCvvFocused;
        });
        _flipCardController.toggleCard();
      }
    }

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

    @override
    void dispose() {
      // Dispose the focus nodes when the widget is removed
      _cardNumberFocusNode.dispose();
      _expiryDateFocusNode.dispose();
      _cvvFocusNode.dispose();
      super.dispose();
    }

    //   SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
    //     log(widget.packageId ?? '');
    //     context.read<PaymentController>().initState(
    //         context,
    //         widget.packageId,
    //         widget.price,
    //         widget.percetagePrise,
    //         widget.percetage,
    //         widget.selectedNames,
    //         widget.puchesId,
    //         widget.patientID,
    //         widget.purchaseType,
    //         widget.bankName,
    //         "");
    //   });
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
    final read = context.read<PaymentController>();
    final watch = context.watch<PaymentController>();
    // final FlipCardController _flipCardController = FlipCardController();
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
      final watch = context.watch<PaymentController>();
      return Stack(
        children: [
          Container(
              padding: EdgeInsets.only(left: 19.w, right: 19.w, top: 19.w),
              child: Image.asset("assets/images/Rectangle 277 (1).png")),
          Positioned(
            top: 40.w,
            left: 40.w,
            child: Image.asset(
              'assets/images/mdd.png', // Replace with the path to your image
              height: 21.w, // Adjust the height as needed
              width: 111.h, // Adjust the width as needed
            ),
          ),
          Positioned(
            bottom: 75.w,
            left: 40.w,
            child: Text(
              // "${watch.number}",
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
              "${watch.nameaccount}",
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
              "${watch.expiryDate}",
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
                      '${watch.cardType}',
                      width: 80.w,
                    )
                  : Container())
        ],
      );
    }

    return BaseScreen(
        onWillPop: () async {
          Navigator.push(
            context,
            SlidePageRoute(
              page: PaymentDetailsViewDiet(
                type: widget.type,
                subscriptionType: widget.subscriptionType,
                subscriptionStartDate: widget.subscriptionStartDate,
                foodPackageId: watch.foodPackageId,

                // price: watch.salePrice,
              ),
              direction:
                  SlideDirection.right, // Specify the slide direction here
              delay: Duration(milliseconds: 5000),
            ),
          );
          // Navigator.push(
          //   context,
          //   SlidePageRoute(
          //     page: PaymentDetailsViewDiet(
          //       type: widget.type,
          //       subscriptionType: widget.subscriptionType,
          //       subscriptionStartDate: widget.subscriptionStartDate,
          //       foodPackageId: watch.foodPackageId,

          //       // price: watch.salePrice,
          //     ),
          //     direction:
          //         SlideDirection.right, // Specify the slide direction here
          //     delay: Duration(milliseconds: 5000),
          //   ),
          // );

          return false;
        },
        backgroundColor: Colors.white,
        appBar: CustomAppBar(
          onBackPressed: () {
            // widget.screenName != "PackageDetailView"
            //     ?
            Navigator.push(
              context,
              SlidePageRoute(
                page: PaymentDetailsViewDiet(
                  type: widget.type,
                  subscriptionType: widget.subscriptionType,
                  subscriptionStartDate: widget.subscriptionStartDate,
                  foodPackageId: watch.foodPackageId,

                  // price: watch.salePrice,
                ),
                direction:
                    SlideDirection.right, // Specify the slide direction here
                delay: Duration(milliseconds: 5000),
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
            physics: BouncingScrollPhysics(),
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
                                  Row(
                                    children: [
                                      Text(
                                        "${widget.foodPackageName}",
                                        // "package Name",
                                        // "${watch.purchaseDetailsDataLast?.treatmentName}",
                                        style: TextStyle(
                                          fontFamily: 'Campton',
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      Text(
                                        " ${widget.subscriptionType}",
                                        // "package Name",
                                        // "${watch.purchaseDetailsDataLast?.treatmentName}",
                                        style: TextStyle(
                                          fontFamily: 'Campton',
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ],
                                  ),
                                  // Text(
                                  //   "${widget.foodPackageSalePrice} ",

                                  //   // "Sale Prices",
                                  //   // "${watch.purchaseDetailsDataLast?.treatmentPrice}",
                                  //   style: TextStyle(
                                  // fontFamily: 'Campton',
                                  // color: Colors.black,
                                  // fontSize: 16.sp,
                                  // fontWeight: FontWeight.w700,
                                  //   ),
                                  // ),
                                  RichText(
                                    text: TextSpan(
                                        text: "${widget.foodPackageSalePrice} ",
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
                                                //  fontFamily: 'Campton',
                                                color: Colors.black,
                                                fontSize: 16.sp,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          ),
                                        ]),
                                  ),
                                ],
                              ),
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
                                    fontSize: 19,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                // Text(
                                //   "${widget.foodPackageSalePrice}",
                                //   style: TextStyle(
                                //     fontFamily: 'Campton',
                                //     color: black,
                                //     fontSize: 18,
                                //     fontWeight: FontWeight.w700,
                                //   ),
                                // ),
                                RichText(
                                  text: TextSpan(
                                      text: "${widget.foodPackageSalePrice} ",
                                      style: TextStyle(
                                        fontFamily: 'Campton',
                                        color: Colors.black,
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.w700,
                                      ),
                                      children: [
                                        TextSpan(
                                          text: '₺',
                                          style: GoogleFonts.inter(
                                            textStyle: TextStyle(
                                              //  fontFamily: 'Campton',
                                              color: Colors.black,
                                              fontSize: 18.sp,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ),
                                      ]),
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
                    elevation: 2.2,
                    child: Column(
                      children: [
                        FlipCard(
                            controller: _flipCardController,
                            fill: Fill
                                .fillBack, // Fill the back side of the card to make in the same size as the front.
                            direction: FlipDirection.HORIZONTAL, // default
                            side: isCvvFocused ? CardSide.BACK : CardSide.FRONT,
                            front: _buildFrontContent(),
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
                          //  PrimaryInformationTextFormFieldNumber(
                          //   hintText: "Card Number",
                          //   lengthLimitingTextInputFormatter:
                          //       LengthLimitingTextInputFormatter(
                          //           16), // Set your desired limit

                          //   textInputType: TextInputType.number,
                          //   onChanged: (value) {
                          //     watch.accountNumver(
                          //         watch.formatAccountNumber(value));
                          //     watch
                          //         .updateCardType(); // Update card type when account number changes
                          //   },
                          // ),
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
                                  // allowOnlyDigits: true,
                                  // allowCommasAndDotsAndSpaces: false,
                                  textInputType: TextInputType.number,
                                  hintText: "MM/YY",
                                  controller: watch.expiryFieldCtrl,
                                  lengthLimitingTextInputFormatter:
                                      LengthLimitingTextInputFormatter(5),
                                  onChanged: (value) {
                                    var newDateValue = value.trim();
                                    final isPressingBackspace =
                                        watch.expiryDate.length >
                                            newDateValue.length;
                                    final containsSlash =
                                        newDateValue.contains('/');

                                    if (newDateValue.length >= 2 &&
                                        !containsSlash &&
                                        !isPressingBackspace) {
                                      newDateValue =
                                          '${newDateValue.substring(0, 2)}/${newDateValue.substring(2)}';
                                    }
                                    if (newDateValue.length >= 5) {
                                      final enteredMonth = int.tryParse(
                                              newDateValue.substring(0, 2)) ??
                                          0;
                                      final enteredYear = int.tryParse(
                                              newDateValue.substring(3)) ??
                                          0;
                                      if (enteredMonth < 1 ||
                                          enteredMonth > 12) {
                                        if (newDateValue.length == 5) {
                                          newDateValue = newDateValue.substring(
                                              0,
                                              3); // Remove the last character (entered month)
                                        }
                                      }
                                      final currentYear =
                                          DateTime.now().year % 100;
                                      if (enteredYear < currentYear ||
                                          (enteredYear == currentYear &&
                                              enteredMonth <
                                                  DateTime.now().month)) {
                                        if (newDateValue.length == 5) {
                                          newDateValue = newDateValue.substring(
                                              0,
                                              4); // Remove the last character (entered year)
                                        }
                                      }
                                    }

                                    setState(() {
                                      watch.expiryFieldCtrl.text = newDateValue;
                                      watch.expiryFieldCtrl.selection =
                                          TextSelection.fromPosition(
                                              TextPosition(
                                                  offset: newDateValue.length));
                                      if (newDateValue.isEmpty) {
                                        watch.expiryDate = '00/00';
                                      } else {
                                        watch.expiryDate = newDateValue;
                                      }
                                    });
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
                                      _flipCardController.toggleCard();
                                    });
                                  },
                                  obscureText: true,
                                  textInputType: TextInputType.number,
                                  lengthLimitingTextInputFormatter:
                                      LengthLimitingTextInputFormatter(3),
                                  hintText: "CVV",
                                  onChanged: (value) {
                                    setState(() {
                                      watch.cvvn = value;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Padding(
                        //   padding: EdgeInsets.only(
                        //       left: 20.0.w, top: 20.w, right: 20.w),
                        //   child: Row(
                        //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        //     mainAxisSize: MainAxisSize.min,
                        //     children: [
                        //       Expanded(
                        //         child: PrimaryInformationTextFormField(
                        //           textInputType: TextInputType.number,

                        //           hintText: "MM/YY",
                        //           controller: expiryFieldCtrl,
                        //           lengthLimitingTextInputFormatter:
                        //               LengthLimitingTextInputFormatter(5),
                        //           // maxLength: 5,
                        //           onChanged: (value) {
                        //             var newDateValue = value.trim();
                        //             final isPressingBackspace =
                        //                 watch.expiryDate.length >
                        //                     newDateValue.length;
                        //             final containsSlash =
                        //                 newDateValue.contains('/');
                        //             if (newDateValue.length >= 2 &&
                        //                 !containsSlash &&
                        //                 !isPressingBackspace) {
                        //               newDateValue =
                        //                   newDateValue.substring(0, 2) +
                        //                       '/' +
                        //                       newDateValue.substring(2);
                        //             }
                        //             setState(() {
                        //               expiryFieldCtrl.text = newDateValue;
                        //               expiryFieldCtrl.selection =
                        //                   TextSelection.fromPosition(
                        //                       TextPosition(
                        //                           offset: newDateValue.length));
                        //               watch.expiryDate = newDateValue;
                        //             });
                        //           },
                        //         ),
                        //       ),
                        //       SizedBox(
                        //         width: 10.w,
                        //       ),
                        //       Expanded(
                        //           child: PrimaryInformationTextFormField(
                        //         onTap: () {
                        //           _flipCardController.toggleCard();
                        //         },
                        //         obscureText: true,
                        //         textInputType: TextInputType.number,
                        //         lengthLimitingTextInputFormatter:
                        //             LengthLimitingTextInputFormatter(3),
                        //         hintText: "CVV",
                        //         onChanged: (value) {
                        //           watch.accountcvv(value);
                        //         },
                        //       )),
                        //     ],
                        //   ),
                        // ),
                        SizedBox(
                          height: 20.w,
                        ),
                        PrimaryButton(
                          height: 40.h,
                          width: 310.w,
                          borderRadius: 30,
                          color: Color(0xff4CDB06),
                          onTap: () async {
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
                              print(
                                widget.type,
                              );
                              print(
                                widget.subscriptionStartDate,
                              );
                              print(
                                widget.subscriptionEndDate,
                              );
                              print(
                                widget.platformType,
                              );
                              print(
                                widget.paymentMethod,
                              );
                              print(
                                widget.foodPackageSalePrice,
                              );
                              print(
                                "${widget.foodPackageId}idddddddd",
                              );
                              // return;
                              read.cardDietPayment(
                                  context,
                                  widget.type,
                                  widget.subscriptionStartDate,
                                  widget.subscriptionEndDate,
                                  widget.patientId,
                                  widget.platformType,
                                  widget.paymentMethod,
                                  widget.foodPackageSalePrice,
                                  widget.foodPackageId,
                                  "",
                                  widget.subscriptionType,
                                  '',
                                  '',
                                  watch.randomNumber,
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
                                  page: DietPaymentProcessingView(
                                    type: widget.type,
                                    subscriptionStartDate:
                                        widget.subscriptionStartDate,
                                    subscriptionEndDate:
                                        widget.subscriptionEndDate,
                                    platformtype: widget.platformType,
                                    paymentMethod: widget.paymentMethod,
                                    foodPackageTotalPrice:
                                        widget.foodPackageSalePrice,
                                    foodPackageId: widget.foodPackageId,
                                    patiendId: widget.patientId,
                                  ),
                                  direction: SlideDirection
                                      .right, // Specify the slide direction here
                                  delay: Duration(milliseconds: 5000),
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
