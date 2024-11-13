import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:md_health/Screens/health/packages/model/accomodation_notes_model.dart';
import 'package:md_health/Screens/health/packages/model/active_package_model.dart';
import 'package:md_health/Screens/health/packages/model/active_search_model.dart';
import 'package:md_health/Screens/health/packages/model/canceled_search_model.dart';
import 'package:md_health/Screens/health/packages/model/cancelled_model.dart';
import 'package:md_health/Screens/health/packages/model/cancelled_package_model.dart';
import 'package:md_health/Screens/health/packages/model/completed_get_review_model.dart';
import 'package:md_health/Screens/health/packages/model/completed_package_model.dart';
import 'package:md_health/Screens/health/packages/model/completed_search_model.dart';
import 'package:md_health/Screens/health/packages/model/hote_model.dart';
import 'package:md_health/Screens/health/packages/model/package_detail_view_model.dart';
import 'package:md_health/Screens/health/packages/model/tour_model.dart';
import 'package:md_health/Screens/health/packages/model/tour_notes_model.dart';
import 'package:md_health/Screens/health/packages/model/transport_notes_model.dart';
import 'package:md_health/Screens/health/packages/model/transportation_model.dart';
import 'package:md_health/Screens/health/packages/repository/accomodation_notes_repo.dart';
import 'package:md_health/Screens/health/packages/repository/active_package_repo.dart';
import 'package:md_health/Screens/health/packages/repository/cancel_request_repo.dart';
import 'package:md_health/Screens/health/packages/repository/cancelled_package_repo.dart';
import 'package:md_health/Screens/health/packages/repository/cancelled_search_repo.dart';
import 'package:md_health/Screens/health/packages/repository/complete_package_repo.dart';
import 'package:md_health/Screens/health/packages/repository/completed_get_review_repo.dart';
import 'package:md_health/Screens/health/packages/repository/hotel_repo.dart';
import 'package:md_health/Screens/health/packages/repository/package_detail_view_repo.dart';
import 'package:md_health/Screens/health/packages/repository/search_active_repo.dart';
import 'package:md_health/Screens/health/packages/repository/search_completed_repo.dart';
// import 'package:md_health/Screens/health/repository/package_detail_view_repo.dart';
import 'package:md_health/Screens/health/packages/repository/tour_details_repo.dart';
import 'package:md_health/Screens/health/packages/repository/tour_notes_repo.dart';
import 'package:md_health/Screens/health/packages/repository/transport_notes_repo.dart';
import 'package:md_health/Screens/health/packages/repository/transpotation_repo.dart';
import 'package:md_health/Screens/health/packages/view/view_detail_pop_up_view.dart';
import 'package:md_health/Screens/health/packages/view/view_details_tour_.dart';
import 'package:md_health/Screens/health/packages/view/view_details_transport_view.dart';
// import 'package:md_health/Screens/reservation/view/cancel_packages_view.dart';
import 'package:md_health/utils/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PackageViewController extends ChangeNotifier {
  ActivePackageRepo activepackageRepo = ActivePackageRepo();
  SearchActiveListRepo searchActiveListRepo = SearchActiveListRepo();
  CompletedSearchRepo completedSearchRepo = CompletedSearchRepo();
  CanclledSearchRepo canclledSearchRepo = CanclledSearchRepo();
  // ActivePackageRepo activepackageRepo = ActivePackageRepo();CompletedSearchRepo CanclledSearchRepo
  CompletedPackageRepo completedPackageRepo = CompletedPackageRepo();
  DeleteActivePackaegRequestRepo deleteActivePackaegRequestRepo =
      DeleteActivePackaegRequestRepo();
  CancelledPackageRepo cancelledPackageRepo = CancelledPackageRepo();
  TextEditingController reasonController = TextEditingController();
  List<CustomerPurchasePackageActiveList>? customerPurchasePackageActiveList;
  // List<CustomerPurchasePackageActiveListSearch>?
  //     customerPurchasePackageActiveListsearch;
  List<CustomerPurchasePackageCompletedList>?
      customerPurchasePackageCompletedList;
  List<CustomerPurchasePackageCanclledList>?
      customerPurchasePackageCancelledList;
  bool isLoading = true;
  bool isVerifyChecked = false; //terms
  double? ratingValues;
  double? ratingValue;
  int selectedIndex = 0;
  bool isTabChanged = false;
  String cancelId = '';
  String purchesId = '';
  String hotelId = '';
  String? treatmentName;
  String? packageName;
  String? companyName;
  String? cityName;

  Future<void> initState(
    context,
    index,
    puId,
    cId,
  ) async {
    selectedIndex = 1;
    reasonController.clear;
    isChecked = false;
    await activePackageList(context);
    await completedPackageList(context);
    await cancelledPackageList(context);
    await getCompletedPkgReviews(context, puId);
    notifyListeners();
  }

  void clearCancellationPopup() {
    reasonController.clear();
    isChecked = false;
    notifyListeners();
  }

  void onTabClicked(index) {
    selectedIndex = index;
    notifyListeners();
  }

  void onRatingSelect(value) {
    ratingValue = value;
    notifyListeners();
  }

  void onRatingSelects(value) {
    ratingValues = value;
    notifyListeners();
  }

  void onVerifyChecked(value) {
    isVerifyChecked = value;
    notifyListeners();
  }

  showLoader(value) {
    isLoading = value;
    notifyListeners();
  }

  bool isChecked = false;

  void onChecked() {
    isChecked = !isChecked;
    notifyListeners();
  }

  Future<void> activePackageList(context) async {
    showLoader(true);
    SharedPreferences pref = await SharedPreferences.getInstance();
    print(pref.getString("successToken"));
    activepackageRepo
        .activePackage(pref.getString("successToken"))
        .then((response) {
      log(response.body);
      final result = ActivePurchesPackageList.fromJson(
        jsonDecode(response.body),
      );
      if (response.statusCode == 200) {
        reasonController.clear(); // Clear text field
        isChecked = false; //
        customerPurchasePackageActiveList =
            result.customerPurchasePackageActiveList;

        showLoader(false);
        // Utils.showPrimarySnackbar(context, "", type: SnackType.success);
        notifyListeners();
      } else {
        // Utils.showPrimarySnackbar(context, "", type: SnackType.error);
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

  ////////////////////////////
  TextEditingController searchController = TextEditingController();

  ActiveSearchPackgeRequestModel get activeSearchPackgeRequestModel =>
      ActiveSearchPackgeRequestModel(
        packgeName: searchController.text,
      );
  Future<void> activeSearchList(context) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    print(pref.getString("successToken"));

    if (searchController.text.isNotEmpty) {
      customerPurchasePackageActiveList ==
          searchActiveListRepo
              .searchActive(activeSearchPackgeRequestModel,
                  pref.getString("successToken"))
              .then((response) {
            log("response.body${response.body}");
            final result =
                ActivePurchesPackageList.fromJson(jsonDecode(response.body));
            if (response.statusCode == 200) {
              customerPurchasePackageActiveList =
                  result.customerPurchasePackageActiveList;
              notifyListeners();
            } else {
              Utils.showPrimarySnackbar(context, result.message,
                  type: SnackType.error);
            }
          }).onError((error, stackTrace) {
            Utils.showPrimarySnackbar(context, error,
                type: SnackType.debugError);
          }).catchError(
            (Object e) {
              Utils.showPrimarySnackbar(context, e, type: SnackType.debugError);
            },
            test: (Object e) {
              Utils.showPrimarySnackbar(context, e, type: SnackType.debugError);
              return false;
            },
          );
    } else {
      // If the search text is empty, display all packages
      await activePackageList(context);
      notifyListeners();
    }
  }

  ///////////////

  Future<void> completedPackageList(context) async {
    showLoader(true);
    SharedPreferences pref = await SharedPreferences.getInstance();
    print(pref.getString("successToken"));
    completedPackageRepo
        .completedPackage(pref.getString("successToken"))
        .then((response) {
      log(response.body);
      final result = CompletedPurchesPackageList.fromJson(
        jsonDecode(response.body),
      );
      if (response.statusCode == 200) {
        if (result.status == 200) {
          customerPurchasePackageCompletedList =
              result.customerPurchasePackageCompletedList;
          showLoader(false);
          // Utils.showPrimarySnackbar(context, "", type: SnackType.success);/
          notifyListeners();
        } else {
          // Utils.showPrimarySnackbar(context, "", type: SnackType.error);
        }
      } else {
        // Utils.showPrimarySnackbar(context, "", type: SnackType.error);
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

  TextEditingController searchCompletedController = TextEditingController();

  CompletedSearchPackgeRequestModel get completedSearchPackgeRequestModel =>
      CompletedSearchPackgeRequestModel(
        packgeName: searchCompletedController.text,
      );
  Future<void> comeSearchList(context) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    print(pref.getString("successToken"));

    if (searchCompletedController.text.isNotEmpty) {
      customerPurchasePackageCompletedList ==
          completedSearchRepo
              .completedSeacrh1(completedSearchPackgeRequestModel,
                  pref.getString("successToken"))
              .then((response) {
            log("response.body${response.body}");
            final result =
                CompletedPurchesPackageList.fromJson(jsonDecode(response.body));
            if (response.statusCode == 200) {
              customerPurchasePackageCompletedList =
                  result.customerPurchasePackageCompletedList;
              notifyListeners();
            } else {
              Utils.showPrimarySnackbar(context, result.message,
                  type: SnackType.error);
            }
          }).onError((error, stackTrace) {
            Utils.showPrimarySnackbar(context, error,
                type: SnackType.debugError);
          }).catchError(
            (Object e) {
              Utils.showPrimarySnackbar(context, e, type: SnackType.debugError);
            },
            test: (Object e) {
              Utils.showPrimarySnackbar(context, e, type: SnackType.debugError);
              return false;
            },
          );
    } else {
      // If the search text is empty, display all packages
      await completedPackageList(context);
      notifyListeners();
    }
  }
  // TextEditingController searchCompletedController = TextEditingController();

  // CompletedSearchPackgeRequestModel get completedSearchPackgeRequestModel =>
  //     CompletedSearchPackgeRequestModel(
  //       packgeName: searchCompletedController.text,
  //     );
  // Future<void> completedSearchList(context) async {
  //   SharedPreferences pref = await SharedPreferences.getInstance();
  //   print(pref.getString("successToken"));

  //   if (searchCompletedController.text.isNotEmpty) {
  //     customerPurchasePackageCompletedList ==
  //         completedSearchRepo
  //             .completedSeacrh1(completedSearchPackgeRequestModel,
  //                 pref.getString("successToken"))
  //             .then((response) {
  //           log("response.body${response.body}");
  //           final result =
  //               CompletedPurchesPackageList.fromJson(jsonDecode(response.body));
  //           if (response.statusCode == 200) {
  //             customerPurchasePackageCompletedList =
  //                 result.customerPurchasePackageCompletedList;
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
  //     await completedSearchList(context);
  //     notifyListeners();
  //   }
  // }

/////////////////////////////////////////
  Future<void> cancelledPackageList(context) async {
    showLoader(true);
    SharedPreferences pref = await SharedPreferences.getInstance();
    print(pref.getString("successToken"));
    cancelledPackageRepo
        .cancelledPackage(pref.getString("successToken"))
        .then((response) {
      log(response.body);
      final result = CancelledPurchesPackageList.fromJson(
        jsonDecode(response.body),
      );
      if (response.statusCode == 200) {
        if (result.status == 200) {
          // reasonController.clear(); // Clear text field
          // isChecked = false; //
          customerPurchasePackageCancelledList =
              result.customerPurchasePackageCancelledList;
          showLoader(false);

          notifyListeners();
          // Utils.showPrimarySnackbar(context, "", type: SnackType.success);
          // notifyListeners();
        } else {
          // Utils.showPrimarySnackbar(context, "", type: SnackType.error);
        }
      } else {
        // Utils.showPrimarySnackbar(context, "", type: SnackType.error);/
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

  TextEditingController searchCanclledController = TextEditingController();

  CanceledSearchPackgeRequestModel get canceledSearchPackgeRequestModel =>
      CanceledSearchPackgeRequestModel(
        packgeName: searchCanclledController.text,
      );
  Future<void> canceledSearchList(context) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    print(pref.getString("successToken"));

    if (searchCanclledController.text.isNotEmpty) {
      customerPurchasePackageCancelledList ==
          canclledSearchRepo
              .cancelledSeach(canceledSearchPackgeRequestModel,
                  pref.getString("successToken"))
              .then((response) {
            log("response.body${response.body}");
            final result =
                CancelledPurchesPackageList.fromJson(jsonDecode(response.body));
            if (response.statusCode == 200) {
              customerPurchasePackageCancelledList =
                  result.customerPurchasePackageCancelledList;
              notifyListeners();
            } else {
              Utils.showPrimarySnackbar(context, result.message,
                  type: SnackType.error);
            }
          }).onError((error, stackTrace) {
            Utils.showPrimarySnackbar(context, error,
                type: SnackType.debugError);
          }).catchError(
            (Object e) {
              Utils.showPrimarySnackbar(context, e, type: SnackType.debugError);
            },
            test: (Object e) {
              Utils.showPrimarySnackbar(context, e, type: SnackType.debugError);
              return false;
            },
          );
    } else {
      // If the search text is empty, display all packages
      await cancelledPackageList(context);
      notifyListeners();
    }
  }

  CustomerReviews? customerReviews;
  CompletedGetReviewRepo completedGetReviewRepo = CompletedGetReviewRepo();
  CompletedGetReviewRequestModel get completedGetReviewRequestModel =>
      CompletedGetReviewRequestModel(purchaseId: purchesId);

  Future<void> getCompletedPkgReviews(context, puId) async {
    purchesId = puId.toString();
    showLoader(true);
    SharedPreferences pref = await SharedPreferences.getInstance();
    completedGetReviewRepo
        .getCompletedPkgReview(
            completedGetReviewRequestModel, pref.getString('successToken'))
        .then((response) async {
      final result =
          CompletedGetReviewResponseModel.fromJson(jsonDecode(response.body));
      print(jsonDecode(response.body));
      if (response.statusCode == 200) {
        customerReviews = result.customerReviews;
        notifyListeners();
      }
      notifyListeners();
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

//////////////////////////////////////////////////////////////////////////
  CancelledRequestModel get orderStatusChangedRequestModel =>
      CancelledRequestModel(
        purchesId: purchesId.toString(),
        cancelledReason: reasonController.text,
        id: cancelId.toString(),
      );
  Future<void> packageDeleteActiveStatus(
    context,
    puId,
    cId,
  ) async {
    cancelId = cId.toString();
    purchesId = puId.toString();
    showLoader(true);
    SharedPreferences pref = await SharedPreferences.getInstance();
    deleteActivePackaegRequestRepo
        .deletePackageActive(
            orderStatusChangedRequestModel, pref.getString("successToken"))
        .then((response) async {
      final result = CancelledResponseModel.fromJson(jsonDecode(response.body));
      if (response.statusCode == 200) {
        cancelledPackageList(context);
        reasonController.clear(); // Clear text field
        isChecked = false; //
        print(cancelId);
        print("object");
        activePackageList(context);
        // cancelledPackageList(context);
        showLoader(false);
        notifyListeners();
      }
      notifyListeners();
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
  ////////////////////////////////////////////////////
}
    // offset = 0;
      // // customerPurchasePackageActiveList.clear();
      // var news = customerPurchasePackageActiveList;
      // customerPurchasePackageActiveList = [];
      // // status 200
      // //status 404
      // customerPurchasePackageActiveList = news;
      // await activePackageList(context);
      // notifyListeners();