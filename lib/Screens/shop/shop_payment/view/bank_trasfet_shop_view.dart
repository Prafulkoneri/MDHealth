import 'package:clipboard/clipboard.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:md_health/Screens/health/payment/controller/payment_controller.dart';
import 'package:md_health/Screens/shop/shop_cart/view/cart_view.dart';
import 'package:md_health/Screens/shop/shop_payment/view/payment_shop_proccesing.dart';
import 'package:md_health/constants/styles/colors.dart';
import 'package:md_health/test_widget.dart';
import 'package:md_health/utils/utils.dart';
import 'package:md_health/widget/base_screen.dart';
import 'package:md_health/widget/buttons.dart';
import 'package:md_health/widget/custom_appbar.dart';
import 'package:md_health/widget/drop_down.dart';
import 'package:md_health/widget/text_field.dart';
import 'package:provider/provider.dart';

class shopBankCompletedView extends StatefulWidget {
  final String? purchseId;
  final String? packageName;
  final String? screenName;
  final String? platformType;
  final String? patientID;
  final String? purchaseType;
  final String? packageId;
  final String? puchesId;
  final String? pendingAmount;
  final String? percetagePrise;
  final String? percetage;
  final String? price;
  final String? bankName;
  final List<String>? selectedNames;
  final String? productName;
  final String? shippingfees;
  final String? totalPrice;
  final String? productPrices;
  const shopBankCompletedView(
      {super.key,
      this.packageId,
      this.purchseId,
      this.screenName,
      this.platformType,
      this.patientID,
      this.purchaseType,
      this.puchesId,
      this.pendingAmount,
      this.percetagePrise,
      this.percetage,
      this.packageName,
      this.price,
      this.selectedNames,
      this.bankName,
      this.productName,
      this.shippingfees,
      this.productPrices,
      this.totalPrice});

  @override
  State<shopBankCompletedView> createState() => _shopBankCompletedViewState();
}

