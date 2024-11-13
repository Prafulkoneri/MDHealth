// // // import 'dart:convert';
// // // import 'dart:developer';
// // // import 'package:flutter/material.dart';
// // // import 'package:md_health/Screens/packages/model/hote_model.dart';
// // // import 'package:md_health/Screens/packages/model/package_detail_view_model.dart';
// // // import 'package:md_health/Screens/packages/model/tour_model.dart';
// // // import 'package:md_health/Screens/packages/model/transportation_model.dart';
// // // import 'package:md_health/Screens/packages/repository/active_package_repo.dart';
// // // import 'package:md_health/Screens/packages/repository/cancelled_package_repo.dart';
// // // import 'package:md_health/Screens/packages/repository/complete_package_repo.dart';
// // // import 'package:md_health/Screens/packages/repository/hotel_repo.dart';
// // // import 'package:md_health/Screens/packages/repository/package_detail_view_repo.dart';
// // // import 'package:md_health/Screens/packages/repository/tour_details_repo.dart';
// // // import 'package:md_health/Screens/packages/repository/transpotation_repo.dart';
// // // import 'package:md_health/Screens/packages/view/view_detail_pop_up_view.dart';
// // // import 'package:md_health/Screens/packages/view/view_details_tour_.dart';
// // // import 'package:md_health/Screens/packages/view/view_details_transport_view.dart';
// // // import 'package:md_health/utils/utils.dart';
// // // import 'package:shared_preferences/shared_preferences.dart';

// // // class PackageDetailViewController extends ChangeNotifier {
// // //   PackageDetailViewRepo packagedetailViewRepo = PackageDetailViewRepo();
// // //   HotelViewDetailsRepo hotelViewDetailsRepo = HotelViewDetailsRepo();
// // //   TourDetailsRepo tourDetailsRepo = TourDetailsRepo();

// // //   TransportationRepo transportationRepo = TransportationRepo();
// // //   String hotelId = '';
// // //   String transportId = '';
// // //   String tourId = '';

// // //   String packageId = '';
// // //   String purcheseId = '';
// // //   bool isLoading = true;
// // //   CustomerPurchasePackageList? customerPurchasePackageList;
// // //   List<OtherService>? otherServices;
// // //   // void onViewDetailPressed(){
// // //   //   isTabChanged=true;
// // //   //   notifyListeners();
// // //   // }

// // //   Future<void> initState(context, pId, purchesId, hId, tId, toId) async {
// // //     packageDetailsView(context, pId, purchesId);
// // //     ViewHotelPackageDetails(
// // //       context,
// // //       hId,
// // //     );
// // //     ViewTransportationPackageDetails(
// // //       context,
// // //       tId,
// // //     );
// // //     ViewTourDetailsPackageDetails(
// // //       context,
// // //       toId,
// // //     );
// // //     print("object");
// // //     print("${customerPurchasePackageList?.companyLogoImagePathS ?? ""}");
// // //     print(customerPurchasePackageList?.cityName);
// // //     print("object");
// // //     // getPaymentDetailsList(context, pId);
// // //     notifyListeners();
// // //   }

// // // /////////////////////////////

// // //   showLoader(value) {
// // //     isLoading = value;
// // //     notifyListeners();
// // //   }

// // //   PackageDetailViewRequestModel get packageDetailViewRequestModel =>
// // //       PackageDetailViewRequestModel(
// // //           purchesId: purcheseId.toString(), packageId: packageId);
// // //   Future<void> packageDetailsView(context, pId, purchesId) async {
// // //     showLoader(true);
// // //     packageId = pId;
// // //     purcheseId = purchesId;
// // //     SharedPreferences pref = await SharedPreferences.getInstance();
// // //     packagedetailViewRepo
// // //         .packageDetails(
// // //             packageDetailViewRequestModel, pref.getString("successToken"))
// // //         .then((response) async {
// // //       // log(response.body);
// // //       debugPrint('/////////////');
// // //       final result =
// // //           PackageDetailViewResponseModel.fromJson(jsonDecode(response.body));
// // //       if (response.statusCode == 200) {
// // //         log(response.body);

// // //         customerPurchasePackageList = result.customerPurchasePackageList;
// // //         otherServices = result.otherServices;
// // //         print("juhujkiuyol,oi;l");
// // //         print("juhujkiuyol,oi;l");
// // //         print(customerPurchasePackageList?.companyLogoImagePathS ?? "");
// // //         print(customerPurchasePackageList?.companyName);

// // //         print("juhujkiuyol,oi;l");
// // //         showLoader(false);
// // //         notifyListeners();
// // //       } else {
// // //         log(response.body);
// // //         Utils.showPrimarySnackbar(context, result.message,
// // //             type: SnackType.error);
// // //       }
// // //     }).onError((error, stackTrace) {
// // //       Utils.showPrimarySnackbar(context, error, type: SnackType.debugError);
// // //     }).catchError(
// // //       (Object e) {
// // //         Utils.showPrimarySnackbar(context, e, type: SnackType.debugError);
// // //       },
// // //       test: (Object e) {
// // //         Utils.showPrimarySnackbar(context, e, type: SnackType.debugError);
// // //         return false;
// // //       },
// // //     );
// // //   }
// // //   ///////////////
// // //   //  HotelRequestMOdel get hotelRequestMOdel =>
// // //   //     HotelRequestMOdel(hotelId: hotelId.toString(),

// // //   //     );
// // //   HotelList? hotelList;

// // //   HotelRequestMOdel get hotelRequestMOdel => HotelRequestMOdel(
// // //         id: hotelId.toString(),
// // //       );
// // //   Future<void> ViewHotelPackageDetails(
// // //     context,
// // //     hId,
// // //   ) async {
// // //     hotelId = hId.toString();

// // //     showLoader(true);
// // //     SharedPreferences pref = await SharedPreferences.getInstance();
// // //     hotelViewDetailsRepo
// // //         .hotelView(hotelRequestMOdel, pref.getString("successToken"))
// // //         .then((response) async {
// // //       final result = HotelReposonseMOdel.fromJson(jsonDecode(response.body));
// // //       if (response.statusCode == 200) {
// // //         hotelList = result.hotelList;
// // //         // Navigator.push(
// // //         //   context,
// // //         //   MaterialPageRoute(
// // //         //     builder: (context) =>
// // //         //         PackageViewDetailsPagepopUp(hotelId: hotelId.toString()),
// // //         //   ),
// // //         // );

// // //         showLoader(false);
// // //         notifyListeners();
// // //       }
// // //       notifyListeners();
// // //     }).onError((error, stackTrace) {
// // //       Utils.showPrimarySnackbar(context, error, type: SnackType.debugError);
// // //     }).catchError(
// // //       (Object e) {
// // //         Utils.showPrimarySnackbar(context, e, type: SnackType.debugError);
// // //       },
// // //       test: (Object e) {
// // //         Utils.showPrimarySnackbar(context, e, type: SnackType.debugError);
// // //         return false;
// // //       },
// // //     );
// // //   }

// // //   ///////////////////////////////////////////////////////tourDetailsRepo transportationRepo
// // //   TransportationDetails? transportationDetails;
// // //   List<String>? otherServicest;

// // //   TransportationRequestModel get transportationRequestModel =>
// // //       TransportationRequestModel(
// // //         id: transportId.toString(),
// // //       );
// // //   Future<void> ViewTransportationPackageDetails(
// // //     context,
// // //     tId,
// // //   ) async {
// // //     transportId = tId.toString();

// // //     showLoader(true);
// // //     SharedPreferences pref = await SharedPreferences.getInstance();
// // //     transportationRepo
// // //         .transPortation(
// // //             transportationRequestModel, pref.getString("successToken"))
// // //         .then((response) async {
// // //       final result =
// // //           TransportationResponseModel.fromJson(jsonDecode(response.body));
// // //       if (response.statusCode == 200) {
// // //         transportationDetails = result.transportationDetails;
// // //         otherServicest = result.otherServicest;
// // //         // Navigator.push(
// // //         //   context,
// // //         //   MaterialPageRoute(
// // //         //     builder: (context) => PackageViewDetailsPagepopUpTransport(
// // //         //         transportId: transportId.toString()),
// // //         //   ),
// // //         // );
// // //         showLoader(false);
// // //         notifyListeners();
// // //       }
// // //       notifyListeners();
// // //     }).onError((error, stackTrace) {
// // //       Utils.showPrimarySnackbar(context, error, type: SnackType.debugError);
// // //     }).catchError(
// // //       (Object e) {
// // //         Utils.showPrimarySnackbar(context, e, type: SnackType.debugError);
// // //       },
// // //       test: (Object e) {
// // //         Utils.showPrimarySnackbar(context, e, type: SnackType.debugError);
// // //         return false;
// // //       },
// // //     );
// // //   }

