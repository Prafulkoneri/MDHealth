// import 'dart:async';
// import 'dart:convert';
// import 'dart:developer';

// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:md_health/Screens/food/diet_plan/model/add_to_fav_food_repo.dart';
// import 'package:md_health/Screens/food/diet_plan/model/calaries_model.dart';
// import 'package:md_health/Screens/food/diet_plan/model/calculation_model.dart';
// import 'package:md_health/Screens/food/diet_plan/model/calculation_model.dart';
// import 'package:md_health/Screens/food/diet_plan/model/calculation_model.dart';
// import 'package:md_health/Screens/food/diet_plan/model/diet_view_model.dart';
// import 'package:md_health/Screens/food/diet_plan/model/calculation_model.dart';
// import 'package:md_health/Screens/food/diet_plan/model/get_who-purchase_model.dart';
// import 'package:md_health/Screens/food/diet_plan/model/type_model.dart';
// import 'package:md_health/Screens/food/diet_plan/model/view_menu_model.dart';
// import 'package:md_health/Screens/food/diet_plan/repositiory/add_fav_repo.dart';
// // import 'package:md_health/Screens/health/diet_plan/repositiory/calculation_repo.dart';
// import 'package:md_health/Screens/food/diet_plan/repositiory/calculation_repo.dart';
// import 'package:md_health/Screens/food/diet_plan/repositiory/dient_view_repo.dart';
// // import 'package:md_health/Screens/diet_plan/repositiory/get_who_purches_repo.dart';
// import 'package:md_health/Screens/food/diet_plan/repositiory/get_who_purches_repo.dart';
// import 'package:md_health/Screens/food/diet_plan/repositiory/type_repo.dart';
// // import 'package:md_health/Screens/diet_plan/repositiory/view_menu_repo.dart';
// import 'package:md_health/Screens/food/diet_plan/repositiory/view_menu_repo.dart';
// import 'package:md_health/Screens/food/diet_plan/view/map.dart';
// import 'package:md_health/utils/utils.dart';
// import 'package:md_health/widget/loading_overlay.dart';
// import 'package:provider/provider.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class DietPlanviewController extends ChangeNotifier {
//   bool isLoading = true;
//   String food = '';
//   String calories = '';
//   String newSalePrice = '';
//   String? foodpackageId;
//   String? salesPrice;
//   String? status;
//   String? mealType;
//   String subscriptionType = '';
//   String selectedTextfood = '';
//   String selectedTexttype = '';
//   String selectedTextcalories = '';
//   int selectedTextIndexfood = -1; // Assuming -1 represents no selection
//   int selectedTextIndextype =
//       -1; // Changed from 0 to -1 to indicate no selection
//   int selectedTextIndexcalories = -1; // Assuming -1 represents no selection

//   DietViewRepo dietViewRepo = DietViewRepo();
//   GetwhoPurchaseRepo getwhoPurchaseRepo = GetwhoPurchaseRepo();
//   CalculationRepo calculationRepo = CalculationRepo();
//   MENUDietViewRepo menuietViewRepo = MENUDietViewRepo();
//   addToFavFood addtoFavFood = addToFavFood();
//   List<bool> selectAddonServicesList = [true];
//   getWhoPurchaseData? whoPurhasedata;
//   List<MealTypeWho>? mealTypeswho;
//   List<CaloriesData>? caloriesData;

//   // List<FoodList>? foodData;
//   TextEditingController foodNamesearchController = TextEditingController();

//   Future<void> initState(
//       context, fName, subscType, cal, fpId, fSearch, pin) async {
//     await foodViewDetails(context, fName, subscType, cal, fSearch, pin);
//     subscriptionType = '';
//     selectedTextIndextype = -1;
//     BirthDateController.clear();
//     gwtWhoTopUrchase(context, fpId);
//     // viewMenuDetails(
//     //   context,
//     //   pId,
//     // );
//     notifyListeners();
//   }

//   showLoader(value) {
//     isLoading = value;
//     notifyListeners();
//   }

//   List<bool> selectedAddOnServicesStatus = [];
//   List selectedAddOnServicesId = [];
//   void onAddOnServicesSelected(BuildContext context, int index, String id) {
//     LoadingOverlay.of(context).show();

//     // Toggle the selection status of the add-on service at the given index
//     selectAddonServicesList[index] = !selectAddonServicesList[index];

//     if (selectAddonServicesList[index]) {
//       // If the checkbox is checked, add the service ID to the list
//       selectedAddOnServicesId.add(id);
//       selectedAddOnServicesStatus.add(true); // Add true for checked status
//     } else {
//       // If the checkbox is unchecked, remove the service ID from the list
//       selectedAddOnServicesId.remove(id);
//       if (index < selectedAddOnServicesStatus.length) {
//         // Ensure index is within valid range
//         selectedAddOnServicesStatus.removeAt(index); // Remove status at index
//       }
//     }

//     // Recalculate the price based on the selected add-on services and other parameters
//     calculationprice(
//       context: context,
//       saPrices: '',
//       cheStatus: selectedAddOnServicesStatus.isNotEmpty
//           ? selectedAddOnServicesStatus.join(',')
//           : '',
//       fpId: whoPurhasedata?.foodPackageId.toString(),
//       mType: selectedAddOnServicesId.isNotEmpty
//           ? selectedAddOnServicesId.join(',')
//           : '',
//       stype: '',
//     );

