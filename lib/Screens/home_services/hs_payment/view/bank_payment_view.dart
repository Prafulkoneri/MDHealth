import 'package:clipboard/clipboard.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:md_health/Screens/health/bank_transfer/view/bank_payment_processingView.dart';
import 'package:md_health/Screens/home_services/hs_payment/controller/hs_payment_controller.dart';
import 'package:md_health/Screens/home_services/hs_payment/view/bank_loading_view.dart';
import 'package:md_health/Screens/home_services/hs_payment/view/bank_processing_view.dart';
import 'package:md_health/Screens/home_services/purchase_details/view/purchase_details_view.dart';
import 'package:md_health/constants/styles/colors.dart';
import 'package:md_health/test_widget.dart';
import 'package:md_health/utils/utils.dart';
import 'package:md_health/widget/base_screen.dart';
import 'package:md_health/widget/buttons.dart';
import 'package:md_health/widget/custom_appbar.dart';
import 'package:md_health/widget/drop_down.dart';
import 'package:md_health/widget/text_field.dart';
import 'package:provider/provider.dart';

class HsBankTransferView extends StatefulWidget {
  final String? purchseId;
  final String? paymentType;
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
  final String? randNumber;
  final List<String>? selectedNames;
  const HsBankTransferView(
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
      this.paymentType,
      this.randNumber,
      this.bankName});

  @override
  State<HsBankTransferView> createState() => _HsBankTransferViewState();
}

class _HsBankTransferViewState extends State<HsBankTransferView> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      print('obj333333333333333333ect');
      print(widget.paymentType);
      print('o33333333333333333bject');
      context.read<HsPaymentLastController>().initState(
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
          widget.paymentType,
          widget.puchesId,
          widget.patientID,
          '');
    });
  }

  @override
  Widget build(BuildContext context) {
    final read = context.read<HsPaymentLastController>();
    final watch = context.watch<HsPaymentLastController>();
    // final read = context.read<BankTransferController>();
    // final watch = context.watch<BankTransferController>();
    return BaseScreen(
      onWillPop: () async {
        Navigator.push(
          context,
          SlidePageRoute(
            page: HSPurchaseDetailsView(
              purchaseType: widget.purchaseType,
              packageId: watch.packageId.toString(),
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
              page: HSPurchaseDetailsView(
                purchaseType: widget.purchaseType,
                packageId: watch.packageId.toString(),
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
                                "${watch.purchaseDetailsDataLast?.treatmentName}",
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
                                fontSize: 19,
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
                                        fontSize: 26,
                                        fontWeight: FontWeight.w700,
                                      ),
                                      children: [
                                        TextSpan(
                                          text: ' ₺',
                                          style: GoogleFonts.inter(
                                            textStyle: TextStyle(
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
                                  read.bakDetails(context, watch.countryListId);
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
                                  read.bakDetails(context, watch.countryListId);
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
                          // Container(
                          //   width: 400.w,
                          //   child: Row(
                          //     children: [
                          //       Text(
                          //         "Please write",
                          //         style: TextStyle(
                          //           fontFamily: 'Campton',
                          //           color: Colors.black,
                          //           fontSize: 10.sp,
                          //           fontWeight: FontWeight.w600,
                          //         ),
                          //       ),
                          //       Text(
                          //         ' "${widget.packageName}"',
                          // style: TextStyle(
                          //   fontFamily: 'Campton',
                          //   color: kDefaultActiveColor,
                          //   fontSize: 12.sp,
                          //   fontWeight: FontWeight.w900,
                          // ),
                          //       ),
                          //       Text(
                          //         "in the description section",
                          //         style: TextStyle(
                          //           fontFamily: 'Campton',
                          //           color: Colors.black,
                          //           fontSize: 10.5.sp,
                          //           fontWeight: FontWeight.w600,
                          //         ),
                          //       ),
                          //     ],
                          //   ),
                          // ),
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
                                  text: ' "${widget.packageName}"',
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
                            hintText: 'Enter Description',
                            borderRadius: 20.w,
                            controller: watch.bankDiscriptionController,
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
                              print(widget.paymentType);
                              print(watch.countryListId);
                              print(watch.bankDetails?.accountNumber);
                              print(watch.bankDetails?.accountHolderName);
                              print(watch.bankDetails?.bankName);
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
                                print(widget.paymentType);
                                print(widget.purchaseType);
                                print(widget.puchesId);
                                // print(widget.paymentType);
                                // print(widget.paymentType);
                                // print(widget.paymentType);
                                print(widget.randNumber);
                                print(watch.otherService);
                                print(watch.countryListId);
                                print(watch.bankDetails?.accountNumber);
                                print(watch.bankDetails?.accountHolderName);
                                print(watch.bankDetails?.bankName);
                                // return;
                                // Process the payment if the transaction ID is entered
                                read.paymentDone(
                                    context,
                                    widget.puchesId ?? "",
                                    widget.patientID ?? "",
                                    widget.purchaseType,
                                    watch.otherService,
                                    widget.paymentType,
                                    widget.randNumber,
                                    watch.bankDiscriptionController.text,
                                    watch.bankDetails?.accountHolderName,
                                    watch.bankDetails?.accountNumber,
                                    watch.bankDetails?.bankName,
                                    watch.transactionIdController.text,
                                    '',
                                    '',
                                    '',
                                    '');
                                // Navigator.push(
                                //   context,
                                //   SlidePageRoute(
                                //     page: BankPaymentProcessingView(
                                //         purchesId: widget.puchesId),
                                //     direction: SlideDirection.right,
                                //     delay: Duration(milliseconds: 5000),
                                //   ),
                                // );
                                // return;
                                Navigator.push(
                                  context,
                                  SlidePageRoute(
                                    page: HsBackPaymentProcessingView(
                                      purchesId: widget.puchesId ?? "",
                                    ),
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
                      height: 100.h,
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
