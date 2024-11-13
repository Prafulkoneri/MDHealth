import 'dart:developer';
import 'package:flip_card/flip_card.dart';
import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:md_health/Screens/health/packages/view/package_detail_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:md_health/Screens/health/payment/controller/payment_controller.dart';
import 'package:md_health/Screens/health/payment/view/Payment_processing_view.dart';
import 'package:md_health/Screens/health/payment_details/view/payment_details_view.dart';
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

class PaymentView extends StatefulWidget {
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
  final List<String>? selectedNames; // Add this parameter

  PaymentView({
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
    this.randNumber,
    this.paymentType,
  });

  @override
  State<PaymentView> createState() => _PaymentViewState();
}

class _PaymentViewState extends State<PaymentView> {
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
      log(widget.paymentType ?? '');
      print(widget.paymentType ?? '');
      print("pratik");
      context.read<PaymentController>().initState(
          context,
          widget.packageId,
          widget.price,
          widget.percetagePrise,
          widget.percetage,
          widget.selectedNames,
          widget.puchesId,
          widget.patientID,
          widget.purchaseType,
          widget.bankName,
          "",
          widget.paymentType);
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
// cahnges here

  String cardHolderName = '';
  String cvvCode = '';
  String expiryDate = '';
  bool isCvvFocused = false;
  bool useGlassMorphism = false;
  bool useBackgroundImage = false;
  bool useFloatingAnimation = true;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String text = ''; // variable stored your text
  TextEditingController expiryFieldCtrl = TextEditingController();
  // var iyziConfig = IyziConfig(
  //     '****************************************',
  //     '****************************************',
  //     'https://sandbox-api.iyzipay.com');

  //   //Create an iyzico object
  //  final iyzico = Iyzico.fromConfig(configuration: iyziConfig);

////////////////////////////////////////////////////////////////////

  // _pay() async {
  //   String token = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2MDBlYWY2YjU3NTEwNzI3NDg5YjAxYWIiLCJpYXQiOjE2MTU0NDkxMzl9.YTRsYrZqMDmByiOK3XqE6IuEtOaBRmJwtV_qBXy0wVI';
  //   String paymentUrl = 'http://192.168.1.2:3000/api/payment/iyzico';
  //   final body = Map<String,dynamic>();
  //   var expireMonth = expiryDate.split('/')[0];
  //   var expireYear = expiryDate.split('/')[1];
  //   cardNumber = cardNumber.split(" ").join("");
  //   print(expiryDate[0]);
  //   print(expiryDate[1]);
  //   body['cardNumber'] = cardNumber;
  //   body['expireMonth'] = expireMonth;
  //   body['expireYear'] = expireYear;
  //   body['cardHolderName'] = cardHolderName;
  //   body['cvc'] = cvvCode;
  //   body['registerCard'] = registerCard ? '1' : '0';
  //   final response = await http.post(paymentUrl,body: jsonEncode(body), headers: {
  //     'Content-Type': 'application/json',
  //     'Accept': 'application/json',
  //     'Authorization': 'Bearer $token',
  //   });

  //   if(response.statusCode == 200){
  //     final iyzicoPayment = iyzicoPaymentFromJson(response.body);
  //     print(iyzicoPayment.status);
  //     if(iyzicoPayment.status == 'success'){
  //       // Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => PaymentSuccessfulPage()));
  //     }else{
  //       var err = jsonDecode(response.body);
  //       _showMyDialog('Unsuccessful Payment',err['errorMessage']);
  //     }
  //   }else{
  //     _showMyDialog('Unsuccessful Payment','Something went wrong');
  //   }

  // }

