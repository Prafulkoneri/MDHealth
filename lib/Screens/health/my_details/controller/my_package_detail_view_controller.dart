// import 'dart:convert';
// import 'dart:developer';

// import 'package:flutter/material.dart';
// import 'package:md_health/Screens/my_details/model/my_detail_model.dart';
// import 'package:md_health/Screens/my_details/repository/package_my_detail_view.dart';
// import 'package:md_health/utils/utils.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class MyPackageDetailViewCOntroller extends ChangeNotifier {
//   MyPackageDetailViewRepo myPackageDetailViewRepo = MyPackageDetailViewRepo();
//   String packageId = '';
//   String patientId = '';
//   String purchaseId = '';
//   bool isLoading = false;
//   PatientInformation? patientInformation;
//   TreatmentInformation? treatmentInformation;

//   Future<void> initState(context, pId, idPatient, puId) async {
//     await myPackageDetailView(context, pId, idPatient, puId);
//     notifyListeners();
//   }

//   showLoader(value) {
//     isLoading = value;
//     notifyListeners();
//   }

//   MyPackageDetailResponseModelReq get myPackageDetailResponseModelReq =>
//       MyPackageDetailResponseModelReq(
//           purchesId: purchaseId.toString(),
//           patientId: patientId.toString(),
//           packageId: packageId);
//   // Future<void> myPackageDetailView(context, pId, idPatient, puId) async {
//   // packageId = pId;
//   // patientId = idPatient;
//   // purchaseId = puId;
//   //   showLoader(true);
//   //   SharedPreferences pref = await SharedPreferences.getInstance();
//   //   myPackageDetailViewRepo
//   // .mypackageDetails(
//   //     myPackageDetailResponseModelReq, pref.getString("successToken"))
//   //       .then((response) async {
//   //     final result =
//   //         MyPackageDetailResponseModel.fromJson(jsonDecode(response.body));
//   //     if (response.statusCode == 200) {
//   //       log(response.body);
//   // patientInformation = result.patientInformation;
//   // treatmentInformation = result.treatmentInformation;
//   //       log("1");
//   //       showLoader(false);
//   //       log("2");
//   //       notifyListeners();
//   //       log("3");
//   //     }
//   //   }).onError((error, stackTrace) {
//   //     Utils.showPrimarySnackbar(context, error, type: SnackType.debugError);
//   //   }).catchError(
//   //     (Object e) {
//   //       Utils.showPrimarySnackbar(context, e, type: SnackType.debugError);
//   //     },
//   //     test: (Object e) {
//   //       Utils.showPrimarySnackbar(context, e, type: SnackType.debugError);
//   //       return false;
//   //     },
//   //   );
//   // }
//   Future<void> myPackageDetailView(context, pId, idPatient, puId) async {
//     packageId = pId;
//     patientId = idPatient;
//     purchaseId = puId;
//     SharedPreferences pref = await SharedPreferences.getInstance();
//     myPackageDetailViewRepo
//         .mypackageDetails(
//             myPackageDetailResponseModelReq, pref.getString("successToken"))
//         .then((response) async {
//       // log(response.body);
//       debugPrint('/////////////');
//       final result =
//           MyPackageDetailResponseModel.fromJson(jsonDecode(response.body));
//       if (response.statusCode == 200) {
//         log(response.body);
//         patientInformation = result.patientInformation;
//         treatmentInformation = result.treatmentInformation;

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
// }

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:md_health/Screens/health/my_details/model/my_detail_model.dart';
import 'package:md_health/Screens/health/my_details/repository/package_my_detail_view.dart';
import 'package:md_health/utils/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyPackageDetailController extends ChangeNotifier {
  final MyPackageDetailViewRepo shopEditProfileRepo = MyPackageDetailViewRepo();

  String packageId = '';
  String type = '';
  String patientId = '';
  String purchesId = '';
  bool isLoading = true;
  PatientInformation? patientInformation;
  TreatmentInformation? treatmentInformation;

  Future<void> initState(BuildContext context, String pId, String idPatient,
      String purId, String tp) async {
    packageId = pId;
    patientId = idPatient;
    purchesId = purId;
    type = tp;

    await myPackageDetailView(context);

    // You can choose to call notifyListeners here or inside myPackageDetailView
    notifyListeners();
  }

  showLoader(bool value) {
    isLoading = value;
    notifyListeners();
  }

  MyPackageDetailResponseModelReq get myPackageDetailResponseModelReq =>
      MyPackageDetailResponseModelReq(
        type: type,
        packageId: packageId.toString(),
        patientId: patientId.toString(),
        purchesId: purchesId.toString(),
      );

  Future<void> myPackageDetailView(context) async {
    showLoader(true);
    SharedPreferences pref = await SharedPreferences.getInstance();
    print(pref.getString("successToken"));

    try {
      final response = await shopEditProfileRepo.mypackageDetails(
        myPackageDetailResponseModelReq,
        pref.getString("successToken") ?? '',
      );

      final result =
          MyPackageDetailResponseModel.fromJson(jsonDecode(response.body));

      if (response.statusCode == 200) {
        print(response.body);

        print("object");
        print(patientInformation);
        print("object");

        patientInformation = result.patientInformation;
        treatmentInformation = result.treatmentInformation;

        showLoader(false);
        notifyListeners();
      } else {
        Utils.showPrimarySnackbar(context, result.message,
            type: SnackType.error);
      }
    } catch (e) {
      Utils.showPrimarySnackbar(context, e.toString(),
          type: SnackType.debugError);
    }
  }
}
