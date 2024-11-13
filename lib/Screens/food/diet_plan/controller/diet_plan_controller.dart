// import 'dart:async';
// import 'dart:convert';
// import 'dart:developer';
// import 'package:geocoding/geocoding.dart'; // New package for reverse geocoding

// import 'package:flutter/material.dart';
// import 'package:geocoding/geocoding.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:google_places_flutter/google_places_flutter.dart';
// import 'package:google_places_flutter/model/prediction.dart';
// import 'package:md_health/Screens/food/diet_plan/model/calaries_model.dart';
// import 'package:md_health/Screens/food/diet_plan/model/food_model.dart';
// import 'package:md_health/Screens/food/diet_plan/model/most_used_product.dart';
// import 'package:md_health/Screens/food/diet_plan/model/type_model.dart';
// import 'package:md_health/Screens/food/diet_plan/repositiory/calaries_repo.dart';
// import 'package:md_health/Screens/food/diet_plan/repositiory/food_repo.dart';
// import 'package:md_health/Screens/food/diet_plan/repositiory/most_used_repo.dart';
// import 'package:md_health/Screens/food/diet_plan/repositiory/type_repo.dart';
// import 'package:md_health/Screens/food/diet_plan/view/map.dart';
// import 'package:md_health/Screens/health/home/map_testing.dart';
// import 'package:md_health/Screens/shop/md_shop_home_page/model/ads_model.dart';
// import 'package:md_health/Screens/shop/md_shop_home_page/repository/ads_repo.dart';
// import 'package:md_health/utils/utils.dart';
// // import 'package:provider/dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:geocoding/geocoding.dart'; // New package for reverse geocoding
// import 'package:provider/provider.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class DietPlanController extends ChangeNotifier {
//   bool isLoading = true;
//   String selectedText = '';
//   String selectedTexttype = '';
//   String selectedTextcalaries = '';
//   int selectedTextIndex = -1; // Assuming -1 represents no selection
//   int selectedTextIndextype = -1; // Assuming -1 represents no selection
//   int selectedTextIndexcalories = -1; // Assuming -1 represents no selection
//   TextEditingController foodNamesearchController = TextEditingController();
//   GetFoodRepo getFoodRepo = GetFoodRepo();
//   MostUsedFoodRepo mostUsedFoodRepo = MostUsedFoodRepo();
//   TypeSubscriptionRepo typeSubscriptionRepo = TypeSubscriptionRepo();
//   CaloriesRepo caloriesRepo = CaloriesRepo();
//   List<FoodList>? foodData;
//   List<CaloriesData>? caloriesData;
//   List<SubscriptionData>? subscriptiondata;

//   Future<void> initState(context) async {
//     selectedText = 'Food';
//     selectedTexttype = 'Subscription';
//     selectedTextcalaries = 'Calories';
//     await getFood(context);
//     await getCalories(context);
//     await getSubScriptionType(context);
//     await mostUsedFood(context);
//     adsImage(context);
//     getUserCurrentLocation();
//     notifyListeners();
//   }

//   AdsRepo ddsRepo = AdsRepo();
//   AdsData? adsdata;

//   Future<void> adsImage(context) async {
//     showLoader(true);
//     SharedPreferences pref = await SharedPreferences.getInstance();
//     ddsRepo.ads(pref.getString("successToken")).then((response) async {
//       // log(response.body);
//       debugPrint('/////////////');
//       final result = ShopAdsResponseModel.fromJson(jsonDecode(response.body));
//       if (response.statusCode == 200) {
//         adsdata = result.adsdata;
//         // cityList = result.cityList;
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

//   void setSelectedText(value, index) {
//     selectedText = value;
//     selectedTextIndex = index;
//     notifyListeners();
//   }
//   ///////////setSelectedTextCalories

//   void setSelectedTexttypes(value, index) {
//     selectedTexttype = value;
//     selectedTextIndextype = index;
//     notifyListeners();
//   }

//   ////////////
//   void setSelectedTextCalories(value, index) {
//     selectedTextcalaries = value;
//     selectedTextIndexcalories = index;
//     notifyListeners();
//   }

//   showLoader(value) {
//     isLoading = value;
//     notifyListeners();
//   }

