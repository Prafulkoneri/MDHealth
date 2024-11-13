import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:md_health/Screens/health/home/map_testing.dart';
import 'package:md_health/Screens/health/home/model/message_status_model.dart';
import 'package:md_health/Screens/health/home/model/new_city_for_treatment.dart';
import 'package:md_health/Screens/health/home/model/new_city_list_model.dart';
import 'package:md_health/Screens/health/home/model/notification_count.dart';
import 'package:md_health/Screens/health/home/model/notification_seen_model.dart';
import 'package:md_health/Screens/health/home/model/review_model.dart';
import 'package:md_health/Screens/health/home/model/scrolle_home_nodel.dart';
import 'package:md_health/Screens/health/home/model/shop_cart_count_model.dart';
import 'package:md_health/Screens/health/home/model/treatment_list_model.dart';
import 'package:md_health/Screens/health/home/model/user_model.dart';
import 'package:md_health/Screens/health/home/repository/message_status_repo.dart';
import 'package:md_health/Screens/health/home/repository/new_city_for_treatment.dart';
import 'package:md_health/Screens/health/home/repository/new_getcityList_repo.dart';
import 'package:md_health/Screens/health/home/repository/nitification_seen_repo.dart';
import 'package:md_health/Screens/health/home/repository/notification_count_repo.dart';
import 'package:md_health/Screens/health/home/repository/review_pop_up_repo.dart';
import 'package:md_health/Screens/health/home/repository/scrolle_home_repo.dart';
import 'package:md_health/Screens/health/home/repository/shop_cart_count_repo.dart';
import 'package:md_health/Screens/health/home/repository/treatment_list_repo.dart';
import 'package:md_health/Screens/health/home/repository/user_repo.dart';
import 'package:md_health/Screens/health/home/view/home_section_one.dart';
import 'package:md_health/Screens/health/home/view/review_pop_up.dart';
import 'package:md_health/Screens/health/search/controller/search_view_controller.dart';
import 'package:md_health/Screens/health/search/view/search_view.dart';
import 'package:md_health/test_widget.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:md_health/Screens/auth/model/city_list_model.dart';
import 'package:md_health/Screens/health/home/repository/city_list_repository.dart';
import 'package:md_health/Screens/health/search/model/search_model.dart';
import 'package:md_health/Screens/health/search/repository/search_view_repository.dart';
import 'package:md_health/utils/utils.dart';

class HomeViewController extends ChangeNotifier {
  // SearchViewRepository packageRepository = SearchViewRepository();
  String selectedText = '';
  String? countryId;
  int? selectedTextIndex = -1; // Assuming -1 represents no selection
  // int? selectedTextIndex1;
  bool isLoading = true;
// void setSelectedText(value, index) {
//   selectedText = value;
//   selectedTextIndex = index;
//   notifyListeners();
// }
  // List<PackageList>? packageList;
  // List<String>? otherServices;
  // CityListRepository cityListRepo = CityListRepository();
  NewCityGetlistRepo newCityGetlistRepo = NewCityGetlistRepo();
  TextEditingController searchController = TextEditingController();
  NewCityforTreatmentRepo newCityforTreatmentRepo = NewCityforTreatmentRepo();
  List<PurchaseDetail>? purchaseDetails;

  HomeScrolleRepo homeScrolleRepo = HomeScrolleRepo();

  TreatmentListRepository treatmentListRepo = TreatmentListRepository();
  UserNameRepo userNameRepo = UserNameRepo();
  NotificationCountRepo notificationCountRepo = NotificationCountRepo();
  NotificationSeenRepo notificationSeenRepo = NotificationSeenRepo();
  ReviewPopUpRepository reviewPopUpRepository = ReviewPopUpRepository();

  MessageStatusRepo messageStatusRepo = MessageStatusRepo();
  String? readStatus;
  int? unreadMsgCount;

  List<CityListData>? cityList;
  List<bool> radioValue = [true];
  List<NewCityList>? oiginalcityList = [];
  String? fullName;