//     print("Selected Add-On Services IDs: $selectedAddOnServicesId");

//     LoadingOverlay.of(context).hide();
//     notifyListeners();
//   }

//   /////////////////////////////////////////////////////////////
//   CalculationData? calculationdata;

//   CalculationRequestModel get calculationRequestModel =>
//       CalculationRequestModel(
//         foodpackageId: foodpackageId.toString(),
//         subscriptionType: selectedTexttype.toString(),
//         salePrice: salesPrice.toString(),
//         mealType: mealType,
//         status: status,
//       );
//   Future<void> calculationprice(
//       {required BuildContext context,
//       required saPrices,
//       required mType,
//       required fpId,
//       required stype,
//       required cheStatus}) async {
//     salesPrice = saPrices;
//     mealType = mType;
//     foodpackageId = fpId;
//     subscriptionType = stype;
//     status = cheStatus;
//     log(salesPrice = saPrices);
//     log(mealType = mType);
//     log(foodpackageId = fpId);
//     log(status = cheStatus);
//     showLoader(true);

//     SharedPreferences pref = await SharedPreferences.getInstance();
//     calculationRepo
//         .calcluationprice(
//             calculationRequestModel, pref.getString("successToken"))
//         .then((response) async {
//       log(response.body);
//       debugPrint('/////////////');
//       final result =
//           CalculationMealResponseModel.fromJson(jsonDecode(response.body));
//       if (response.statusCode == 200) {
//         log(response.body);
//         newSalePrice = result.calculationdata?.salePrices.toString() ?? '';
//         debugPrint('/////////////');
//         log(newSalePrice.toString());
//         debugPrint('/////////////');
//         showLoader(false);
//         notifyListeners();
//       } else {
//         log(response.body);
//         Utils.showPrimarySnackbar(context, result.message,
//             type: SnackType.error);
//       }
//     }).onError((error, stackTrace) {
//       Utils.showPrimarySnackbar(context, error, type: SnackType.debugError);
//     }).catchError(
//       (Object e) {
//         Utils.showPrimarySnackbar(context, e, type: SnackType.debugError);
//       },
//       test: (Object e) {
//         Utils.showPrimarySnackbar(context, e, type: SnackType.debugError);
//         return false;
//       },
//     );
//   }

//   void setSelectedTextfood(value, index) {
//     selectedTextfood = value;
//     selectedTextIndexfood = index;
//     notifyListeners();
//   }

//   void setSelectedTexttype1(context, value, index) {
//     selectedTexttype = value;
//     selectedTextIndextype = index;
//     calculationprice(
//       context: context,
//       saPrices: '',
//       cheStatus: '',
//       fpId: whoPurhasedata?.foodPackageId.toString(),
//       mType: '',
//       stype: '',
//     );
//     notifyListeners();
//   }

//   void setSelectedTextCalories(value, index) {
//     selectedTextcalories = value;
//     selectedTextIndexcalories = index;
//     notifyListeners();
//   }

//   DietViewListData? dietviewdata;
//   List<FoodPackagesSearch>? foodPackagesSearch;
//   // List<String>? mealTypes;
//   String? pincode;
//   DietViewRequestModel get dietViewRequestModel => DietViewRequestModel(
//         userPincode: pincode ?? '',
//         searchFood: foodNamesearchController.text,
//         foodType: food != "Food" ? food : '',
//         subscriptionType:
//             subscriptionType != "Subscription" ? subscriptionType : '',
//         calories: calories != "Calories" ? calories : '',
//       );
//   Future<void> foodViewDetails(
//       context, fName, subscType, cal, fSearch, pin) async {
//     food = fName.toString() != 'Food' ? fName.toString() : '';
//     subscriptionType =
//         subscType.toString() != "Subscription" ? subscType.toString() : '';
//     calories = cal.toString() != 'Calories' ? cal.toString() : '';
//     foodNamesearchController.text = fSearch;
//     pincode = pin ?? '';
//     showLoader(true);
//     SharedPreferences pref = await SharedPreferences.getInstance();
//     dietViewRepo
//         .dietView(dietViewRequestModel, pref.getString("successToken"))
//         .then((response) async {
//       debugPrint('/////////////');
//       final result = DietViewReponseModel.fromJson(jsonDecode(response.body));
//       if (response.statusCode == 200) {
//         log(response.body);
//         dietviewdata = result.dietviewdata;
//         isFavProduct =
//             dietviewdata?.foodPackagesSearch?.first.isFavorite == "yes"
//                 ? true
//                 : false;

//         foodPackagesSearch = result.dietviewdata?.foodPackagesSearch;
//         print("juhujkiuyol,oi;l");
//         showLoader(false);
//         notifyListeners();
//       } else {
//         log(response.body);
//         Utils.showPrimarySnackbar(context, result.message,
//             type: SnackType.error);
//       }
//     }).onError((error, stackTrace) {
//       Utils.showPrimarySnackbar(context, error, type: SnackType.debugError);
//     }).catchError(
//       (Object e) {
//         Utils.showPrimarySnackbar(context, e, type: SnackType.debugError);
//       },
//       test: (Object e) {
//         Utils.showPrimarySnackbar(context, e, type: SnackType.debugError);
//         return false;
//       },
//     );
//   }

