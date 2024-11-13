import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:md_health/Screens/home_services/homes_services_search_list/search_list/model/prices_count_model.dart';
import 'package:md_health/Screens/home_services/homes_services_search_list/search_list/model/review_count_model.dart';
import 'package:md_health/Screens/home_services/homes_services_search_list/search_list/model/search_list_model.dart';
import 'package:md_health/Screens/home_services/homes_services_search_list/search_list/model/services_count_model.dart';
import 'package:md_health/Screens/home_services/homes_services_search_list/search_list/repository/prices_count_repo.dart';
import 'package:md_health/Screens/home_services/homes_services_search_list/search_list/repository/reviw_count_repo.dart';
import 'package:md_health/Screens/home_services/homes_services_search_list/search_list/repository/search_list_hs_repo.dart';
import 'package:md_health/Screens/home_services/homes_services_search_list/search_list/repository/serivices_count_repo.dart';
import 'package:md_health/utils/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeServicesSearchListController extends ChangeNotifier {
  HSSearchListRepo hSSearchListRepo = HSSearchListRepo();
  PricesCountRepo pricesCountRepo = PricesCountRepo();
  ServicesCountRepo servicesCountRepo = ServicesCountRepo();
  ReviewCountRepo reviewCountRepo = ReviewCountRepo();
  bool isLoading = true;
  String? servicesName = '';
  String? cityName = '';
  String? prices = '';
  String? servicesfilter = '';
  String? verifiedCount = '';
  String? rating = '';
  TextEditingController searchHSpackageController = TextEditingController();
  List<HomeServiceSearchDataList>? homeServicesSearchDataList;

  Future<void> initState(context, cName, sName, sfiltter, srating, sprices,
      sePackaeg, sDate) async {
    homeServicesPackageSearchList(
        context, cName, sName, sfiltter, srating, sprices, sePackaeg, sDate);
    ratingCount(context);
    pricesCount(context);
    servicesCount(context);
    notifyListeners();
  }

  // bool isCheckedone = false;
  // bool isCheckedtwo = false;
  // bool isCheckedthree = false;
  // bool isCheckedfour = false;
  // bool isCheckedfive = false;
  // bool isCheckedsix = false;

  // String oneselectedPrices = '';
  // String twoselectedPrices = '';
  // String threeselectedPrices = '';
  // String fourselectedPrices = '';
  // String fiveselectedPrices = '';
  // String sixselectedPrices = '';

  // List<String> selectedPricesList = [];
  // String allSelectedPrices = '';

  // void onetoggleCheckBox(bool value, String text) {
  //   isCheckedone = value;
  //   if (value) {
  //     oneselectedPrices = text;
  //     selectedPricesList.add(text);
  //   } else {
  //     oneselectedPrices = '';
  //     selectedPricesList.remove(text);
  //   }
  //   allSelectedPrices = selectedPricesList.join(', ');
  //   notifyListeners();
  // }

  // void twotoggleCheckBox(bool value, String text) {
  //   isCheckedtwo = value;
  //   if (value) {
  //     twoselectedPrices = text;
  //     selectedPricesList.add(text);
  //   } else {
  //     twoselectedPrices = '';
  //     selectedPricesList.remove(text);
  //   }
  //   allSelectedPrices = selectedPricesList.join(', ');
  //   notifyListeners();
  // }

  // void threetoggleCheckBox(bool value, String text) {
  //   isCheckedthree = value;
  //   if (value) {
  //     threeselectedPrices = text;
  //     selectedPricesList.add(text);
  //   } else {
  //     threeselectedPrices = '';
  //     selectedPricesList.remove(text);
  //   }
  //   allSelectedPrices = selectedPricesList.join(', ');
  //   notifyListeners();
  // }

  // void fourtoggleCheckBox(bool value, String text) {
  //   isCheckedfour = value;
  //   if (value) {
  //     fourselectedPrices = text;
  //     selectedPricesList.add(text);
  //   } else {
  //     fourselectedPrices = '';
  //     selectedPricesList.remove(text);
  //   }
  //   allSelectedPrices = selectedPricesList.join(', ');
  //   notifyListeners();
  // }

  // void fivetoggleCheckBox(bool value, String text) {
  //   isCheckedfive = value;
  //   if (value) {
  //     fiveselectedPrices = text;
  //     selectedPricesList.add(text);
  //   } else {
  //     fiveselectedPrices = '';
  //     selectedPricesList.remove(text);
  //   }
  //   allSelectedPrices = selectedPricesList.join(', ');
  //   notifyListeners();
  // }

  // void sixtoggleCheckBox(bool value, String text) {
  //   isCheckedsix = value;
  //   if (value) {
  //     sixselectedPrices = text;
  //     selectedPricesList.add(text);
  //   } else {
  //     sixselectedPrices = '';
  //     selectedPricesList.remove(text);
  //   }
  //   allSelectedPrices = selectedPricesList.join(', ');
  //   notifyListeners();
  // }

  bool isCheckedpersonal = false;
  bool isCheckedcompaniship = false;
  bool isCheckedmealandhouse = false;
  bool isCheckedprivate = false;
  bool isCheckedbaby = false;
  bool isCheckedphysical = false;
  bool isCheckedonly = false;
  bool isCheckedfull = false;
  String soneselectedPrices = '';
  String stwoselectedPrices = '';
  String sthreeselectedPrices = '';
  String sfourselectedPrices = '';
  String sfiveselectedPrices = '';
  String ssixselectedPrices = '';
  String ssevenselectedPrices = '';
  String seightselectedPrices = '';
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

  bool isCheckedone = false;
  bool isCheckedtwo = false;
  bool isCheckedthree = false;
  bool isCheckedfour = false;
  bool isCheckedfive = false;
  bool isCheckedsix = false;

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

  String oneselectedPrices = '';
  String twoselectedPrices = '';
  String threeselectedPrices = '';
  String fourselectedPrices = '';
  String fiveselectedPrices = '';
  String sixselectedPrices = '';

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
    print('*****************${allSelectedReviews}');
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