//   Future<void> getFood(context) async {
//     showLoader(true);
//     SharedPreferences pref = await SharedPreferences.getInstance();
//     print(pref.getString("successToken"));
//     getFoodRepo.getfood(pref.getString("successToken")).then((response) {
//       log(response.body);
//       final result = FoodResponseModel.fromJson(
//         jsonDecode(response.body),
//       );
//       if (response.statusCode == 200) {
//         if (result.status == 200) {
//           foodData = result.foodData;

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

//   //////////////////////////////////////////////////////////////////////////////
//   List<MostUsedData>? mostuseddata;

//   Future<void> mostUsedFood(context) async {
//     showLoader(true);
//     SharedPreferences pref = await SharedPreferences.getInstance();
//     print(pref.getString("successToken"));
//     mostUsedFoodRepo.mostFood(pref.getString("successToken")).then((response) {
//       log(response.body);
//       final result = MostUsedProviderFoodResponseModel.fromJson(
//         jsonDecode(response.body),
//       );
//       if (response.statusCode == 200) {
//         if (result.status == 200) {
//           mostuseddata = result.mostuseddata;

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

// /////////////////////////////////////////////////////////////////////////////////////
//   Future<void> getCalories(context) async {
//     showLoader(true);
//     SharedPreferences pref = await SharedPreferences.getInstance();
//     print(pref.getString("successToken"));
//     caloriesRepo.calariesData(pref.getString("successToken")).then((response) {
//       log(response.body);
//       final result = CaloriesResponseModel.fromJson(
//         jsonDecode(response.body),
//       );
//       if (response.statusCode == 200) {
//         if (result.status == 200) {
//           caloriesData = result.caloriesData;

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

// //////////////////////////////////////////////\
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

// /////////////////////////////////////////////////////////////
//   // GoogleMapController? mapController;
//   // LatLng? currentPosition; // Will store the user's current location
//   // LatLng? selectedPosition;
//   // String? selectedAddress;
//   // String? selectedPinCode;
//   // Marker? currentLocationMarker; // Marker for current location
//   // Future<void> getUserCurrentLocation() async {
//   //   bool serviceEnabled;
//   //   LocationPermission permission;

//   //   // Check if location services are enabled
//   //   serviceEnabled = await Geolocator.isLocationServiceEnabled();
//   //   if (!serviceEnabled) {
//   //     // Location services are not enabled, handle it accordingly
//   //     return;
//   //   }

//   //   // Check for location permissions
//   //   permission = await Geolocator.checkPermission();
//   //   if (permission == LocationPermission.denied) {
//   //     permission = await Geolocator.requestPermission();
//   //     if (permission == LocationPermission.denied) {
//   //       // Permissions are denied, handle it accordingly
//   //       return;
//   //     }
//   //   }

//   //   if (permission == LocationPermission.deniedForever) {
//   //     // Permissions are denied forever, handle it accordingly
//   //     return;
//   //   }

//   //   // Get the current position of the user
//   //   Position position = await Geolocator.getCurrentPosition(
//   //       desiredAccuracy: LocationAccuracy.high);

//   //   // setState(() {
//   //   // Set the initial position to the user's current location
//   //   currentPosition = LatLng(position.latitude, position.longitude);
//   //   currentLocationMarker = Marker(
//   //     markerId: MarkerId('current_location'),
//   //     position: currentPosition!,
//   //     infoWindow: InfoWindow(title: 'Your Location'),
//   //   );
//   //   notifyListeners();
//   //   // });
//   // }

//   // void openBottomSheet(BuildContext context) {
//   //   showModalBottomSheet(
//   //     context: context,
//   //     isScrollControlled: true,
//   //     builder: (BuildContext context) {
//   //       return StatefulBuilder(builder: (context, setModalState) {
//   //         return Container(
//   //           height: MediaQuery.of(context).size.height * 0.7,
//   //           child: Column(
//   //             children: [
//   //               Expanded(
//   //                 child: currentPosition == null
//   //                     ? Center(
//   //                         child:
//   //                             CircularProgressIndicator()) // Show loader while fetching location
//   //                     : GoogleMap(
//   //                         initialCameraPosition: CameraPosition(
//   //                           target: currentPosition!,
//   //                           zoom: 14.0,
//   //                         ),
//   //                         onMapCreated: (controller) {
//   //                           mapController = controller;
//   //                           // Move camera to the current position
//   //                           mapController?.moveCamera(
//   //                             CameraUpdate.newLatLng(currentPosition!),
//   //                           );
//   //                         },
//   //                         onTap: (position) async {
//   //                           setModalState(() {
//   //                             selectedPosition = position;
//   //                           });

