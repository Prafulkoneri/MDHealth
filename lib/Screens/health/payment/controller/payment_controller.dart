import 'dart:convert';
import 'dart:developer';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:md_health/Screens/health/bank_transfer/model/bank_detai_model.dart';
import 'package:md_health/Screens/health/bank_transfer/model/get_bank_trasfer_model.dart';
import 'package:md_health/Screens/health/bank_transfer/repository/detail_bank_repo.dart';
import 'package:md_health/Screens/health/bank_transfer/repository/get_bank_trasfer_repo.dart';
import 'package:md_health/Screens/food/card_diet/model/card_diet_payment_model.dart';
import 'package:md_health/Screens/food/card_diet/repository/card_diet_repo.dart';
import 'package:md_health/Screens/health/packages/model/download_invoices_model.dart';
import 'package:md_health/Screens/health/packages/repository/download_invoise_repo.dart';
import 'package:md_health/Screens/health/payment/model/invoice_model.dart';
import 'package:md_health/Screens/health/payment/model/payment_done_model.dart';
import 'package:md_health/Screens/health/payment/model/payment_purches_model.dart';
import 'package:md_health/Screens/health/payment/repository/cart_payment_repo.dart';
import 'package:md_health/Screens/health/payment/repository/food_invoice_repo.dart';
import 'package:md_health/Screens/health/payment/repository/payment_done_repo.dart';
import 'package:md_health/Screens/health/payment_details/model/md_coin_model.dart';
import 'package:md_health/Screens/health/payment_details/repository/wallet_repo.dart';
import 'package:md_health/Screens/shop/shop_payment/model/shop_payment_model.dart';
import 'package:md_health/Screens//shop/shop_payment/repository/shop_card_repo.dart';
import 'package:md_health/utils/utils.dart';
import 'package:md_health/widget/loading_overlay.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PaymentController extends ChangeNotifier {
  PaymentDetailslastRepository paymentDetailslastRepository =
      PaymentDetailslastRepository();
  PaymentDoneRepo paymentDoneRepo = PaymentDoneRepo();
  MdCoinRepo mdCoinRepo = MdCoinRepo();
  PaymentDoneShopRepo paymentDoneShopRepo = PaymentDoneShopRepo();
  TextEditingController passwordController = TextEditingController();
  TextEditingController transactionIdController = TextEditingController();
  TextEditingController bankDisController = TextEditingController();

