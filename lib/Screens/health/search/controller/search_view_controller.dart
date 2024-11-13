import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:md_health/Screens/health/search/model/search_model.dart';
import 'package:md_health/Screens/health/search/model/search_details_model.dart';
import 'package:md_health/Screens/health/search/repository/search_details_view_repository.dart';
import 'package:md_health/Screens/health/search/repository/search_view_repository.dart';
import 'package:md_health/utils/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SearchViewController extends ChangeNotifier {
  SearchViewRepository packageRepository = SearchViewRepository();
  List<String>? galleryList;
  List<PackageList>? packageList;
  bool isLoading = true;
  PackagesDetails? packageDetails;
  String? packageId;
  String? cityName;
  TextEditingController searchController = TextEditingController();
  String? tretmentName;
  SearchViewRepository packageViewRepository = SearchViewRepository();
  bool showPaginationLoader = false;

  int? verifiedProvidersCount;
  int? excellentCount;
  int? veryGoodCount;
  int? goodCount;
  int? fairCount;
  int? badCount;
  int? allTreatmentCount;
  int? fullPackageCount;
  int? accommodationCount;
  int? transportationCount;
  int? tourCount;
  int? visaCount;
  int? translateCount;
  int? ambulanceCount;
  int? ticketCount;
  int? zerototen;
  int? tentotwenty;
  int? twentytofifty;
  int? fiftytoseventy;
  int? seventytohundres;
  int? hundrestoabove;

  Future<void> initState(context, cName, tName, seaTr
      // refresh,
      // cityName,
      // platformType,
      ) async {
    // if (refresh) {

    // }
    searchController.clear();
    getPackages(context, cName, tName, seaTr);
    notifyListeners();
  }

  updateAllSelectedPrices() {
    allSelectedPrices = '';
    if (oneselectedPrices.isNotEmpty)
      allSelectedPrices += oneselectedPrices + ', ';
    if (twoselectedPrices.isNotEmpty)
      allSelectedPrices += twoselectedPrices + ', ';
    if (threeselectedPrices.isNotEmpty)
      allSelectedPrices += threeselectedPrices + ', ';
    if (fourselectedPrices.isNotEmpty)
      allSelectedPrices += fourselectedPrices + ', ';
    if (fiveselectedPrices.isNotEmpty)
      allSelectedPrices += fiveselectedPrices + ', ';
    if (sixselectedPrices.isNotEmpty)
      allSelectedPrices += sixselectedPrices + ', ';

    if (allSelectedPrices.isNotEmpty) {
      allSelectedPrices = allSelectedPrices.substring(
          0, allSelectedPrices.length - 2); // Remove trailing comma and space
    }
  }

  updateVerfiewsdSelected() {
    allSelectedVerifed = '';
    if (onVerifiedSelected.isNotEmpty)
      allSelectedVerifed += onVerifiedSelected + ', ';

    if (allSelectedVerifed.isNotEmpty) {
      allSelectedVerifed = allSelectedVerifed.substring(
          0, allSelectedVerifed.length - 2); // Remove trailing comma and space
    }
  }

  void verifiedToggle(bool value, String text) {
    isverifiedCheckDone = value;
    if (value) {
      onVerifiedSelected = text;
    } else {
      onVerifiedSelected = '';
    }
    updateVerfiewsdSelected();
    notifyListeners();
  }