//   //                           // Get the address and pin code from the selected position
//   //                           await getAddressFromLatLng(position, setModalState);
//   //                         },
//   //                         markers: currentPosition != null
//   //                             ? {
//   //                                 currentLocationMarker!,
//   //                                 if (selectedPosition != null)
//   //                                   Marker(
//   //                                     markerId: MarkerId('selected_location'),
//   //                                     position: selectedPosition!,
//   //                                   ),
//   //                               }
//   //                             : {},
//   //                       ),
//   //               ),
//   //               Padding(
//   //                 padding: EdgeInsets.all(15),
//   //                 child: Column(
//   //                   crossAxisAlignment: CrossAxisAlignment.start,
//   //                   children: [
//   //                     if (selectedAddress != null)
//   //                       Text(
//   //                         'Selected Address: $selectedAddress',
//   //                         style: TextStyle(fontWeight: FontWeight.w600),
//   //                       ),
//   //                     if (selectedPinCode != null)
//   //                       Text('Pin Code: $selectedPinCode'),
//   //                     SizedBox(height: 20),
//   //                     ElevatedButton(
//   //                       onPressed: selectedPosition != null
//   //                           ? () {
//   //                               // Save selected location and address
//   //                               Navigator.pop(context);
//   //                               print('Selected Address: $selectedAddress');
//   //                               print('Pin Code: $selectedPinCode');
//   //                             }
//   //                           : null,
//   //                       child: Text('Confirm Location'),
//   //                     ),
//   //                   ],
//   //                 ),
//   //               ),
//   //             ],
//   //           ),
//   //         );
//   //       });
//   //     },
//   //   );
//   // }

//   // Future<void> getAddressFromLatLng(
//   //     LatLng position, Function setModalState) async {
//   //   try {
//   //     // Use the geocoding package's placemarkFromCoordinates
//   //     List<Placemark> placemarks = await placemarkFromCoordinates(
//   //       position.latitude,
//   //       position.longitude,
//   //     );

//   //     Placemark place = placemarks[0];

//   //     setModalState(() {
//   //       selectedAddress =
//   //           "${place.street}, ${place.locality}, ${place.country}";
//   //       selectedPinCode = place.postalCode;
//   //     });
//   //   } catch (e) {
//   //     print(e);
//   //   }
//   // // }
//   // GoogleMapController? mapController;
//   // LatLng? initialPosition;
//   // LatLng? selectedPosition;
//   // Marker? currentLocationMarker;
//   // String? selectedAddress;
//   // String? selectedPinCode;
//   // TextEditingController searchController = TextEditingController();
//   // Future<void> getUserCurrentLocation() async {
//   //   bool serviceEnabled;
//   //   LocationPermission permission;
//   //   serviceEnabled = await Geolocator.isLocationServiceEnabled();
//   //   if (!serviceEnabled) {
//   //     return;
//   //   }
//   //   permission = await Geolocator.checkPermission();
//   //   if (permission == LocationPermission.denied) {
//   //     permission = await Geolocator.requestPermission();
//   //     if (permission == LocationPermission.denied) {
//   //       return;
//   //     }
//   //   }
//   //   if (permission == LocationPermission.deniedForever) {
//   //     return;
//   //   }
//   //   Position position = await Geolocator.getCurrentPosition(
//   //       desiredAccuracy: LocationAccuracy.high);
//   //   initialPosition = LatLng(position.latitude, position.longitude);
//   //   selectedPosition = initialPosition;
//   //   currentLocationMarker = Marker(
//   //     markerId: const MarkerId('current_location'),
//   //     position: initialPosition!,
//   //     infoWindow: const InfoWindow(title: 'Your Location'),
//   //   );
//   //   notifyListeners();
//   // }

