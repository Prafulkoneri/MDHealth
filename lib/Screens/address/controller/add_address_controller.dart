import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:md_health/Screens/address/controller/address_controller.dart';
import 'package:md_health/Screens/address/model/edit_list_address_model.dart';
import 'package:md_health/Screens/address/model/edit_submit_model.dart';
import 'package:md_health/Screens/address/repository/edit_list_repo.dart';
import 'package:md_health/Screens/address/repository/edit_submit_repo.dart';
import 'package:md_health/Screens/address/view/address_view.dart';
import 'package:md_health/Screens/auth/model/city_list_model.dart';
import 'package:md_health/Screens/auth/model/country_list_model.dart';
import 'package:md_health/Screens/auth/repository/city_list_repository.dart';
import 'package:md_health/Screens/auth/repository/country_list_repository.dart';
import 'package:md_health/test_widget.dart';
import 'package:md_health/utils/utils.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditAddAddressController extends ChangeNotifier {
  TextEditingController addressNameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController postalcodeController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  CountryListRepository countryListRepo = CountryListRepository();
  CityListRepository cityListRepo = CityListRepository();
  EditSubmitRepo editSubmitRepo = EditSubmitRepo();
  int selectedCountryId = 0;
  int selectedCityId = 0;
  String countryName = "";
  String cityName = "";
  String? id;
  int? cityListId;
  List<CountryList>? countryList;
  EditAddressListData? editaddresslistdata;
  List<CityListData>? cityList;
  EditAddAddressRepo editAddAddressRepo = EditAddAddressRepo();
  Future<void> initState(context, eId) async {
    editListAddress(context, eId);
    getCountry(context);
    notifyListeners();
  }

  Future<void> onSelectCountryType(int value) async {
    selectedCountryId = value;
    cityList = null;
    print(selectedCountryId);
    notifyListeners();
  }

  Future<void> onSelectCityType(int value) async {
    selectedCityId = value;
    print("controller" + selectedCityId.toString());
    notifyListeners();
  }

  EditAddressListRequestModel get editAddressListRequestModel =>
      EditAddressListRequestModel(id: id);

  Future<void> editListAddress(context, eId) async {
    id = eId;
    SharedPreferences pref = await SharedPreferences.getInstance();
    editAddAddressRepo
        .editaddAddress(
            editAddressListRequestModel, pref.getString("successToken"))
        .then((response) async {
      // log(response.body);
      debugPrint('/////////////');
      final result =
          EditaddressListResponeModel.fromJson(jsonDecode(response.body));
      if (response.statusCode == 200) {
        log(response.body);
        editaddresslistdata = result.editaddresslistdata;
        addressNameController.text = editaddresslistdata?.addressName ?? '';
        addressController.text = editaddresslistdata?.address ?? '';
        phoneNumberController.text = editaddresslistdata?.phoneNo ?? '';
        postalcodeController.text = editaddresslistdata?.postalCode ?? '';
        addressNameController.text = editaddresslistdata?.addressName ?? '';

        countryName = editaddresslistdata?.countryName ?? '';
        cityName = editaddresslistdata?.cityName ?? '';
        // return;
        // Navigator.push(
        //   context,
        //   SlidePageRoute(
        //     page: AddressView(),
        //     direction: SlideDirection.right,
        //     delay: Duration(milliseconds: 5000),
        //   ),
        //   // MaterialPageRoute(
        //   //     builder: (context) => ProfileView()
        // );
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

  EditSubmitRequestModel get editSubmitRequestModel => EditSubmitRequestModel(
      id: id,
      postalCode: postalcodeController.text,
      mobileNo: phoneNumberController.text,
      cityId: selectedCityId.toString(),
      addressName: addressNameController.text,
      address: addressController.text,
      countryId: selectedCountryId.toString());

  Future<void> submitEdit(context) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    editSubmitRepo
        .editsubmit(editSubmitRequestModel, pref.getString("successToken"))
        .then((response) {
      print(response.body);
      final result =
          EditSubmitResponseModel.fromJson(jsonDecode(response.body));
      print(response.statusCode);
      if (response.statusCode == 200) {
        print(response.body);
        // cityList = result.cityList;
        print(cityList);
        final readMain = Provider.of<AddressController>(context, listen: false);
        readMain.getAddresslist(context);
        Navigator.pushReplacement(
          context,
          SlidePageRoute(
            page: AddressView(
                // packageId: widget.packageId,

                // packageId: watch.packageId,
                ),
            direction: SlideDirection.left, // Specify the slide direction here
            delay: Duration(milliseconds: 5000),
          ),
        );
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
