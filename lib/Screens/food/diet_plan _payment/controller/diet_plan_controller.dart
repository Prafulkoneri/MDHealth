import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:md_health/Screens/address/model/add_address_model.dart';
import 'package:md_health/Screens/address/model/address_list_model.dart';
import 'package:md_health/Screens/address/repository/add_address_list_repo.dart';
import 'package:md_health/Screens/address/repository/address_list_repo.dart';
import 'package:md_health/Screens/auth/model/city_list_model.dart';
import 'package:md_health/Screens/auth/model/country_list_model.dart';
import 'package:md_health/Screens/auth/repository/city_list_repository.dart';
import 'package:md_health/Screens/auth/repository/country_list_repository.dart';
import 'package:md_health/Screens/food/diet_plan%20_payment/model/diet_plan_model.dart';
import 'package:md_health/Screens/food/diet_plan%20_payment/repository/diet_plan_repo.dart';
import 'package:md_health/Screens/food/diet_plan%20_payment/view/food_address_list.dart';
import 'package:md_health/test_widget.dart';
// import 'package:md_health/diet_plan%20_payment/model/diet_plan_model.dart';
// import 'package:md_health/diet_plan%20_payment/repository/diet_plan_repo.dart';
import 'package:md_health/utils/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DietPlanPaymertController extends ChangeNotifier {
  DietPAymentDetailsRepo dietPAymentDetailsRepo = DietPAymentDetailsRepo();
  bool isLoading = true;
  TextEditingController addressNameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController postalcodeController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  Future<void> initState(
    context,
    foodId,
    dateS,
    subscType,
    parchType,
    paDaiteId,
    sPrices,
  ) async {
    await dietPaymentDetail(
      context,
      foodId,
      dateS,
      subscType,
      parchType,
      paDaiteId,
      sPrices,
    );
    getAddresslist(context);
    getCountry(context);
    notifyListeners();
  }

  void showLoader(value) {
    isLoading = value;
    notifyListeners();
  }

  int? selectAddressIndex;
  String? selectAddressID; // Declare a variable to store the selected city ID

  void selectAddresBox(int index, id) {
    if (selectAddressIndex == index) {
      selectAddressIndex = null;
      selectAddressID = null; // Clear the selected ID when unchecking
    } else {
      print("object111111");
      selectAddressIndex = index;
      selectAddressID = id.toString(); // Store the selected ID
    }
    notifyListeners();
  }

  AddAddressRepo addAddressRepo = AddAddressRepo();
  String countryName = "";

  List<CountryList>? countryList;
  CountryListRepository countryListRepo = CountryListRepository();
  Future<void> getCountry(context) async {
    showLoader(true);
    SharedPreferences pref = await SharedPreferences.getInstance();
    countryListRepo.getCountries(context).then((response) {
      print(response.body);
      final result = CountryListModel.fromJson(jsonDecode(response.body));
      print(response.statusCode);
      if (response.statusCode == 200) {
        print(response.body);
        countryList = result.countryList;
        countryName = countryList
                ?.where((element) =>
                    element.id?.toString().contains(countryListId.toString()) ??
                    false)
                .toList()[0]
                .countryName ??
            "";
        showLoader(false);
        print(countryList);
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

  int countryListId = 0;

  Future<void> onSelectCountryType(int value) async {
    countryListId = value;
    cityList = null;
    print(countryListId);
    notifyListeners();
  }

  int? selectedCityId;
  int? cityListId;
  Future<void> onSelectCityType(int value) async {
    selectedCityId = value;
    print("controller" + selectedCityId.toString());
    notifyListeners();
  }

  CityListRequestModel get requestModel =>
      CityListRequestModel(countryId: countryListId.toString());
  CityListRepository cityListRepo = CityListRepository();
  List<CityListData>? cityList;

  Future<void> getCitiesList(BuildContext context) async {
    showLoader(true);
    SharedPreferences pref = await SharedPreferences.getInstance();

    cityListRepo
        .getCityList(requestModel, pref.getString("successToken"))
        .then((response) {
      final result = CityListResponseModel.fromJson(jsonDecode(response.body));
      if (response.statusCode == 200) {
        if (result.status == 200) {
          cityList = result.cityList;
          debugPrint(cityList?[1].toString());
          showLoader(false);
          notifyListeners();
        } else {
          // Utils.showPrimarySnackbar(context, result.message,
          //     type: SnackType.error);
        }
      } else {
        // Utils.showPrimarySnackbar(context, result.message,
        //     type: SnackType.error);
      }
    }).onError((error, stackTrace) {
      // Utils.showPrimarySnackbar(context, error, type: SnackType.debugError);
    }).catchError(
      (Object e) {
        // Utils.showPrimarySnackbar(context, e, type: SnackType.debugError);
      },
      // test: (Object e) {
      //   Utils.showPrimarySnackbar(context, e, type: SnackType.debugError);
      //   return false;
      // },
    );
  }

  AddressAddRequestModel get addressAddRequestModel => AddressAddRequestModel(
        addressName: addressNameController.text,
        postalCode: postalcodeController.text,
        mobileNo: phoneNumberController.text,
        cityId: selectedCityId.toString(),
        countryId: (countryListId.toString()),
        address: addressController.text,
      );
  Future<void> addAddress(
    context,
  ) async {
    if (addressNameController.text == "") {
      Utils.showPrimarySnackbar(context, "Please Fill Address Name ",
          type: SnackType.error);
      notifyListeners();
      return;
    }
    if (postalcodeController.text == "") {
      Utils.showPrimarySnackbar(context, "Please Fill Postal Codr",
          type: SnackType.error);
      notifyListeners();
      return;
    }

    if (addressController.text == "") {
      Utils.showPrimarySnackbar(context, "Please Fill Address",
          type: SnackType.error);
      notifyListeners();
      return;
    }

    if (phoneNumberController.text == "" ||
        phoneNumberController.text.length < 10) {
      Utils.showPrimarySnackbar(
          context, "Please Fill  10 Digits Contact Number",
          type: SnackType.error);
      notifyListeners();
      return;
    }

    if (countryListId == null) {
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
    addAddressRepo
        .addAddress(addressAddRequestModel, pref.getString("successToken"))
        .then((response) async {
      // log(response.body);
      debugPrint('/////////////');
      final result =
          AddressAddResponseModel.fromJson(jsonDecode(response.body));
      if (response.statusCode == 200) {
        log(response.body);

        // return;
        Navigator.push(
          context,
          SlidePageRoute(
            page: FoodSelectAddressView(),
            direction: SlideDirection.right,
            delay: Duration(milliseconds: 5000),
          ),
          // MaterialPageRoute(
          //     builder: (context) => ProfileView()
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

  DietPaymentDetailsData? dietPaymentdetailsdata;
  CustomerList? customerList;
  String? foodpackageId;
  String? subscriptionType;
  // String? selectedAddressID;
  String? type;
  String? patientId;
  String? salePrice;
  String? dateSubscription;
  DietViewRequestModelPayment get dietViewRequestModelPayment =>
      DietViewRequestModelPayment(
        selectedAddress: selectAddressID ?? '',
        foodpackageId: foodpackageId,
        subscriptionDate: dateSubscription,
        subscriptionType: subscriptionType,
        type: type,
        patientId: patientId,
        salePrices: salePrice,
      );
  Future<void> dietPaymentDetail(
    context,
    foodId,
    dateS,
    subscType,
    parchType,
    paDaiteId,
    sPrices,
  ) async {
    foodpackageId = foodId.toString();
    dateSubscription = dateS.toString();
    subscriptionType = subscType.toString();
    type = parchType.toString();
    patientId = paDaiteId.toString();
    salePrice = sPrices.toString();
    showLoader(true);

    SharedPreferences pref = await SharedPreferences.getInstance();
    dietPAymentDetailsRepo
        .dietPaymnet(
            dietViewRequestModelPayment, pref.getString("successToken"))
        .then((response) async {
      debugPrint('/////////////');
      final result =
          DietViewReponseModelPayment.fromJson(jsonDecode(response.body));
      if (response.statusCode == 200) {
        log(response.body);
        dietPaymentdetailsdata = result.dietPaymentdetailsdata;
        customerList = result.customerList;
        print("juhujkiuyol,oi;l");
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

  // int? selectedIndex;

  // void toggleCheckBox(int index) {
  //   if (selectedIndex == index) {
  //     selectedIndex = null;
  //   } else {
  //     selectedIndex = index;
  //   }
  //   notifyListeners();
  // }

  List<AddressListData>? addressListData;
  AddressListRepo addressListRepo = AddressListRepo();
  Future<void> getAddresslist(context) async {
    showLoader(true);
    SharedPreferences pref = await SharedPreferences.getInstance();
    print(pref.getString("successToken"));
    addressListRepo
        .addresslist(pref.getString("successToken"))
        .then((response) {
      log(response.body);
      final result = AccomodationResponseModel.fromJson(
        jsonDecode(response.body),
      );
      if (response.statusCode == 200) {
        // if (result.status == 200) {
        addressListData = result.addressListData;
        showLoader(false);
        Utils.showPrimarySnackbar(context, '', type: SnackType.success);
        notifyListeners();
      } else {
        Utils.showPrimarySnackbar(context, '', type: SnackType.error);
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