// // //   ///////////////////////////////////////PackageViewDetailsPagepopUpTour
// // // TourRequestModel get tourRequestModel => TourRequestModel(
// // //       id: tourId.toString(),
// // //     );
// // // TourDetails? tourDetails;

// // // /////////////////////////////////////////////////
// // // Future<void> ViewTourDetailsPackageDetails(
// // //   context,
// // //   toId,
// // // ) async {
// // //   tourId = toId.toString();

// // //   showLoader(true);
// // //   SharedPreferences pref = await SharedPreferences.getInstance();
// // //   tourDetailsRepo
// // //       .tourDetailsRepo(tourRequestModel, pref.getString("successToken"))
// // //       .then((response) async {
// // //     final result = TourResponseModel.fromJson(jsonDecode(response.body));
// // //     if (response.statusCode == 200) {
// // //       tourDetails = result.tourDetails;
// // //       // Navigator.push(
// // //       //   context,
// // //       //   MaterialPageRoute(
// // //       //     builder: (context) => PackageViewDetailsPagepopUpTour(
// // //       //       tourDetailId: tourId.toString(),
// // //       //     ),
// // //       //   ),
// // //       // );
// // //       showLoader(false);
// // //       notifyListeners();
// // //     }
// // //     notifyListeners();
// // //   }).onError((error, stackTrace) {
// // //     Utils.showPrimarySnackbar(context, error, type: SnackType.debugError);
// // //   }).catchError(
// // //     (Object e) {
// // //       Utils.showPrimarySnackbar(context, e, type: SnackType.debugError);
// // //     },
// // //     test: (Object e) {
// // //       Utils.showPrimarySnackbar(context, e, type: SnackType.debugError);
// // //       return false;
// // //     },
// // //   );
// // // }
// // // }
// // import 'dart:convert';
// // import 'dart:developer';

// // import 'package:flutter/material.dart';
// // import 'package:md_health/Screens/packages/model/accomodation_notes_model.dart';
// // import 'package:md_health/Screens/packages/model/active_package_model.dart';
// // import 'package:md_health/Screens/packages/model/cancelled_model.dart';
// // import 'package:md_health/Screens/packages/model/cancelled_package_model.dart';
// // import 'package:md_health/Screens/packages/model/completed_package_model.dart';
// // import 'package:md_health/Screens/packages/model/hote_model.dart';
// // import 'package:md_health/Screens/packages/model/package_detail_view_model.dart';
// // import 'package:md_health/Screens/packages/model/tour_model.dart';
// // import 'package:md_health/Screens/packages/model/tour_notes_model.dart';
// // import 'package:md_health/Screens/packages/model/transport_notes_model.dart';
// // import 'package:md_health/Screens/packages/model/transportation_model.dart';
// // import 'package:md_health/Screens/packages/repository/accomodation_notes_repo.dart';
// // import 'package:md_health/Screens/packages/repository/active_package_repo.dart';
// // import 'package:md_health/Screens/packages/repository/cancelled_package_repo.dart';
// // import 'package:md_health/Screens/packages/repository/complete_package_repo.dart';
// // import 'package:md_health/Screens/packages/repository/hotel_repo.dart';
// // import 'package:md_health/Screens/packages/repository/package_detail_view_repo.dart';
// // import 'package:md_health/Screens/packages/repository/tour_details_repo.dart';
// // import 'package:md_health/Screens/packages/repository/tour_notes_repo.dart';
// // import 'package:md_health/Screens/packages/repository/transport_notes_repo.dart';
// // import 'package:md_health/Screens/packages/repository/transpotation_repo.dart';
// // import 'package:md_health/utils/utils.dart';
// // import 'package:md_health/utils/utils.dart';
// // import 'package:shared_preferences/shared_preferences.dart';

// // class PackageDetailViewController extends ChangeNotifier {
// //   PackageDetailViewRepo packagedetailViewRepo = PackageDetailViewRepo();
// //   HotelViewDetailsRepo hotelViewDetailsRepo = HotelViewDetailsRepo();
// //   TransportationRepo transportationRepo = TransportationRepo();
// //   TourDetailsRepo tourDetailsRepo = TourDetailsRepo();
// //   TourNotesRepo tourNotesRepo = TourNotesRepo();
// //   TransportRepo transportRepo = TransportRepo();
// //   AccomodationNOtesRepo accomodationNOtesRepo = AccomodationNOtesRepo();
// //   TextEditingController notesTourController = TextEditingController();
// //   TextEditingController notesTransportController = TextEditingController();
// //   TextEditingController notesAccomodatiopnController = TextEditingController();
// //   String hotelId = '';
// //   String transportationId = '';
// //   String? cPercentage;
// //   String tourId = '';
// //   List<String>? fakeOthersevices = [
// //     "Service 1",
// //     "Service 2",
// //     "Service 3",
// //   ];
// //   String packageId = '';
// //   String purcheseId = '';
// //   String type = '';
// //   bool isLoading = true;
// //   CustomerPurchasePackageList? customerPurchasePackageList;
// //   List<OtherService>? otherServices;
// //   // void onViewDetailPressed(){
// //   //   isTabChanged=true;
// //   //   notifyListeners();
// //   // }

// //   Future<void> initState(
// //     context,
// //     pId,
// //     purchesId,
// //     hId,
// //     tId,
// //     toId,
// //     tp,
// //   ) async {
// //     notesTourController.clear();
// //     packageDetailsView(context, pId, purchesId, tp);
// //     ViewHotelPackageDetails(
// //       context,
// //       hId,
// //     );
// //     ViewTransportPackageDetails(
// //       context,
// //       tId,
// //     );
// //     ViewTourPackageDetails(
// //       context,
// //       toId,
// //     );
// //     print("object");
// //     print("${customerPurchasePackageList?.companyLogoImagePathS ?? ""}");
// //     print(customerPurchasePackageList?.cityName);
// //     print("object");
// //     // getPaymentDetailsList(context, pId);
// //     notifyListeners();
// //   }

// // /////////////////////////////

// //   showLoader(value) {
// //     isLoading = value;
// //     notifyListeners();
// //   }

// //   PackageDetailViewRequestModel get packageDetailViewRequestModel =>
// //       PackageDetailViewRequestModel(
// //         type: type,
// //         purchesId: purcheseId.toString(),
// //         packageId: packageId,
// //       );
// //   Future<void> packageDetailsView(context, pId, purchesId, tp) async {
// //     showLoader(true);
// //     packageId = pId;
// //     purcheseId = purchesId;
// //     type = tp;
// //     SharedPreferences pref = await SharedPreferences.getInstance();
// //     packagedetailViewRepo
// //         .packageDetails(
// //             packageDetailViewRequestModel, pref.getString("successToken"))
// //         .then((response) async {
// //       // log(response.body);
// //       debugPrint('/////////////');
// //       final result =
// //           PackageDetailViewResponseModel.fromJson(jsonDecode(response.body));
// //       if (response.statusCode == 200) {
// //         log(response.body);

// //         customerPurchasePackageList = result.customerPurchasePackageList;
// //         cPercentage = customerPurchasePackageList?.completedPercentage;
// //         cPercentage = (100 - int.parse(cPercentage ?? "")).toString();
// //         log(cPercentage ?? "");
// //         otherServices = result.otherServices;
// //         print("juhujkiuyol,oi;l");
// //         print("juhujkiuyol,oi;l");
// //         print(customerPurchasePackageList?.companyLogoImagePathS ?? "");
// //         print(customerPurchasePackageList?.companyName);