  // Future<void> _showMyDialog(String title, String content){
  //   return showDialog<void>(
  //       context: context,
  //       builder: (BuildContext context){
  //         return AlertDialog(
  //           title: Text(title),
  //           content: Text(content),
  //         );
  //       }).then((value) => {
  //     setState(() {
  //       _isLoading = false;
  //     })
  //   });
  // }
  @override
  Widget build(BuildContext context) {
    final read = context.read<PaymentController>();
    final watch = context.watch<PaymentController>();
    // final FlipCardController _flipCardController = FlipCardController();

    Widget _buildFrontContent() {
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

    return BaseScreen(
        onWillPop: () async {
          widget.screenName != "PackageDetailView"
              ? Navigator.push(
                  context,
                  SlidePageRoute(
                    page: PaymentDetailsView(
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
                    page: PackageDetailView(
                      type: "",
                      purchesId: widget.puchesId,
                      // purchaseType: widget.purchaseType,
                      packageId: watch.packageId.toString(),
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
                      page: PaymentDetailsView(
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
                      page: PackageDetailView(
                        type: "",
                        purchesId: widget.puchesId,
                        // purchaseType: widget.purchaseType,
                        packageId: watch.packageId.toString(),
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
                          color: const Color.fromARGB(255, 230, 230, 230)
                              .withOpacity(0.60),
                          offset: const Offset(2, 2),
                          blurRadius: 10.0,
                        ),
                      ]),
                  child: Card(
                    elevation: 2.0,
                    color: const Color.fromARGB(255, 255, 254, 254),
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
                                    style: const TextStyle(
                                      fontFamily: 'Campton',
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                    ),
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
                          decoration: const BoxDecoration(
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
                                          style: const TextStyle(
                                            fontFamily: 'Campton',
                                            color: black,
                                            fontSize: 26,
                                            fontWeight: FontWeight.w700,
                                          ),
                                          children: [
                                            TextSpan(
                                              text: ' ₺',
                                              style: GoogleFonts.inter(
                                                textStyle: const TextStyle(
                                                  // fontFamily: 'Campton',
                                                  color: black,
                                                  fontSize: 26,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                            ),
                                          ]),
                                    ),
                                    // Text(
                                    //   "        ${widget.percetagePrise}",
                                    //   style: TextStyle(
                                    // fontFamily: 'Campton',
                                    // color: black,
                                    // fontSize: 26,
                                    // fontWeight: FontWeight.w700,
                                    //   ),
                                    // ),
                                    Text(
                                      "${widget.percetage}% of the amount",
                                      style: const TextStyle(
                                        fontFamily: 'Campton',
                                        color: black,
                                        fontSize: 14,
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
                                  hintText: "00/00",
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
                                      // watch.expiryDate = newDateValue;
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
                                      // Update the CVV value in the state
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
                          color: const Color(0xff4CDB06),
                          onTap: () async {
                            // const iyziConfig = IyziConfig(
                            //     'sandbox-BOhpAyMe4ewgstkrnmQbhLnrI7kMlTfD',
                            //     'sandbox-5F4PXtaQLl8nxj4m2r8HRcQ9xT3NCe2S',
                            //     'https://sandbox-api.iyzipay.com');

                            //Create an iyzico object
                            // final iyzico =
                            // Iyzico.fromConfig(configuration: iyziConfig);
//                             final double price = 1;
                            // final int paidPrice = 1;
// final binResult = await iyzico.retrieveBinNumberRequest(binNumber: '542119');
//   print(binResult);

//   //                             final paymentCard = PaymentCard(
//   //   cardHolderName: watch.nameaccount,
//   //   cardNumber: watch.number,
//   //   expireYear: '2030',
//   //   expireMonth: '12',
//   //   cvc: watch.cardType,
//   //   //  "${watch.expiryDate}",
//   // );
//                             final paymentCard = PaymentCard(
//                               cardHolderName: 'John Doe',
//                               cardNumber: '5528790000000008',
//                               expireYear: '2030',
//                               expireMonth: '12',
//                               cvc: '123',
//                             );
//                             final shippingAddress = Address(
//                                 address:
//                                     'Nidakule Göztepe, Merdivenköy Mah. Bora Sok. No:1',
//                                 contactName: 'Jane Doe',
//                                 zipCode: '34742',
//                                 city: 'Istanbul',
//                                 country: 'Turkey');
//                             final billingAddress = Address(
//                                 address:
//                                     'Nidakule Göztepe, Merdivenköy Mah. Bora Sok. No:1',
//                                 contactName: 'Jane Doe',
//                                 city: 'Istanbul',
//                                 country: 'Turkey');
//
//                             final buyer = Buyer(
//                                 id: 'BY789',
//                                 name: 'John',
//                                 surname: 'Doe',
//                                 identityNumber: '74300864791',
//                                 email: 'email@email.com',
//                                 registrationAddress:
//                                     'Nidakule Göztepe, Merdivenköy Mah. Bora Sok. No:1',
//                                 city: 'Istanbul',
//                                 country: 'Turkey',
//                                 ip: '85.34.78.112');
//
//                             final basketItems = <BasketItem>[
//                               BasketItem(
//                                   id: 'BI101',
//                                   price: '3000.0',
//                                   name: 'Binocular',
//                                   category1: 'Collectibles',
//                                   category2: 'Accessories',
//                                   itemType: BasketItemType.PHYSICAL),
//                             ];
                            // final paymentResult =
                            // await iyzico.CreatePaymentRequest(
                            //     conversationId: "123456789",
                            //     price: 3000.0,
                            //     paidPrice: 3000.00,
                            //     paymentCard: paymentCard,
                            //     buyer: buyer,
                            //     shippingAddress: shippingAddress,
                            //     billingAddress: billingAddress,
                            //     basketItems: basketItems);

                            // print(paymentResult);

//     final initializeThreeds = await iyzico.initializeThreedsPaymentRequest(
                            // price: price,
                            // paidPrice: paidPrice,
                            // paymentCard: paymentCard,
                            // buyer: buyer,
                            // shippingAddress: shippingAddress,
                            // billingAddress: billingAddress,
                            // currency: Currency.TRY,
                            // basketItems: basketItems,
                            // callbackUrl: 'www.marufmarket.com',
//   );
//   final createThreedsRequest = await iyzico.createThreedsPaymentRequest(
//     paymentConversationId: '123456789');
// print(createThreedsRequest);

//                             print(widget.puchesId);
//                             print("qqqqqq${widget.patientID}");
//                             final initChecoutForm = await iyzico.initializeCheoutForm(
//       price: price,
//       paidPrice: paidPrice,
//       paymentCard: paymentCard,
//       buyer: buyer,
//       shippingAddress: shippingAddress,
//       billingAddress: billingAddress,
//       basketItems: basketItems,
//       callbackUrl: 'www.test.com',
//       enabledInstallments: []);
//   print(initChecoutForm);

//   final retrieveCheckoutForm =
//       await iyzico.retrieveCheckoutForm(token: 'token');
//   print(retrieveCheckoutForm);
// var paymentRequest = PaymentRequest(
//   // price: 100.0,
//   // currency: "TRY",
//   // cardHolderName: "John Doe",
//   // cardNumber: "****",
//     price: 100,
//     paidPrice: paidPrice,
//     paymentCard: paymentCard,
//     buyer: buyer,
//     shippingAddress: shippingAddress,
//     billingAddress: billingAddress,
//     currency: Currency.TRY,
//     basketItems: basketItems,
//     callbackUrl: 'www.marufmarket.com',
//   // Add other necessary parameters
// );
// try {
//   var paymentResult = await iyzico.CreatePaymentRequest(
//      price: 100.0,
//     paidPrice: 100.0,
//     paymentCard: paymentCard,
//     buyer: buyer,paymentChannel:paymentCard ,
//     shippingAddress: shippingAddress,
//     billingAddress: billingAddress,
//     currency: Currency.TRY,
//     basketItems: basketItems,
//     callbackUrl: 'www.marufmarket.com',
//     // amount: 100.0, // Replace with your actual payment amount
//     // currency: "TRY", // Replace with your currency code
//     // Add other necessary parameters
//   );

//   // Handle the payment result as needed
//   print("Payment successful: ${paymentResult}");
// } catch (e) {
//   // Handle payment failure
//   print("Payment failed: $e");
// }
                            // try {
                            //   final initializeThreeds =
                            //       await iyzico.initializeThreedsPaymentRequest(
                            //     price: 100.0,
                            //     paidPrice: 100.0,
                            //     paymentCard: paymentCard,
                            //     buyer: buyer,
                            //     shippingAddress: shippingAddress,
                            //     billingAddress: billingAddress,
                            //     basketItems: basketItems,
                            //     callbackUrl: 'www.marufmarket.com',
                            //   );
                            //   print(initializeThreeds.conversationId);
                            //   final createThreedsRequest =
                            //       await iyzico.createThreedsPaymentRequest(
                            //     conversationId:
                            //         initializeThreeds.conversationId.toString(),
                            //     locale: initializeThreeds.locale,
                            //     paymentConversationId: '123456789',
                            //   );
                            //   print(createThreedsRequest);
                            //   final initCheckoutForm =
                            //       await iyzico.initializeCheoutForm(
                            //     price: 100.0,
                            //     paidPrice: 100.0,
                            //     paymentCard: paymentCard,
                            //     buyer: buyer,
                            //     shippingAddress: shippingAddress,
                            //     billingAddress: billingAddress,
                            //     basketItems: basketItems,
                            //     callbackUrl: 'www.test.com',
                            //     enabledInstallments: [],
                            //   );
                            //   print(
                            //       "Initialization of Checkout Form successful");
                            //   print("Token: ${initCheckoutForm.token}");
                            //   final retrieveCheckoutForm =
                            //       await iyzico.retrieveCheckoutForm(
                            //           token: initCheckoutForm.token.toString());
                            //   print(retrieveCheckoutForm);
                            // } catch (e) {
                            //   print("Error initializing 3D Secure payment: $e");
                            // }

// final initChecoutForm = await iyzico.initializeCheoutForm(
//         price: 100.0,
//     paidPrice: 100.0,
//       paymentCard: paymentCard,
//       buyer: buyer,
//       shippingAddress: shippingAddress,
//       billingAddress: billingAddress,
//       basketItems: basketItems,
//       callbackUrl: 'www.test.com',

//       enabledInstallments: []);
//        print("object");
//   log(initChecoutForm.toString());
//   print(initChecoutForm.token);
//   print("object");

//   final retrieveCheckoutForm =
//       await iyzico.retrieveCheckoutForm(token:initChecoutForm.token.toString());
//   print(retrieveCheckoutForm);
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
                                  "",
                                  widget.randNumber.toString(),
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
                                  page: PaymentProcessingView(
                                      purchesId: widget.puchesId),
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
// class CardNumberFormatter extends TextInputFormatter {
//   @override
//   TextEditingValue formatEditUpdate(
//     TextEditingValue previousValue,
//     TextEditingValue nextValue,
//   ) {
//     var inputText = nextValue.text;

//     if (nextValue.selection.baseOffset == 0) {
//       return nextValue;
//     }

//     var bufferString = StringBuffer();
//     for (int i = 0; i < inputText.length; i++) {
//       bufferString.write(inputText[i]);
//       var nonZeroIndexValue = i + 1;
//       if (nonZeroIndexValue % 4 == 0 && nonZeroIndexValue != inputText.length) {
//         bufferString.write(' ');
//       }
//     }

//     var string = bufferString.toString();
//     return nextValue.copyWith(
//       text: string,
//       selection: TextSelection.collapsed(
//         offset: string.length,
//       ),
//     );
//   }
// }
//   Glassmorphism? _getGlassmorphismConfig() {
//     final LinearGradient gradient = LinearGradient(
//       begin: Alignment.topLeft,
//       end: Alignment.bottomRight,
//       colors: <Color>[Colors.red.withAlpha(50), Colors.grey.withAlpha(50)],
//       stops: const <double>[0.3, 0],
//     );

//     // return isLightTheme
//     //     ? Glassmorphism(blurX: 8.0, blurY: 16.0, gradient: gradient)
//     //     : Glassmorphism.defaultConfig();
//   }

//   void onCreditCardModelChange(CreditCardModel creditCardModel) {
//     setState(() {
//       cardNumber = creditCardModel.cardNumber;
//       expiryDate = creditCardModel.expiryDate;
//       cardHolderName = creditCardModel.cardHolderName;
//       cvvCode = creditCardModel.cvvCode;
//       isCvvFocused = creditCardModel.isCvvFocused;
//     });
//   }
// }

                        // Container(
                        //   // padding: EdgeInsets.only(left: 10.w, right: 10.w),
                        //   child: Stack(
                        //     children: [
                        //       CreditCardWidget(
                        //         isChipVisible: true,
                        //         // height: 200, // Set your desired height
                        //         width: 350.w, // Set your desired width
                        //         // enableFloatingCard: useFloatingAnimation,
                        //         // glassmorphismConfig: _getGlassmorphismConfig(),/
                        //         cardNumber: cardNumber,
                        //         expiryDate: expiryDate,
                        //         cardHolderName: cardHolderName,
                        //         cvvCode: cvvCode,
                        //         bankName: 'Axis Bank',
                        //         showBackView: isCvvFocused,
                        //         // obscureCardNumber: true, //
                        //         // obscureCardCvv: true, //
                        //         isHolderNameVisible: true, //
                        //         cardBgColor: Colors.black,
                        //         isSwipeGestureEnabled: true,
                        //         onCreditCardWidgetChange:
                        //             (CreditCardBrand creditCardBrand) {},
                        //         customCardTypeIcons: <CustomCardTypeIcon>[
                        //           CustomCardTypeIcon(
                        //             cardType: CardType.mastercard,
                                    // cardImage: Image.asset(
                                    //   'assets/images/ri_visa-line (2).png',
                                    //   height: 48,
                                    //   width: 48,
                                    // ),
                        //           ),
                        //         ],
                        //       ),
                        //       Positioned(
                        //         top: 33.w, // Adjust the top position as needed
                        //         left:
                        //             30.w, // Adjust the left position as needed
                        // child: Image.asset(
                        //   'assets/images/mdd.png', // Replace with the path to your image
                        //   height: 21.w, // Adjust the height as needed
                        //   width: 111.h, // Adjust the width as needed
                        // ),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                        // Padding(
                        //   padding: EdgeInsets.only(left: 20.0.w, right: 20.w),
                        //   child: CreditCardForm(
                        //     formKey: formKey,
                        //     obscureCvv: true,
                        //     obscureNumber: true,
                        //     cardNumber: cardNumber,
                        //     cvvCode: cvvCode,
                        //     isHolderNameVisible: true,
                        //     isCardNumberVisible: true,
                        //     isExpiryDateVisible: true,
                        //     cardHolderName: cardHolderName,
                        //     expiryDate: expiryDate,
                        //     inputConfiguration: InputConfiguration(
                        //       cardHolderDecoration: InputDecoration(
                        //         contentPadding: EdgeInsets.only(
                        //             top: 10.0, left: 10), // Add padding
                        //         border: OutlineInputBorder(
                        //           borderRadius: BorderRadius.circular(20.0),
                        //           borderSide: BorderSide(
                        //             color: Colors.red, // Enabled border color
                        //           ),
                        //         ),
                        //         focusedBorder: OutlineInputBorder(
                        //           borderRadius: BorderRadius.circular(20.0),
                        //           borderSide: BorderSide(
                        //             color: Colors.green, // Focused border color
                        //           ),
                        //         ),

                        //         // labelText: 'Card Holder',
                        //         hintText: 'Card Holder Name',
                        //       ),
                        //       cardNumberDecoration: InputDecoration(
                        //         contentPadding: EdgeInsets.only(
                        //             top: 10.0, left: 10), // Add padding
                        //         border: OutlineInputBorder(
                        //           borderRadius: BorderRadius.circular(20.0),
                        //           borderSide: BorderSide(
                        //             color: Colors.white, // Enabled border color
                        //           ),
                        //         ),
                        //         focusedBorder: OutlineInputBorder(
                        //           borderRadius: BorderRadius.circular(20.0),
                        //           borderSide: BorderSide(
                        //             color: Colors.green, // Focused border color
                        //           ),
                        //         ),

                        //         // labelText: 'Number',/
                        //         hintText: 'Card Number',
                        //         labelStyle: TextStyle(
                        //           color: cardNumber.isNotEmpty
                        //               ? Colors.red
                        //               : Colors.black,
                        //         ),
                        //       ),
                        //       expiryDateDecoration: InputDecoration(
                        //         hintText: 'XX/XX',
                        //         contentPadding: EdgeInsets.only(
                        //             top: 10.0, left: 10), // Add padding
                        //         border: OutlineInputBorder(
                        //           borderRadius: BorderRadius.circular(20.0),
                        //           borderSide: BorderSide(
                        //             color: Colors.white, // Enabled border color
                        //           ),
                        //         ),
                        //         focusedBorder: OutlineInputBorder(
                        //           borderRadius: BorderRadius.circular(20.0),
                        //           borderSide: BorderSide(
                        //             color: Colors.green, // Focused border color
                        //           ),
                        //         ),
                        //       ),
                        //       cvvCodeDecoration: InputDecoration(
                        //         contentPadding: EdgeInsets.only(
                        //             top: 10.0, left: 10), // Add padding
                        //         border: OutlineInputBorder(
                        //           borderRadius: BorderRadius.circular(20.0),
                        //           borderSide: BorderSide(
                        //             color: Colors.white, // Enabled border color
                        //           ),
                        //         ),
                        //         focusedBorder: OutlineInputBorder(
                        //           borderRadius: BorderRadius.circular(20.0),
                        //           borderSide: BorderSide(
                        //             color: Colors.green, // Focused border color
                        //           ),
                        //         ),

                        //         hintText: 'CVV',
                        //       ),
                        //     ),
                        //     onCreditCardModelChange: onCreditCardModelChange,
                        //   ),
                        // ),