///////////////////////////////////////////////////
  void onetoggleCheckBox(bool value, String text) {
    isCheckedone = value;
    if (value) {
      oneselectedPrices = text;
    } else {
      oneselectedPrices = '';
    }
    updateAllSelectedPrices();
    notifyListeners();
  }

  void twotoggleCheckBox(bool value, String text) {
    isCheckedtwo = value;
    if (value) {
      twoselectedPrices = text;
    } else {
      twoselectedPrices = '';
    }
    updateAllSelectedPrices();
    notifyListeners();
  }

  void threetoggleCheckBox(bool value, String text) {
    isCheckedthree = value;
    if (value) {
      threeselectedPrices = text;
    } else {
      threeselectedPrices = '';
    }
    updateAllSelectedPrices();
    notifyListeners();
  }

  void fourtoggleCheckBox(bool value, String text) {
    isCheckedfour = value;
    if (value) {
      fourselectedPrices = text;
    } else {
      fourselectedPrices = '';
    }
    updateAllSelectedPrices();
    notifyListeners();
  }

  void fivetoggleCheckBox(bool value, String text) {
    isCheckedfive = value;
    if (value) {
      fiveselectedPrices = text;
    } else {
      fiveselectedPrices = '';
    }
    updateAllSelectedPrices();
    notifyListeners();
  }

  String onVerifiedSelected = '';
  String oneselectedPrices = '';
  String twoselectedPrices = '';
  String threeselectedPrices = '';
  String fourselectedPrices = '';
  String fiveselectedPrices = '';
  String sixselectedPrices = '';
  void sixtoggleCheckBox(bool value, String text) {
    isCheckedsix = value;
    if (value) {
      sixselectedPrices = text;
    } else {
      sixselectedPrices = '';
    }
    updateAllSelectedPrices();
    notifyListeners();
  }

  bool isverifiedCheckDone = false;
  bool isCheckedone = false;
  bool isCheckedtwo = false;
  bool isCheckedthree = false;
  bool isCheckedfour = false;
  bool isCheckedfive = false;
  bool isCheckedsix = false;
  ///////////
  bool isCheckedpersonal = false;
  bool isCheckedcompaniship = false;
  bool isCheckedmealandhouse = false;
  bool isCheckedprivate = false;
  bool isCheckedbaby = false;
  bool isCheckedphysical = false;
  bool isCheckedonly = false;
  bool isCheckedfull = false;
  bool isCheckedAmbulances = false;
  String soneselectedPrices = '';
  String stwoselectedPrices = '';
  String sthreeselectedPrices = '';
  String sfourselectedPrices = '';
  String sfiveselectedPrices = '';
  String ssixselectedPrices = '';
  String ssevenselectedPrices = '';
  String seightselectedPrices = '';
  String nineselectedPrices = '';
  updateAllSelectedServices() {
    allSelectedServices = '';
    if (soneselectedPrices.isNotEmpty)
      allSelectedServices += soneselectedPrices + ', ';
    if (stwoselectedPrices.isNotEmpty)
      allSelectedServices += stwoselectedPrices + ', ';
    if (sthreeselectedPrices.isNotEmpty)
      allSelectedServices += sthreeselectedPrices + ', ';
    if (sfourselectedPrices.isNotEmpty)
      allSelectedServices += sfourselectedPrices + ', ';
    if (sfiveselectedPrices.isNotEmpty)
      allSelectedServices += sfiveselectedPrices + ', ';
    if (ssixselectedPrices.isNotEmpty)
      allSelectedServices += ssixselectedPrices + ', ';
    if (ssevenselectedPrices.isNotEmpty)
      allSelectedServices += ssevenselectedPrices + ', ';
    if (seightselectedPrices.isNotEmpty)
      allSelectedServices += seightselectedPrices + ', ';
    if (allSelectedServices.isNotEmpty) {
      allSelectedServices = allSelectedServices.substring(
          0, allSelectedServices.length - 2); // Remove trailing comma and space
    }
  }

  void sOnetoggleCheckBox(bool value, String text) {
    isCheckedpersonal = value;
    if (value) {
      soneselectedPrices = text;
    } else {
      soneselectedPrices = '';
    }
    updateAllSelectedServices();
    notifyListeners();
  }

  void sTwotoggleCheckBox(bool value, String text) {
    isCheckedcompaniship = value;
    if (value) {
      stwoselectedPrices = text;
    } else {
      stwoselectedPrices = '';
    }
    updateAllSelectedServices();
    notifyListeners();
  }

  void sThreetoggleCheckBox(bool value, String text) {
    isCheckedmealandhouse = value;
    if (value) {
      sthreeselectedPrices = text;
    } else {
      sthreeselectedPrices = '';
    }
    updateAllSelectedServices();
    notifyListeners();
  }

  void sfourtoggleCheckBox(bool value, String text) {
    isCheckedprivate = value;
    if (value) {
      sfourselectedPrices = text;
    } else {
      sfourselectedPrices = '';
    }
    updateAllSelectedServices();
    notifyListeners();
  }

  void sfivetoggleCheckBox(bool value, String text) {
    isCheckedbaby = value;
    if (value) {
      sfiveselectedPrices = text;
    } else {
      sfiveselectedPrices = '';
    }
    updateAllSelectedServices();
    notifyListeners();
  }

  void sSixtoggleCheckBox(bool value, String text) {
    isCheckedphysical = value;
    if (value) {
      ssixselectedPrices = text;
    } else {
      ssixselectedPrices = '';
    }
    updateAllSelectedServices();
    notifyListeners();
  }

  void sSeventoggleCheckBox(bool value, String text) {
    isCheckedonly = value;
    if (value) {
      ssevenselectedPrices = text;
    } else {
      ssevenselectedPrices = '';
    }
    updateAllSelectedServices();
    notifyListeners();
  }

  void sEighttoggleCheckBox(bool value, String text) {
    isCheckedfull = value;
    if (value) {
      seightselectedPrices = text;
    } else {
      seightselectedPrices = '';
    }
    updateAllSelectedServices();
    notifyListeners();
  }

  void sNinetoggelCheckBox(bool value, String text) {
    isCheckedAmbulances = value;
    if (value) {
      nineselectedPrices = text;
    } else {
      nineselectedPrices = '';
    }
    updateAllSelectedServices();
    notifyListeners();
  }

