import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:md_health/Screens/food/diet_plan/model/calculation_model.dart';
import 'package:md_health/Screens/food/diet_plan/model/type_model.dart';
import 'package:md_health/Screens/food/diet_plan/repositiory/calculation_repo.dart';
import 'package:md_health/Screens/food/diet_plan/repositiory/type_repo.dart';
import 'package:md_health/Screens/order_details/model/order_details_food_model.dart';
import 'package:md_health/utils/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RenewFoodPopUpController extends ChangeNotifier {
  bool isLoading = true;

  String newSalePrice = ''; // final calculated price is getting stored in this

  String? salesPrice; // store price from previous screen in this
  // String? renewSalesPrice;
  String? mealType;
  String? foodpackageId;
  String? status;

  String subscriptionType = '';

  String? selectedText = '';
  String selectedTextfood = '';
  String selectedTexttype = '';
  String selectedTextcalories = '';
  int selectedTextIndexfood = -1; // Assuming -1 represents no selection
  int selectedTextIndextype =
      -1; // Changed from 0 to -1 to indicate no selection

  CalculationRepo calculationRepo = CalculationRepo();

  OrderFoodDetails? orderFoodDetails;

  List<String>? mealTypeswho;

  Future<void> initState(context, newPrice, mealType, foodPkgId, status) async {
    selectedText = 'Food';
    print('***************************************');
    print(mealType);
    print(status);
    print(foodPkgId);
    print(newPrice);
    print('***************************************');
    selectedTexttype = 'Subscription';
    salesPrice = newPrice;
    mealType = mealType;
    foodpackageId = foodPkgId;
    status = status;

    getSubScriptionType(context);

    notifyListeners();
  }

  void setSelectedTexttypes(context, value, index) {
    selectedTexttype = value;
    selectedTextIndextype = index;
    print('99999999999999999999999999');
    print(salesPrice);
    print(foodpackageId);
    print(mealType);

    calculationprice(
      context: context,
      saPrices: salesPrice ?? '',
      cheStatus: 'true',
      fpId: foodpackageId ?? '',
      mType: mealType ?? "",
      stype: orderFoodDetails?.subscriptionType ?? '',
    );
    notifyListeners();
  }

  showLoader(value) {
    isLoading = value;
    notifyListeners();
  }

  /////////////////////////////////////////////////////////////
  CalculationData? calculationdata;

  CalculationRequestModel get calculationRequestModel =>
      CalculationRequestModel(
        foodpackageId: foodpackageId.toString(),
        subscriptionType: selectedTexttype.toString(),
        salePrice: salesPrice.toString(),
        mealType: mealType,
        status: status,
      );
  Future<void> calculationprice({
    required BuildContext context,
    required String saPrices,
    required String mType,
    required String fpId,
    required String stype,
    required String cheStatus,
  }) async {
    salesPrice = saPrices;
    mealType = mType;
    foodpackageId = fpId;
    subscriptionType = stype;
    status = cheStatus;

    // Debug logs to verify parameter values
    log('Sales Price: $salesPrice');
    log('Meal Type: $mealType');
    log('Food Package ID here is : $foodpackageId');
    log('Subscription Type: $subscriptionType');
    log('Status: $status');

    showLoader(true);

    SharedPreferences pref = await SharedPreferences.getInstance();
    calculationRepo
        .calcluationprice(
            calculationRequestModel, pref.getString("successToken"))
        .then((response) async {
      log('Request URL: ${response.request?.url}');
      log('Response Body: ${response.body}');
      final result =
          CalculationMealResponseModel.fromJson(jsonDecode(response.body));
      if (response.statusCode == 200) {
        log('Calculation Result: ${result.calculationdata}');
        newSalePrice = result.calculationdata?.salePrices.toString() ?? '';
        log('New Sale Price: $newSalePrice');
        showLoader(false);
        notifyListeners();
      } else {
        Utils.showPrimarySnackbar(context, result.message,
            type: SnackType.error);
      }
    }).onError((error, stackTrace) {
      Utils.showPrimarySnackbar(context, error, type: SnackType.debugError);
    }).catchError((Object e) {
      Utils.showPrimarySnackbar(context, e, type: SnackType.debugError);
    });
  }

  // void setSelectedText(value, index) {
  //   selectedText = value;
  //   selectedTextIndex = index;
  //   notifyListeners();
  // }

  TextEditingController BirthDateController = TextEditingController();

  void onToDateSelected(date) {
    BirthDateController.text = date;
    notifyListeners();
  }

  TypeSubscriptionRepo typeSubscriptionRepo = TypeSubscriptionRepo();
  List<SubscriptionData>? subscriptiondata;
  Future<void> getSubScriptionType(context) async {
    showLoader(true);
    SharedPreferences pref = await SharedPreferences.getInstance();
    print(pref.getString("successToken"));
    typeSubscriptionRepo
        .typesub(pref.getString("successToken"))
        .then((response) {
      log('Response Body: ${response.body}');
      final result = SubscriptionType.fromJson(
        jsonDecode(response.body),
      );
      if (response.statusCode == 200) {
        if (result.status == 200) {
          subscriptiondata = result.subscriptiondata;
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
    }).catchError((Object e) {
      Utils.showPrimarySnackbar(context, e, type: SnackType.debugError);
    });
  }
}
