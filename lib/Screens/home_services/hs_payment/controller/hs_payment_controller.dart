import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:md_health/Screens/health/bank_transfer/model/bank_detai_model.dart';
import 'package:md_health/Screens/health/bank_transfer/model/get_bank_trasfer_model.dart';
import 'package:md_health/Screens/health/bank_transfer/repository/detail_bank_repo.dart';
import 'package:md_health/Screens/health/bank_transfer/repository/get_bank_trasfer_repo.dart';
import 'package:md_health/Screens/health/payment_details/model/md_coin_model.dart';
import 'package:md_health/Screens/health/payment_details/repository/wallet_repo.dart';
import 'package:md_health/Screens/home_services/hs_payment/model/hs_payment_purchase_model.dart';
import 'package:md_health/Screens/home_services/hs_payment/model/payment_done_model.dart';
import 'package:md_health/Screens/home_services/hs_payment/repo/bank_payment_repo.dart';
import 'package:md_health/Screens/home_services/hs_payment/repo/card_payment_repo.dart';
import 'package:md_health/Screens/order_details/model/invoices_hs_dowload_model.dart';
import 'package:md_health/Screens/order_details/repo/invoices_hs_repo.dart';
import 'package:md_health/utils/utils.dart';
import 'package:md_health/widget/loading_overlay.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HsPaymentLastController extends ChangeNotifier {
  bool isLoading = true;

  // Future<void> initState(context, pId, sPrice, priceP, percentagePrices,
  //     oServices, purcType) async {
  //   await getBankList(context);
  //   walletCount(context);
  //   hsgetPaymentDetailsList(
  //       context, pId, sPrice, priceP, percentagePrices, oServices, purcType);
  //   notifyListeners();
  // }
  String newPaymentType = '';
  TextEditingController cvvController = TextEditingController();

  Future<void> initState(
      context,
      pId,
      sPrice,
      priceP,
      percentagePrices,
      oServices,
      purchesId,
      patientID,
      purcType,
      bname,
      payType,
      purcId,
      patId,
      orderId) async {
    // this.newPaymentType = paymentMethod;
    cardNameController.clear();
    accountNumberController.clear();
    expiryFieldCtrl.clear();
    cvvController.clear();
    expiryDate = '';
    walletCount(context);
    transactionIdController.clear();
    await getBankList(context);
    formattedAccountNumber = '';
    nameaccount = '';

    formattedAccountNumber = "0000 0000 0000 0000";
    nameaccount = "Card Holder Name";
    expiryDate = "00 / 00";
    cvvn = "";
    print("objectttt");
    print(pId);
    this.newPaymentType = paymentMethod;
    print(newPaymentType);
    print(paymentMethod);
    print("objectttt");
    await hsgetPaymentDetailsList(context, pId, sPrice, priceP,
        percentagePrices, oServices, purcType, purcId, payType, patId);
    notifyListeners();
  }

  String? _expiryErrorText;

  // Getter for expiryErrorText
  String? get expiryErrorText => _expiryErrorText;

  // Setter for expiryErrorText
  set expiryErrorText(String? value) {
    _expiryErrorText = value;
    notifyListeners(); // If PaymentController extends ChangeNotifier
  }

