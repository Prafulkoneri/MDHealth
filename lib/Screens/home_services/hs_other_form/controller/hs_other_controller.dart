import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:convert';
import 'dart:developer';
import 'package:md_health/Screens/home_services/hs_other_form/model/hs_other_model.dart';
import 'package:md_health/Screens/home_services/hs_other_form/repo/hs_other_repo.dart';
import 'package:md_health/Screens/home_services/purchase_details/view/purchase_details_view.dart';
import 'package:md_health/test_widget.dart';
import 'package:md_health/utils/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:md_health/Screens/auth/model/city_list_model.dart';
import 'package:md_health/Screens/auth/model/country_list_model.dart';
import 'package:md_health/Screens/auth/repository/city_list_repository.dart';
import 'package:md_health/Screens/auth/repository/country_list_repository.dart';

class HsOtherFormController extends ChangeNotifier {
  TextEditingController hspatientFirstNameController = TextEditingController();
  TextEditingController hspatientLastNameController = TextEditingController();
  TextEditingController hsPatientRelationController = TextEditingController();
  TextEditingController hspatientNumberController = TextEditingController();
  TextEditingController hspatientEmailController = TextEditingController();
  TextEditingController hspatientbirthDateController = TextEditingController();
  int selectedCountryId = 0;
  int selectedCityId = 0;
  String? foodpackageId;
  String subscriptionType = '';
  int? patientId;
  String? salePrice;
  String? packageId;
  String? selectedDate;
  String? newSelectedDate;
  bool isLoading = true;
  HsOtherFormRepo hsOtherFormRepo = HsOtherFormRepo();
  Future<void> initState(context, packageId, selectedDate) async {
    // rpatientFullNameController.clear();
    // rpatientEmailController.clear();
    // rpatientNumberController.clear();
    // rpatientAddressController.clear();
    // rpatientDisesController.clear();
    // rpatientNotesController.clear();
    hspatientFirstNameController.clear();
    hspatientLastNameController.clear();
    hspatientbirthDateController.clear();
    hspatientEmailController.clear();
    hspatientNumberController.clear();
    hsPatientRelationController.clear();
    hsPatientRelationController.clear();
    this.packageId = packageId;
    selectedCountryId = 0;
    cityList = null;
    countryList = null;
    getCountry(context);
    print('-----------');
    this.newSelectedDate = selectedDate;
    print(newSelectedDate);
    print('-----------');
    notifyListeners();
  }

  void onDateSelected(date) {
    hspatientbirthDateController.text = date;
    notifyListeners();
  }
  ////////////////////////////////////////////////////////////////////////dateRangeController

///////////////////////////////////////////
  HsOtherFormRequestModel get hsOtherFormRequestModel =>
      HsOtherFormRequestModel(
        patientBirthdate: dateRangeController.text,
        patientContactNumber: hspatientNumberController.text,
        patientEmail: hspatientEmailController.text,
        patientRelation: hsPatientRelationController.text,
        patientLastName: hspatientLastNameController.text,
        patientFirstName: hspatientFirstNameController.text,
        patientCityId: (selectedCityId.toString()),
        patientCountryId: (selectedCountryId.toString()),
        packageId: packageId,
        // patientId: patientId.toString(),
        packagebuyfor: "others",
        platFormType: "android",
      );
  Future<void> hsOtherForm(context) async {
    // bool email = RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
    //     .hasMatch(hspatientEmailController.text.trim());
    // print(email);
    // // if (!email) {
    // //   Utils.showPrimarySnackbar(context, "Enter Correct Email ID",
    // //       type: SnackType.error);
    // //   return;
    // // }
    // if (hspatientNumberController.text == "" ||
    //     hspatientNumberController.text.length < 10) {
    //   Utils.showPrimarySnackbar(context, "Please Enter Correct Mobile Number",
    //       type: SnackType.error);
    //   notifyListeners();
    //   return;
    // }
    if (selectedCountryId.toString().isEmpty || selectedCountryId == 0) {
      Utils.showPrimarySnackbar(context, "Please Select Country",
          type: SnackType.error);
      return;
    }
    if (selectedCityId.toString().isEmpty || selectedCityId == 0) {
      Utils.showPrimarySnackbar(context, "Please Select City",
          type: SnackType.error);
      return;
    }
    SharedPreferences pref = await SharedPreferences.getInstance();
    hsOtherFormRepo
        .hsother(hsOtherFormRequestModel, pref.getString("successToken"))
        .then((response) async {
      // log(response.body);
      debugPrint('/////////////');
      final result =
          HsOtherFormResponseModel.fromJson(jsonDecode(response.body));
      if (response.statusCode == 200) {
        log(response.body);
        patientId = result.patientId;
        print("object");
        print(patientId.toString());
        print("object");
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
        print(patientId.toString);
        // return;
        Navigator.push(
          context,
          SlidePageRoute(
            page: HSPurchaseDetailsView(
                servicesDate: newSelectedDate,
                patientID: patientId.toString(),
                packageId: packageId.toString(),
                purchaseType: "others"),
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

  Future<void> onSelectCountryType(int value) async {
    selectedCountryId = value;
    cityList = null;
    print(selectedCountryId);
    notifyListeners();
  }

  ////////////////////////////////////////////////
  TextEditingController dateRangeController = TextEditingController();

  DateTime? startDate;
  DateTime? endDate;

  void onDateRangeSelected(DateTimeRange dateRange) {
    startDate = dateRange.start;
    endDate = dateRange.end;
    dateRangeController.text =
        "${DateFormat('dd-MM-yyyy').format(startDate!)} to ${DateFormat('dd-MM-yyyy').format(endDate!)}";
    notifyListeners();
  }
}