// //         print("juhujkiuyol,oi;l");
// //         showLoader(false);
// //         notifyListeners();
// //       } else {
// //         log(response.body);
// //         Utils.showPrimarySnackbar(context, result.message,
// //             type: SnackType.error);
// //       }
// //     }).onError((error, stackTrace) {
// //       Utils.showPrimarySnackbar(context, error, type: SnackType.debugError);
// //     }).catchError(
// //       (Object e) {
// //         Utils.showPrimarySnackbar(context, e, type: SnackType.debugError);
// //       },
// //       test: (Object e) {
// //         Utils.showPrimarySnackbar(context, e, type: SnackType.debugError);
// //         return false;
// //       },
// //     );
// //   }

// //   HotelList? hotelList;

// //   HotelRequestMOdel get hotelRequestMOdel => HotelRequestMOdel(
// //         id: hotelId.toString(),
// //       );
// //   Future<void> ViewHotelPackageDetails(
// //     context,
// //     hId,
// //   ) async {
// //     hotelId = hId.toString();

// //     showLoader(true);
// //     SharedPreferences pref = await SharedPreferences.getInstance();
// //     hotelViewDetailsRepo
// //         .hotelView(hotelRequestMOdel, pref.getString("successToken"))
// //         .then((response) async {
// //       final result = HotelReposonseMOdel.fromJson(jsonDecode(response.body));
// //       if (response.statusCode == 200) {
// //         log(response.body);
// //         hotelList = result.hotelList;
// //         showLoader(false);

// //         notifyListeners();
// //       }
// //       notifyListeners();
// //     }).onError((error, stackTrace) {
// //       Utils.showPrimarySnackbar(context, error, type: SnackType.debugError);
// //     }).catchError(
// //       (Object e) {
// //         Utils.showPrimarySnackbar(context, e, type: SnackType.debugError);
// //       },
// //       test: (Object e) {
// //         Utils.showPrimarySnackbar(context, e, type: SnackType.debugError);
// //         return false;
// //       },
// //     );
// //   }
// //   //////////////////////////////////////

// //   TransportationDetails? transportationDetails;
// //   List<String>? otherServicest;

// //   TransportationRequestModel get transportationRequestModel =>
// //       TransportationRequestModel(
// //         id: transportationId.toString(),
// //       );
// //   Future<void> ViewTransportPackageDetails(
// //     context,
// //     tId,
// //   ) async {
// //     transportationId = tId.toString();

// //     showLoader(true);
// //     SharedPreferences pref = await SharedPreferences.getInstance();
// //     transportationRepo
// //         .transPortation(
// //             transportationRequestModel, pref.getString("successToken"))
// //         .then((response) async {
// //       final result =
// //           TransportationResponseModel.fromJson(jsonDecode(response.body));
// //       if (response.statusCode == 200) {
// //         log(response.body);
// //         transportationDetails = result.transportationDetails;
// //         otherServicest = result.otherServicest;
// //         showLoader(false);

// //         notifyListeners();
// //       }
// //       notifyListeners();
// //     }).onError((error, stackTrace) {
// //       Utils.showPrimarySnackbar(context, error, type: SnackType.debugError);
// //     }).catchError(
// //       (Object e) {
// //         Utils.showPrimarySnackbar(context, e, type: SnackType.debugError);
// //       },
// //       test: (Object e) {
// //         Utils.showPrimarySnackbar(context, e, type: SnackType.debugError);
// //         return false;
// //       },
// //     );
// //   }

// //   /////////////////////////////////////
// //   TourDetails? tourDetails;
// //   List<String>? otherServicestour;

// //   TourRequestModel get tourRequestModel => TourRequestModel(
// //         id: tourId.toString(),
// //       );
// //   Future<void> ViewTourPackageDetails(
// //     context,
// //     toId,
// //   ) async {
// //     tourId = toId.toString();

// //     // showLoader(true);
// //     SharedPreferences pref = await SharedPreferences.getInstance();
// //     tourDetailsRepo
// //         .tourDetailsRepo(tourRequestModel, pref.getString("successToken"))
// //         .then((response) async {
// //       final result = TourResponseModel.fromJson(jsonDecode(response.body));
// //       if (response.statusCode == 200) {
// //         log(response.body);
// //         tourDetails = result.tourDetails;
// //         otherServicestour = result.otherServicestour;
// //         // showLoader(false);
// //         notifyListeners();
// //       }
// //       notifyListeners();
// //     }).onError((error, stackTrace) {
// //       Utils.showPrimarySnackbar(context, error, type: SnackType.debugError);
// //     }).catchError(
// //       (Object e) {
// //         Utils.showPrimarySnackbar(context, e, type: SnackType.debugError);
// //       },
// //       test: (Object e) {
// //         Utils.showPrimarySnackbar(context, e, type: SnackType.debugError);
// //         return false;
// //       },
// //     );
// //   }

// // ////////////////////////////////////////////////////////
// //   TourNOtesRequestModel get tourNOtesRequestModel => TourNOtesRequestModel(
// //       purchaseId: purcheseId.toString(), notes: notesTourController.text);
// //   Future<void> TourNotes(
// //     context,
// //   ) async {
// //     // showLoader(true);
// //     SharedPreferences pref = await SharedPreferences.getInstance();
// //     tourNotesRepo
// //         .notesRepo(tourNOtesRequestModel, pref.getString("successToken"))
// //         .then((response) async {
// //       final result = TourNOtesResponseModel.fromJson(jsonDecode(response.body));
// //       if (response.statusCode == 200) {
// //         notesTourController.clear();
// //         log(response.body);
// //         Utils.showPrimarySnackbar(context, result.message,
// //             type: SnackType.success);
// //         notifyListeners();
// //       }
// //       notifyListeners();
// //     }).onError((error, stackTrace) {
// //       Utils.showPrimarySnackbar(context, error, type: SnackType.debugError);
// //     }).catchError(
// //       (Object e) {
// //         Utils.showPrimarySnackbar(context, e, type: SnackType.debugError);
// //       },
// //       test: (Object e) {
// //         Utils.showPrimarySnackbar(context, e, type: SnackType.debugError);
// //         return false;
// //       },
// //     );
// //   }

// //   ////////////////////////////
// //   AccomodationRequestModel get accomodationRequestModel =>
// //       AccomodationRequestModel(
// //           purchaseId: purcheseId.toString(),
// //           notes: notesAccomodatiopnController.text);
// //   Future<void> AccomopdationNotes(
// //     context,
// //   ) async {
// //     // showLoader(true);
// //     SharedPreferences pref = await SharedPreferences.getInstance();
// //     accomodationNOtesRepo
// //         .accomodationNOteRepo(
// //             accomodationRequestModel, pref.getString("successToken"))
// //         .then((response) async {
// //       final result =
// //           AccomodationResponseMOdel.fromJson(jsonDecode(response.body));
// //       if (response.statusCode == 200) {
// //         notesTourController.clear();
// //         log(response.body);
// //         Utils.showPrimarySnackbar(context, result.message,
// //             type: SnackType.success);
// //         notifyListeners();
// //       }
// //       notifyListeners();
// //     }).onError((error, stackTrace) {
// //       Utils.showPrimarySnackbar(context, error, type: SnackType.debugError);
// //     }).catchError(
// //       (Object e) {
// //         Utils.showPrimarySnackbar(context, e, type: SnackType.debugError);
// //       },
// //       test: (Object e) {
// //         Utils.showPrimarySnackbar(context, e, type: SnackType.debugError);
// //         return false;
// //       },
// //     );
// //   }