///////////////////////////////////////////////////
  TextEditingController expiryFieldCtrl = TextEditingController();
  String formattedAccountNumber = "0000 0000 0000 0000";
  String nameaccount = "Card Holder Name";
  // String expir = "12/24";
  String cvvn = "***";
  String expiryDate = '00/00';
  // void accountNumver(String newText) {
  //   number = newText;
  //   notifyListeners();
  // }
  void accountNumver(String newText) {
    formattedAccountNumber = newText;
    notifyListeners();
  }

  TextEditingController cardNameController = TextEditingController();
  void accountName(String newText) {
    if (newText.isEmpty) {
      nameaccount = "Card Holder Name";
    } else {
      nameaccount = newText;
    }
    notifyListeners();
  }

  // void accountexpire(String newText) {
  //   expiryDate = newText;
  //   notifyListeners();
  // }

  void handleExpiryDateChange(String value) {
    var newDateValue = value.trim();
    final isPressingBackspace = expiryDate.length > newDateValue.length;
    final containsSlash = newDateValue.contains('/');
    {
      // Add slash after the first two digits if not already present
      if (newDateValue.length >= 2 && !containsSlash && !isPressingBackspace) {
        newDateValue =
            '${newDateValue.substring(0, 2)}/${newDateValue.substring(2)}';
      }

      // Validate the length and format of the input
      if (newDateValue.length >= 5) {
        final enteredMonth = int.tryParse(newDateValue.substring(0, 2)) ?? 0;
        final enteredYear = int.tryParse(newDateValue.substring(3)) ?? 0;

        // Check for valid month
        if (enteredMonth < 1 || enteredMonth > 12) {
          if (newDateValue.length == 5) {
            newDateValue = newDateValue.substring(0, 3); // Remove invalid month
          }
        }

        // Check for valid year
        final currentYear = DateTime.now().year % 100;
        if (enteredYear < currentYear ||
            (enteredYear == currentYear &&
                enteredMonth < DateTime.now().month)) {
          if (newDateValue.length == 5) {
            newDateValue = newDateValue.substring(0, 4); // Remove expired year
          }
        }
      }
    }

    // Update the text field and state
    expiryFieldCtrl.text = newDateValue;
    expiryFieldCtrl.selection =
        TextSelection.fromPosition(TextPosition(offset: newDateValue.length));
    if (newDateValue.isEmpty) {
      expiryDate = '00/00';
    } else {
      expiryDate = newDateValue;
    }

    // Notify listeners
    notifyListeners();
  }

  void accountcvv(String newText) {
    cvvn = newText;
    notifyListeners();
  }

  TextEditingController accountNumberController = TextEditingController();
  // formatAccountNumber() {
  //   String accountNumber =
  //       accountNumberController.text.replaceAll(RegExp(r'\s'), '');
  //   if (accountNumber.length >= 4) {
  //     accountNumber = accountNumber.replaceAllMapped(
  //         RegExp(r".{4}"), (match) => "${match.group(0)} ");
  //   }
  //   formattedAccountNumber = accountNumber.trim();
  //   notifyListeners();
  // }
  void formatAccountNumber() {
    String accountNumber =
        accountNumberController.text.replaceAll(RegExp(r'\s'), '');

    if (accountNumber.isEmpty) {
      formattedAccountNumber = "0000 0000 0000 0000"; // Placeholder text
    } else {
      if (accountNumber.length >= 4) {
        accountNumber = accountNumber.replaceAllMapped(
            RegExp(r".{4}"), (match) => "${match.group(0)} ");
      }
      // Trim any trailing spaces
      formattedAccountNumber = accountNumber.trim();
    }

    // Notify listeners to update the UI
    notifyListeners();
  }

  //////////////////
  void clearAccountNumber() {
    accountNumberController.clear();
    formattedAccountNumber = '';
    notifyListeners();
  }

  // String formatAccountNumber(String accountNumber) {
  //   accountNumber = accountNumber.replaceAllMapped(
  //       RegExp(r".{4}"), (match) => "${match.group(0)} ");

  //   return accountNumber.trim();
  // }

  String getCardType(String accountNumber) {
    if (RegExp(r'[4]').hasMatch(accountNumber)) {
      return 'assets/images/ri_visa-line.png';
    } else if (RegExp(
            r'((5[1-5])|(222[1-9]|22[3-9][0-9]|2[3-6][0-9]{2}|27[01][0-9]|2720))')
        .hasMatch(accountNumber)) {
      return 'assets/images/mastercard.png';
    } else if (RegExp(r'((6[45])|(6011))').hasMatch(accountNumber)) {
      return 'assets/images/american-express.png';
    } else if (RegExp(r'^6(?:011|5[0-9]{2})[0-9]{12}$')
        .hasMatch(accountNumber)) {
      return 'assets/images/discover.png';
    } else if (RegExp(r'((30[0-5])|(3[89])|(36)|(3095))')
        .hasMatch(accountNumber)) {
      return 'assets/images/dinners.png';
    } else if (RegExp(r'(352[89]|35[3-8][0-9])').hasMatch(accountNumber)) {
      return 'assets/images/ri_visa-line.png';
    } else {
      return 'assets/images/ri_visa-line.png';
    }
  }

  String cardTypes = '';
  String accountNumbers = '';

  String get cardType => cardTypes;
  String get accountNumber => accountNumbers;

  void updateCardType() {
    cardTypes = getCardType((formattedAccountNumber));
    notifyListeners();
  }

  void updateAccountNumber(String newAccountNumber) {
    accountNumbers = newAccountNumber;
    updateCardType(); // Call updateCardType when the account number changes
    notifyListeners();
  }

  bool isValidCVV(String cvv) {
    return cvv.length == 3 || cvv.length == 4;
  }

  ////////////////////////////////////////

  int? countryListId;

  Future<void> onSelectCountryType(int value) async {
    countryListId = value;
    print(countryListId);
    notifyListeners();
  }

  List<BankList>? bankList;
  Future<void> getBankList(context) async {
    if (transactionIdController.text == '') {
      Utils.showPrimarySnackbar(context, 'Please enter trancaction id',
          type: SnackType.error);
      notifyListeners();
    }
    showLoader(true);
    SharedPreferences pref = await SharedPreferences.getInstance();
    print(pref.getString("successToken"));
    getBanklistRepo.bankList(pref.getString("successToken")).then((response) {
      print(response.body);
      final result = BankListModel.fromJson(
        jsonDecode(response.body),
      );
      if (response.statusCode == 200) {
        if (result.status == 200) {
          bankList = result.bankList;

          showLoader(false);
          // Utils.showPrimarySnackbar(context, "", type: SnackType.success);
          notifyListeners();
        } else {
          // Utils.showPrimarySnackbar(context, "", type: SnackType.error);
        }
      } else {
        // Utils.showPrimarySnackbar(context, "", type: SnackType.error);
      }
    }).onError((error, stackTrace) {
      // Utils.showPrimarySnackbar(context, error, type: SnackType.debugError);
    }).catchError(
      (Object e) {
        // Utils.showPrimarySnackbar(context, e, type: SnackType.debugError);
      },
      test: (Object e) {
        // Utils.showPrimarySnackbar(context, e, type: SnackType.debugError);
        return false;
      },
    );
  }

  showLoader(value) {
    isLoading = value;
    notifyListeners();
  }

  String? purchaseType = '';
  String? paymentType = '';
  String? packageId = '';
  String? salePrice = '';
  String? price = '';
  String? percentage = '';
  List<String>? otherService;
  String? purchaseId = '';
  String? patientID = '';
  HsgetPurchaseInformationRepo hsgetPurchaseInformationRepo =
      HsgetPurchaseInformationRepo();
  LastHsPurchaseDetailsRequestModel get lastHsPurchaseDetailsRequestModel =>
      LastHsPurchaseDetailsRequestModel(
        purchaseType: purchaseType.toString(),
        purchesId: purchaseId ?? '0',
        patientID: patientID ?? '0',
        packageId: packageId.toString(),
        salePrice: salePrice,
        price: price,
        percentage: percentage,
        otherService: otherService,
        paymentType: paymentType ?? "",
      );

  PurchaseDetailsDataLast? purchaseDetailsDataLast;
  List<OtherService>? otherServices;
  Future<void> hsgetPaymentDetailsList(context, pId, sPrice, priceP,
      percentagePrices, oServices, purcType, purcId, payType, patId) async {
    packageId = pId.toString();
    salePrice = sPrice.toString();
    price = priceP;
    percentage = percentagePrices;
    otherService = oServices;
    purchaseType = purcType;
    purchaseId = purcId;
    patientID = patId;
    paymentType = payType;
    SharedPreferences pref = await SharedPreferences.getInstance();
    hsgetPurchaseInformationRepo
        .hsGetPurchaseInformation(
            lastHsPurchaseDetailsRequestModel, pref.getString("successToken"))
        .then((response) async {
      // print(response.body);
      debugPrint('/////////////');
      final result = HsLastPurchaseDetailsResponseModel.fromJson(
          jsonDecode(response.body));
      if (response.statusCode == 200) {
        print(response.body);
        purchaseDetailsDataLast = result.purchaseDetailsDataLast;
        otherServices = result.otherServices;
        notifyListeners();
      } else {
        print(response.body);
        Utils.showPrimarySnackbar(context, result.message,
            type: SnackType.error);
      }
    }).onError((error, stackTrace) {
      Utils.showPrimarySnackbar(context, error, type: SnackType.debugError);
    }).catchError(
      (Object e) {
        Utils.showPrimarySnackbar(context, e, type: SnackType.debugError);
      },
      test: (Object e) {
        Utils.showPrimarySnackbar(context, e, type: SnackType.debugError);
        return false;
      },
    );
  }

  GetBanklistRepo getBanklistRepo = GetBanklistRepo();

  TextEditingController transactionIdController = TextEditingController();
  TextEditingController bankDiscriptionController = TextEditingController();

  // GetBanklistRepo getBanklistRepo = GetBanklistRepo();
  BankListDetailRepo bankListDetailRepo = BankListDetailRepo();
  BankDetails? bankDetails;
  String? bankName;

  PackageDetails? packageDetails;
  BankListRequestModel get bankListRequestModel => BankListRequestModel(
        // packageID: packageId.toString(),
        bankId: countryListId.toString(),
      );
  Future<void> bakDetails(context, bname) async {
    bankName = bname.toString();
    // packageId = pId.toString();
    showLoader(true);
    SharedPreferences pref = await SharedPreferences.getInstance();
    bankListDetailRepo
        .bankListdetail(bankListRequestModel, pref.getString("successToken"))
        .then((response) async {
      // print(response.body);
      debugPrint('/////////////');
      final result = BankListModelRsponse.fromJson(jsonDecode(response.body));
      if (response.statusCode == 200) {
        print(response.body);
        bankDetails = result.bankDetails;
        packageDetails = result.packageDetails;
        print("juhujkiuyol,oi;l");
        showLoader(false);
        notifyListeners();
      } else {
        print(response.body);
        // Utils.showPrimarySnackbar(context, result.message,
        //     type: SnackType.error);
      }
    }).onError((error, stackTrace) {
      // Utils.showPrimarySnackbar(context, error, type: SnackType.debugError);
    }).catchError(
      (Object e) {
        // Utils.showPrimarySnackbar(context, e, type: SnackType.debugError);
      },
      test: (Object e) {
        // Utils.showPrimarySnackbar(context, e, type: SnackType.debugError);
        return false;
      },
    );
  }

  //////////////////////////////////////////////////////
  MdCoinRepo mdCoinRepo = MdCoinRepo();

  String? coins;
