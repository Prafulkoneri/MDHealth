import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:developer';
import 'package:md_health/Screens/food/diet_other/model/diet_other_model.dart';
import 'package:md_health/Screens/food/diet_other/repository/other_repo_diet.dart';
import 'package:md_health/Screens/food/diet_plan%20_payment/view/payment_view_diet.dart';
import 'package:md_health/test_widget.dart';
import 'package:md_health/utils/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:md_health/Screens/auth/model/city_list_model.dart';
import 'package:md_health/Screens/auth/model/country_list_model.dart';
import 'package:md_health/Screens/auth/repository/city_list_repository.dart';
import 'package:md_health/Screens/auth/repository/country_list_repository.dart';

class DietOtherFormController extends ChangeNotifier {
  TextEditingController rpatientFullNameController = TextEditingController();
  TextEditingController postalcodeController = TextEditingController();
  TextEditingController rpatientRelationtoYuController =
      TextEditingController();
  TextEditingController BirthDateController = TextEditingController();
  TextEditingController rpatientNumberController = TextEditingController();
  TextEditingController rpatientEmailController = TextEditingController();
  TextEditingController rpatientAddressController = TextEditingController();
  TextEditingController rpatientDisesController = TextEditingController();
  TextEditingController rpatientNotesController = TextEditingController();
  TextEditingController birthDateController = TextEditingController();

  int selectedCountryId = 0;
  int selectedCityId = 0;
  String? foodpackageId;
  String subscriptionType = '';
  DietId? dietId;
  String? salePrice;
  String? patientId;

  bool isLoading = true;

  DietOtherRepo dietOtherRepo = DietOtherRepo();
  Future<void> initState(context, fckageId, bDate, subType, nSaleP
      // salePrices,
      ) async {
    // rpatientFullNameController.clear();
    // rpatientEmailController.clear();
    // rpatientNumberController.clear();
    // rpatientAddressController.clear();
    // rpatientDisesController.clear();
    // rpatientNotesController.clear();
    print("init");
    print(fckageId);
    print(subType);
    print(bDate);
    print(nSaleP);
    print("init");
    foodpackageId;
    birthDateController.text;
    subscriptionType;
    salePrice;
    selectedCountryId = 0;
    cityList = null;
    countryList = null;
    getCountry(context);
    notifyListeners();
  }

  ////////////////////////////////////////////////////////////////////////

///////////////////////////////////////////
  DietOtherRequestModel get dietOtherRequestModel => DietOtherRequestModel(
        relationToYou: rpatientRelationtoYuController.text ?? "brother",
        postalCode: postalcodeController.text,
        salePrices: salePrice,
        // patientId: patientId,
        type: "gift",
        subscriptionType: subscriptionType,
        rpatientEmail: rpatientEmailController.text,
        rpatientContactNumber: rpatientNumberController.text,
        rnotes: rpatientNotesController.text,
        rdiseases: rpatientDisesController.text,
        raddress: rpatientAddressController.text,
        foodpackageId: foodpackageId,
        birthDate: BirthDateController.text,
        rpatientFullName: rpatientFullNameController.text,
        platFormType: "android",
        rpatientCityId: (selectedCityId.toString()),
        rpatientCountryId: (selectedCountryId.toString()),
      );
  Future<void> dietOtherForm(context, fckageId, bDate, subType, nSaleP) async {
    foodpackageId = fckageId;
    birthDateController.text = bDate;
    // subscriptionType = subType;
    subscriptionType = subType;
    salePrice = nSaleP;

    if (rpatientAddressController.text == "") {
      Utils.showPrimarySnackbar(context, "Please Fill Address",
          type: SnackType.error);
      notifyListeners();
      return;
    }
    bool email = RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
        .hasMatch(rpatientEmailController.text.trim());
    print(email);
    if (!email) {
      Utils.showPrimarySnackbar(context, "Enter Correct Email ID",
          type: SnackType.error);
      return;
    }
    if (rpatientNumberController.text == "" ||
        rpatientNumberController.text.length < 10) {
      Utils.showPrimarySnackbar(context, "Please Enter Correct Mobile Number",
          type: SnackType.error);
      notifyListeners();
      return;
    }
    if (selectedCountryId == null) {
      Utils.showPrimarySnackbar(context, "Please Select Country",
          type: SnackType.error);
      return;
    }
    if (selectedCityId == null) {
      Utils.showPrimarySnackbar(context, "Please Select City",
          type: SnackType.error);
      return;
    }
    SharedPreferences pref = await SharedPreferences.getInstance();
    dietOtherRepo
        .otherDiet(dietOtherRequestModel, pref.getString("successToken"))
        .then((response) async {
      // log(response.body);
      debugPrint('/////////////');
      final result = DietOtherResponseModel.fromJson(jsonDecode(response.body));
      if (response.statusCode == 200) {
        log(response.body);
        dietId = result.dietId;
        patientId = dietId?.patientId.toString();

        log("object");
        print(dietId?.patientId.toString());
        log("object");
        // Navigator.push(
        //             context,
        //             SlidePageRoute(
        //               page: PaymentDetailsViewDiet(
        //                 type: "gift",
        //                 foodPackageId: widget.foodpackageId,
        //                 subscriptionType: widget.subscriptionType,
        //                 subscriptionStartDate: widget.birthDateController,
        //               ),
        //               direction: SlideDirection.right,
        //               delay: Duration(milliseconds: 5000),
        //             ),
        //           );
        // return;
        Navigator.push(
          context,
          SlidePageRoute(
            page: PaymentDetailsViewDiet(
              foodPackageId: fckageId,
              subscriptionStartDate: bDate,
              subscriptionType: subType,
              type: "gift",
              patientId: dietId?.patientId.toString(),
              salePrice: salePrice,
            ),
            direction: SlideDirection.right,
            delay: Duration(milliseconds: 5000),
          ),
        );
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

  String countryName = "";
  String cityName = "";

  List<CountryList>? countryList;

  Future<void> getCountry(context) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    countryListRepo.getCountries(context).then((response) {
      print(response.body);
      final result = CountryListModel.fromJson(jsonDecode(response.body));
      print(response.statusCode);
      if (response.statusCode == 200) {
        log(response.body);
        countryList = result.countryList;
        print(countryList);
        // LoadingOverlay.of(context).hide();
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
      },
      test: (Object e) {
        Utils.showPrimarySnackbar(context, e, type: SnackType.debugError);
        return false;
      },
    );
  }

  Future<void> onSelectCountryType(int value) async {
    selectedCountryId = value;
    cityList = null;
    print(selectedCountryId);
    notifyListeners();
  }

  int? cityListId;
  Future<void> onSelectCityType(int value) async {
    selectedCityId = value;
    print("controller" + selectedCityId.toString());
    notifyListeners();
  }

  CountryListRepository countryListRepo = CountryListRepository();
  CityListRepository cityListRepo = CityListRepository();

  List<CityListData>? cityList;
  CityListRequestModel get cityListRequestModel =>
      CityListRequestModel(countryId: selectedCountryId.toString());

  Future<void> getCities(context) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    cityListRepo
        .getCityList(cityListRequestModel, pref.getString("successToken"))
        .then((response) {
      print(response.body);
      final result = CityListResponseModel.fromJson(jsonDecode(response.body));
      print(response.statusCode);
      if (response.statusCode == 200) {
        print(response.body);
        cityList = result.cityList;
        print(cityList);
        // LoadingOverlay.of(context).hide();
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
      },
      test: (Object e) {
        Utils.showPrimarySnackbar(context, e, type: SnackType.debugError);
        return false;
      },
    );
  }
}