// //   /////////////////////////////////
// //   TransportNOtesRequestModel get transportNOtesRequestModel =>
// //       TransportNOtesRequestModel(
// //           purchaseId: purcheseId.toString(),
// //           notes: notesTransportController.text);
// //   Future<void> TransportNOtes(
// //     context,
// //   ) async {
// //     // showLoader(true);
// //     SharedPreferences pref = await SharedPreferences.getInstance();
// //     transportRepo
// //         .trasnportNoteRepo(
// //             transportNOtesRequestModel, pref.getString("successToken"))
// //         .then((response) async {
// //       final result =
// //           TransportNOtesResponseModel.fromJson(jsonDecode(response.body));
// //       if (response.statusCode == 200) {
// //         notesAccomodatiopnController.clear();
// //         log(response.body);
// //         Utils.showPrimarySnackbar(context, result.message,
// //             type: SnackType.success);
// //         notifyListeners();
// //       }
// //       notifyListeners();
// //     }).onError((error, stackTrace) {
// //       Utils.showPrimarySnackbar(context, error, type: SnackType.debugError);
// //     }).catchError(
// //       (Object e) {
// //         Utils.showPrimarySnackbar(context, e, type: SnackType.debugError);
// //       },
// //       test: (Object e) {
// //         Utils.showPrimarySnackbar(context, e, type: SnackType.debugError);
// //         return false;
// //       },
// //     );
// //   }
// // }
// // import 'dart:convert';
// // import 'dart:developer';
// // import 'package:flutter/material.dart';
// // import 'package:flutter_application_1/Screens/packages/model/hote_model.dart';
// // import 'package:flutter_application_1/Screens/packages/model/package_detail_view_model.dart';
// // import 'package:flutter_application_1/Screens/packages/model/tour_model.dart';
// // import 'package:flutter_application_1/Screens/packages/model/transportation_model.dart';
// // import 'package:flutter_application_1/Screens/packages/repository/active_package_repo.dart';
// // import 'package:flutter_application_1/Screens/packages/repository/cancelled_package_repo.dart';
// // import 'package:flutter_application_1/Screens/packages/repository/complete_package_repo.dart';
// // import 'package:flutter_application_1/Screens/packages/repository/hotel_repo.dart';
// // import 'package:flutter_application_1/Screens/packages/repository/package_detail_view_repo.dart';
// // import 'package:flutter_application_1/Screens/packages/repository/tour_details_repo.dart';
// // import 'package:flutter_application_1/Screens/packages/repository/transpotation_repo.dart';
// // import 'package:flutter_application_1/Screens/packages/view/view_detail_pop_up_view.dart';
// // import 'package:flutter_application_1/Screens/packages/view/view_details_tour_.dart';
// // import 'package:flutter_application_1/Screens/packages/view/view_details_transport_view.dart';
// // import 'package:flutter_application_1/utils/utils.dart';
// // import 'package:shared_preferences/shared_preferences.dart';

// // class PackageDetailViewController extends ChangeNotifier {
// //   PackageDetailViewRepo packagedetailViewRepo = PackageDetailViewRepo();
// //   HotelViewDetailsRepo hotelViewDetailsRepo = HotelViewDetailsRepo();
// //   TourDetailsRepo tourDetailsRepo = TourDetailsRepo();

// //   TransportationRepo transportationRepo = TransportationRepo();
// //   String hotelId = '';
// //   String transportId = '';
// //   String tourId = '';

// //   String packageId = '';
// //   String purcheseId = '';
// //   bool isLoading = true;
// //   CustomerPurchasePackageList? customerPurchasePackageList;
// //   List<OtherService>? otherServices;
// //   // void onViewDetailPressed(){
// //   //   isTabChanged=true;
// //   //   notifyListeners();
// //   // }

// //   Future<void> initState(context, pId, purchesId, hId, tId, toId) async {
// //     packageDetailsView(context, pId, purchesId);
// //     ViewHotelPackageDetails(
// //       context,
// //       hId,
// //     );
// //     ViewTransportationPackageDetails(
// //       context,
// //       tId,
// //     );
// //     ViewTourDetailsPackageDetails(
// //       context,
// //       toId,
// //     );
// //     print("object");
// //     print("${customerPurchasePackageList?.companyLogoImagePathS ?? ""}");
// //     print(customerPurchasePackageList?.cityName);
// //     print("object");
// //     // getPaymentDetailsList(context, pId);
// //     notifyListeners();
// //   }

// // /////////////////////////////

// //   showLoader(value) {
// //     isLoading = value;
// //     notifyListeners();
// //   }

// //   PackageDetailViewRequestModel get packageDetailViewRequestModel =>
// //       PackageDetailViewRequestModel(
// //           purchesId: purcheseId.toString(), packageId: packageId);
// //   Future<void> packageDetailsView(context, pId, purchesId) async {
// //     showLoader(true);
// //     packageId = pId;
// //     purcheseId = purchesId;
// //     SharedPreferences pref = await SharedPreferences.getInstance();
// //     packagedetailViewRepo
// //         .packageDetails(
// //             packageDetailViewRequestModel, pref.getString("successToken"))
// //         .then((response) async {
// //       // log(response.body);
// //       debugPrint('/////////////');
// //       final result =
// //           PackageDetailViewResponseModel.fromJson(jsonDecode(response.body));
// //       if (response.statusCode == 200) {
// //         log(response.body);

// //         customerPurchasePackageList = result.customerPurchasePackageList;
// //         otherServices = result.otherServices;
// //         print("juhujkiuyol,oi;l");
// //         print("juhujkiuyol,oi;l");
// //         print(customerPurchasePackageList?.companyLogoImagePathS ?? "");
// //         print(customerPurchasePackageList?.companyName);

// //         print("juhujkiuyol,oi;l");
// //         showLoader(false);
// //         notifyListeners();
// //       } else {
// //         log(response.body);
// //         Utils.showPrimarySnackbar(context, result.message,
// //             type: SnackType.error);
// //       }
// //     }).onError((error, stackTrace) {
// //       Utils.showPrimarySnackbar(context, error, type: SnackType.debugError);
// //     }).catchError(
// //       (Object e) {
// //         Utils.showPrimarySnackbar(context, e, type: SnackType.debugError);
// //       },
// //       test: (Object e) {
// //         Utils.showPrimarySnackbar(context, e, type: SnackType.debugError);
// //         return false;
// //       },
// //     );
// //   }
// //   ///////////////
// //   //  HotelRequestMOdel get hotelRequestMOdel =>
// //   //     HotelRequestMOdel(hotelId: hotelId.toString(),

// //   //     );
// //   HotelList? hotelList;

// //   HotelRequestMOdel get hotelRequestMOdel => HotelRequestMOdel(
// //         id: hotelId.toString(),
// //       );
// //   Future<void> ViewHotelPackageDetails(
// //     context,
// //     hId,
// //   ) async {
// //     hotelId = hId.toString();

// //     showLoader(true);
// //     SharedPreferences pref = await SharedPreferences.getInstance();
// //     hotelViewDetailsRepo
// //         .hotelView(hotelRequestMOdel, pref.getString("successToken"))
// //         .then((response) async {
// //       final result = HotelReposonseMOdel.fromJson(jsonDecode(response.body));
// //       if (response.statusCode == 200) {
// //         hotelList = result.hotelList;
// //         // Navigator.push(
// //         //   context,
// //         //   MaterialPageRoute(
// //         //     builder: (context) =>
// //         //         PackageViewDetailsPagepopUp(hotelId: hotelId.toString()),
// //         //   ),
// //         // );

// //         showLoader(false);
// //         notifyListeners();
// //       }
// //       notifyListeners();
// //     }).onError((error, stackTrace) {
// //       Utils.showPrimarySnackbar(context, error, type: SnackType.debugError);
// //     }).catchError(
// //       (Object e) {
// //         Utils.showPrimarySnackbar(context, e, type: SnackType.debugError);
// //       },
// //       test: (Object e) {
// //         Utils.showPrimarySnackbar(context, e, type: SnackType.debugError);
// //         return false;
// //       },
// //     );
// //   }

// //   ///////////////////////////////////////////////////////tourDetailsRepo transportationRepo
// //   TransportationDetails? transportationDetails;
// //   List<String>? otherServicest;

// //   TransportationRequestModel get transportationRequestModel =>
// //       TransportationRequestModel(
// //         id: transportId.toString(),
// //       );
// //   Future<void> ViewTransportationPackageDetails(
// //     context,
// //     tId,
// //   ) async {
// //     transportId = tId.toString();

// //     showLoader(true);
// //     SharedPreferences pref = await SharedPreferences.getInstance();
// //     transportationRepo
// //         .transPortation(
// //             transportationRequestModel, pref.getString("successToken"))
// //         .then((response) async {
// //       final result =
// //           TransportationResponseModel.fromJson(jsonDecode(response.body));
// //       if (response.statusCode == 200) {
// //         transportationDetails = result.transportationDetails;
// //         otherServicest = result.otherServicest;
// //         // Navigator.push(
// //         //   context,
// //         //   MaterialPageRoute(
// //         //     builder: (context) => PackageViewDetailsPagepopUpTransport(
// //         //         transportId: transportId.toString()),
// //         //   ),
// //         // );
// //         showLoader(false);
// //         notifyListeners();
// //       }
// //       notifyListeners();
// //     }).onError((error, stackTrace) {
// //       Utils.showPrimarySnackbar(context, error, type: SnackType.debugError);
// //     }).catchError(
// //       (Object e) {
// //         Utils.showPrimarySnackbar(context, e, type: SnackType.debugError);
// //       },
// //       test: (Object e) {
// //         Utils.showPrimarySnackbar(context, e, type: SnackType.debugError);
// //         return false;
// //       },
// //     );
// //   }