////////////////////////////
  bool isCheckedExcellent = false;
  bool isCheckedVGood = false;
  bool isCheckedGood = false;
  bool isCheckedfair = false;
  bool isCheckedBad = false;
  String exellentselectedPrices = '';
  String verygoodselectedPrices = '';
  String goodselectedPrices = '';
  String fairselectedPrices = '';
  String badselectedPrices = '';

  String allSelectedVerifed = '';
  String allSelectedPrices = '';
  String allSelectedReviews = '';
  String allSelectedServices = '';
  updateAllSelectedReviews() {
    allSelectedReviews = '';
    if (exellentselectedPrices.isNotEmpty)
      allSelectedReviews += exellentselectedPrices + ', ';
    if (verygoodselectedPrices.isNotEmpty)
      allSelectedReviews += verygoodselectedPrices + ', ';
    if (goodselectedPrices.isNotEmpty)
      allSelectedReviews += goodselectedPrices + ', ';
    if (fairselectedPrices.isNotEmpty)
      allSelectedReviews += fairselectedPrices + ', ';
    if (badselectedPrices.isNotEmpty)
      allSelectedReviews += badselectedPrices + ', ';

    if (allSelectedReviews.isNotEmpty) {
      allSelectedReviews = allSelectedReviews.substring(
          0, allSelectedReviews.length - 2); // Remove trailing comma and space
    }
  }

  void etoggleCheckBox(bool value, String text) {
    isCheckedExcellent = value;
    if (value) {
      exellentselectedPrices = text;
    } else {
      exellentselectedPrices = '';
    }
    updateAllSelectedReviews();
    notifyListeners();
  }

  void vtoggleCheckBox(bool value, String text) {
    isCheckedVGood = value;
    if (value) {
      verygoodselectedPrices = text;
    } else {
      verygoodselectedPrices = '';
    }
    updateAllSelectedReviews();
    notifyListeners();
  }

  void gtoggleCheckBox(bool value, String text) {
    isCheckedGood = value;
    if (value) {
      goodselectedPrices = text;
    } else {
      goodselectedPrices = '';
    }
    updateAllSelectedReviews();
    notifyListeners();
  }

  void ftoggleCheckBox(bool value, String text) {
    isCheckedfair = value;
    if (value) {
      fairselectedPrices = text;
    } else {
      fairselectedPrices = '';
    }
    updateAllSelectedReviews();
    notifyListeners();
  }

  void btoggleCheckBox(bool value, String text) {
    isCheckedBad = value;
    if (value) {
      badselectedPrices = text;
    } else {
      badselectedPrices = '';
    }
    updateAllSelectedReviews();
    notifyListeners();
  }

