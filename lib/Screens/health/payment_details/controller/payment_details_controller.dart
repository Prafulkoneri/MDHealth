import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:md_health/Screens/health/payment_details/model/disscount_model.dart';
import 'package:md_health/Screens/health/payment_details/model/guest_model.dart';
import 'package:md_health/Screens/health/payment_details/model/payment_details_model.dart';
import 'package:md_health/Screens/health/payment_details/repository/disscount_repository.dart';
import 'package:md_health/Screens/health/payment_details/repository/geust_repo.dart';
import 'package:md_health/Screens/health/payment_details/repository/payment_details_repository.dart';
import 'package:md_health/utils/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PaymentDetailsController extends ChangeNotifier {
  PaymentDetailsRepository paymentDetailRepository = PaymentDetailsRepository();
  DisscountRepo disscountRepo = DisscountRepo();
  GeuestNumberRepo geuestNumberRepo = GeuestNumberRepo();
  PurchaseDetails? purchaseDetails;
  List<OtherService>? otherServices;
  // List<Discount>? discounts;
  List<Discount>? discounts;
  String packageId = '';
  String purchaseType = '';
  String? guestNumber;

  // String radioGrpValue = "1";
  String salePrice = "";
  bool? value;
  String radioGrpValue = "1";
  String selectedPlanId = "0";
  String selectedIndex = "0";
  String selectedPrice = "0";
  String selectedPercetage = "0";
  List<bool> radioValue = [true];
  List amountList = [];
  bool isLoading = false;
  List<bool> selectAddonServicesList = [true];
  List selectedAddOnServicesId = [];
  List<String> selectedNames = [];
  List<String> selectedPrices = [];
  Future<void> initState(context, pId, type, code) async {
    await getPaymentDetailsList(context, pId, type, code);
    getDisscountamount(context);
    guestnumber(context);
    notifyListeners();
  }

  showLoader(value) {
    isLoading = value;
    notifyListeners();
  }

  DisscountRequestModel get disscountRequestModel => DisscountRequestModel(
        packageId: packageId.toString(),
        salePrice: salePrice,
      );
  void onRadioBtnChanged(value, id, price) {
    int selectedIndex =
        discounts?.indexWhere((discount) => discount.id == id) ?? -1;
    if (selectedIndex != -1) {
      for (int i = 0; i < radioValue.length; i++) {
        radioValue[i] = (i == selectedIndex);
      }
      selectedPrice = discounts?[selectedIndex].price ?? "";
      selectedPercetage = discounts?[selectedIndex].percentage ?? "";
      selectedPlanId = id.toString();
      notifyListeners();
    }
  }

  void deselectAllAddOnServices(context) {
    // Calculate the total amount to be subtracted from salePrice
    double totalSubtractedAmount = 0.0;

    // Iterate over each service and add its price to the totalSubtractedAmount
    for (int i = 0; i < selectAddonServicesList.length; i++) {
      if (selectAddonServicesList[i]) {
        final element = otherServices![i];
        totalSubtractedAmount +=
            double.parse(element.pricepercetage.toString());
        selectAddonServicesList[i] = false; // Deselect the service
      }
    }

    // Clear selectedAddOnServicesId
    selectedAddOnServicesId.clear();

    // Clear the selectedNames and selectedPrices lists
    selectedNames.clear();
    selectedPrices.clear();

    // Recalculate salePrice based on the total subtracted amount
    salePrice = (double.parse(salePrice) - totalSubtractedAmount).toString();

    // Notify listeners to update the UI
    getDisscountamount(context);
    notifyListeners();
  }

  void onAddOnOtherServicesSelected(index, id, pricepercetage, title, context) {
    selectAddonServicesList[index] = !selectAddonServicesList[index];
    if (selectAddonServicesList[index]) {
      selectedAddOnServicesId.removeWhere((item) => item == id);
      selectedAddOnServicesId.insert(0, id);
      salePrice =
          (double.parse(salePrice) + double.parse(pricepercetage.toString()))
              .toString();
    } else {
      selectedAddOnServicesId.removeWhere((item) => item == id);
      salePrice =
          (double.parse(salePrice) - double.parse(pricepercetage.toString()))
              .toString();
    }

    // Clear the selectedNames and selectedPrices lists
    selectedNames.clear();
    selectedPrices.clear();

    otherServices?.forEach((element) {
      if (selectAddonServicesList[otherServices!.indexOf(element)]) {
        // Add only the selected item to the lists
        selectedNames.add(element.title.toString());
        selectedPrices.add(element.pricepercetage.toString());
      }
    });

    print("object");
    print(pricepercetage);
    print("object");
    print(selectedAddOnServicesId);
    print("Selected Names: $selectedNames");
    print("Selected Prices: $selectedPrices");
    getDisscountamount(context);
    notifyListeners();
  }

  PaymentDetailRequestModel get paymentdetailRequestModel =>
      PaymentDetailRequestModel(
        guestNumber: disSubCode ?? "",
        packageId: packageId.toString(),
        purchaseType: purchaseType,
      );
  Future<void> getPaymentDetailsList(context, pId, type, code) async {
    packageId = pId;
    purchaseType = type;
    disSubCode = code;
    showLoader(true);
    SharedPreferences pref = await SharedPreferences.getInstance();
    paymentDetailRepository
        .getPaymentDetailsList(
            paymentdetailRequestModel, pref.get('successToken'))
        .then((response) async {
      log(response.body);
      debugPrint('/////////////');
      final result =
          PaymentDetailReponseModel.fromJson(jsonDecode(response.body));
      if (response.statusCode == 200) {
        log(response.body);
        purchaseDetails = result.purchaseDetails;
        otherServices = result.otherServices;
        int otherServiceLength = otherServices?.length ?? 0;
        print(otherServices?.length);
        salePrice = result.purchaseDetails?.salePrice ?? "";
        selectAddonServicesList =
            List<bool>.filled(otherServices?.length ?? 0, true, growable: true);
        selectedNames.clear();
        for (int i = 0; i < otherServiceLength; i++) {
          selectedNames.add(otherServices?[i].title ?? "");
        }
        showLoader(false);

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
  /////////////////////////////

  Future<void> getDisscountamount(context) async {
    // salePrice = pId;
    SharedPreferences pref = await SharedPreferences.getInstance();
    disscountRepo
        .disscountrepo(disscountRequestModel, pref.get('successToken'))
        .then((response) async {
      // log(response.body);
      debugPrint('/////////////');
      final result = DisscountResponseModel.fromJson(jsonDecode(response.body));
      if (response.statusCode == 200) {
        log(response.body);
        discounts = result.discounts;
        selectedPrice = result.discounts?[0].price ?? "";
        selectedPercetage = result.discounts?[0].percentage ?? "";
        int length = discounts?.length ?? 0;
        radioValue.clear();
        for (int i = 0; i < length; i++) {
          radioValue.add(false);
        }
        radioValue[0] = true;

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

  List<NumberData>? numbersdata;
  String? disSubCode = '';
  bool isExpanded = false;

  ExpansionTileController? principleOutExpansionTileController;

  void toggleExpansion(bool isExpanded) {
    this.isExpanded = isExpanded;
    notifyListeners();
  }

  void togglSubCodeExpansion() {
    isExpanded = true;
    principleOutExpansionTileController?.collapse();
    notifyListeners();
  }

  Future<void> selectsubCode(BuildContext context, String subcode) async {
    disSubCode = subcode;
    togglSubCodeExpansion();
    notifyListeners();
  }

  Future<void> guestnumber(context) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    geuestNumberRepo
        .geuestNumber(pref.get('successToken'))
        .then((response) async {
      final result =
          NumberAccomodationResponseModel.fromJson(jsonDecode(response.body));
      if (response.statusCode == 200) {
        numbersdata = result.numbersdata;
        principleOutExpansionTileController = ExpansionTileController();
        notifyListeners();
      } else {
        Utils.showPrimarySnackbar(context, result.message,
            type: SnackType.error);
      }
    }).onError((error, stackTrace) {
      Utils.showPrimarySnackbar(context, error, type: SnackType.debugError);
    }).catchError(
      (Object e) {
        Utils.showPrimarySnackbar(context, e, type: SnackType.debugError);
        return false;
      },
    );
  }
}