// //   ///////////////////////////////////////PackageViewDetailsPagepopUpTour
// // TourRequestModel get tourRequestModel => TourRequestModel(
// //       id: tourId.toString(),
// //     );
// // TourDetails? tourDetails;

// // /////////////////////////////////////////////////
// // Future<void> ViewTourDetailsPackageDetails(
// //   context,
// //   toId,
// // ) async {
// //   tourId = toId.toString();

// //   showLoader(true);
// //   SharedPreferences pref = await SharedPreferences.getInstance();
// //   tourDetailsRepo
// //       .tourDetailsRepo(tourRequestModel, pref.getString("successToken"))
// //       .then((response) async {
// //     final result = TourResponseModel.fromJson(jsonDecode(response.body));
// //     if (response.statusCode == 200) {
// //       tourDetails = result.tourDetails;
// //       // Navigator.push(
// //       //   context,
// //       //   MaterialPageRoute(
// //       //     builder: (context) => PackageViewDetailsPagepopUpTour(
// //       //       tourDetailId: tourId.toString(),
// //       //     ),
// //       //   ),
// //       // );
// //       showLoader(false);
// //       notifyListeners();
// //     }
// //     notifyListeners();
// //   }).onError((error, stackTrace) {
// //     Utils.showPrimarySnackbar(context, error, type: SnackType.debugError);
// //   }).catchError(
// //     (Object e) {
// //       Utils.showPrimarySnackbar(context, e, type: SnackType.debugError);
// //     },
// //     test: (Object e) {
// //       Utils.showPrimarySnackbar(context, e, type: SnackType.debugError);
// //       return false;
// //     },
// //   );
// // }
// // }
// import 'dart:convert';
// import 'dart:developer';

// import 'package:flutter/material.dart';
// import 'package:md_health/Screens/packages/model/accomodation_notes_model.dart';
// import 'package:md_health/Screens/packages/model/active_package_model.dart';
// import 'package:md_health/Screens/packages/model/cancelled_model.dart';
// import 'package:md_health/Screens/packages/model/cancelled_package_model.dart';
// import 'package:md_health/Screens/packages/model/completed_package_model.dart';
// import 'package:md_health/Screens/packages/model/hote_model.dart';
// import 'package:md_health/Screens/packages/model/package_detail_view_model.dart';
// import 'package:md_health/Screens/packages/model/tour_model.dart';
// import 'package:md_health/Screens/packages/model/tour_notes_model.dart';
// import 'package:md_health/Screens/packages/model/transport_notes_model.dart';
// import 'package:md_health/Screens/packages/model/transportation_model.dart';
// import 'package:md_health/Screens/packages/repository/accomodation_notes_repo.dart';
// import 'package:md_health/Screens/packages/repository/active_package_repo.dart';
// import 'package:md_health/Screens/packages/repository/cancelled_package_repo.dart';
// import 'package:md_health/Screens/packages/repository/complete_package_repo.dart';
// import 'package:md_health/Screens/packages/repository/hotel_repo.dart';
// import 'package:md_health/Screens/packages/repository/package_detail_view_repo.dart';
// import 'package:md_health/Screens/packages/repository/tour_details_repo.dart';
// import 'package:md_health/Screens/packages/repository/tour_notes_repo.dart';
// import 'package:md_health/Screens/packages/repository/transport_notes_repo.dart';
// import 'package:md_health/Screens/packages/repository/transpotation_repo.dart';
// import 'package:md_health/Screens/packages/view/view_detail_pop_up_view.dart';
// import 'package:md_health/Screens/packages/view/view_details_transport_view.dart';
// import 'package:md_health/utils/utils.dart';
// import 'package:md_health/utils/utils.dart';
// import 'package:md_health/widget/loading_overlay.dart';
// import 'package:md_health/utils/utils.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class PackageDetailViewController extends ChangeNotifier {
//   PackageDetailViewRepo packagedetailViewRepo = PackageDetailViewRepo();
//   HotelViewDetailsRepo hotelViewDetailsRepo = HotelViewDetailsRepo();
//   TransportationRepo transportationRepo = TransportationRepo();
//   TourDetailsRepo tourDetailsRepo = TourDetailsRepo();
//   TourNotesRepo tourNotesRepo = TourNotesRepo();
//   TransportRepo transportRepo = TransportRepo();
//   AccomodationNOtesRepo accomodationNOtesRepo = AccomodationNOtesRepo();
//   TextEditingController notesTourController = TextEditingController();
//   TextEditingController notesTransportController = TextEditingController();
//   TextEditingController notesAccomodatiopnController = TextEditingController();
//   String hotelId = '';
//   String transportationId = '';
//   String? cPercentage;
//   String tourId = '';
//   List<String>? fakeOthersevices = [
//     "Service 1",
//     "Service 2",
//     "Service 3",
//   ];
//   String packageId = '';
//   String patientID = '';
//   String purcheseId = '';
//   String type = '';
//   bool isLoading = true;
//   CustomerPurchasePackageList? customerPurchasePackageList;
//   List<OtherService>? otherServices;
//   // void onViewDetailPressed(){
//   //   isTabChanged=true;
//   //   notifyListeners();
//   // }

//   Future<void> initState(
//     context,
//     pId,
//     purchesId,
//     hId,
//     tId,
//     toId,
//     tp,
//   ) async {
//     notesTourController.clear();
//     packageDetailsView(context, pId, purchesId, tp);
//     // ViewHotelPackageDetails(
//     //   context,
//     //   hId,
//     // );
//     // ViewTransportPackageDetails(
//     //   context,
//     //   tId,
//     // );
//     ViewTourPackageDetails(
//       context,
//       toId,
//     );
//     print("object");
//     print("${customerPurchasePackageList?.companyLogoImagePathS ?? ""}");
//     print(customerPurchasePackageList?.cityName);
//     print("object");
//     // getPaymentDetailsList(context, pId);
//     notifyListeners();
//   }

// /////////////////////////////

//   showLoader(value) {
//     isLoading = value;
//     notifyListeners();
//   }

//   PackageDetailViewRequestModel get packageDetailViewRequestModel =>
//       PackageDetailViewRequestModel(
//         type: type,
//         purchesId: purcheseId.toString(),
//         packageId: packageId,
//       );
//   Future<void> packageDetailsView(context, pId, purchesId, tp) async {
//     showLoader(true);
//     packageId = pId;
//     purcheseId = purchesId;
//     type = tp;
//     SharedPreferences pref = await SharedPreferences.getInstance();
//     packagedetailViewRepo
//         .packageDetails(
//             packageDetailViewRequestModel, pref.getString("successToken"))
//         .then((response) async {
//       // log(response.body);
//       debugPrint('/////////////');
//       final result =
//           PackageDetailViewResponseModel.fromJson(jsonDecode(response.body));
//       if (response.statusCode == 200) {
//         log(response.body);

//         customerPurchasePackageList = result.customerPurchasePackageList;
//         cPercentage = customerPurchasePackageList?.completedPercentage;
//         cPercentage = (100 - int.parse(cPercentage ?? "")).toString();
//         log(cPercentage ?? "");
//         otherServices = result.otherServices;
//         print("juhujkiuyol,oi;l");
//         print("juhujkiuyol,oi;l");
//         print(customerPurchasePackageList?.companyLogoImagePathS ?? "");
//         print(customerPurchasePackageList?.companyName);

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

//   HotelList? hotelList;

//   HotelRequestMOdel get hotelRequestMOdel => HotelRequestMOdel(
//         id: hotelId.toString(),
//       );
//   Future<void> ViewHotelPackageDetails(
//     context,
//     hId,
//   ) async {
//     hotelId = hId.toString();

