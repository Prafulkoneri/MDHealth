// import 'dart:convert';
// import 'dart:developer';

// import 'package:flutter/material.dart';
// import 'package:md_health/Screens/address/model/address_list_model.dart';
// import 'package:md_health/Screens/address/repository/address_list_repo.dart';
// import 'package:md_health/utils/utils.dart';
// import 'package:shared_preferences/shared_preferences.dart';

import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:md_health/Screens/address/model/add_address_model.dart';
import 'package:md_health/Screens/address/model/address_list_model.dart';
import 'package:md_health/Screens/address/model/delete_address_model.dart';
import 'package:md_health/Screens/address/model/edit_list_address_model.dart';
import 'package:md_health/Screens/address/repository/add_address_list_repo.dart';
import 'package:md_health/Screens/address/repository/address_list_repo.dart';
import 'package:md_health/Screens/address/repository/delete_address_repo.dart';
import 'package:md_health/Screens/address/repository/edit_list_repo.dart';
import 'package:md_health/Screens/address/view/address_view.dart';
import 'package:md_health/Screens/auth/model/city_list_model.dart';
import 'package:md_health/Screens/auth/model/country_list_model.dart';
import 'package:md_health/Screens/auth/repository/city_list_repository.dart';
import 'package:md_health/Screens/auth/repository/country_list_repository.dart';
import 'package:md_health/test_widget.dart';
import 'package:md_health/utils/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddressController extends ChangeNotifier {
  TextEditingController addressNameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController postalcodeController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  Future<void> initState(context) async {
    getAddresslist(context);
    getCountry(context);
    addressNameController.clear();
    addressController.clear();
    postalcodeController.clear();
    phoneNumberController.clear();
    notifyListeners();
  }

  // int? selectedIndex;

  // void toggleCheckBox(int index, id) {
  //   if (selectedIndex == index) {
  //     print('ID');
  //     print(selectedCityId);
  //     print('12877');

  //     print(id);
  //     print('ID');
  //     selectedIndex = null;
  //   } else {
  //     selectedIndex = index;
  //   }
  //   notifyListeners();
  // }
  int? selectedIndex;
  int? selectedAddressId; // Declare a variable to store the selected city ID

  void toggleCheckBox(int index, id) {
    if (selectedIndex == index) {
      selectedIndex = null;
      selectedAddressId = null; // Clear the selected ID when unchecking
    } else {
      print("object111111");
      selectedIndex = index;
      selectedAddressId = id; // Store the selected ID
    }
    notifyListeners();
  }
  // void onAddOnOtherServicesSelected(index, id, pricepercetage, title, context) {
  //   selectAddonServicesList[index] = !selectAddonServicesList[index];
  //   if (selectAddonServicesList[index]) {
  //     selectedAddOnServicesId.removeWhere((item) => item == id);
  //     selectedAddOnServicesId.insert(0, id);
  //     salePrice =
  //         (double.parse(salePrice) + double.parse(pricepercetage.toString()))
  //             .toString();
  //   } else {
  //     selectedAddOnServicesId.removeWhere((item) => item == id);
  //     salePrice =
  //         (double.parse(salePrice) - double.parse(pricepercetage.toString()))
  //             .toString();
  //   }

  //   // Clear the selectedNames and selectedPrices lists
  //   selectedNames.clear();
  //   selectedPrices.clear();

  //   otherServices?.forEach((element) {
  //     if (selectAddonServicesList[otherServices!.indexOf(element)]) {
  //       // Add only the selected item to the lists
  //       selectedNames.add(element.title.toString());
  //       selectedPrices.add(element.pricepercetage.toString());
  //     }
  //   });

  //   print("object");
  //   print(pricepercetage);
  //   print("object");
  //   print(selectedAddOnServicesId);
  //   print("Selected Names: $selectedNames");
  //   print("Selected Prices: $selectedPrices");
  //   getDisscountamount(context);
  //   notifyListeners();
  // }
  List<AddressListData>? addressListData;
  AddressListRepo addressListRepo = AddressListRepo();
  Future<void> getAddresslist(context) async {
    // showLoader(true);
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
        // showLoader(false);
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
    SharedPreferences pref = await SharedPreferences.getInstance();

    cityListRepo
        .getCityList(requestModel, pref.getString("successToken"))
        .then((response) {
      final result = CityListResponseModel.fromJson(jsonDecode(response.body));
      if (response.statusCode == 200) {
        if (result.status == 200) {
          cityList = result.cityList;
          debugPrint(cityList?[1].toString());
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

  String countryName = "";
  String dId = "";

  DeleteAddressRepo deleteAddressRepo = DeleteAddressRepo();
  AddAddressRepo addAddressRepo = AddAddressRepo();
  EditAddAddressRepo editAddAddressRepo = EditAddAddressRepo();

  List<CountryList>? countryList;
  CountryListRepository countryListRepo = CountryListRepository();
  Future<void> getCountry(context) async {
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
      Utils.showPrimarySnackbar(context, "Please Fill Postal Code",
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
            page: AddressView(),
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

  /////////////////////////////////////////////////////
  // String? id;
  // EditAddressListRequestModel get editAddressListRequestModel =>
  //     EditAddressListRequestModel(id: id);
  // EditAddressListData? editaddresslistdata;

  // Future<void> editListAddress(
  //   context,
  // ) async {
  //   SharedPreferences pref = await SharedPreferences.getInstance();
  //   editAddAddressRepo
  //       .editaddAddress(
  //           editAddressListRequestModel, pref.getString("successToken"))
  //       .then((response) async {
  //     // log(response.body);
  //     debugPrint('/////////////');
  //     final result =
  //         EditaddressListResponeModel.fromJson(jsonDecode(response.body));
  //     if (response.statusCode == 200) {
  //       log(response.body);
  //       editaddresslistdata = result.editaddresslistdata;
  //       addressNameController.text = editaddresslistdata?.addressName ?? '';
  //       addressController.text = editaddresslistdata?.address ?? '';
  //       phoneNumberController.text = editaddresslistdata?.phoneNo ?? '';
  //       postalcodeController.text = editaddresslistdata?.postalCode ?? '';
  //       addressNameController.text = editaddresslistdata?.addressName ?? '';

  //       countryName = editaddresslistdata?.countryName ?? '';
  //       // return;
  //       Navigator.push(
  //         context,
  //         SlidePageRoute(
  //           page: AddressView(),
  //           direction: SlideDirection.right,
  //           delay: Duration(milliseconds: 5000),
  //         ),
  //         // MaterialPageRoute(
  //         //     builder: (context) => ProfileView()
  //       );
  //       notifyListeners();
  //     } else {
  //       log(response.body);
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
  DeleteAddressRequestModel get deleteAddressRequestModel =>
      DeleteAddressRequestModel(id: dId.toString());
  Future<void> addresDelete(context, id) async {
    dId = id;
    SharedPreferences pref = await SharedPreferences.getInstance();
    deleteAddressRepo
        .deleteaddress(
            deleteAddressRequestModel, pref.getString("successToken"))
        .then((response) {
      print(response.body);
      final result =
          DeleteAddressResponseModel.fromJson(jsonDecode(response.body));
      print(response.statusCode);
      if (response.statusCode == 200) {
        getAddresslist(context);
        // print(response.body);
        // countryList = result.countryList;
        // countryName = countryList
        //         ?.where((element) =>
        //             element.id?.toString().contains(countryListId.toString()) ??
        //             false)
        //         .toList()[0]
        //         .countryName ??
        //     "";
        // print(countryList);
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
//   AddressListRepo addressListRepo = AddressListRepo();
//   // showLoader(value) {
//   //   isLoading = value;
//   //   notifyListeners();
//   // }

//   Future<void> initState(context) async {
//     // await getAddresslist(context);
//     notifyListeners();
//   }

//   bool isLoading = true;
//   List<AddressListData>? addressListData;

  // Future<void> getAddresslist(context) async {
  //   // showLoader(true);
  //   SharedPreferences pref = await SharedPreferences.getInstance();
  //   print(pref.getString("successToken"));
  //   addressListRepo
  //       .addresslist(pref.getString("successToken"))
  //       .then((response) {
  //     log(response.body);
  //     final result = AccomodationResponseModel.fromJson(
  //       jsonDecode(response.body),
  //     );
  //     if (response.statusCode == 200) {
  //       // if (result.status == 200) {
  //       addressListData = result.addressListData;
  //       // showLoader(false);
  //       Utils.showPrimarySnackbar(context, '', type: SnackType.success);
  //       notifyListeners();
  //     } else {
  //       Utils.showPrimarySnackbar(context, '', type: SnackType.error);
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
// }