////////////////////////////////////////////////////////////////
  Future<void> refreshState(BuildContext context, cName, tName, seaTr) async {
    getPackages(context, cName, tName, seaTr);

    notifyListeners();
  }

  int? selectedTextIndex;
  void setSelectedText(value, index) {
    selectedTextIndex = index;
    notifyListeners();
  }

  int? selectedTextIndex1;
  void setSelectedText1(value, index) {
    selectedTextIndex1 = index;
    notifyListeners();
  }
// bool isLoading = true;

  showLoader(value) {
    isLoading = value;
    notifyListeners();
  }

  void setPackageId(int value) {
    packageId = value.toString();
    notifyListeners();
  }

  setPackageList(List<PackageList>? list) {
    packageList = list;
    log(packageList![0].packageName ?? ''); // Method to update packageList
    notifyListeners();
  }

  SearchListRequestModel get packageRequestModel => SearchListRequestModel(
      verified: allSelectedVerifed ?? "",
      services: allSelectedServices ?? '',
      rating: allSelectedReviews ?? '',
      prices: allSelectedPrices ?? '',
      offset: offset.toString() ?? '',
      searchtreatment: searchController.text ?? '',
      tretmentName: tretmentName ?? '',
      cityName: cityName ?? '',
      platformType: "android");

  Future<void> getPackages(context, cName, tName, seaTr) async {
    showLoader(true);
    cityName = cName.toString();
    tretmentName = tName.toString();
    searchController.text = seaTr ?? '';
    // packageList = [];
    SharedPreferences pref = await SharedPreferences.getInstance();
    packageRepository
        .getPackages(packageRequestModel, pref.getString("successToken"))
        .then((response) async {
      log(response.body);
      final result =
          SearchListResponseModel.fromJson(jsonDecode(response.body));
      if (response.statusCode == 200) {
        log(response.body);
        print(response.body);

        packageList = result.data?.packageList;

        verifiedProvidersCount = result.verifiedProvidersCount;
        excellentCount = result.excellentCount;
        veryGoodCount = result.veryGoodCount;
        goodCount = result.goodCount;
        fairCount = result.fairCount;
        badCount = result.badCount;
        allTreatmentCount = result.allTreatmentCount;
        fullPackageCount = result.fullPackageCount;
        accommodationCount = result.accommodationCount;
        transportationCount = result.transportationCount;
        tourCount = result.tourCount;
        visaCount = result.visaCount;
        translateCount = result.translateCount;
        ambulanceCount = result.ambulanceCount;
        ticketCount = result.ticketCount;

        zerototen = result.zerototen;
        tentotwenty = result.tentotwenty;
        twentytofifty = result.twentytofifty;
        fiftytoseventy = result.fiftytoseventy;
        seventytohundres = result.seventytohundres;
        hundrestoabove = result.hundrestoabove;

        print(packageList?[0].packageName);
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

///////////////////////////////
  int offset = 0;

  Future<void> onScrollMaxExtent(context) async {
    showPaginationLoader = true;
    print("hello");
    offset = offset + 1;
    SharedPreferences pref = await SharedPreferences.getInstance();
    print("kkkkkkkkkk");
    packageRepository
        .getPackages(packageRequestModel, pref.getString("successToken"))
        .then((response) {
      log(response.body);
      final result =
          SearchListResponseModel.fromJson(jsonDecode(response.body));
      if (response.statusCode == 200) {
        print("111111123e24errfsdfs");
        // allShops.clear();
        packageList = result.data?.packageList;
        isLoading = false;
        showPaginationLoader = false;
        notifyListeners();
      } else {
        Utils.showPrimarySnackbar(context, result.message,
            type: SnackType.error);
      }
    }).onError((error, stackTrace) {
      //   //Utils.showPrimarySnackbar(context, error, type: SnackType.debugError);
    }).catchError(
      (Object e) {
        // Utils.showPrimarySnackbar(context, e, type: SnackType.debugError);
      },
      test: (Object e) {
        // Utils.showPrimarySnackbar(context, e, type: SnackType.debugError);
        return false;
      },
    );
    // await getAllShops(context, categoryId);
    isLoading = false;

    notifyListeners();
  }
///////////////////////////////////
  // Future<void> activeSearchList(context) async {
  //   SharedPreferences pref = await SharedPreferences.getInstance();
  //   print(pref.getString("successToken"));

  //   if (searchController.text.isNotEmpty) {
  //     packageList ==
  //         packageRepository
  //             .getPackages(packageRequestModel, pref.getString("successToken"))
  //             .then((response) {
  //           log("response.body${response.body}");
  //           final result =
  //               SearchListResponseModel.fromJson(jsonDecode(response.body));
  //           if (response.statusCode == 200) {
  //             packageList = result.data?.packageList;
  //             notifyListeners();
  //           } else {
  //             Utils.showPrimarySnackbar(context, result.message,
  //                 type: SnackType.error);
  //           }
  //         }).onError((error, stackTrace) {
  //           Utils.showPrimarySnackbar(context, error,
  //               type: SnackType.debugError);
  //         }).catchError(
  //           (Object e) {
  //             Utils.showPrimarySnackbar(context, e, type: SnackType.debugError);
  //           },
  //           test: (Object e) {
  //             Utils.showPrimarySnackbar(context, e, type: SnackType.debugError);
  //             return false;
  //           },
  //         );
  //   } else {
  //     // If the search text is empty, display all packages
  //     await getPackages(context, '', '', '');
  //     notifyListeners();
  //   }
  // }
  // PackageViewRequestModel requestModel =
  // PackageViewRequestModel(
  //     id: packageId.toString());

  // PackageViewRequestModel get requestModel =>
  //     PackageViewRequestModel( id: packageId.toString());
  //
  // Future<void> showDetails(context, packId)async{
  //   final id = packId.toString();
  //   SharedPreferences pref = await SharedPreferences.getInstance();
  //   packageViewRepository.getPackages(requestModel, pref.get('successToken')).then((response) {
  //     print(response.body);
  //     final result =
  //     PackageViewResponseModel.fromJson(jsonDecode(response.body));
  //     print(response.statusCode);
  //     if (response.statusCode == 200) {
  //       print(response.body);
  //       if (result.status == 200) {
  //
  //         packageDetails =  result.packagesDetails;
  //         galleryList = result.providerGallery;
  //         Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeSearchViewDetails()));
  //         // pref.setString(
  //         //     "successToken", result.registrationdata?.accessToken ?? "");
  //         // print("4444444444444444444444444444444444444444");
  //         // print(pref.getString("successToken"));
  //         // print("4444444444444444444444444444444444444444");
  //         notifyListeners();
  //       } else {
  //         Utils.showPrimarySnackbar(context, result.message,
  //             type: SnackType.error);
  //       }
  //     } else {
  //       Utils.showPrimarySnackbar(context, result.message,
  //           type: SnackType.error);
  //     }
  //   }).onError((error, stackTrace) {
  //     Utils.showPrimarySnackbar(context, error, type: SnackType.debugError);
  //   }).catchError(
  //         (Object e) {
  //       Utils.showPrimarySnackbar(context, e, type: SnackType.debugError);
  //     },
  //     test: (Object e) {
  //       Utils.showPrimarySnackbar(context, e, type: SnackType.debugError);
  //       return false;
  //     },
  //   );
  // }
}