//     // showLoader(true);
//     LoadingOverlay.of(context).show();
//     SharedPreferences pref = await SharedPreferences.getInstance();
//     hotelViewDetailsRepo
//         .hotelView(hotelRequestMOdel, pref.getString("successToken"))
//         .then((response) async {
//       final result = HotelReposonseMOdel.fromJson(jsonDecode(response.body));
//       if (response.statusCode == 200) {
//         log(response.body);
//         hotelList = result.hotelList;
//         LoadingOverlay.of(context).hide();
//         showDialog(
//             context: context,
//             builder: (context) {
//               return PackageViewDetailsPagepopUp(hotelId: hId.toString());
//             });
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
//   //////////////////////////////////////

//   TransportationDetails? transportationDetails;
//   List<String>? otherServicest;

//   TransportationRequestModel get transportationRequestModel =>
//       TransportationRequestModel(
//         id: transportationId.toString(),
//       );
//   Future<void> ViewTransportPackageDetails(
//     context,
//     tId,
//   ) async {
//     transportationId = tId.toString();

//     LoadingOverlay.of(context).show();
//     SharedPreferences pref = await SharedPreferences.getInstance();
//     transportationRepo
//         .transPortation(
//             transportationRequestModel, pref.getString("successToken"))
//         .then((response) async {
//       final result =
//           TransportationResponseModel.fromJson(jsonDecode(response.body));
//       if (response.statusCode == 200) {
//         log(response.body);
//         transportationDetails = result.transportationDetails;
//         otherServicest = result.otherServicest;
//         LoadingOverlay.of(context).hide();

//         showDialog(
//             context: context,
//             builder: (context) {
//               return PackageViewDetailsPagepopUpTransport(
//                   transportId: tId.toString());
//             });
//         // notifyListeners();
//         notifyListeners();
//       }
//       notifyListeners();
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

//   /////////////////////////////////////
//   TourDetails? tourDetails;
//   List<String>? otherServicestour;

//   TourRequestModel get tourRequestModel => TourRequestModel(
//         id: tourId.toString(),
//       );
//   Future<void> ViewTourPackageDetails(
//     context,
//     toId,
//   ) async {
//     tourId = toId.toString();

//     // showLoader(true);
//     SharedPreferences pref = await SharedPreferences.getInstance();
//     tourDetailsRepo
//         .tourDetailsRepo(tourRequestModel, pref.getString("successToken"))
//         .then((response) async {
//       final result = TourResponseModel.fromJson(jsonDecode(response.body));
//       if (response.statusCode == 200) {
//         log(response.body);
//         tourDetails = result.tourDetails;
//         otherServicestour = result.otherServicestour;
//         // showLoader(false);
//         notifyListeners();
//       }
//       notifyListeners();
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

// ////////////////////////////////////////////////////////
//   TourNOtesRequestModel get tourNOtesRequestModel => TourNOtesRequestModel(
//       purchaseId: purcheseId.toString(), notes: notesTourController.text);
//   Future<void> TourNotes(
//     context,
//   ) async {
//     // showLoader(true);
//     SharedPreferences pref = await SharedPreferences.getInstance();
//     tourNotesRepo
//         .notesRepo(tourNOtesRequestModel, pref.getString("successToken"))
//         .then((response) async {
//       final result = TourNOtesResponseModel.fromJson(jsonDecode(response.body));
//       if (response.statusCode == 200) {
//         notesTourController.clear();
//         log(response.body);
//         Utils.showPrimarySnackbar(context, result.message,
//             type: SnackType.success);
//         notifyListeners();
//       }
//       notifyListeners();
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

//   ////////////////////////////
//   AccomodationRequestModel get accomodationRequestModel =>
//       AccomodationRequestModel(
//           purchaseId: purcheseId.toString(),
//           notes: notesAccomodatiopnController.text);
//   Future<void> AccomopdationNotes(
//     context,
//   ) async {
//     // showLoader(true);
//     SharedPreferences pref = await SharedPreferences.getInstance();
//     accomodationNOtesRepo
//         .accomodationNOteRepo(
//             accomodationRequestModel, pref.getString("successToken"))
//         .then((response) async {
//       final result =
//           AccomodationResponseMOdel.fromJson(jsonDecode(response.body));
//       if (response.statusCode == 200) {
//         notesTourController.clear();
//         log(response.body);
//         Utils.showPrimarySnackbar(context, result.message,
//             type: SnackType.success);
//         notifyListeners();
//       }
//       notifyListeners();
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

//   /////////////////////////////////
//   TransportNOtesRequestModel get transportNOtesRequestModel =>
//       TransportNOtesRequestModel(
//           purchaseId: purcheseId.toString(),
//           notes: notesTransportController.text);
//   Future<void> TransportNOtes(
//     context,
//   ) async {
//     // showLoader(true);
//     SharedPreferences pref = await SharedPreferences.getInstance();
//     transportRepo
//         .trasnportNoteRepo(
//             transportNOtesRequestModel, pref.getString("successToken"))
//         .then((response) async {
//       final result =
//           TransportNOtesResponseModel.fromJson(jsonDecode(response.body));
//       if (response.statusCode == 200) {
//         notesAccomodatiopnController.clear();
//         log(response.body);
//         Utils.showPrimarySnackbar(context, result.message,
//             type: SnackType.success);
//         notifyListeners();
//       }
//       notifyListeners();
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
// }
// import 'dart:convert';
// import 'dart:developer';
// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/Screens/packages/model/hote_model.dart';
// import 'package:flutter_application_1/Screens/packages/model/package_detail_view_model.dart';
// import 'package:flutter_application_1/Screens/packages/model/tour_model.dart';
// import 'package:flutter_application_1/Screens/packages/model/transportation_model.dart';
// import 'package:flutter_application_1/Screens/packages/repository/active_package_repo.dart';
// import 'package:flutter_application_1/Screens/packages/repository/cancelled_package_repo.dart';
// import 'package:flutter_application_1/Screens/packages/repository/complete_package_repo.dart';
// import 'package:flutter_application_1/Screens/packages/repository/hotel_repo.dart';
// import 'package:flutter_application_1/Screens/packages/repository/package_detail_view_repo.dart';
// import 'package:flutter_application_1/Screens/packages/repository/tour_details_repo.dart';
// import 'package:flutter_application_1/Screens/packages/repository/transpotation_repo.dart';
// import 'package:flutter_application_1/Screens/packages/view/view_detail_pop_up_view.dart';
// import 'package:flutter_application_1/Screens/packages/view/view_details_tour_.dart';
// import 'package:flutter_application_1/Screens/packages/view/view_details_transport_view.dart';
// import 'package:flutter_application_1/utils/utils.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class PackageDetailViewController extends ChangeNotifier {
//   PackageDetailViewRepo packagedetailViewRepo = PackageDetailViewRepo();
//   HotelViewDetailsRepo hotelViewDetailsRepo = HotelViewDetailsRepo();
//   TourDetailsRepo tourDetailsRepo = TourDetailsRepo();

//   TransportationRepo transportationRepo = TransportationRepo();
//   String hotelId = '';
//   String transportId = '';
//   String tourId = '';

//   String packageId = '';
//   String purcheseId = '';
//   bool isLoading = true;
//   CustomerPurchasePackageList? customerPurchasePackageList;
//   List<OtherService>? otherServices;
//   // void onViewDetailPressed(){
//   //   isTabChanged=true;
//   //   notifyListeners();
//   // }

//   Future<void> initState(context, pId, purchesId, hId, tId, toId) async {
//     packageDetailsView(context, pId, purchesId);
//     ViewHotelPackageDetails(
//       context,
//       hId,
//     );
//     ViewTransportationPackageDetails(
//       context,
//       tId,
//     );
//     ViewTourDetailsPackageDetails(
//       context,
//       toId,
//     );
//     print("object");
//     print("${customerPurchasePackageList?.companyLogoImagePathS ?? ""}");
//     print(customerPurchasePackageList?.cityName);
//     print("object");
//     // getPaymentDetailsList(context, pId);
//     notifyListeners();
//   }

// /////////////////////////////

//   showLoader(value) {
//     isLoading = value;
//     notifyListeners();
//   }