////////////////////////////////////////////////////
  Future<void> walletCount(context) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    mdCoinRepo
        .mdCoinWallet(pref.getString("successToken"))
        .then((response) async {
      // print(response.body);
      debugPrint('/////////////');
      final result = GetMdCoinsResponse.fromJson(jsonDecode(response.body));
      if (response.statusCode == 200) {
        print(response.body);
        coins = result.coins;
        notifyListeners();
      } else {
        print(response.body);
        Utils.showPrimarySnackbar(context, result.message,
            type: SnackType.error);
      }
    }).onError((error, stackTrace) {
      Utils.showPrimarySnackbar(context, error, type: SnackType.debugError);
    }).catchError(
      (Object e) {
        Utils.showPrimarySnackbar(context, e, type: SnackType.debugError);
      },
      test: (Object e) {
        Utils.showPrimarySnackbar(context, e, type: SnackType.debugError);
        return false;
      },
    );
  }

  //////////////////////////////
  String randomNumber = '';
  // String patientID = "";
  String purchesId = "";
  String paymentMethod = "";
  String bankReciverNAme = "";
  String iban = "";
  // String paymentMethod = "";
  HSPaymentDoneRequestModel get hSPaymentDoneRequestModel =>
      HSPaymentDoneRequestModel(
        expiryDate: expiryFieldCtrl.text ?? '',
        cardNumber: accountNumberController.text ?? '',
        cardName: cardNameController.text ?? '',
        cardCVV: cvvController.text ?? '',
        iban: iban,
        bankReciverNAme: bankReciverNAme,
        bankName: bankName,
        transactionId: transactionIdController.text ?? '',
        bankDiscription: bankDiscriptionController.text ?? "",
        conversationId: randomNumber.toString() ?? '',
        otherService: otherService,
        purchaseType: purchaseType ?? "",
        patientID: patientID ?? '',
        purchesId: purchesId ?? '',
        paymentType: paymentType,
        //  paymentType ?? 'card',
        packageId: packageId.toString(), //
        paidAmount: price ?? '', //
        salePrice: salePrice ?? "", //
        percentage: percentage ?? '', //
        platFormType: "android" ?? '', //
      );
  HsPaymentDoneRepo hsPaymentDoneRepo = HsPaymentDoneRepo();
  String? id;
  // DateTime future = now.add(Duration(hours: 3));

  Future<void> paymentDone(
      context,
      purcheIdN,
      idPatient,
      purcType,
      oServices,
      paymentType,
      randNumber,
      bankDis,
      bReciver,
      iba,
      bName,
      trId,
      cNumber,
      cName,
      exp,
      cvv) async {
    purchesId = purcheIdN;
    patientID = idPatient ?? '';
    purchaseType = purcType;
    otherService = oServices;
    paymentType = paymentType;
    bankDiscriptionController.text = bankDis;
    transactionIdController.text = trId;
    randomNumber = randNumber.toString();
    bankReciverNAme = bReciver;
    iban = iba;
    bankName = bName;
    accountNumberController.text = cNumber;
    cardNameController.text = cName;
    expiryFieldCtrl.text = exp;
    cvvController.text = cvv;
    print("yguytggytyttyftyty");
    print(randomNumber);
    print(paymentType);
    print("yguytggytyttyftyty");
    SharedPreferences pref = await SharedPreferences.getInstance();
    hsPaymentDoneRepo
        .hspaymentDone(
            hSPaymentDoneRequestModel, pref.getString("successToken"))
        .then((response) async {
      // print(response.body);
      debugPrint('/////////////');
      final result =
          HsPaymentDoneResponseModel.fromJson(jsonDecode(response.body));
      if (response.statusCode == 200) {
        print(response.body);
        id = result.id;
        // call generate invoice api here
        hsdownloadInvoise(context, id);
        notifyListeners();
      } else {
        print(response.body);
        Utils.showPrimarySnackbar(context, result.message,
            type: SnackType.error);
      }
    }).onError((error, stackTrace) {
      Utils.showPrimarySnackbar(context, error, type: SnackType.debugError);
    }).catchError(
      (Object e) {
        Utils.showPrimarySnackbar(context, e, type: SnackType.debugError);
      },
      test: (Object e) {
        Utils.showPrimarySnackbar(context, e, type: SnackType.debugError);
        return false;
      },
    );
  }
  /////////////////////////////////////////////////////

  String? invoices;
  HSDonloadInvoiceRepo hsDonloadInvoiceRepo = HSDonloadInvoiceRepo();

  String? orderId;
  HSInvoicesdownloadrequestModel get hsinvoicesdownloadrequestModel =>
      HSInvoicesdownloadrequestModel(orderId: orderId);
  Future<void> hsdownloadInvoise(context, od) async {
    orderId = od;
    LoadingOverlay.of(context).show();
    SharedPreferences pref = await SharedPreferences.getInstance();
    hsDonloadInvoiceRepo
        .hsdownloadIn(
            hsinvoicesdownloadrequestModel, pref.getString("successToken"))
        .then((response) async {
      // log(response.body);
      debugPrint('/////////////');
      final result =
          HSInvoicesDownloadResponseModel.fromJson(jsonDecode(response.body));
      if (response.statusCode == 200) {
        log(response.body);
        invoices = result.invoices;
        // String url = Uri.encodeFull(result.invoices.toString());
        // if (await canLaunch(url)) {
        //   launch(url);
        // } else {
        //   throw 'Could not launch $url';
        // }
        LoadingOverlay.of(context).hide();
        notifyListeners();
      } else {
        log(response.body);
        Utils.showPrimarySnackbar(context, result.message,
            type: SnackType.error);
      }
    }).onError((error, stackTrace) {
      Utils.showPrimarySnackbar(context, error, type: SnackType.debugError);
    }).catchError(
      (Object e) {
        Utils.showPrimarySnackbar(context, e, type: SnackType.debugError);
      },
      test: (Object e) {
        Utils.showPrimarySnackbar(context, e, type: SnackType.debugError);
        return false;
      },
    );
  }
}
