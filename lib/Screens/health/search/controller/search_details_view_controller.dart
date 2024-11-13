import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:md_health/Screens/health/search/model/add_to_favrt_model.dart';
import 'package:md_health/Screens/health/search/model/search_model.dart';
import 'package:md_health/Screens/health/search/model/search_details_model.dart';
import 'package:md_health/Screens/health/search/repository/add_to_fav_repo.dart';
import 'package:md_health/Screens/health/search/repository/search_details_view_repository.dart';
import 'package:md_health/utils/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SearchDetailsViewController extends ChangeNotifier {
  List<String>? galleryList;
  List<String>? packageGallery;
  List<PackageList>? packageList;
  PackagesDetails? packageDetails;
  String packageId = "";
  bool isLoading = true;

  // String? id;

  SearchDetailsViewRepository packageViewRepository =
      SearchDetailsViewRepository();

  AddToFavRepo addToFavRepo = AddToFavRepo();

  Future<void> initState(
      context, packId, pcity, pTretment, packagePurchase) async {
    await showDetails(context, packId);

    notifyListeners();
  }

  showLoader(value) {
    isLoading = value;
    notifyListeners();
  }

  SearchDetailsListRequestModel get requestModel =>
      SearchDetailsListRequestModel(id: packageId);
  Future<void> showDetails(context, packId) async {
    showLoader(true);
    packageId = packId;

    if (packId != null) {
      SharedPreferences pref = await SharedPreferences.getInstance();

      packageViewRepository
          .getPackages(requestModel, pref.get('successToken'))
          .then((response) {
        log(response.body);
        final result =
            SearchDetailsListResponseModel.fromJson(jsonDecode(response.body));
        print(response.statusCode);
        if (response.statusCode == 200) {
          print(response.body);
          if (result.status == 200) {
            packageDetails = result.packagesDetails;
            galleryList = result.providerGallery;
            packageGallery = result.packageGallery;

            showLoader(false);
            notifyListeners();
          } else {
            Utils.showPrimarySnackbar(context, result.message,
                type: SnackType.error);
          }
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

/////////////////////////////////////////////////////////////////
  Future<void> addToFav(context, packId) async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    addToFavRepo
        .addAFav(
            AddToFavModelRequest(
              packageId: packId,
            ),
            pref.getString("successToken"))
        .then((response) async {
      log("response.body${response.body}");
      final result = AddToFavModelRes.fromJson(jsonDecode(response.body));
      if (response.statusCode == 200) {
        await showDetails(context, packId);
        // Utils.showPrimarySnackbar(context, result.message,
        //     type: SnackType.success);
        notifyListeners();
      } else {
        Utils.showPrimarySnackbar(context, result.message,
            type: SnackType.success);
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