/////////////////////////////////////////
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

  // int? selectedTextIndex;
  // void setSelectedText(value, index) {
  //   selectedTextIndex = index;
  //   notifyListeners();
  // }

  showLoader(value) {
    isLoading = value;
    notifyListeners();
  }

  bool isverifiedCheckDone = false;
  String onVerifiedSelected = '';
  String allSelectedVerifed = '';

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

  String? servicesDate = '';
  HomeSSearchListRequestModel get homeSSearchListRequestModel =>
      HomeSSearchListRequestModel(
          verifiedCount: allSelectedVerifed,
          servicesDate: servicesDate,
          searchHS: searchHSpackageController.text ?? '',
          services: allSelectedServices ?? "",
          //  servicesfilter ?? '',
          rating: allSelectedReviews ?? '',
          prices: allSelectedPrices ?? '',
          cityName: cityName ?? '',
          servicesName: servicesName ?? '');
  Future<void> homeServicesPackageSearchList(context, cName, sName, sfiltter,
      srating, sprices, sePackaeg, sDate) async {
    cityName = cName.toString();
    servicesName = sName.toString();
    servicesfilter = sfiltter.toString();
    rating = srating.toString();
    prices = sprices.toString();
    servicesDate = sDate.toString();
    searchHSpackageController.text = sePackaeg ?? '';
    showLoader(true);
    SharedPreferences pref = await SharedPreferences.getInstance();
    hSSearchListRepo
        .hSearchlist(
            homeSSearchListRequestModel, pref.getString("successToken"))
        .then((response) async {
      log(response.body);
      debugPrint('/////////////');
      final result =
          HomeSSearchListResponseModel.fromJson(jsonDecode(response.body));
      if (response.statusCode == 200) {
        log(response.body);
        homeServicesSearchDataList = result.homeServicesSearchDataList;
        verifiedCount = result.verifiedCount.toString();
        print('------------------$verifiedCount');
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

  ReviewCountData? reviewCountData;
  int? excellent;
  int? veryGood;
  int? good;
  int? fair;
  int? bad;
  Future<void> ratingCount(context) async {
    showLoader(true);
    SharedPreferences pref = await SharedPreferences.getInstance();
    print(pref.getString("successToken"));
    reviewCountRepo
        .reviewCount(pref.getString("successToken"))
        .then((response) {
      log(response.body);
      final result = ReviewCountResponseModel.fromJson(
        jsonDecode(response.body),
      );
      if (response.statusCode == 200) {
        log(response.body);
        print(response.body);
        reviewCountData = result.reviewCountData;
        // excellent=reviewCountData.
        // if (result.status == 200) {
        notifyListeners();
        showLoader(false);
        Utils.showPrimarySnackbar(context, "", type: SnackType.success);
        // } else {
        //   Utils.showPrimarySnackbar(context, "", type: SnackType.error);
        // }
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

  PricesCountData? pricesCountData;

  Future<void> pricesCount(context) async {
    showLoader(true);
    SharedPreferences pref = await SharedPreferences.getInstance();
    print(pref.getString("successToken"));
    pricesCountRepo
        .pricesCount(pref.getString("successToken"))
        .then((response) {
      log(response.body);
      final result = PricesCountResponseModel.fromJson(
        jsonDecode(response.body),
      );
      if (response.statusCode == 200) {
        log(response.body);
        print(response.body);
        pricesCountData = result.pricesCountData;
        // if (result.status == 200) {
        notifyListeners();
        showLoader(false);
        Utils.showPrimarySnackbar(context, "", type: SnackType.success);
        // } else {
        //   Utils.showPrimarySnackbar(context, "", type: SnackType.error);
        // }
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

  ServicesCountData? servicesCountData;

  Future<void> servicesCount(context) async {
    showLoader(true);
    SharedPreferences pref = await SharedPreferences.getInstance();
    print(pref.getString("successToken"));
    servicesCountRepo
        .servicesCount(pref.getString("successToken"))
        .then((response) {
      log(response.body);
      final result = ServicesCountResponseModel.fromJson(
        jsonDecode(response.body),
      );
      if (response.statusCode == 200) {
        log(response.body);
        print(response.body);
        servicesCountData = result.servicesCountData;
        // if (result.status == 200) {
        notifyListeners();
        showLoader(false);
        Utils.showPrimarySnackbar(context, "", type: SnackType.success);
        // } else {
        //   Utils.showPrimarySnackbar(context, "", type: SnackType.error);
        // }
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

////////////////////////////////////
  int offset = 0;
  bool showPaginationLoader = false;

  Future<void> onScrollMaxExtent(context) async {
    showPaginationLoader = true;
    print("hello");
    offset = offset + 1;
    SharedPreferences pref = await SharedPreferences.getInstance();
    print("kkkkkkkkkk");
    hSSearchListRepo
        .hSearchlist(
            homeSSearchListRequestModel, pref.getString("successToken"))
        .then((response) {
      log(response.body);
      final result =
          HomeSSearchListResponseModel.fromJson(jsonDecode(response.body));
      if (response.statusCode == 200) {
        print("111111123e24errfsdfs");
        // allShops.clear();
        homeServicesSearchDataList = result.homeServicesSearchDataList;
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
}