class _shopBankCompletedViewState extends State<shopBankCompletedView> {
  @override
  void initState() {
    print(widget.purchaseType);
    print("hjkggjf");
    SchedulerBinding.instance.addPostFrameCallback((_) {
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
          '');
    });
  }

  @override
  Widget build(BuildContext context) {
    final read = context.read<PaymentController>();
    final watch = context.watch<PaymentController>();
    // final read = context.read<BankTransferController>();
    // final watch = context.watch<BankTransferController>();
    return BaseScreen(
      onWillPop: () async {
        Navigator.push(
          context,
          SlidePageRoute(
            page: ShopCartScreenView(
                // purchaseType: widget.purchaseType,
                // packageId: watch.packageId.toString(),
                // price: watch.salePrice,
                ),
            direction: SlideDirection.right, // Specify the slide direction here
            delay: Duration(milliseconds: 5000),
          ),
        );
        return false;
      },
      backgroundColor: const Color(0xffFBFBFB),
      appBar: CustomAppBar(
        onBackPressed: () {
          Navigator.push(
            context,
            SlidePageRoute(
              page: ShopCartScreenView(
                  // purchaseType: widget.purchaseType,
                  // packageId: watch.packageId.toString(),
                  // price: watch.salePrice,
                  ),
              direction:
                  SlideDirection.right, // Specify the slide direction here
              delay: Duration(milliseconds: 5000),
            ),
          );

          // Navigator.pushReplacement(context,
          //     MaterialPageRoute(builder: (context) => PaymentDetailsView()));
        },
        hasBackButton: true,
        hasMdTitle: false,
        // drawerTitle: "Orders",
      ),
      content: Builder(builder: (context) {
        return Column(
          children: [
            SizedBox(
              height: 28.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "BANK TRANSFER",
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
                      color:
                          Color.fromARGB(255, 230, 230, 230).withOpacity(0.60),
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
                      padding:
                          EdgeInsets.only(left: 18.w, top: 21.w, right: 20.w),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 5.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Products Price",

                                // "${widget.productName}",
                                // "package Name",
                                // "${watch.purchaseDetailsDataLast?.treatmentName}",
                                style: TextStyle(
                                  fontFamily: 'Campton',
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              RichText(
                                text: TextSpan(
                                  text: "${widget.productPrices} ",
                                  // "299,99 ₺",
                                  style: TextStyle(
                                    fontFamily: 'Campton',
                                    color: Colors.black,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w700,
                                  ),

                                  /*defining default style is optional */
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: '₺',
                                      style: GoogleFonts.inter(
                                        textStyle: TextStyle(
                                          //  fontFamily: 'Campton',
                                          color: Colors.black,
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              // Text(
                              //   "${widget.productPrices}",

                              //   // "Sale Prices",
                              //   // "${watch.purchaseDetailsDataLast?.treatmentPrice}",
                              //   style: TextStyle(
                              //     fontFamily: 'Campton',
                              //     color: Colors.black,
                              //     fontSize: 16.sp,
                              //     fontWeight: FontWeight.w700,
                              //   ),
                              // ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Delivery Fee",
                                style: TextStyle(
                                  fontFamily: 'Campton',
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              RichText(
                                text: TextSpan(
                                  text: "${widget.shippingfees} ",
                                  // "299,99 ₺",
                                  style: TextStyle(
                                    fontFamily: 'Campton',
                                    color: Colors.black,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w700,
                                  ),

                                  /*defining default style is optional */
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: '₺',
                                      style: GoogleFonts.inter(
                                        textStyle: TextStyle(
                                          //  fontFamily: 'Campton',
                                          color: Colors.black,
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              // Text(
                              //   "${widget.shippingfees}",
                              //   style: TextStyle(
                              // fontFamily: 'Campton',
                              // color: Colors.black,
                              // fontSize: 16.sp,
                              // fontWeight: FontWeight.w700,
                              //   ),
                              // ),
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
                          bottom: Radius.circular(20.0.w),
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
                            //   "${widget.totalPrice}",
                            //   style: TextStyle(
                            // fontFamily: 'Campton',
                            // color: black,
                            // fontSize: 18,
                            // fontWeight: FontWeight.w700,
                            //   ),
                            // ),
                            RichText(
                              text: TextSpan(
                                text: "${widget.totalPrice} ",
                                // "299,99 ₺",
                                style: TextStyle(
                                  fontFamily: 'Campton',
                                  color: black,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w700,
                                ),

                                /*defining default style is optional */
                                children: <TextSpan>[
                                  TextSpan(
                                    text: '₺',
                                    style: GoogleFonts.inter(
                                      textStyle: TextStyle(
                                        // fontFamily: 'Campton',
                                        color: black,
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                ],
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
            SizedBox(
              height: 21.h,
            ),
            Container(
              padding: EdgeInsets.only(left: 18.w, right: 18.w),
              child: Card(
                elevation: 5.0,
                color: Color.fromARGB(255, 255, 254, 254),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 31.h,
                    ),
                    Text(
                      "BANK INFORMATIONS",
                      style: TextStyle(
                        fontFamily: 'Campton',
                        color: kDefaultActiveColor,
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(
                      height: 9.h,
                    ),
                    Padding(
                        padding: EdgeInsets.only(left: 12.w, right: 12.w),
                        child: watch.bankList == ""
                            ? ProfileDropDownInformation(
                                hint: "Choose Bank",
                                textEditingController: null,
                                items: watch.bankList
                                    ?.map((item) => DropdownMenuItem<String>(
                                          value: item.id.toString(),
                                          child: Text(
                                            item.bankName ?? "",
                                            style: TextStyle(
                                              letterSpacing: 3,
                                              color: Colors.black,
                                              fontFamily: 'Campton',
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.w400,
                                              // letterSpacing: isPasswordFeild ? 0 : -0.5
                                            ),
                                          ),
                                        ))
                                    .toList(),

                                onChanged: (value) async {
                                  print(value.toString());
                                  await read
                                      .onSelectCountryType(int.parse(value));
                                  read.bakDetails(
                                      context,
                                      //  widget.packageId,
                                      watch.countryListId);
                                  // await read.onSelectCoutryType(value);
                                },
                                value: watch.countryListId?.toString() ??
                                    null, // Use null if the list is empty
                              )
                            : ProfileDropDownInformation(
                                hint: "Choose Bank",
                                textEditingController: null,
                                items: watch.bankList
                                    ?.map((item) => DropdownMenuItem<String>(
                                          value: item.id.toString(),
                                          child: Text(
                                            item.bankName ?? "",
                                            style: TextStyle(
                                              letterSpacing: 3,
                                              color: Colors.black,
                                              fontFamily: 'Campton',
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.w400,
                                              // letterSpacing: isPasswordFeild ? 0 : -0.5
                                            ),
                                          ),
                                        ))
                                    .toList(),
                                onChanged: (value) async {
                                  print(value.toString());
                                  await read
                                      .onSelectCountryType(int.parse(value));
                                  read.bakDetails(
                                      context,
                                      //  widget.packageId,
                                      watch.countryListId);
                                  // await read.onSelectCoutryType(value);
                                },
                                value: watch.countryListId?.toString() ??
                                    null, // Use null if the list is empty
                              )),
                    SizedBox(
                      height: 28.h,
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 20.0.w, right: 20.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "RECEIVER NAME",
                            style: TextStyle(
                              fontFamily: 'Campton',
                              color: kDefaultActiveColor,
                              fontSize: 19.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            "${watch.bankDetails?.accountHolderName ?? ""}",
                            style: TextStyle(
                              fontFamily: 'Campton',
                              color: Colors.black,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(
                            height: 28.h,
                          ),
                          Text(
                            "IBAN",
                            style: TextStyle(
                              fontFamily: 'Campton',
                              color: kDefaultActiveColor,
                              fontSize: 19.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Text(
                            "${watch.bankDetails?.accountNumber ?? ""}",
                            style: TextStyle(
                              fontFamily: 'Campton',
                              color: Colors.black,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  FlutterClipboard.copy(
                                      watch.bankDetails?.accountNumber ?? "");
                                  Utils.showPrimarySnackbar(
                                      context, "Number Copy",
                                      type: SnackType.success);
                                },
                                child: Row(
                                  children: [
                                    SvgPicture.asset('assets/icons/copy.svg'),
                                    Text(
                                      " Copy IBAN",
                                      style: TextStyle(
                                        fontFamily: 'Campton',
                                        color: kDefaultActiveColor,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          Text(
                            "DESCRIPTION",
                            style: TextStyle(
                              fontFamily: 'Campton',
                              color: kDefaultActiveColor,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          RichText(
                            text: TextSpan(
                              text: "Please write",
                              style: TextStyle(
                                  fontFamily: 'Campton',
                                  color: Colors.black,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500),

                              /*defining default style is optional */
                              children: <TextSpan>[
                                TextSpan(
                                  text: ' "#MD736" ',
                                  style: TextStyle(
                                    fontFamily: 'Campton',
                                    color: kDefaultActiveColor,
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w900,
                                  ),
                                  recognizer: new TapGestureRecognizer()
                                    ..onTap = () {
                                      // Navigator.push(
                                      //   context,
                                      //   MaterialPageRoute(
                                      //       builder: (context) => SignUpView()),
                                      // );
                                    },
                                ),
                                TextSpan(
                                  text: ' in the description section',
                                  style: TextStyle(
                                      fontFamily: 'Campton',
                                      color: Colors.black,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500),
                                  recognizer: new TapGestureRecognizer()
                                    ..onTap = () {
                                      // Navigator.push(
                                      //   context,
                                      //   MaterialPageRoute(
                                      //       builder: (context) => SignUpView()),
                                      // );
                                    },
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          PrimaryInformationTextFormFieldreq(
                            borderColor: Color(0xff989898),
                            hintText: 'Enter Description',
                            borderRadius: 20.w,
                            controller: watch.bankDisController,
                            maxLines: 100,
                            height: 100.w,
                            maxLength: 300,
                            contentPadding: EdgeInsets.only(top: 20, left: 15),
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
                          PrimaryInformationTextFormFieldNew(
                            controller: watch.transactionIdController,
                            titleHeader: "Transaction ID",
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
                          PrimaryButton(
                            width: 301.w,
                            height: 40.h,
                            // borderRadius: BorderRadius.circular(),
                            borderRadius: 30,
                            // width: ScreenUtil().screenWidth,
                            color: Color(0xff4CDB06),
                            onTap: () {
                              print(watch.bankDetails?.accountHolderName);
                              print(watch.bankDetails?.accountNumber);
                              print(watch.bankName);
                              print(watch.bankDisController.text);
                              print(widget.purchaseType);
                              print(watch.transactionIdController.text);
                              // print(object)
                              // print(object)
                              // print(object)
                              // return;
                              // Check if the transaction ID is entered
                              if (watch.transactionIdController.text.isEmpty) {
                                // Show an error message, you can replace this with your own error handling logic
                                Utils.showPrimarySnackbar(
                                    context, "Please enter Transaction ID",
                                    type: SnackType.error);
                                // Scaffold.of(context).showSnackBar(
                                //   SnackBar(
                                //     content: Text('Please enter Transaction ID'),
                                //     duration: Duration(seconds: 2),
                                //   ),
                                // );
                              } else if (watch.countryListId == null) {
                                // Check if a bank is selected, if not, show an error message
                                Utils.showPrimarySnackbar(
                                  context,
                                  "Please choose a bank",
                                  type: SnackType.error,
                                );
                              } else {
                                // Process the payment if the transaction ID is entered
                                read.shopCardPayment(
                                    context,
                                    watch.bankDetails?.accountHolderName,
                                    watch.bankDetails?.accountNumber,
                                    watch.bankDetails?.bankName,
                                    '',
                                    '',
                                    '',
                                    '',
                                    watch.bankDisController.text,
                                    widget.purchaseType,
                                    '',
                                    watch.transactionIdController.text);
                                Navigator.push(
                                  context,
                                  SlidePageRoute(
                                    page: ShopPaymentProcessingView(),
                                    direction: SlideDirection
                                        .right, // Specify the slide direction here
                                    delay: Duration(milliseconds: 5000),
                                  ),
                                );
                              }
                            },

                            child: Text(
                              "Complete Payment",
                              style: TextStyle(
                                  color: Colors.black,
                                  // letterSpacing: .5,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 50.h,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 100.h,
            ),
          ],
        );
      }),
    );
  }
}