//   int offset = 0;
//   bool showPaginationLoader = false;

//   Future<void> onScrollMaxExtent(context) async {
//     showPaginationLoader = true;
//     print("hello");
//     offset = offset + 1;
//     SharedPreferences pref = await SharedPreferences.getInstance();
//     print("kkkkkkkkkk");
//     dietViewRepo
//         .dietView(dietViewRequestModel, pref.getString("successToken"))
//         .then((response) {
//       log(response.body);
//       final result = DietViewReponseModel.fromJson(jsonDecode(response.body));
//       if (response.statusCode == 200) {
//         print("111111123e24errfsdfs");
//         // allShops.clear();
//         // packageList = result.data?.packageList;
//         dietviewdata = result.dietviewdata;
//         isFavProduct =
//             dietviewdata?.foodPackagesSearch?.first.isFavorite == "yes"
//                 ? true
//                 : false;
//         isLoading = false;
//         showPaginationLoader = false;
//         notifyListeners();
//       } else {
//         Utils.showPrimarySnackbar(context, result.message,
//             type: SnackType.error);
//       }
//     }).onError((error, stackTrace) {
//       //   //Utils.showPrimarySnackbar(context, error, type: SnackType.debugError);
//     }).catchError(
//       (Object e) {
//         // Utils.showPrimarySnackbar(context, e, type: SnackType.debugError);
//       },
//       test: (Object e) {
//         // Utils.showPrimarySnackbar(context, e, type: SnackType.debugError);
//         return false;
//       },
//     );
//     // await getAllShops(context, categoryId);
//     isLoading = false;

//     notifyListeners();
//   }
//   ///////////////////////////////////////////////////

//   ///////////////////////////////////

//   GetWhoPurchaseRequestModel get getWhoPurchaseRequestModel =>
//       GetWhoPurchaseRequestModel(foodpackageId: foodpackageId ?? '');
//   Future<void> gwtWhoTopUrchase(context, fpId) async {
//     foodpackageId = fpId;

//     showLoader(true);

//     SharedPreferences pref = await SharedPreferences.getInstance();
//     getwhoPurchaseRepo
//         .whopurchase(getWhoPurchaseRequestModel, pref.getString("successToken"))
//         .then((response) async {
//       log(response.body);
//       debugPrint('///////praful//////');
//       final result =
//           GetWhoPurchaseReponseModel.fromJson(jsonDecode(response.body));
//       if (response.statusCode == 200) {
//         log(response.body);
//         whoPurhasedata = result.whoPurhasedata;

//         print("object11111111111111111111111111111");
//         log(result.whoPurhasedata?.salesPrice ?? '');
//         print("object2222222222222222222222222222222222");
//         newSalePrice = result.whoPurhasedata?.salesPrice ?? '';
//         mealTypeswho = result.mealTypeswho;
//         selectAddonServicesList = List.generate(
//           mealTypeswho?.length ?? 0,
//           (index) => true,
//         );
//         showLoader(false);
//         notifyListeners();
//       } else {
//         log(response.body);
//         Utils.showPrimarySnackbar(context, result.message,
//             type: SnackType.error);
//       }
//     }).onError((error, stackTrace) {
//       Utils.showPrimarySnackbar(context, error, type: SnackType.debugError);
//     }).catchError(
//       (Object e) {
//         Utils.showPrimarySnackbar(context, e, type: SnackType.debugError);
//       },
//       test: (Object e) {
//         Utils.showPrimarySnackbar(context, e, type: SnackType.debugError);
//         return false;
//       },
//     );
//   }

//   TextEditingController BirthDateController = TextEditingController();

//   void onToDateSelected(date) {
//     BirthDateController.text = date;
//     notifyListeners();
//   }

//   TypeSubscriptionRepo typeSubscriptionRepo = TypeSubscriptionRepo();
//   List<SubscriptionData>? subscriptiondata;
//   Future<void> getSubScriptionType(context) async {
//     showLoader(true);
//     SharedPreferences pref = await SharedPreferences.getInstance();
//     print(pref.getString("successToken"));
//     typeSubscriptionRepo
//         .typesub(pref.getString("successToken"))
//         .then((response) {
//       log(response.body);
//       final result = SubscriptionType.fromJson(
//         jsonDecode(response.body),
//       );
//       if (response.statusCode == 200) {
//         if (result.status == 200) {
//           subscriptiondata = result.subscriptiondata;
//           showLoader(false);
//           Utils.showPrimarySnackbar(context, "", type: SnackType.success);
//           notifyListeners();
//         } else {
//           Utils.showPrimarySnackbar(context, "", type: SnackType.error);
//         }
//       } else {
//         Utils.showPrimarySnackbar(context, "", type: SnackType.error);
//       }
//     }).onError((error, stackTrace) {
//       Utils.showPrimarySnackbar(context, error, type: SnackType.debugError);
//     }).catchError(
//       (Object e) {
//         Utils.showPrimarySnackbar(context, e, type: SnackType.debugError);
//       },
//       test: (Object e) {
//         Utils.showPrimarySnackbar(context, e, type: SnackType.debugError);
//         return false;
//       },
//     );
//   }