//   // void openBottomSheet(BuildContext context) {
//   //   showModalBottomSheet(
//   //     context: context,
//   //     isScrollControlled: true,
//   //     builder: (BuildContext context) {
//   //       return StatefulBuilder(builder: (context, setModalState) {
//   //         return Container(
//   //           height: MediaQuery.of(context).size.height * 0.7,
//   //           child: Column(
//   //             children: [
//   //               // _buildSearchBar(setModalState),
//   //               Expanded(
//   //                 child: initialPosition == null
//   //                     ? const Center(child: CircularProgressIndicator())
//   //                     : GoogleMap(
//   //                         initialCameraPosition: CameraPosition(
//   //                           target: initialPosition!,
//   //                           zoom: 13.5,
//   //                         ),
//   //                         onMapCreated: (controller) {
//   //                           mapController = controller;
//   //                         },
//   //                         onTap: (position) async {
//   //                           setModalState(() {
//   //                             selectedPosition = position;
//   //                           });

//   //                           // Get the address and pin code from the selected position
//   //                           await getAddressFromLatLng(position, setModalState);
//   //                         },
//   //                         markers: currentLocationMarker != null
//   //                             ? {
//   //                                 currentLocationMarker!,
//   //                                 if (selectedPosition != null)
//   //                                   Marker(
//   //                                     markerId:
//   //                                         const MarkerId('selected_location'),
//   //                                     position: selectedPosition!,
//   //                                   ),
//   //                               }
//   //                             : {},
//   //                       ),
//   //               ),
//   //               Padding(
//   //                 padding: const EdgeInsets.all(15),
//   //                 child: Column(
//   //                   crossAxisAlignment: CrossAxisAlignment.start,
//   //                   children: [
//   //                     if (selectedAddress != null)
//   //                       Text(
//   //                         'Selected Address: $selectedAddress',
//   //                         style: const TextStyle(fontWeight: FontWeight.w600),
//   //                       ),
//   //                     if (selectedPinCode != null)
//   //                       Text('Pin Code: $selectedPinCode'),
//   //                     const SizedBox(height: 20),
//   //                     ElevatedButton(
//   //                       onPressed: selectedPosition != null
//   //                           ? () {
//   //                               // Save selected location and address
//   //                               Navigator.pop(context);
//   //                               print('Selected Address: $selectedAddress');
//   //                               print('Pin Code: $selectedPinCode');
//   //                             }
//   //                           : null,
//   //                       child: const Text('Confirm Location'),
//   //                     ),
//   //                   ],
//   //                 ),
//   //               ),
//   //             ],
//   //           ),
//   //         );
//   //       });
//   //     },
//   //   );
//   // }

//   // Future<void> getAddressFromLatLng(
//   //     LatLng position, Function setModalState) async {
//   //   try {
//   //     List<Placemark> placemarks =
//   //         await placemarkFromCoordinates(position.latitude, position.longitude);

//   //     Placemark place = placemarks[0];

//   //     setModalState(() {
//   //       selectedAddress =
//   //           "${place.street}, ${place.locality}, ${place.country}";
//   //       selectedPinCode = place.postalCode;
//   //     });
//   //   } catch (e) {
//   //     print(e);
//   //   }
//   // }
//   // GoogleMapController? mapController;
//   // LatLng? initialPosition;
//   // LatLng? selectedPosition;
//   // Marker? currentLocationMarker;
//   // String? selectedAddress;
//   // String? selectedPinCode;
//   // TextEditingController searchController = TextEditingController();

//   // Future<void> getUserCurrentLocation() async {
//   //   bool serviceEnabled;
//   //   LocationPermission permission;

//   //   serviceEnabled = await Geolocator.isLocationServiceEnabled();
//   //   if (!serviceEnabled) {
//   //     return;
//   //   }

//   //   permission = await Geolocator.checkPermission();
//   //   if (permission == LocationPermission.denied) {
//   //     permission = await Geolocator.requestPermission();
//   //     if (permission == LocationPermission.denied) {
//   //       return;
//   //     }
//   //   }

//   //   if (permission == LocationPermission.deniedForever) {
//   //     return;
//   //   }

//   //   Position position = await Geolocator.getCurrentPosition(
//   //       desiredAccuracy: LocationAccuracy.high);
//   //   initialPosition = LatLng(position.latitude, position.longitude);
//   //   selectedPosition = initialPosition;

