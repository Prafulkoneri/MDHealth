// import 'dart:convert';
// import 'dart:developer';

// import 'package:flutter/cupertino.dart';
// import 'package:md_health/Screens/order_details/model/submit_food_review.dart';
// import 'package:md_health/Screens/order_details/repo/food_add_review_new_pop_up.dart';
// import 'package:md_health/utils/utils.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class FoodAddReviewNewPopUpController extends ChangeNotifier {
//   FoodAddReviewNewPopUpRepo writeReviewRepo = FoodAddReviewNewPopUpRepo();
//   // ThreeReviewRepo threeReviewRepo = ThreeReviewRepo();
//   TextEditingController reviewController = TextEditingController();

//   String orderId = '';
//   String feedback = '';
//   String rating = '';
//   String recommendation = '';
//   String productId = '';
//   bool isLoading = true;

// <<<<<<< HEAD
//   // String packageId = '';
// =======


//   String packageId = '';
// >>>>>>> 6dc007da3bf8332e86eecd4f450553651e7555ed
//   // String purcheseId = '';
//   // bool isLoading = true;
//   double? cleanless;
//   double? ratingValues;
//   double? transportationValueratingValue;
//   double? behaviorValueratingValue;
//   double? newStartOne;
//   double? newStartTwo;
//   double? newStartThree;
//   double? comfort;
//   double? food;

//   // Future<void> initState(context, pId, puId
//   //     // valueTreatment, valueTransportation,
//   //     //     valueBehaviorValue, valueacommmodation
//   //     ) async {
//   //   // await threeReview(context, puId);
//   //   notifyListeners();
//   // }

// /////////////////////////////

//   showLoader(value) {
//     isLoading = value;
//     notifyListeners();
//   }

//   void onRatingSelectsCleanless(value) {
//     cleanless = value;
//     notifyListeners();
//   }

//   void onRatingSelectsComfort(value) {
//     comfort = value;
//     notifyListeners();
//   }

//   void onRatingSelectsFood(value) {
//     food = value;
//     notifyListeners();
//   }

//   void onRatingSelectsBehavior(value) {
//     behaviorValueratingValue = value;
//     notifyListeners();
//   }
//   /////////////////////////

//   void onRatingNewOne(value) {
//     newStartOne = value;
//     notifyListeners();
//   }

//   void onRatingNewTWO(value) {
//     newStartTwo = value;
//     notifyListeners();
//   }

//   void onRatingNewtHREE(value) {
//     newStartThree = value;
//     notifyListeners();
//   }

//   FoodAddReviewNewRequestModel get wirteReviewRequestModel =>
//       FoodAddReviewNewRequestModel(
//           orderId: orderId.toString(),
//           feedback: feedback,
//           rating: rating.toString(),
//           recommendation: recommendation.toString(),
//           productId: productId.toString()

//           // purchaseId: purcheseId,
//           // packageId: purcheseId,
//           // notes: reviewController.text,
//           // behaviorValue: behaviorValueratingValue.toString(),
//           // foodQuality: food.toString(),
//           // comfort: comfort.toString(),
//           // cleanliness: cleanless.toString(),
//           // tour: newStartThree.toString(),
//           // transportation: newStartTwo.toString(),
//           // accomodation: newStartOne.toString()
//           // treatmentValue: treatmentValueratingValue.toString(),
//           // notes: reviewController.text,
//           // transportationValue: transportationValueratingValue.toString(),
//           // behaviorValue: behaviorValueratingValue.toString(),
//           // acommmodationValue: acommmodationValueratingValue.toString(),
//           // packageId: packageId
//           );
//   Future<void> writeFoodReview(context, pId, puId
//       // valueTreatment, valueTransportation,
//       //     valueBehaviorValue, valueacommmodation
//       ) async {
//     showLoader(true);

//     // send all req parameters here change fun name cause you called writeFoodReview from repo.
//     // packageId = pId;
//     // packageId = puId;

//     // treatmentValueratingValue = valueTreatment;
//     // transportationValueratingValue = valueTransportation;
//     // behaviorValueratingValue = valueBehaviorValue;
//     // acommmodationValueratingValue = valueacommmodation;
//     SharedPreferences pref = await SharedPreferences.getInstance();
//     writeReviewRepo
//         .writeFoodReview(
//             wirteReviewRequestModel, pref.getString("successToken"))
//         .then((response) async {
//       // log(response.body);
//       debugPrint('/////////////');
//       final result =
//           FoodAddReviewNewResponseModel.fromJson(jsonDecode(response.body));
//       if (response.statusCode == 200) {
//         log(response.body);
//         // customerReviewsData = result.customerReviewsData;
//         // reviewController.text = customerReviewsData?.extraNotes ?? "";

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

// //   ReviewsScreenData? reviewsScreenDatas;

// //   ///////////////
// //   ActiveReviewRequestMOdel get activeReviewRequestMOdel =>
// //       ActiveReviewRequestMOdel(
// //         purchaseId: purcheseId.toString(),
// //       );
// //   Future<void> threeReview(context, puId) async {
// //     showLoader(true);
// //     purcheseId = puId;

// //     SharedPreferences pref = await SharedPreferences.getInstance();
// //     threeReviewRepo
// //         .threeReview(activeReviewRequestMOdel, pref.getString("successToken"))
// //         .then((response) async {
// //       debugPrint('/////////////');
// //       final result =
// //           ActiveReviewResponseMOdel.fromJson(jsonDecode(response.body));
// //       if (response.statusCode == 200) {
// //         log(response.body);
// //         reviewsScreenDatas = result.reviewsScreenDatas;
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
// }