//   ViewMenuRequestNModel get viewmenurequestNModel =>
//       ViewMenuRequestNModel(foodpackageId: foodpackageId);
//   List<ViewMenuDetailsData>? viewmenudata;
//   List<MealType>? mealTypes;
//   List<String>? mealName;
//   Future<void> viewMenuDetails(
//     context,
//     pId,
//   ) async {
//     foodpackageId = pId.toString();
//     showLoader(true);
//     SharedPreferences pref = await SharedPreferences.getInstance();
//     menuietViewRepo
//         .mENUdietView(
//       viewmenurequestNModel,
//       pref.getString("successToken"),
//     )
//         .then((response) async {
//       final result = ViewMenuResponseModel.fromJson(jsonDecode(response.body));
//       if (response.statusCode == 200) {
//         log(response.body);
//         viewmenudata = result.viewmenudata;
//         mealTypes = result.viewmenudata?.first.mealTypes;
//         mealName = result.viewmenudata?.first.mealTypes?.first.mealName;
//         showLoader(false);
//         notifyListeners();
//       } else {
//         log(response.body);
//         Utils.showPrimarySnackbar(context, result.message,
//             type: SnackType.error);
//       }
//     }).onError((error, stackTrace) {
//       Utils.showPrimarySnackbar(context, error, type: SnackType.debugError);
//     }).catchError(
//       (Object e) {
//         Utils.showPrimarySnackbar(context, e, type: SnackType.debugError);
//       },
//       test: (Object e) {
//         Utils.showPrimarySnackbar(context, e, type: SnackType.debugError);
//         return false;
//       },
//     );
//   }

//   bool isFavProduct = true; //fvrt Product
//   Future<void> addToFavMenuFood(
//       context, packId, favtype, fName, subscType, cal, fSearch, pin) async {
//     SharedPreferences pref = await SharedPreferences.getInstance();

//     addtoFavFood
//         .foodAddFav(
//             AddFavFooDRequestModel(
//               favtype: "food",
//               packageId: packId,
//             ),
//             pref.getString("successToken"))
//         .then((response) async {
//       log("response.body${response.body}");
//       final result =
//           AddFavFooDResponseMOdel.fromJson(jsonDecode(response.body));
//       if (response.statusCode == 200) {
//         if (result.status == 200) {
//           // if (result.favStatus == "added") {
//           //   isFavProduct = true;
//           // } else {
//           //   isFavProduct = false;
//           // }
//           foodViewDetails(context, fName, subscType, cal, fSearch, pin);

//           showDialog(
//               context: context,
//               builder: (BuildContext context) {
//                 return AlertDialog(
//                   shape: const RoundedRectangleBorder(
//                     borderRadius: BorderRadius.all(Radius.circular(20.0)),
//                   ),
//                   backgroundColor: const Color(0xffF55C5C),
//                   scrollable: true,
//                   content: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.end,
//                     children: <Widget>[
//                       GestureDetector(
//                         onTap: () {
//                           Navigator.pop(context);
//                         },
//                         child: SvgPicture.asset(
//                           'assets/icons/CloseSquare.svg',
//                           // width: 30,
//                           // alignment: Alignment.topRight,
//                         ),
//                       ),
//                       Center(
//                         child: Column(
//                           children: [
//                             SvgPicture.asset(
//                               'assets/icons/favorite.svg',
//                               width: 54.w,
//                               height: 37.h,
//                               // alignment: Alignment.topRight,
//                             ),
//                             // SizedBox(
//                             //   height:
//                             //       10.h,
//                             // ),
//                             Text(
//                               "Added to favorites!",
//                               style: TextStyle(
//                                 fontFamily: 'Campton',
//                                 color: Colors.white,
//                                 fontSize: 17.sp,
//                                 fontWeight: FontWeight.w600,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 );
//               });
//           notifyListeners();
//         } else if (result.status == 404) {
//           // Handle 404 status code here
//           Utils.showPrimarySnackbar(context, result.message,
//               type: SnackType.error);
//           notifyListeners();
//         }
//       } else if (result.status == 404) {
//         // Handle 404 status code here
//         Utils.showPrimarySnackbar(context, result.message,
//             type: SnackType.error);
//         notifyListeners();
//       }
//     }).onError((error, stackTrace) {
//       Utils.showPrimarySnackbar(context, error, type: SnackType.debugError);
//     }).catchError(
//       (Object e) {
//         Utils.showPrimarySnackbar(context, e, type: SnackType.debugError);
//       },
//       test: (Object e) {
//         Utils.showPrimarySnackbar(context, e, type: SnackType.debugError);
//         return false;
//       },
//     );
//   }
//   ////////////////////////////////////////////

//   bool isLocationServiceEnabled = false;
//   LatLng defaultLatLng = const LatLng(18.5695447, 73.8794143);

//   void showMap(context, intialMapView) async {
//     isLocationServiceEnabled = await Geolocator.isLocationServiceEnabled();
//     print("hello");
//     print(isLocationServiceEnabled);
//     showModalBottomSheet(
//       enableDrag: false,
//       isDismissible: false,
//       backgroundColor: Colors.white,
//       isScrollControlled: true,
//       shape: const RoundedRectangleBorder(
//           borderRadius: BorderRadius.only(
//               topLeft: Radius.circular(30), topRight: Radius.circular(30))),
//       context: context,
//       builder: (BuildContext context) {
//         return WillPopScope(
//             onWillPop: () async {
//               print("hello");
//               return true;
//             },
//             child: FMapScreenView(
//               isLocationEnabled: isLocationServiceEnabled,
//               initialMapView: intialMapView,
//               latLng: defaultLatLng,
//             ));
//       },
//     );
//     if (!isLocationServiceEnabled) {}
//   }