//   //   currentLocationMarker = Marker(
//   //     markerId: const MarkerId('current_location'),
//   //     position: initialPosition!,
//   //     infoWindow: const InfoWindow(title: 'Your Location'),
//   //   );

//   //   notifyListeners();
//   // }

//   // Future<void> getAddressFromLatLng(LatLng position) async {
//   //   try {
//   //     List<Placemark> placemarks =
//   //         await placemarkFromCoordinates(position.latitude, position.longitude);

//   //     Placemark place = placemarks[0];

//   //     selectedAddress = "${place.street}, ${place.locality}, ${place.country}";
//   //     selectedPinCode = place.postalCode;

//   //     notifyListeners();
//   //   } catch (e) {
//   //     print(e);
//   //   }
//   // }

//   // void openBottomSheet(BuildContext context) {
//   //   showModalBottomSheet(
//   //       context: context,
//   //       isScrollControlled: true,
//   //       builder: (BuildContext context) {
//   //         return Container(
//   //           height: MediaQuery.of(context).size.height * 0.7,
//   //           child: Column(
//   //             children: [
//   //               Expanded(
//   //                 child: initialPosition == null
//   //                     ? const Center(child: CircularProgressIndicator())
//   //                     : GoogleMap(
//   //                         initialCameraPosition: CameraPosition(
//   //                           target: initialPosition!,
//   //                           zoom: 13.5,
//   //                         ),
//   //                         onMapCreated: (controller) {
//   //                           mapController = controller;
//   //                         },
//   //                         onTap: (position) async {
//   //                           selectedPosition = position;

//   //                           // Get the address and pin code from the selected position
//   //                           await getAddressFromLatLng(position);
//   //                         },
//   //                         markers: currentLocationMarker != null
//   //                             ? {
//   //                                 currentLocationMarker!,
//   //                                 if (selectedPosition != null)
//   //                                   Marker(
//   //                                     markerId:
//   //                                         const MarkerId('selected_location'),
//   //                                     position: selectedPosition!,
//   //                                   ),
//   //                               }
//   //                             : {},
//   //                       ),
//   //               ),
//   //               Padding(
//   //                 padding: const EdgeInsets.all(15),
//   //                 child: Column(
//   //                   crossAxisAlignment: CrossAxisAlignment.start,
//   //                   children: [
//   //                     if (selectedAddress != null)
//   //                       Text(
//   //                         'Selected Address: ${selectedAddress}',
//   //                         style: const TextStyle(fontWeight: FontWeight.w600),
//   //                       ),
//   //                     if (selectedPinCode != null)
//   //                       Text('Pin Code: ${selectedPinCode}'),
//   //                     const SizedBox(height: 20),
//   //                     ElevatedButton(
//   //                       onPressed: selectedPosition != null
//   //                           ? () {
//   //                               // Save selected location and address
//   //                               Navigator.pop(context);
//   //                               print('Selected Address: ${selectedAddress}');
//   //                               print('Pin Code: ${selectedPinCode}');
//   //                             }
//   //                           : null,
//   //                       child: const Text('Confirm Location'),
//   //                     ),
//   //                   ],
//   //                 ),
//   //               ),
//   //             ],
//   //           ),
//   //         );
//   //       });
//   // }
// //   import 'package:flutter/material.dart';
// // import 'package:google_maps_flutter/google_maps_flutter.dart';
// // import 'package:geolocator/geolocator.dart';
// // import 'package:geocoding/geocoding.dart';

// // class MapProvider extends ChangeNotifier {
//   GoogleMapController? mapController;
//   LatLng? initialPosition;
//   LatLng? selectedPosition;
//   Marker? currentLocationMarker;
//   Marker? selectedLocationMarker;
//   String? selectedAddress;
//   String? selectedPinCode;
//   TextEditingController searchController = TextEditingController();

//   Future<void> getUserCurrentLocation() async {
//     bool serviceEnabled;
//     LocationPermission permission;

//     serviceEnabled = await Geolocator.isLocationServiceEnabled();
//     if (!serviceEnabled) {
//       return;
//     }

//     permission = await Geolocator.checkPermission();
//     if (permission == LocationPermission.denied) {
//       permission = await Geolocator.requestPermission();
//       if (permission == LocationPermission.denied) {
//         return;
//       }
//     }

//     if (permission == LocationPermission.deniedForever) {
//       return;
//     }