//   PackageDetailViewRequestModel get packageDetailViewRequestModel =>
//       PackageDetailViewRequestModel(
//           purchesId: purcheseId.toString(), packageId: packageId);
//   Future<void> packageDetailsView(context, pId, purchesId) async {
//     showLoader(true);
//     packageId = pId;
//     purcheseId = purchesId;
//     SharedPreferences pref = await SharedPreferences.getInstance();
//     packagedetailViewRepo
//         .packageDetails(
//             packageDetailViewRequestModel, pref.getString("successToken"))
//         .then((response) async {
//       // log(response.body);
//       debugPrint('/////////////');
//       final result =
//           PackageDetailViewResponseModel.fromJson(jsonDecode(response.body));
//       if (response.statusCode == 200) {
//         log(response.body);

//         customerPurchasePackageList = result.customerPurchasePackageList;
//         otherServices = result.otherServices;
//         print("juhujkiuyol,oi;l");
//         print("juhujkiuyol,oi;l");
//         print(customerPurchasePackageList?.companyLogoImagePathS ?? "");
//         print(customerPurchasePackageList?.companyName);

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
//   ///////////////
//   //  HotelRequestMOdel get hotelRequestMOdel =>
//   //     HotelRequestMOdel(hotelId: hotelId.toString(),

//   //     );
//   HotelList? hotelList;

//   HotelRequestMOdel get hotelRequestMOdel => HotelRequestMOdel(
//         id: hotelId.toString(),
//       );
//   Future<void> ViewHotelPackageDetails(
//     context,
//     hId,
//   ) async {
//     hotelId = hId.toString();

//     showLoader(true);
//     SharedPreferences pref = await SharedPreferences.getInstance();
//     hotelViewDetailsRepo
//         .hotelView(hotelRequestMOdel, pref.getString("successToken"))
//         .then((response) async {
//       final result = HotelReposonseMOdel.fromJson(jsonDecode(response.body));
//       if (response.statusCode == 200) {
//         hotelList = result.hotelList;
//         // Navigator.push(
//         //   context,
//         //   MaterialPageRoute(
//         //     builder: (context) =>
//         //         PackageViewDetailsPagepopUp(hotelId: hotelId.toString()),
//         //   ),
//         // );

//         showLoader(false);
//         notifyListeners();
//       }
//       notifyListeners();
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

//   ///////////////////////////////////////////////////////tourDetailsRepo transportationRepo
//   TransportationDetails? transportationDetails;
//   List<String>? otherServicest;

//   TransportationRequestModel get transportationRequestModel =>
//       TransportationRequestModel(
//         id: transportId.toString(),
//       );
//   Future<void> ViewTransportationPackageDetails(
//     context,
//     tId,
//   ) async {
//     transportId = tId.toString();

//     showLoader(true);
//     SharedPreferences pref = await SharedPreferences.getInstance();
//     transportationRepo
//         .transPortation(
//             transportationRequestModel, pref.getString("successToken"))
//         .then((response) async {
//       final result =
//           TransportationResponseModel.fromJson(jsonDecode(response.body));
//       if (response.statusCode == 200) {
//         transportationDetails = result.transportationDetails;
//         otherServicest = result.otherServicest;
//         // Navigator.push(
//         //   context,
//         //   MaterialPageRoute(
//         //     builder: (context) => PackageViewDetailsPagepopUpTransport(
//         //         transportId: transportId.toString()),
//         //   ),
//         // );
//         showLoader(false);
//         notifyListeners();
//       }
//       notifyListeners();
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

//   ///////////////////////////////////////PackageViewDetailsPagepopUpTour
// TourRequestModel get tourRequestModel => TourRequestModel(
//       id: tourId.toString(),
//     );
// TourDetails? tourDetails;

// /////////////////////////////////////////////////
// Future<void> ViewTourDetailsPackageDetails(
//   context,
//   toId,
// ) async {
//   tourId = toId.toString();

//   showLoader(true);
//   SharedPreferences pref = await SharedPreferences.getInstance();
//   tourDetailsRepo
//       .tourDetailsRepo(tourRequestModel, pref.getString("successToken"))
//       .then((response) async {
//     final result = TourResponseModel.fromJson(jsonDecode(response.body));
//     if (response.statusCode == 200) {
//       tourDetails = result.tourDetails;
//       // Navigator.push(
//       //   context,
//       //   MaterialPageRoute(
//       //     builder: (context) => PackageViewDetailsPagepopUpTour(
//       //       tourDetailId: tourId.toString(),
//       //     ),
//       //   ),
//       // );
//       showLoader(false);
//       notifyListeners();
//     }
//     notifyListeners();
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
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:md_health/Screens/health/packages/model/accomodation_notes_model.dart';
import 'package:md_health/Screens/health/packages/model/active_package_model.dart';
import 'package:md_health/Screens/health/packages/model/cancelled_model.dart';
import 'package:md_health/Screens/health/packages/model/cancelled_package_model.dart';
import 'package:md_health/Screens/health/packages/model/completed_package_model.dart';
import 'package:md_health/Screens/health/packages/model/download_invoices_model.dart';
import 'package:md_health/Screens/health/packages/model/hote_model.dart';
import 'package:md_health/Screens/health/packages/model/package_detail_view_model.dart';
import 'package:md_health/Screens/health/packages/model/tour_model.dart';
import 'package:md_health/Screens/health/packages/model/tour_notes_model.dart';
import 'package:md_health/Screens/health/packages/model/transport_notes_model.dart';
import 'package:md_health/Screens/health/packages/model/transportation_model.dart';
import 'package:md_health/Screens/health/packages/repository/accomodation_notes_repo.dart';
import 'package:md_health/Screens/health/packages/repository/active_package_repo.dart';
import 'package:md_health/Screens/health/packages/repository/cancelled_package_repo.dart';
import 'package:md_health/Screens/health/packages/repository/complete_package_repo.dart';
import 'package:md_health/Screens/health/packages/repository/download_invoise_repo.dart';
import 'package:md_health/Screens/health/packages/repository/hotel_repo.dart';
import 'package:md_health/Screens/health/packages/repository/package_detail_view_repo.dart';
// import 'package:md_health/Screens/health/repository/package_detail_view_repo.dart';
import 'package:md_health/Screens/health/packages/repository/tour_details_repo.dart';
import 'package:md_health/Screens/health/packages/repository/tour_notes_repo.dart';
import 'package:md_health/Screens/health/packages/repository/transport_notes_repo.dart';
import 'package:md_health/Screens/health/packages/repository/transpotation_repo.dart';
import 'package:md_health/Screens/health/packages/view/view_detail_pop_up_view.dart';
import 'package:md_health/Screens/health/packages/view/view_details_tour_.dart';
import 'package:md_health/Screens/health/packages/view/view_details_transport_view.dart';
import 'package:md_health/utils/utils.dart';
import 'package:md_health/utils/utils.dart';
import 'package:md_health/widget/loading_overlay.dart';
import 'package:md_health/Screens/health/packages/model/hote_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class PackageDetailViewController extends ChangeNotifier {
  PackageDetailViewRepo packagedetailViewRepo = PackageDetailViewRepo();
  DonloadInvoiceRepo donloadInvoiceRepo = DonloadInvoiceRepo();
  HotelViewDetailsRepo hotelViewDetailsRepo = HotelViewDetailsRepo();
  TransportationRepo transportationRepo = TransportationRepo();
  TourDetailsRepo tourDetailsRepo = TourDetailsRepo();
  TourNotesRepo tourNotesRepo = TourNotesRepo();
  TransportRepo transportRepo = TransportRepo();
  AccomodationNOtesRepo accomodationNOtesRepo = AccomodationNOtesRepo();
  TextEditingController notesTourController = TextEditingController();
  TextEditingController notesTransportController = TextEditingController();
  TextEditingController notesAccomodatiopnController = TextEditingController();
  String hotelId = '';
  String transportationId = '';
  String? cPercentage;
  String tourId = '';
  List<String>? fakeOthersevices = [
    "Service 1",
    "Service 2",
    "Service 3",
  ];
  String packageId = '';
  String patientID = '';
  String purcheseId = '';
  String type = '';
  bool isLoading = true;
  CustomerPurchasePackageList? customerPurchasePackageList;
  List<OtherService>? otherServices;
  // void onViewDetailPressed(){
  //   isTabChanged=true;
  //   notifyListeners();
  // }

  Future<void> initState(
    context,
    pId,
    purchesId,
    hId,
    tId,
    toId,
    tp,
  ) async {
    notesTourController.clear();
    packageDetailsView(context, pId, purchesId, tp);
    // ViewHotelPackageDetails(
    //   context,
    //   hId,
    // );
    // ViewTransportPackageDetails(
    //   context,
    //   tId,
    // );
    // ViewTourPackageDetails(
    //   context,
    //   toId,
    // );
    print("object");
    print("${customerPurchasePackageList?.companyLogoImagePathS ?? ""}");
    print(customerPurchasePackageList?.cityName);
    print("object");
    // getPaymentDetailsList(context, pId);
    notifyListeners();
  }