// PaymentDoneRepo
  OrderId? orderId;
  String? newOrderid;
  bool isLoading = false;
  String packageId = "";
  String patientID = "";
  String purchesId = "";
  String percentage = "";
  String purchaseType = "";
  List<String>? otherService;
  String price = "";
  String pripaymentTypece = "";
  String salePrice = "";
  String paidAmount = "";
  String randomNumber = '';
  bool showBack = false;
  FocusNode cvvFocusNode = FocusNode();

  PurchaseDetailsDataLast? purchaseDetailsDataLast;
  List<OtherService>? otherServices;

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
      pName,
      pmenTypenew) async {
    print("peatik");
    print(purchaseType);
    print("peatik");
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
    // await bakDetails(
    //   context,
    //   pId,
    //   bname,
    // );
    formattedAccountNumber = "0000 0000 0000 0000";
    nameaccount = "Card Holder Name";
    expiryDate = "00 / 00";
    cvvn = "";
    print("objectttt");
    print(pId);
    print("objectttt");
    await getPaymentDetailsList(context, pId, sPrice, priceP, percentagePrices,
        oServices, purcType, pmenTypenew);
    notifyListeners();
  }

  TextEditingController cvvController = TextEditingController();
  PurchaseDetailsRequestModel get purchaseDetailsRequestModel =>
      PurchaseDetailsRequestModel(
        paymentType: paymentMethod,
        purchaseType: purchaseType.toString(),
        purchesId: purchesId.toString(),
        packageId: packageId.toString(),
        salePrice: salePrice,
        price: price ?? '',
        percentage: percentage,
        otherService: otherService,
      );
  Future<void> getPaymentDetailsList(context, pId, sPrice, priceP,
      percentagePrices, oServices, purcType, pmenTypenew) async {
    packageId = pId.toString();
    salePrice = sPrice.toString();
    price = priceP ?? '';
    percentage = percentagePrices ?? '';
    otherService = oServices ?? [];
    purchaseType = purcType ?? '';
    paymentMethod = pmenTypenew ?? '';
    SharedPreferences pref = await SharedPreferences.getInstance();
    paymentDetailslastRepository
        .getPaymentDetailsList(
            purchaseDetailsRequestModel, pref.getString("successToken"))
        .then((response) async {
      // print(response.body);
      debugPrint('/////////////');
      final result =
          LastPurchaseDetailsResponseModel.fromJson(jsonDecode(response.body));
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

// var random = Random();

//  (random.nextInt(900000000) + 100000000).toString();
  String bankReciverNAme = "";
  String iban = "";
  PaymentDoneRequestModel get paymentDoneRequestModel =>
      PaymentDoneRequestModel(
        expiryDate: expiryFieldCtrl.text ?? '',
        cardNumber: accountNumberController.text ?? '',
        cardName: cardNameController.text ?? '',
        cardCVV: cvvController.text ?? '',
        iban: iban,
        bankReciverNAme: bankReciverNAme,
        bankName: bankName,
        transactionId: transactionIdController.text,
        disscription: bankDisController.text,
        conversationId: randomNumber.toString(),
        otherService: otherService,
        purchaseType: purchaseType,
        patientID: patientID,
        purchesId: purchesId,
        paymentMethod: paymentMethod,
        packageId: packageId.toString(), //
        paidAmount: price, //
        salePrice: salePrice, //
        percentage: percentage, //
        platFormType: "android", //
      );
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
      trnsId,
      cNumber,
      cName,
      exp,
      cvv) async {
    purchesId = purcheIdN;
    patientID = idPatient;
    purchaseType = purcType ?? '';
    otherService = oServices ??
        [
          "Accommodation",
          "Transportation",
          "Tour Details",
          "Visa Details",
          "Translation",
          "Ambulance Service",
          "Ticket Service"
        ];
    paymentType = paymentType ?? "";
    transactionIdController.text = trnsId;
    bankDisController.text = bankDis;
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
    print(randomNumber);
    print("yguytggytyttyftyty");
    SharedPreferences pref = await SharedPreferences.getInstance();
    paymentDoneRepo
        .paymentdone(paymentDoneRequestModel, pref.getString("successToken"))
        .then((response) async {
      // print(response.body);
      debugPrint('/////////////');
      final result =
          PaymentDoneResponseModel.fromJson(jsonDecode(response.body));
      if (response.statusCode == 200) {
        print(response.body);
        newOrderid = result.orderId?.id.toString();
        print('***************');
        // print(result.orderId?.id);
        print(newOrderid);
        // call generate invoice api
        downloadInvoise(context, newOrderid);
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

  DonloadInvoiceRepo donloadInvoiceRepo = DonloadInvoiceRepo();

  String? invoices;

  String? oId;
  InvoicesdownloadrequestModel get invoicesdownloadrequestModel =>
      InvoicesdownloadrequestModel(orderId: oId);
  Future<void> downloadInvoise(context, od) async {
    // showLoader(true);
    oId = od.toString();
    print("****************** $od");
    // LoadingOverlay.of(context).show();

    // purcheseId = purchesId;
    // type = tp;
    SharedPreferences pref = await SharedPreferences.getInstance();
    donloadInvoiceRepo
        .downloadIn(
            invoicesdownloadrequestModel, pref.getString("successToken"))
        .then((response) async {
      // log(response.body);
      debugPrint('/////////////');
      final result =
          InvoicesDownloadResponseModel.fromJson(jsonDecode(response.body));
      if (response.statusCode == 200) {
        print(response.body);
        invoices = result.invoices;
        // String url = Uri.encodeFull(result.invoices.toString());
        // if (await canLaunch(url)) {
        //   launch(url);
        // } else {
        //   throw 'Could not launch $url';
        // }
        // LoadingOverlay.of(context).hide();
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
  String cvvn = "";
  String expiryDate = ' 00/00 ';
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

  void accountexpire(String newText) {
    expiryDate = newText;
    notifyListeners();
  }

  void accountcvv(String newText) {
    cvvn = newText;
    notifyListeners();
  }

  TextEditingController accountNumberController = TextEditingController();
  formatAccountNumber() {
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
    if (formattedAccountNumber.isEmpty) {
      formattedAccountNumber =
          "0000 0000 0000 0000"; // Default placeholder text
    }
    notifyListeners();
  }

  //////////////////
  void clearAccountNumber() {
    accountNumberController.clear();
    formattedAccountNumber = '0000 0000 0000 0000';
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
          Utils.showPrimarySnackbar(context, "", type: SnackType.success);
          notifyListeners();
        } else {
          Utils.showPrimarySnackbar(context, "", type: SnackType.error);
        }
      } else {
        Utils.showPrimarySnackbar(context, "", type: SnackType.error);
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
  BankListDetailRepo bankListDetailRepo = BankListDetailRepo();
  // CompletedPackageRepo completedPackageRepo = CompletedPackageRepo();
  String? bankName;

  showLoader(value) {
    isLoading = value;
    notifyListeners();
  }

  //////////////////////////////////////////////
  BankDetails? bankDetails;
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
  ///////////////////////////////////////FOOD/////////////////////////////

  String type = "";
  String data = "";
  String startDate = "";
  String endDate = "";
  String patientId = "";
  String platformtype = "";
  String subscriptiontype = "";
  String paymentMethod = "";
  // String foodPackageTotalPrice = "";
  String foodPackageTotalPrice = ""; // Change data type to String

  String foodPackageId = "";
  DietCardPAymentRepo dietCardPAymentRepo = DietCardPAymentRepo();
  String? shopOrderID;

  CardDietPaymentRequest get cardDietPaymentRequest => CardDietPaymentRequest(
      expiryDate: expiryFieldCtrl.text ?? '',
      cardNumber: accountNumberController.text ?? '',
      cardName: cardNameController.text ?? '',
      cardCVV: cvvController.text ?? '',
      iban: iban,
      bankReciverNAme: bankReciverNAme,
      bankName: bankName,
      conversationId: randomNumber.toString(),
      bankDiscription: bankDisController.text ?? "hello",
      transactionId: transactionIdController.text ?? '',
      subscriptionType: subscriptiontype,
      mdCoins: data,
      type: type,
      subscriptionStartDate: startDate,
      subscriptionEndDate: endDate,
      platformtype: "android",
      paymentMethod: paymentMethod,
      foodPackageTotalPrice: foodPackageTotalPrice,
      foodPackageId: foodPackageId,
      patientId: patientId);
  Future<void> cardDietPayment(
      context,
      moType,
      sDate,
      eDate,
      pId,
      ptype,
      pMethod,
      fpTotalPrices,
      fpId,
      mcoin,
      subscType,
      transId,
      bdiscription,
      bReciver,
      iba,
      bName,
      randNumber,
      cNumber,
      cName,
      exp,
      cvv) async {
    type = moType.toString();
    data = mcoin.toString();
    startDate = sDate.toString();
    endDate = eDate.toString();
    patientId = pId.toString();
    platformtype = ptype.toString();
    paymentMethod = pMethod.toString();
    foodPackageTotalPrice = fpTotalPrices.toString();
    foodPackageId = fpId.toString();
    subscriptiontype = subscType.toString();
    transactionIdController.text = transId;
    bankDisController.text = bdiscription;
    randomNumber = randNumber.toString();
    bankReciverNAme = bReciver;
    iban = iba;
    bankName = bName;
    accountNumberController.text = cNumber;
    cardNameController.text = cName;
    expiryFieldCtrl.text = exp;
    cvvController.text = cvv;
    LoadingOverlay.of(context).show();

    SharedPreferences pref = await SharedPreferences.getInstance();
    dietCardPAymentRepo
        .cardDietPaymnet(cardDietPaymentRequest, pref.getString("successToken"))
        .then((response) async {
      debugPrint('/////////////');
      final result =
          CardDietPaymentResponse.fromJson(jsonDecode(response.body));
      if (response.statusCode == 200) {
        print(response.body);
        shopOrderID = result.shopOrderID;
        LoadingOverlay.of(context).hide();
        generateFoodInvoice(context, shopOrderID);
        // call invoice generate api method here
        // and apply loading overlay in that method
        notifyListeners();
        // }
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

  //////////////////////////ShopCardPayment////////////////////////
  ShopPaymentRequestModel get shopPaymentRequestModel =>
      ShopPaymentRequestModel(
        walletId: data.toString() ?? '',
        userAddressId: '',
        transactionId: transactionIdController.text ?? '',
        paymentMethod: purchaseType ?? '', //
        iban: iban ?? '', //
        expiryDate: expiryFieldCtrl.text ?? '', //
        description: bankDisController.text ?? '', //
        conversationId: randomNumber ?? '',
        cardNumber: accountNumberController.text ?? '', //
        cardName: cardNameController.text ?? '',
        cardCVV: cvvController.text ?? '', //
        bankReciverNAme: bankReciverNAme ?? '',

        ///
        bankName: bankName ?? '',

        ///
      );
  String? orderIdsho;

  // Future<void> shopCardPayment(
  //   context,
  //   //  bReciver, iba, bName, cNumber, cName,
  //   // exp, cvv,
  //   bdiscription,
  //   // ptype,
  //   pMethod,
  //   // mcoin, transId
  // ) async {
  //   // bankReciverNAme = bReciver;
  //   // iban = iba;
  //   // bankName = bName;
  //   // accountNumberController.text = cNumber;
  //   // cardNameController.text = cName;
  //   // expiryFieldCtrl.text = exp;
  //   // cvvController.text = cvv;
  //   bankDisController.text = bdiscription;
  //   // platformtype = ptype.toString();
  //   purchaseType = pMethod.toString();
  //   // data = mcoin.toString();
  //   // transactionIdController.text = transId;
  //   showLoader(true);

  //   SharedPreferences pref = await SharedPreferences.getInstance();
  //   paymentDoneShopRepo
  //       .paymentDoneShop(
  //           shopPaymentRequestModel, pref.getString("successToken"))
  //       .then((response) async {
  //     print(shopPaymentRequestModel.description);
  //     debugPrint('/////////////');
  //     final result =
  //         ShopCardPaymentResponseModel.fromJson(jsonDecode(response.body));

  //     if (response.statusCode == 200) {
  //       print(response.body);
  //       orderIdsho = result.orderIdsho;
  //       print("juhujkiuyol,oi;l");
  //       showLoader(false);
  //       notifyListeners();
  //     } else {
  //       print(response.body);
  //       Utils.showPrimarySnackbar(context, result.message,
  //           type: SnackType.error);
  //     }
  //   }).onError((error, stackTrace) {
  //     Utils.showPrimarySnackbar(context, error, type: SnackType.debugError);
  //   }).catchError(
  //     (Object e) {
  //       Utils.showPrimarySnackbar(context, e, type: SnackType.debugError);
  //     },
  //     test: (Object e) {
  //       Utils.showPrimarySnackbar(context, e, type: SnackType.debugError);
  //       return false;
  //     },
  //   );
  // }

  ///////////////////////////////////////
  Future<void> shopCardPayment(context, bReciver, iba, bName, cNumber, cName,
      exp, cvv, bdiscription, pMethod, mcoin, transId) async {
    bankReciverNAme = bReciver;
    iban = iba;
    bankName = bName;
    accountNumberController.text = cNumber;
    cardNameController.text = cName;
    expiryFieldCtrl.text = exp;
    cvvController.text = cvv;
    bankDisController.text = bdiscription;
    purchaseType = pMethod.toString();
    data = mcoin.toString();
    transactionIdController.text = transId;
    showLoader(true);

    SharedPreferences pref = await SharedPreferences.getInstance();
    paymentDoneShopRepo
        .paymentDoneShop(
            shopPaymentRequestModel, pref.getString("successToken"))
        .then((response) async {
      debugPrint('/////////////');
      print(shopPaymentRequestModel.description);
      final result =
          ShopCardPaymentResponseModel.fromJson(jsonDecode(response.body));
      if (response.statusCode == 200) {
        print(response.body);
        orderIdsho = result.orderIdsho;
        showLoader(false);
        notifyListeners();
        // }
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

  FoodInData? foodInData;
  InvoiceRequestModel get invoiceRequestModel =>
      InvoiceRequestModel(orderId: shopOrderID);
  Future<void> generateFoodInvoice(context, shopOId) async {
    shopOrderID = shopOId;
    LoadingOverlay.of(context).show();
    SharedPreferences pref = await SharedPreferences.getInstance();

    FoodInvoiceRepo()
        .getFoodInvoice(invoiceRequestModel, pref.getString('successToken'))
        .then((response) async {
      final result = InvoiceResponseModel.fromJson(jsonDecode(response.body));
      if (response.statusCode == 200) {
        print(response.body);
        foodInData = result.foodInData;
        LoadingOverlay.of(context).hide();
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
}