//     Position position = await Geolocator.getCurrentPosition(
//         desiredAccuracy: LocationAccuracy.high);
//     initialPosition = LatLng(position.latitude, position.longitude);
//     selectedPosition = initialPosition;

//     currentLocationMarker = Marker(
//       markerId: const MarkerId('current_location'),
//       position: initialPosition!,
//       infoWindow: const InfoWindow(title: 'Your Location'),
//     );

//     notifyListeners();
//   }

//   Future<void> getAddressFromLatLng(LatLng position) async {
//     try {
//       List<Placemark> placemarks =
//           await placemarkFromCoordinates(position.latitude, position.longitude);

//       Placemark place = placemarks[0];

//       selectedAddress = "${place.street}, ${place.locality}, ${place.country}";
//       selectedPinCode = place.postalCode;

//       selectedLocationMarker = Marker(
//         markerId: const MarkerId('selected_location'),
//         position: position,
//         infoWindow: InfoWindow(
//           title: 'Selected Location',
//           snippet: '${place.street}, ${place.locality}, ${place.country}',
//         ),
//       );

//       notifyListeners();
//     } catch (e) {
//       print(e);
//     }
//   }

//   void openBottomSheet(BuildContext context) {
//     showModalBottomSheet(
//       context: context,
//       isScrollControlled: true,
//       builder: (BuildContext context) {
//         return Consumer<DietPlanController>(
//             builder: (context, provider, child) {
//           return Container(
//             height: MediaQuery.of(context).size.height * 0.7,
//             child: Column(
//               children: [
//                 Expanded(
//                   child: provider.initialPosition == null
//                       ? const Center(child: CircularProgressIndicator())
//                       : GoogleMap(
//                           initialCameraPosition: CameraPosition(
//                             target: provider.initialPosition!,
//                             zoom: 13.5,
//                           ),
//                           onMapCreated: (controller) {
//                             provider.mapController = controller;
//                           },
//                           onTap: (position) async {
//                             provider.selectedPosition = position;
//                             await provider.getAddressFromLatLng(position);
//                           },
//                           markers: {
//                             if (provider.currentLocationMarker != null)
//                               provider.currentLocationMarker!,
//                             if (provider.selectedLocationMarker != null)
//                               provider.selectedLocationMarker!,
//                           },
//                         ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(15),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       if (provider.selectedAddress != null)
//                         Text(
//                           'Selected Address: ${provider.selectedAddress}',
//                           style: const TextStyle(fontWeight: FontWeight.w600),
//                         ),
//                       if (provider.selectedPinCode != null)
//                         Text('Pin Code: ${provider.selectedPinCode}'),
//                       const SizedBox(height: 20),
//                       ElevatedButton(
//                         onPressed: provider.selectedPosition != null
//                             ? () {
//                                 // Save selected location and address
//                                 Navigator.pop(context);
//                                 print(
//                                     'Selected Address: ${provider.selectedAddress}');
//                                 print('Pin Code: ${provider.selectedPinCode}');
//                               }
//                             : null,
//                         child: const Text('Confirm Location'),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           );
//         });
//       },
//     );
//   }
// }
import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:geocoding/geocoding.dart'; // New package for reverse geocoding

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_places_flutter/google_places_flutter.dart';
import 'package:google_places_flutter/model/prediction.dart';
import 'package:md_health/Screens/food/diet_plan/model/calaries_model.dart';
import 'package:md_health/Screens/food/diet_plan/model/food_model.dart';
import 'package:md_health/Screens/food/diet_plan/model/most_used_product.dart';
import 'package:md_health/Screens/food/diet_plan/model/type_model.dart';
import 'package:md_health/Screens/food/diet_plan/repositiory/calaries_repo.dart';
import 'package:md_health/Screens/food/diet_plan/repositiory/food_repo.dart';
import 'package:md_health/Screens/food/diet_plan/repositiory/most_used_repo.dart';
import 'package:md_health/Screens/food/diet_plan/repositiory/type_repo.dart';
import 'package:md_health/Screens/food/diet_plan/view/map.dart';
import 'package:md_health/Screens/health/home/map_testing.dart';
import 'package:md_health/Screens/shop/md_shop_home_page/model/ads_model.dart';
import 'package:md_health/Screens/shop/md_shop_home_page/repository/ads_repo.dart';
import 'package:md_health/utils/utils.dart';
// import 'package:provider/dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart'; // New package for reverse geocoding
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DietPlanController extends ChangeNotifier {
  bool isLoading = true;
  String selectedText = '';
  String selectedTexttype = '';
  String selectedTextcalaries = '';
  int selectedTextIndex = -1; // Assuming -1 represents no selection
  int selectedTextIndextype = -1; // Assuming -1 represents no selection
  int selectedTextIndexcalories = -1; // Assuming -1 represents no selection
  TextEditingController foodNamesearchController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  GetFoodRepo getFoodRepo = GetFoodRepo();
  MostUsedFoodRepo mostUsedFoodRepo = MostUsedFoodRepo();
  TypeSubscriptionRepo typeSubscriptionRepo = TypeSubscriptionRepo();
  CaloriesRepo caloriesRepo = CaloriesRepo();
  List<FoodList>? foodData;
  List<CaloriesData>? caloriesData;
  List<SubscriptionData>? subscriptiondata;

  void setSelectedAddress(String? selectedLocation) {
    addressController.text = selectedLocation ?? '';
  }

  Future<void> initState(context) async {
    selectedText = 'Choose Food Type';
    selectedTexttype = '';
    selectedTextcalaries = 'Calories';
    selectedTextIndex = -1;
    await getFood(context);
    await getCalories(context);
    await getSubScriptionType(context);
    await mostUsedFood(context);
    adsImage(context);
    await initializeUserLocation();
    // getUserCurrentLocation();
    notifyListeners();
  }

  AdsRepo ddsRepo = AdsRepo();
  AdsData? adsdata;

  Future<void> adsImage(context) async {
    showLoader(true);
    SharedPreferences pref = await SharedPreferences.getInstance();
    ddsRepo.ads(pref.getString("successToken")).then((response) async {
      // log(response.body);
      debugPrint('/////////////');
      final result = ShopAdsResponseModel.fromJson(jsonDecode(response.body));
      if (response.statusCode == 200) {
        adsdata = result.adsdata;
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

  void setSelectedText(value, index) {
    selectedText = value;
    selectedTextIndex = index;
    notifyListeners();
  }
  ///////////setSelectedTextCalories

  void setSelectedTexttypes(value, index) {
    selectedTexttype = value;
    selectedTextIndextype = index;
    notifyListeners();
  }

  ////////////
  void setSelectedTextCalories(value, index) {
    selectedTextcalaries = value;
    selectedTextIndexcalories = index;
    notifyListeners();
  }

  showLoader(value) {
    isLoading = value;
    notifyListeners();
  }

  Future<void> getFood(context) async {
    showLoader(true);
    SharedPreferences pref = await SharedPreferences.getInstance();
    print(pref.getString("successToken"));
    getFoodRepo.getfood(pref.getString("successToken")).then((response) {
      log(response.body);
      final result = FoodResponseModel.fromJson(
        jsonDecode(response.body),
      );
      if (response.statusCode == 200) {
        if (result.status == 200) {
          foodData = result.foodData;

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

  //////////////////////////////////////////////////////////////////////////////
  List<MostUsedData>? mostuseddata;

  Future<void> mostUsedFood(context) async {
    showLoader(true);
    SharedPreferences pref = await SharedPreferences.getInstance();
    print(pref.getString("successToken"));
    mostUsedFoodRepo.mostFood(pref.getString("successToken")).then((response) {
      log(response.body);
      final result = MostUsedProviderFoodResponseModel.fromJson(
        jsonDecode(response.body),
      );
      if (response.statusCode == 200) {
        if (result.status == 200) {
          mostuseddata = result.mostuseddata;

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

/////////////////////////////////////////////////////////////////////////////////////
  Future<void> getCalories(context) async {
    showLoader(true);
    SharedPreferences pref = await SharedPreferences.getInstance();
    print(pref.getString("successToken"));
    caloriesRepo.calariesData(pref.getString("successToken")).then((response) {
      log(response.body);
      final result = CaloriesResponseModel.fromJson(
        jsonDecode(response.body),
      );
      if (response.statusCode == 200) {
        if (result.status == 200) {
          caloriesData = result.caloriesData;

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

//////////////////////////////////////////////\
  Future<void> getSubScriptionType(context) async {
    showLoader(true);
    SharedPreferences pref = await SharedPreferences.getInstance();
    print(pref.getString("successToken"));
    typeSubscriptionRepo
        .typesub(pref.getString("successToken"))
        .then((response) {
      log(response.body);
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

  LatLng? userLocation;
  String? currentLocationText;
  String? pinCode;
  GoogleMapController? mapController;
  Set<Marker> markers = {};

  void setMapController(GoogleMapController controller) {
    mapController = controller;
    initializeUserLocation();
  }

  Future<void> initializeUserLocation() async {
    final locationData = await Geolocator.getCurrentPosition();

    userLocation = LatLng(locationData.latitude, locationData.longitude);
    markers.clear();
    markers.add(
      Marker(
        markerId: MarkerId('userLocation'),
        position: userLocation!,
        infoWindow: InfoWindow(title: 'Your Location'),
      ),
    );

    mapController?.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
      target: userLocation!,
      zoom: 15,
    )));

    final textData = await getAddressFromLatLng(
        userLocation!.latitude, userLocation!.longitude);
    currentLocationText = textData;

    await getPinCodeFromLatLng(userLocation!.latitude, userLocation!.longitude);

    print("Initial pincode: $pinCode");

    notifyListeners();
  }

  Future<void> onMapTap(LatLng tapPosition) async {
    userLocation = tapPosition;
    markers.clear();
    markers.add(
      Marker(
        markerId: MarkerId('userLocation'),
        position: userLocation!,
        infoWindow: InfoWindow(title: 'Your Location'),
      ),
    );
    final textData = await getAddressFromLatLng(
        userLocation!.latitude, userLocation!.longitude);
    currentLocationText = textData;
    await getPinCodeFromLatLng(userLocation!.latitude, userLocation!.longitude);

    notifyListeners();
  }

  Future<void> getPinCodeFromLatLng(double latitude, double longitude) async {
    try {
      List<Placemark> placemarks =
          await placemarkFromCoordinates(latitude, longitude);

      if (placemarks.isNotEmpty) {
        pinCode = placemarks.first.postalCode; // Get the pin code
      }
    } catch (e) {
      print("Error fetching pin code: $e");
    }
  }

  Future<String> getAddressFromLatLng(double latitude, double longitude) async {
    try {
      List<Placemark> placemarks =
          await placemarkFromCoordinates(latitude, longitude);

      address = '';

      if (placemarks.isNotEmpty) {
        var streets = placemarks.reversed
            .map((placemark) => placemark.street)
            .where((street) => street != null);

        streets = streets.where((street) =>
            street!.toLowerCase() !=
            placemarks.reversed.last.locality!.toLowerCase());
        streets = streets.where((street) => !street!.contains('+'));

        address += streets.join(', ');

        address += ', ${placemarks.reversed.last.subLocality ?? ''}';
      }
      print('address');
      print(address);

      return address;
    } catch (e) {
      print("Error fetching address: $e");
      return "Failed to get address";
    }
  }

  void submit(context) {
    if (pinCode != null) {
      print('Selected pin code: $pinCode');
      // Perform any additional actions with the pin code here
    } else {
      // print('No pin code selected');
      Utils.showPrimarySnackbar(context, "Please Select Location",
          type: SnackType.success);
    }
  }

  Future<void> searchLocation(String query) async {
    try {
      // Use the Geocoding package to search for the location
      List<Location> locations = await locationFromAddress(query);
      if (locations.isNotEmpty) {
        LatLng newLocation =
            LatLng(locations.first.latitude, locations.first.longitude);
        userLocation = newLocation;
        mapController?.animateCamera(CameraUpdate.newLatLng(newLocation));

        markers.clear();
        markers.add(
          Marker(
            markerId: MarkerId('searchedLocation'),
            position: newLocation,
            infoWindow: InfoWindow(title: 'Searched Location'),
          ),
        );

        final addressText = await getAddressFromLatLng(
            newLocation.latitude, newLocation.longitude);
        currentLocationText = addressText;

        notifyListeners();
      }
    } catch (e) {
      print("Error searching location: $e");
    }
  }

  String address = ''; // New variable to store the formatted address
}
