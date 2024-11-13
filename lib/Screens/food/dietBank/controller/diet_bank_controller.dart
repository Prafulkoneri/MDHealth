import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:md_health/Screens/health/bank_transfer/model/get_bank_trasfer_model.dart';
// import 'package:md_health/Screens/bank_transfer/model/bank_detai_model.dart';
// import 'package:md_health/Screens/bank_transfer/model/get_bank_trasfer_model.dart';
// import 'package:md_health/Screens/bank_transfer/repository/get_bank_trasfer_repo.dart';
import 'package:md_health/Screens/health/bank_transfer/repository/get_bank_trasfer_repo.dart';
import 'package:md_health/utils/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DietBankTransferController extends ChangeNotifier {
  bool isLoading = false;
  TextEditingController transactionIdController = TextEditingController();
  GetBanklistRepo getBanklistRepo = GetBanklistRepo();

  Future<void> initState(context) async {
    transactionIdController.clear();
    await getBankList(context);

    notifyListeners();
  }

  showLoader(value) {
    isLoading = value;
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
      log(response.body);
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

  // int? countryListId;

  // Future<void> onSelectCountryType(int value) async {
  //   countryListId = value;
  //   print(countryListId);
  //   notifyListeners();
  // }
  // BankDetails? bankDetails;
  // PackageDetails? packageDetails;
  // BankListRequestModel get bankListRequestModel => BankListRequestModel(
  //       packageID: packageId.toString(),
  //       bankId: countryListId.toString(),
  //     );
  // Future<void> bakDetails(context, bname, pId) async {
  //   bankName = bname.toString();
  //   packageId = pId.toString();
  //   showLoader(true);

  //   SharedPreferences pref = await SharedPreferences.getInstance();
  //   bankListDetailRepo
  //       .bankListdetail(bankListRequestModel, pref.getString("successToken"))
  //       .then((response) async {
  //     // log(response.body);
  //     debugPrint('/////////////');
  //     final result = BankListModelRsponse.fromJson(jsonDecode(response.body));
  //     if (response.statusCode == 200) {
  //       log(response.body);
  //       bankDetails = result.bankDetails;
  //       packageDetails = result.packageDetails;
  //       print("juhujkiuyol,oi;l");
  //       showLoader(false);
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
}