/////////////////////////////
  String? invoices;

  String? orderId;
  InvoicesdownloadrequestModel get invoicesdownloadrequestModel =>
      InvoicesdownloadrequestModel(orderId: orderId);
  Future<void> downloadInvoise(context, od) async {
    // showLoader(true);
    orderId = od;
    LoadingOverlay.of(context).show();

    // purcheseId = purchesId;
    // type = tp;
    SharedPreferences pref = await SharedPreferences.getInstance();
    donloadInvoiceRepo
        .downloadIn(
            invoicesdownloadrequestModel, pref.getString("successToken"))
        .then((response) async {
      // log(response.body);
      debugPrint('/////////////');
      final result =
          InvoicesDownloadResponseModel.fromJson(jsonDecode(response.body));
      if (response.statusCode == 200) {
        log(response.body);
        invoices = result.invoices;
        String url = Uri.encodeFull(result.invoices.toString());
        if (await canLaunch(url)) {
          launch(url);
        } else {
          throw 'Could not launch $url';
        }
        LoadingOverlay.of(context).hide();
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

  showLoader(value) {
    isLoading = value;
    notifyListeners();
  }

  PackageDetailViewRequestModel get packageDetailViewRequestModel =>
      PackageDetailViewRequestModel(
        type: type,
        purchesId: purcheseId.toString(),
        packageId: packageId,
      );
  Future<void> packageDetailsView(context, pId, purchesId, tp) async {
    showLoader(true);
    packageId = pId;
    purcheseId = purchesId;
    type = tp;
    SharedPreferences pref = await SharedPreferences.getInstance();
    packagedetailViewRepo
        .packageDetails(
            packageDetailViewRequestModel, pref.getString("successToken"))
        .then((response) async {
      // log(response.body);
      debugPrint('/////////////');
      final result =
          PackageDetailViewResponseModel.fromJson(jsonDecode(response.body));
      if (response.statusCode == 200) {
        log(response.body);

        customerPurchasePackageList = result.customerPurchasePackageList;
        cPercentage = customerPurchasePackageList?.completedPercentage;
        cPercentage = (100 - int.parse(cPercentage ?? "")).toString();
        log(cPercentage ?? "");
        otherServices = result.otherServices;
        print("juhujkiuyol,oi;l");
        print("juhujkiuyol,oi;l");
        print(customerPurchasePackageList?.companyLogoImagePathS ?? "");
        print(customerPurchasePackageList?.companyName);

        print("juhujkiuyol,oi;l");
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

  HotelList? hotelList;

  HotelRequestMOdel get hotelRequestMOdel => HotelRequestMOdel(
        id: hotelId.toString(),
      );
  Future<void> ViewHotelPackageDetails(
    context,
    hId,
  ) async {
    hotelId = hId.toString();

    // showLoader(true);
    LoadingOverlay.of(context).show();
    SharedPreferences pref = await SharedPreferences.getInstance();
    hotelViewDetailsRepo
        .hotelView(hotelRequestMOdel, pref.getString("successToken"))
        .then((response) async {
      final result = HotelReposonseMOdel.fromJson(jsonDecode(response.body));
      if (response.statusCode == 200) {
        log(response.body);
        hotelList = result.hotelList;
        LoadingOverlay.of(context).hide();
        showDialog(
            context: context,
            builder: (context) {
              return PackageViewDetailsPagepopUp(hotelId: hId.toString());
            });
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
  //////////////////////////////////////

  TransportationDetails? transportationDetails;
  List<String>? otherServicest;

  TransportationRequestModel get transportationRequestModel =>
      TransportationRequestModel(
        id: transportationId.toString(),
      );
  Future<void> ViewTransportPackageDetails(
    context,
    tId,
  ) async {
    transportationId = tId.toString();

    LoadingOverlay.of(context).show();
    SharedPreferences pref = await SharedPreferences.getInstance();
    transportationRepo
        .transPortation(
            transportationRequestModel, pref.getString("successToken"))
        .then((response) async {
      final result =
          TransportationResponseModel.fromJson(jsonDecode(response.body));
      if (response.statusCode == 200) {
        log(response.body);
        transportationDetails = result.transportationDetails;
        otherServicest = result.otherServicest;
        LoadingOverlay.of(context).hide();
        showDialog(
            context: context,
            builder: (context) {
              return PackageViewDetailsPagepopUpTransport(
                  transportId: tId.toString());
            });
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

  /////////////////////////////////////
  TourDetails? tourDetails;
  List<String>? otherServicestour;

  TourRequestModel get tourRequestModel => TourRequestModel(
        id: tourId.toString(),
      );
  Future<void> ViewTourPackageDetails(
    context,
    toId,
  ) async {
    tourId = toId.toString();

    LoadingOverlay.of(context).show();
    SharedPreferences pref = await SharedPreferences.getInstance();
    tourDetailsRepo
        .tourDetailsRepo(tourRequestModel, pref.getString("successToken"))
        .then((response) async {
      final result = TourResponseModel.fromJson(jsonDecode(response.body));
      if (response.statusCode == 200) {
        log(response.body);
        tourDetails = result.tourDetails;
        otherServicestour = result.otherServicestour;
        LoadingOverlay.of(context).hide();
        showDialog(
            context: context,
            builder: (context) {
              return PackageViewDetailsPagepopUpTour(
                tourDetailId: toId.toString(),
              );
            });
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

////////////////////////////////////////////////////////
  TourNOtesRequestModel get tourNOtesRequestModel => TourNOtesRequestModel(
      purchaseId: purcheseId.toString(), notes: notesTourController.text);
  Future<void> TourNotes(
    context,
  ) async {
    // showLoader(true);
    SharedPreferences pref = await SharedPreferences.getInstance();
    tourNotesRepo
        .notesRepo(tourNOtesRequestModel, pref.getString("successToken"))
        .then((response) async {
      final result = TourNOtesResponseModel.fromJson(jsonDecode(response.body));
      if (response.statusCode == 200) {
        notesTourController.clear();
        log(response.body);
        Utils.showPrimarySnackbar(context, result.message,
            type: SnackType.success);
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

  ////////////////////////////
  AccomodationRequestModel get accomodationRequestModel =>
      AccomodationRequestModel(
          purchaseId: purcheseId.toString(),
          notes: notesAccomodatiopnController.text);
  Future<void> AccomopdationNotes(
    context,
  ) async {
    // showLoader(true);
    SharedPreferences pref = await SharedPreferences.getInstance();
    accomodationNOtesRepo
        .accomodationNOteRepo(
            accomodationRequestModel, pref.getString("successToken"))
        .then((response) async {
      final result =
          AccomodationResponseMOdel.fromJson(jsonDecode(response.body));
      if (response.statusCode == 200) {
        notesTourController.clear();
        log(response.body);
        Utils.showPrimarySnackbar(context, result.message,
            type: SnackType.success);
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

  /////////////////////////////////
  TransportNOtesRequestModel get transportNOtesRequestModel =>
      TransportNOtesRequestModel(
          purchaseId: purcheseId.toString(),
          notes: notesTransportController.text);
  Future<void> TransportNOtes(
    context,
  ) async {
    // showLoader(true);
    SharedPreferences pref = await SharedPreferences.getInstance();
    transportRepo
        .trasnportNoteRepo(
            transportNOtesRequestModel, pref.getString("successToken"))
        .then((response) async {
      final result =
          TransportNOtesResponseModel.fromJson(jsonDecode(response.body));
      if (response.statusCode == 200) {
        notesAccomodatiopnController.clear();
        log(response.body);
        // Utils.showPrimarySnackbar(
        //     context, "Your request has been submitted successfully",
        //     type: SnackType.success);
        Utils.showPrimarySnackbar(context, result.message,
            type: SnackType.success);

        notifyListeners();
      } else {
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
}