  String selectedText1 = "";
  String? treatmentName;
  bool isFirstLoad = true;

  int? selectedTextIndex1 = -1;
  // late SearchViewController packageController;

  // HomeViewController() {
  //   packageController = SearchViewController();
  // }

  Future<void> initState(
    context,
    cId,
  ) async {
    getMessageStatus(context);
    searchController.clear();
    // treatmentName = '';
    selectedTextIndex ?? '';
    // selectedText1 = '';
    selectedTextIndex1 ?? '';
    // getShopCartCount(context);
    userName(context);
    getTreatmentList(context);
    getCities(context);
    homeScrollePer(context);
    notificationCountsf(context);
    notificationSeen(context);
    // showMap(context, true);
    // reviewPopUp(context);
    if (isFirstLoad) {
      showMap(context, true);
    }
    isFirstLoad = false;
    notifyListeners();
  }

  Future<void> refreshState(BuildContext context) async {
    // treatmentName = '';
    // selectedTextIndex ?? '';
    // // selectedText1 = '';
    // selectedTextIndex1 ?? '';
    selectedText1 = 'Treatment';
    treatmentName = '';
    selectedText = 'City';
    notificationSeen(context);
    // getShopCartCount(context);
    // userName(context);
    // getTreatmentList(context);
    // getCities(context);
    // homeScrollePer(context);
    // showMap(context, true);
    // if (isFirstLoad) {
    //   showMap(context, true);
    // }
    // isFirstLoad = false;
    // notifyListeners();
    HomeScreenSectionOne();
    notifyListeners();
  }

  bool isLocationServiceEnabled = false;
  LatLng defaultLatLng = const LatLng(18.5695447, 73.8794143);