//   bool locationNotFound = false;
//   bool isLocationFound = false;
//   String locationErrorMessage = "";

//   void onMapCloseBtnPressed(context) {
//     if (!isLocationFound) {
//       locationErrorMessage = "Select another location to continue";
//       locationNotFound = true;
//       notifyListeners();
//       Timer(const Duration(seconds: 3), () {
//         locationNotFound = false;
//         notifyListeners();
//       });
//     } else {
//       final read = Provider.of<DietPlanviewController>(context, listen: false);
//       // read.initState(context, true);
//       Navigator.pop(context);
//     }
//     // Navigator.pushAndRemoveUntil(
//     //   context,
//     //   MaterialPageRoute(
//     //       builder: (context) => MainScreenView(
//     //           index: 0,
//     //           screenName: HomeScreenView(
//     //             refreshPage: true,
//     //           ))),
//     //   (Route<dynamic> route) => false,
//     // );
//     notifyListeners();
//   }

//   void onDismissTaped() {
//     locationNotFound = false;
//     locationErrorMessage = "";
//     notifyListeners();
//   }
// }
import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:md_health/Screens/food/diet_plan/model/add_to_fav_food_repo.dart';
import 'package:md_health/Screens/food/diet_plan/model/calaries_model.dart';
import 'package:md_health/Screens/food/diet_plan/model/calculation_model.dart';
import 'package:md_health/Screens/food/diet_plan/model/calculation_model.dart';
import 'package:md_health/Screens/food/diet_plan/model/calculation_model.dart';
import 'package:md_health/Screens/food/diet_plan/model/diet_view_model.dart';
import 'package:md_health/Screens/food/diet_plan/model/calculation_model.dart';
import 'package:md_health/Screens/food/diet_plan/model/get_who-purchase_model.dart';
import 'package:md_health/Screens/food/diet_plan/model/type_model.dart';
import 'package:md_health/Screens/food/diet_plan/model/view_menu_model.dart';
import 'package:md_health/Screens/food/diet_plan/repositiory/add_fav_repo.dart';
// import 'package:md_health/Screens/health/diet_plan/repositiory/calculation_repo.dart';
import 'package:md_health/Screens/food/diet_plan/repositiory/calculation_repo.dart';
import 'package:md_health/Screens/food/diet_plan/repositiory/dient_view_repo.dart';
// import 'package:md_health/Screens/diet_plan/repositiory/get_who_purches_repo.dart';
import 'package:md_health/Screens/food/diet_plan/repositiory/get_who_purches_repo.dart';
import 'package:md_health/Screens/food/diet_plan/repositiory/type_repo.dart';
// import 'package:md_health/Screens/diet_plan/repositiory/view_menu_repo.dart';
import 'package:md_health/Screens/food/diet_plan/repositiory/view_menu_repo.dart';
import 'package:md_health/Screens/food/diet_plan/view/map.dart';
import 'package:md_health/utils/utils.dart';
import 'package:md_health/widget/loading_overlay.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DietPlanviewController extends ChangeNotifier {
  bool isLoading = true;
  String food = '';
  String calories = '';
  String newSalePrice = '';
  String? foodpackageId;
  String? salesPrice;
  String? status;
  String? mealType;
  String subscriptionType = '';
  String selectedTextfood = '';
  String selectedTexttype = '';
  String selectedTextcalories = '';
  int selectedTextIndexfood = -1; // Assuming -1 represents no selection
  int selectedTextIndextype =
      -1; // Changed from 0 to -1 to indicate no selection
  int selectedTextIndexcalories = -1; // Assuming -1 represents no selection

  int? firstPrice;
  int? secondPrice;
  int? thirdPrice;
  int? fourthPrice;
  int? fifthPrice;
  int? sixthPrice;

  int? firstRCount;
  int? secondRCount;
  int? thirdRCount;
  int? fourthRCount;
  int? fifthRCount;

  // int? allMealType;
  int? breakfast;
  int? lunch;
  int? dinner;
  int? noGluten;
  int? zeroSugarD;
  MealTypeCounts? mealTypeCounts;

  int? verifiedProviderCount;

  DietViewRepo dietViewRepo = DietViewRepo();
  GetwhoPurchaseRepo getwhoPurchaseRepo = GetwhoPurchaseRepo();
  CalculationRepo calculationRepo = CalculationRepo();
  addToFavFood addtoFavFood = addToFavFood();
  List<bool> selectAddonServicesList = [true];
  getWhoPurchaseData? whoPurhasedata;
  List<MealTypeWho>? mealTypeswho;
  List<CaloriesData>? caloriesData;

  // List<FoodList>? foodData;
  TextEditingController foodNamesearchController = TextEditingController();

  Future<void> initState(
      context, fName, subscType, cal, fpId, fSearch, pin, rOrderID, myOrOther
      // allmeal, allrevices, allprices
      ) async {
    await foodViewDetails(context, fName, subscType, cal, fSearch, pin);

    subscriptionType = '';
    selectedTextIndextype = -1;
    BirthDateController.clear();
    gwtWhoTopUrchase(context, fpId, fName);

    notifyListeners();
  }

  showLoader(value) {
    isLoading = value;
    notifyListeners();
  }

  List<bool> selectedAddOnServicesStatus = [];
  List selectedAddOnServicesId = [];
  void onAddOnServicesSelected(BuildContext context, int index, String id) {
    LoadingOverlay.of(context).show();

    // Toggle the selection status of the add-on service at the given index
    selectAddonServicesList[index] = !selectAddonServicesList[index];

    if (selectAddonServicesList[index]) {
      // Add selected meal type and ID
      selectedAddOnServicesId.add(id);
    } else {
      // Remove deselected meal type and ID
      selectedAddOnServicesId.remove(id);
    }

    // Update the status to true if at least one meal type is selected, otherwise false
    status = selectAddonServicesList.contains(true) ? 'true' : 'false';

    // Create a meal type string based on selected meal types
    mealType = mealTypeswho
            ?.asMap()
            .entries
            .where((entry) => selectAddonServicesList[entry.key])
            .map((entry) =>
                entry.value?.mealType) // Ensure we use the mealType property
            .where((type) => type != null) // Filter out any null values
            .join(',') ??
        ''; // Ensure mealType is not null

    // Debug information
    print("Selected Add-On Services IDs: $selectedAddOnServicesId");
    print("Meal Type: $mealType");
    print("Status: $status");

    // Only include subscriptionType if it is not null or empty
    String stype = subscriptionType != null && subscriptionType.isNotEmpty
        ? subscriptionType
        : '';

    // Recalculate the price based on updated parameters
    calculationprice(
      context: context,
      saPrices: salesPrice ?? '', // Pass the current salesPrice
      cheStatus: status ?? '', // Status will be 'true' or 'false'
      fpId: whoPurhasedata?.foodPackageId.toString() ??
          '', // Ensure fpId is not null
      mType: mealType ?? '', // Use the correctly updated mealType string
      stype: stype, // Only send subscriptionType if it is not null or empty
    );

    LoadingOverlay.of(context).hide();
    notifyListeners();
  }

  /////////////////////////////////////////////////////////////
  CalculationData? calculationdata;

  CalculationRequestModel get calculationRequestModel =>
      CalculationRequestModel(
        foodpackageId: foodpackageId.toString(),
        subscriptionType: selectedTexttype.toString(),
        salePrice: salesPrice.toString(),
        mealType: mealType,
        status: status,
      );
  Future<void> calculationprice({
    required BuildContext context,
    required String saPrices,
    required String mType,
    required String fpId,
    required String stype,
    required String cheStatus,
  }) async {
    salesPrice = saPrices;
    mealType = mType;
    foodpackageId = fpId;
    subscriptionType = stype;
    status = cheStatus;

    // Debug logs to verify parameter values
    log('Sales Price: $salesPrice');
    log('Meal Type: $mealType');
    log('Food Package ID: $foodpackageId');
    log('Subscription Type: $subscriptionType');
    log('Status: $status');

    showLoader(true);

    SharedPreferences pref = await SharedPreferences.getInstance();
    calculationRepo
        .calcluationprice(
            calculationRequestModel, pref.getString("successToken"))
        .then((response) async {
      log('Request URL: ${response.request?.url}');
      log('Response Body: ${response.body}');
      final result =
          CalculationMealResponseModel.fromJson(jsonDecode(response.body));
      if (response.statusCode == 200) {
        log('Calculation Result: ${result.calculationdata}');
        newSalePrice = result.calculationdata?.salePrices.toString() ?? '';
        log('New Sale Price: $newSalePrice');
        showLoader(false);
        notifyListeners();
      } else {
        Utils.showPrimarySnackbar(context, result.message,
            type: SnackType.error);
      }
    }).onError((error, stackTrace) {
      Utils.showPrimarySnackbar(context, error, type: SnackType.debugError);
    }).catchError((Object e) {
      Utils.showPrimarySnackbar(context, e, type: SnackType.debugError);
    });
  }

  void setSelectedTextfood(value, index) {
    selectedTextfood = value;
    selectedTextIndexfood = index;
    notifyListeners();
  }

  void setSelectedTexttype1(context, value, index) {
    selectedTexttype = value;
    selectedTextIndextype = index;
    notifyListeners();

    if (selectedTexttype != null) {
      calculationprice(
        context: context,
        saPrices: salesPrice ?? '',
        cheStatus: status ?? 'true',
        fpId: whoPurhasedata?.foodPackageId.toString() ?? '',
        mType: mealType ?? "",
        stype: '',
      );
    }

    // calculationprice(
    //   context: context,
    //   saPrices: '',
    //   cheStatus: status ?? 'true',
    //   fpId: whoPurhasedata?.foodPackageId.toString() ?? '',
    //   mType: mealType ?? "",
    //   stype: '',
    // );
    notifyListeners();
  }

  void setSelectedTextCalories(value, index) {
    selectedTextcalories = value;
    selectedTextIndexcalories = index;
    notifyListeners();
  }

  DietViewListData? dietviewdata;
  List<FoodPackagesSearch>? foodPackagesSearch;
  // List<String>? mealTypes;
  String? pincode;
  List<ReviewList>? reviewList;

  String allSelectedPrices = '';
  String allSelectedReviews = '';
  String allSelectedServices = '';
  DietViewRequestModel get dietViewRequestModel => DietViewRequestModel(
        foodType: food != "Choose Food Type" ? food : '',
        subscriptionType:
            subscriptionType != "Subscription" ? subscriptionType : '',
        calories: calories != "Calories" ? calories : '',
        searchFood: foodNamesearchController.text,
        userPincode: pincode ?? '',
        mealtypef: allSelectedServices,
        rating: allSelectedReviews,
        prices: allSelectedPrices,
        verifiedCount: allSelectedVerifed ?? '',
      );
  Future<void> foodViewDetails(
    context,
    fName,
    subscType,
    cal,
    fSearch,
    pin,
    // allmeal, allrevices, allprices
  ) async {
    food = fName.toString() != 'Choose Food Type' ? fName.toString() : '';
    subscriptionType =
        subscType.toString() != "Subscription" ? subscType.toString() : '';
    calories = cal.toString() != 'Calories' ? cal.toString() : '';
    foodNamesearchController.text = fSearch ?? '';
    pincode = pin ?? '';
    // allSelectedServices = allmeal;
    // allSelectedReviews = allrevices;
    // allSelectedPrices = allprices;
    showLoader(true);
    SharedPreferences pref = await SharedPreferences.getInstance();
    dietViewRepo
        .dietView(dietViewRequestModel, pref.getString("successToken"))
        .then((response) async {
      debugPrint('/////////////');
      final result = DietViewReponseModel.fromJson(jsonDecode(response.body));
      if (result.status == 200) {
        log(response.body);
        dietviewdata = result.dietviewdata;

        isFavProduct =
            dietviewdata?.foodPackagesSearch?.first.isFavorite == "yes"
                ? true
                : false;

        foodPackagesSearch = result.dietviewdata?.foodPackagesSearch;

        firstRCount = result.ratingCounts?.firstRCount;
        secondRCount = result.ratingCounts?.secondRCount;
        thirdRCount = result.ratingCounts?.thirdRCount;
        fourthRCount = result.ratingCounts?.fourthRCount;
        fifthRCount = result.ratingCounts?.fifthRCount;

        firstPrice = result.priceRange?.firstPrice;
        secondPrice = result.priceRange?.secondPrice;
        thirdPrice = result.priceRange?.thirdPrice;
        fourthPrice = result.priceRange?.fourthPrice;
        fifthPrice = result.priceRange?.fifthPrice;
        sixthPrice = result.priceRange?.sixthPrice;

        // allMealType = result.mealTypeCounts?.allMealType;
        breakfast = result.mealTypeCounts?.breakfast;
        lunch = result.mealTypeCounts?.lunch;
        dinner = result.mealTypeCounts?.dinner;
        noGluten = result.mealTypeCounts?.noGluten;
        zeroSugarD = result.mealTypeCounts?.zeroSugarD;

        print('*************************************');
        print(firstPrice);
        print('*************************************');

        verifiedProviderCount = result.verifiedProviderCount;
        menuList = foodPackagesSearch?.first.menuList;
        mealTypen = menuList?.first.mealTypen;

        mealName = mealTypen?.first.mealName;
        reviewList = foodPackagesSearch?.first.reviewList;

        print("juhujkiuyol,oi;l");
        showLoader(false);
        notifyListeners();
      } else {
        log(response.body);
        // Utils.showPrimarySnackbar(context, result.message,
        // type: SnackType.error);
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

  int offset = 0;
  bool showPaginationLoader = false;

  Future<void> onScrollMaxExtent(context) async {
    showPaginationLoader = true;
    print("hello");
    offset = offset + 1;
    SharedPreferences pref = await SharedPreferences.getInstance();
    print("kkkkkkkkkk");
    dietViewRepo
        .dietView(dietViewRequestModel, pref.getString("successToken"))
        .then((response) {
      log(response.body);
      final result = DietViewReponseModel.fromJson(jsonDecode(response.body));
      if (response.statusCode == 200) {
        print("111111123e24errfsdfs");
        // allShops.clear();
        // packageList = result.data?.packageList;
        dietviewdata = result.dietviewdata;
        isFavProduct =
            dietviewdata?.foodPackagesSearch?.first.isFavorite == "yes"
                ? true
                : false;
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
  ///////////////////////////////////////////////////

  ///////////////////////////////////

  GetWhoPurchaseRequestModel get getWhoPurchaseRequestModel =>
      GetWhoPurchaseRequestModel(
          foodpackageId: foodpackageId ?? '', foodType: food ?? '');
  Future<void> gwtWhoTopUrchase(context, fpId, fName) async {
    foodpackageId = fpId;
    food = fName;

    showLoader(true);

    SharedPreferences pref = await SharedPreferences.getInstance();
    getwhoPurchaseRepo
        .whopurchase(getWhoPurchaseRequestModel, pref.getString("successToken"))
        .then((response) async {
      log('Response Body: ${response.body}');
      final result =
          GetWhoPurchaseReponseModel.fromJson(jsonDecode(response.body));
      if (response.statusCode == 200) {
        log('Who Purchased Data: ${result.whoPurhasedata}');
        whoPurhasedata = result.whoPurhasedata;

        print("object11111111111111111111111111111");
        log(result.whoPurhasedata?.salesPrice ?? '');
        print("object2222222222222222222222222222222222");
        newSalePrice = result.whoPurhasedata?.salesPrice ?? '';
        mealTypeswho = result.mealTypeswho;
        selectAddonServicesList = List.generate(
          mealTypeswho?.length ?? 0,
          (index) => true,
        );
        showLoader(false);
        notifyListeners();
      } else {
        Utils.showPrimarySnackbar(context, result.message,
            type: SnackType.error);
      }
    }).onError((error, stackTrace) {
      Utils.showPrimarySnackbar(context, error, type: SnackType.debugError);
    }).catchError((Object e) {
      Utils.showPrimarySnackbar(context, e, type: SnackType.debugError);
    });
  }

  TextEditingController BirthDateController = TextEditingController();

  void onToDateSelected(date) {
    BirthDateController.text = date;
    notifyListeners();
  }

  TypeSubscriptionRepo typeSubscriptionRepo = TypeSubscriptionRepo();
  List<SubscriptionData>? subscriptiondata;
  Future<void> getSubScriptionType(context) async {
    showLoader(true);
    SharedPreferences pref = await SharedPreferences.getInstance();
    print(pref.getString("successToken"));
    typeSubscriptionRepo
        .typesub(pref.getString("successToken"))
        .then((response) {
      log('Response Body: ${response.body}');
      final result = SubscriptionType.fromJson(
        jsonDecode(response.body),
      );
      if (response.statusCode == 200) {
        if (result.status == 200) {
          subscriptiondata = result.subscriptiondata;
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
    }).catchError((Object e) {
      Utils.showPrimarySnackbar(context, e, type: SnackType.debugError);
    });
  }

  bool isFavProduct = true; //fvrt Product
  Future<void> addToFavMenuFood(
    context,
    packId,
    favtype,
    fName,
    subscType,
    cal,
    fSearch,
    pin,
    //  allmeal, allrevices, allprices
  ) async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    addtoFavFood
        .foodAddFav(
            AddFavFooDRequestModel(
              favtype: "food",
              packageId: packId.toString(),
            ),
            pref.getString("successToken"))
        .then((response) async {
      log("response.body${response.body}");
      final result =
          AddFavFooDResponseMOdel.fromJson(jsonDecode(response.body));
      if (response.statusCode == 200) {
        if (result.status == 200) {
          if (result.favStatus == "added") {
            isFavProduct = true;
            // foodViewDetails(
            //   context, fName, subscType, cal, fSearch, pin,
            //   //  allmeal,
            //   //     allrevices, allprices
            // );
          } else {
            isFavProduct = false;
            // foodViewDetails(
            //   context, fName, subscType, cal, fSearch, pin,
            //   //  allmeal,
            //   //     allrevices, allprices
            // );
          }
          // log('*********************');
          // log(fName);
          // log(subscType);
          // log(cal);
          // log(fSearch);
          // log(pin);
          // foodViewDetails(
          //   context, fName, subscType, cal, fSearch, pin,
          //   //  allmeal,
          //   //     allrevices, allprices
          // );

          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  ),
                  backgroundColor: const Color(0xffF55C5C),
                  scrollable: true,
                  content: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: SvgPicture.asset(
                          'assets/icons/CloseSquare.svg',
                          // width: 30,
                          // alignment: Alignment.topRight,
                        ),
                      ),
                      Center(
                        child: Column(
                          children: [
                            SvgPicture.asset(
                              'assets/icons/favorite.svg',
                              width: 54.w,
                              height: 37.h,
                              // alignment: Alignment.topRight,
                            ),
                            // SizedBox(
                            //   height:
                            //       10.h,
                            // ),
                            Text(
                              "Added to favorites!",
                              style: TextStyle(
                                fontFamily: 'Campton',
                                color: Colors.white,
                                fontSize: 17.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              });
          notifyListeners();
        } else if (result.status == 404) {
          // Handle 404 status code here
          Utils.showPrimarySnackbar(context, result.message,
              type: SnackType.error);
          notifyListeners();
        }
      } else if (result.status == 404) {
        // Handle 404 status code here
        Utils.showPrimarySnackbar(context, result.message,
            type: SnackType.error);
        notifyListeners();
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
  ////////////////////////////////////////////

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

  bool isVerifiedSelected = false;
  String onVerifiedSelected = "";
  String allSelectedVerifed = "";

  void verifiedProvidersCheckBox(bool value, String text) {
    isVerifiedSelected = value;
    if (value) {
      onVerifiedSelected = text;
    } else {
      onVerifiedSelected = '';
    }
    updateVerfiewsdSelected();
    notifyListeners();
  }

  updateVerfiewsdSelected() {
    allSelectedVerifed = '';
    if (onVerifiedSelected.isNotEmpty)
      allSelectedVerifed += onVerifiedSelected + ', ';

    if (allSelectedVerifed.isNotEmpty) {
      allSelectedVerifed =
          allSelectedVerifed.substring(0, allSelectedVerifed.length - 2);
    }

    // log('****************');
    print(allSelectedVerifed);
    log(allSelectedVerifed);
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

  List<MenuList>? menuList;
  List<MealTypen>? mealTypen;
  List<String>? mealName;
  int? expandedMenuIndex;

  void toggleMenuDetails(int index) {
    if (expandedMenuIndex == index) {
      expandedMenuIndex = null; // Collapse if the same item is tapped
    } else {
      expandedMenuIndex = index; // Expand the new item
    }
    notifyListeners(); // Notify listeners to rebuild
  }
}