  void showMap(context, intialMapView) async {
    isLocationServiceEnabled = await Geolocator.isLocationServiceEnabled();
    print("hello");
    print(isLocationServiceEnabled);
    showModalBottomSheet(
      enableDrag: false,
      isDismissible: false,
      backgroundColor: Colors.white,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30))),
      context: context,
      builder: (BuildContext context) {
        return WillPopScope(
            onWillPop: () async {
              print("hello");
              return true;
            },
            child: MapScreenView(
              isLocationEnabled: isLocationServiceEnabled,
              initialMapView: intialMapView,
              latLng: defaultLatLng,
            ));
      },
    );
    if (!isLocationServiceEnabled) {}
  }

  bool locationNotFound = false;
  bool isLocationFound = false;
  String locationErrorMessage = "";

  void onMapCloseBtnPressed(context) {
    if (!isLocationFound) {
      locationErrorMessage = "Select another location to continue";
      locationNotFound = true;
      notifyListeners();
      Timer(const Duration(seconds: 3), () {
        locationNotFound = false;
        notifyListeners();
      });
    } else {
      final read = Provider.of<HomeViewController>(context, listen: false);
      read.initState(context, true);
      Navigator.pop(context);
    }
    // Navigator.pushAndRemoveUntil(
    //   context,
    //   MaterialPageRoute(
    //       builder: (context) => MainScreenView(
    //           index: 0,
    //           screenName: HomeScreenView(
    //             refreshPage: true,
    //           ))),
    //   (Route<dynamic> route) => false,
    // );
    notifyListeners();
  }

  void onDismissTaped() {
    locationNotFound = false;
    locationErrorMessage = "";
    notifyListeners();
  }

  void setSelectedText(value, index) {
    selectedText = value;
    selectedTextIndex = index;
    notifyListeners();
  }

  void setSelectedText1(value, index) {
    selectedText1 = value;
    selectedTextIndex1 = index;
    notifyListeners();
  }

  showLoader(value) {
    isLoading = value;
    notifyListeners();
  }

  Future<void> getMessageStatus(context) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    messageStatusRepo
        .getMessageStatus(pref.getString("successToken"))
        .then((response) async {
      final result =
          MessageStatusResponseModel.fromJson(jsonDecode(response.body));
      if (response.statusCode == 200) {
        readStatus = result.readStatus;
        unreadMsgCount = result.unreadMsgCount;
        notifyListeners();
      } else {
        log(response.body);
        Utils.showPrimarySnackbar(context, 'error', type: SnackType.error);
      }
    }).onError((error, stackTrace) {
      Utils.showPrimarySnackbar(context, error, type: SnackType.debugError);
    }).catchError((Object e) {
      Utils.showPrimarySnackbar(context, e, type: SnackType.debugError);
    }, test: (Object e) {
      Utils.showPrimarySnackbar(context, e, type: SnackType.debugError);
      return false;
    });
  }

  List<NewCityList>? newCityList;
  Future<void> getCities(context) async {
    showLoader(true);
    SharedPreferences pref = await SharedPreferences.getInstance();
    newCityGetlistRepo
        .newGetlistCity(pref.getString("successToken"))
        .then((response) async {
      // log(response.body);
      debugPrint('/////////////');
      final result =
          GetTreatnentListNewResponse.fromJson(jsonDecode(response.body));
      if (response.statusCode == 200) {
        log(response.body);
        newCityList = result.newCityList;
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

  NewCityForRequestModel get newCityForRequestModel =>
      NewCityForRequestModel(treatmentName: treatmentName);
  Future<void> NewCitiestratment(context, tName) async {
    showLoader(true);
    oiginalcityList = newCityList;
    newCityList = [];
    treatmentName = tName.toString();
    SharedPreferences pref = await SharedPreferences.getInstance();
    newCityforTreatmentRepo
        .newCityfortreatment(
            newCityForRequestModel, pref.getString("successToken"))
        .then((response) async {
      // log(response.body);
      debugPrint('/////////////');
      final result =
          GetTreatnentListNewResponse.fromJson(jsonDecode(response.body));
      if (response.statusCode == 200) {
        log(response.body);
        newCityList = result.newCityList;

        showLoader(false);
        notifyListeners();
      } else {
        // newCityList =
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

  Future<void> homeScrollePer(context) async {
    showLoader(true);
    SharedPreferences pref = await SharedPreferences.getInstance();
    homeScrolleRepo
        .homeScrolle(pref.getString("successToken"))
        .then((response) async {
      // log(response.body);
      debugPrint('/////////////');
      final result = HomePageScroolResponse.fromJson(jsonDecode(response.body));
      if (response.statusCode == 200) {
        log(response.body);
        purchaseDetails = result.purchaseDetails;
        // treatmentList = result.treatmentList;
        // treatmentList!.map((item) => item.treatmentName).toList();
        // cityList = result.cityList;
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

  List<TreatmentList>? treatmentList;

  Future<void> getTreatmentList(context) async {
    showLoader(true);
    SharedPreferences pref = await SharedPreferences.getInstance();
    treatmentListRepo
        .getTreatmentList(pref.getString("successToken"))
        .then((response) async {
      debugPrint('/////////////');
      final result =
          TreatmentListResponseOdel.fromJson(jsonDecode(response.body));
      if (response.statusCode == 200) {
        log(response.body);
        treatmentList = result.treatmentList;
        treatmentList!.map((item) => item.treatmentName).toList();
        // cityList = result.cityList;
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

  /////////////////////////////////////
  Future<void> userName(context) async {
    showLoader(true);
    SharedPreferences pref = await SharedPreferences.getInstance();
    userNameRepo
        .userName(pref.getString("successToken"))
        .then((response) async {
      // log(response.body);
      debugPrint('/////////////');
      final result = UserReponseModel.fromJson(jsonDecode(response.body));
      if (response.statusCode == 200) {
        log("////// ${result.fullName}");
        fullName = result.fullName;
        // cityList = result.cityList;
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

  String? notificationCount;

  ///////////////////////////////////
  Future<void> notificationCountsf(context) async {
    showLoader(true);
    SharedPreferences pref = await SharedPreferences.getInstance();
    notificationCountRepo
        .notifCount(pref.getString("successToken"))
        .then((response) async {
      // log(response.body);
      debugPrint('/////////////');
      final result =
          NotificationCountResponseModel.fromJson(jsonDecode(response.body));
      if (response.statusCode == 200) {
        // log("////// ${result.fullName}");
        notificationCount = result.notificationCount.toString();
        // cityList = result.cityList;
        showLoader(false);
        notifyListeners();
      } else {
        log(response.body);
        // Utils.showPrimarySnackbar(context, result.message,
        //     type: SnackType.error);
      }
    }).onError((error, stackTrace) {
      // Utils.showPrimarySnackbar(context, error, type: SnackType.debugError);
    }).catchError(
      (Object e) {
        // Utils.showPrimarySnackbar(context, e, type: SnackType.debugError);
      },
      test: (Object e) {
        // Utils.showPrimarySnackbar(context, e, type: SnackType.debugError);
        return false;
      },
    );
  }

  String? seenStatus;

  Future<void> notificationSeen(context) async {
    showLoader(true);
    SharedPreferences pref = await SharedPreferences.getInstance();
    notificationSeenRepo
        .notifSeen(pref.getString("successToken"))
        .then((response) async {
      // log(response.body);
      debugPrint('/////////////');
      final result =
          NotificationSeenResponseModel.fromJson(jsonDecode(response.body));
      if (response.statusCode == 200) {
        log("////// ${result.seenStatus}");
        seenStatus = result.seenStatus;
        // cityList = result.cityList;
        showLoader(false);
        notifyListeners();
      } else {
        log(response.body);
        // Utils.showPrimarySnackbar(context, result.message,
        //     type: SnackType.error);
      }
    }).onError((error, stackTrace) {
      // Utils.showPrimarySnackbar(context, error, type: SnackType.debugError);
    }).catchError(
      (Object e) {
        // Utils.showPrimarySnackbar(context, e, type: SnackType.debugError);
      },
      test: (Object e) {
        // Utils.showPrimarySnackbar(context, e, type: SnackType.debugError);
        return false;
      },
    );
  }

  /////////////////////////////////////////////////////////
  String? reviewCount;
  int selectedIndex = 1;

  Future<void> reviewPopUp(context) async {
    showLoader(true);
    SharedPreferences pref = await SharedPreferences.getInstance();
    reviewPopUpRepository
        .reviewpopUP(pref.getString("successToken"))
        .then((response) async {
      // log(response.body);
      debugPrint('/////////////');
      final result =
          ReviewModelResponseModel.fromJson(jsonDecode(response.body));
      if (response.statusCode == 200) {
        // cityList = result.cityList;
        reviewCount = result.reviewCount;
        print("object");
        print(reviewCount);
        print("object");

        if (reviewCount == "no") {
          // Show the popup using a dialog with transparent background
          showDialog(
            context: context,
            barrierDismissible: true, // Close when tapped outside
            barrierColor:
                Colors.black.withOpacity(0.5), // Semi-transparent background
            builder: (BuildContext context) {
              return const ReviewPopUpView();
            },
          );
        } else {
          Utils.showPrimarySnackbar(context, result.message,
              type: SnackType.error);
        }
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
  // Future<void> getShopCartCount(context) async {
  //   showLoader(true);
  //   SharedPreferences pref = await SharedPreferences.getInstance();
  //   shopCartCountRepo
  //       .cartCount(pref.getString("successToken"))
  //       .then((response) async {
  //     // log(response.body);
  //     debugPrint('/////////////');
  //     final result = ShopCartCountModel.fromJson(jsonDecode(response.body));
  //     if (response.statusCode == 200) {
  //       log("///77777777777777/// ${result.cartCount}");
  //       cartCount = result.cartCount.toString();
  //       // cityList = result.cityList;
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
