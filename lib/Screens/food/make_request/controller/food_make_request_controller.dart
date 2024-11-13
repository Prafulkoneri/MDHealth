import 'dart:convert';
import 'package:async/async.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:md_health/Screens/auth/model/country_list_model.dart';
import 'package:md_health/Screens/auth/repository/country_list_repository.dart';
import 'package:md_health/Screens/bottom_navigation/view/bottom_view.dart';
import 'package:md_health/Screens/food/diet_plan/view/diet_plan_view.dart';
import 'package:md_health/Screens/food/make_request/model/make_request_model.dart';
import 'package:md_health/Screens/food/make_request/repository/food_make_request_repo.dart';
import 'package:md_health/Screens/person_information/model/fill_form_model.dart';
import 'package:md_health/Screens/person_information/repository/fill_form_repo.dart';
import 'package:md_health/constants/styles/colors.dart';
import 'package:md_health/network/end_point.dart';
import 'package:md_health/utils/utils.dart';
import 'package:md_health/widget/loading_overlay.dart';
import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';
import 'package:http/http.dart' as http;

class FoodRequestFormController extends ChangeNotifier {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController emailIdController = TextEditingController();
  TextEditingController foodNameController = TextEditingController();
  TextEditingController detailController = TextEditingController();
  TextEditingController whydoyouneeedFoodController = TextEditingController();
  bool isTravelVisaNo = false;
  bool isTravelVisaYes = false;
  void onTravelvisaSelected() {
    if (!isTravelVisaYes) {
      isTravelVisaYes = true;
      isTravelVisaNo = false;
      notifyListeners();
    }
  }

  void onTravelVisNotSelectedSelected() {
    if (!isTravelVisaNo) {
      isTravelVisaNo = true;
      isTravelVisaYes = false;
      notifyListeners();
    }
  }

  Future<void> initState(
    context,
  ) async {
    // print(fileImage1);
    firstNameController.clear();
    lastNameController.clear();
    phoneNumberController.clear();
    emailIdController.clear();
    foodNameController.clear();
    detailController.clear();
    whydoyouneeedFoodController.clear();

    countryListId == '';
    await getCountry(context);
  }

  List<CountryList>? countryList;

  int? countryListId;

  Future<void> onSelectCountryType(int value) async {
    countryListId = value;
    print(countryListId);
    notifyListeners();
  }

  FoodFormRequestRepo foodFormRequestRepo = FoodFormRequestRepo();
  FoodFormViewHomeRequestModel get foodFormViewHomeRequestModel =>
      FoodFormViewHomeRequestModel(
        foodImagePaths: selectedFiles.map((file) => file.path).toList(),
        whyNeedFood: whydoyouneeedFoodController.text,
        firstName: firstNameController.text,
        lastName: lastNameController.text,
        contactNumber: phoneNumberController.text,
        email: emailIdController.text,
        foodName: foodNameController.text,
        details: detailController.text,
        country: countryListId.toString(),
        contactType: isTravelVisaYes && isTravelVisaNo
            ? "contact_type"
            : isTravelVisaYes
                ? "Whatsapp "
                : isTravelVisaNo
                    ? "Telegram"
                    : "",
      );

  Future<void> foodFillMakeRequest(context) async {
    // LoadingOverlay.of(context).show();

    if (firstNameController.text == "") {
      Utils.showPrimarySnackbar(context, "Please Fill First Name",
          type: SnackType.error);
      notifyListeners();
      return;
    }
    if (lastNameController.text == "") {
      Utils.showPrimarySnackbar(context, "Please Fill Last Name",
          type: SnackType.error);
      notifyListeners();
      return;
    }
    // if (fileImage1.path == "") {
    //   Utils.showPrimarySnackbar(context, "Please Upload Image",
    //       type: SnackType.error);
    //   notifyListeners();
    //   return;
    // }
// BirthDateController
    if (phoneNumberController.text.length < 10) {
      Utils.showPrimarySnackbar(context, "Please Fill Contact Number",
          type: SnackType.error);
      notifyListeners();
      return;
    }
    if (emailIdController.text.isEmpty) {
      Utils.showPrimarySnackbar(context, "Enter Email Id",
          type: SnackType.error);
      return;
    }
    bool emailValid = RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
        .hasMatch(emailIdController.text.trim());
    print(emailValid);
    if (!emailValid) {
      Utils.showPrimarySnackbar(context, "Please Fill Email Id",
          type: SnackType.error);
      return;
    }

    if (phoneNumberController.text == "") {
      Utils.showPrimarySnackbar(context, "Please Fill Contact Number",
          type: SnackType.error);
      notifyListeners();
      return;
    }
    if (foodNameController.text == "") {
      Utils.showPrimarySnackbar(context, "Please Fill Food Name",
          type: SnackType.error);
      notifyListeners();
      return;
    }
    if (countryListId == null) {
      Utils.showPrimarySnackbar(context, "Please Select Country",
          type: SnackType.error);
      return;
    }
    if (detailController.text == "") {
      Utils.showPrimarySnackbar(context, "Please Fill Details",
          type: SnackType.error);
      notifyListeners();
      return;
    }

    if (whydoyouneeedFoodController.text == "") {
      Utils.showPrimarySnackbar(context, "Please Enter Food Reason",
          type: SnackType.error);
      notifyListeners();
      return;
    }

   SharedPreferences pref = await SharedPreferences.getInstance();
    String token = pref.getString("successToken") ?? "";

    var uri = Uri.parse(Endpoint.foodRequestForm);
    var request = http.MultipartRequest('POST', uri)
      ..headers['Authorization'] = "Bearer $token"
      ..fields['first_name'] = firstNameController.text
      ..fields['last_name'] = lastNameController.text
      ..fields['email'] = emailIdController.text
      ..fields['country_id'] = countryListId.toString()
      ..fields['contact_no'] = phoneNumberController.text
      ..fields['food_name_for_request'] = foodNameController.text
      ..fields['details'] = detailController.text
      ..fields['why_do_you_need_food_1'] = whydoyouneeedFoodController.text
      ..fields['contactType'] = isTravelVisaYes && isTravelVisaNo
          ? "contact_type"
          : isTravelVisaYes
              ? "Whatsapp "
              : isTravelVisaNo
                  ? "Telegram"
                  : "";

    // Add the actual files to the request
    for (var file in selectedFiles) {
      var stream = http.ByteStream(DelegatingStream.typed(file.openRead()));
      var length = await file.length();
      var multipartFile = http.MultipartFile(
        "food_image_name[]", // array-like key
        stream,
        length,
        filename: basename(file.path),
      );
      request.files.add(multipartFile);
    }

    var response = await request.send();
    var responseBody = await http.Response.fromStream(response);

    if (response.statusCode == 200) {
      print(responseBody);
      showDialog(
            context: context,
            builder: (BuildContext context) => AlertDialog(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15.0))),

                  // insetPadding:
                  //    EdgeInsets.all(0),
                  contentPadding: const EdgeInsets.only(top: 0.0),

                  content: Container(
                    width: ScreenUtil().screenWidth,
                    height: 350.h,
                    // padding:
                    //     EdgeInsets.only(bottom: 10.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Stack(
                          children: [
                            Container(
                              decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15.0))),
                              child: ClipRRect(
                                borderRadius:
                                    BorderRadius.circular(15), // Image border
                                child: SizedBox.fromSize(
                                  // size: Size.fromRadius(
                                  //     10), // Image radius
                                  child: const Image(
                                      image: AssetImage(
                                          "assets/images/green_pop_up.png")),
                                ),
                              ),

                              // Image(
                              //     image: AssetImage(
                              //         "assets/images/pop__new_.png")),
                            ),
                            // Positioned(
                            //     top: 15,
                            //     right: 15,
                            //     // left: 0,
                            //     child: GestureDetector(
                            //       onTap: () {
                            //         Navigator.pop(context);
                            //         // Navigator.push(
                            //         //   context,
                            //         //   MaterialPageRoute(
                            //         //       builder: (context) =>
                            //         //           AllOrderDetailView()),
                            //         // );
                            //         // Now using the context obtained from the builder
                            //       },
                            //       child: SvgPicture.asset(
                            //           "assets/icons/red_close.svg"),
                            //     )
                            //     ),
                            Positioned(
                              top: 15,
                              right: 0,
                              left: 0,
                              child: SvgPicture.asset(
                                'assets/icons/bx_home-smile.svg',
                                height: 53.h,
                                width: 53.w,
                                // alignment: Alignment.topRight,
                              ),
                            ),
                            Positioned(
                              top: 80.w,
                              left: 80.w,
                              // left: 0,
                              child: RichText(
                                  text: TextSpan(
                                      style: TextStyle(
                                        fontFamily: 'Campton',
                                        color: Colors.black,
                                        fontSize: 25.sp,
                                        fontWeight: FontWeight.w700,
                                      ),
                                      children: [
                                    TextSpan(
                                        text: 'Thank',
                                        style: TextStyle(color: Colors.white)),
                                    TextSpan(
                                        text: 'You!',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500)),
                                  ])),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 50.w,
                        ),
                        Container(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                          ),
                          // height: 700.h,
                          padding: EdgeInsets.only(right: 10.w, left: 10.w),
                          // width: 331.w,
                          child: Column(
                            // crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Thank you for your feedback.',
                                style: TextStyle(
                                  fontFamily: 'Campton',
                                  color: Colors.black,
                                  fontSize: 19.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              Text(
                                'Our team will get back to you as\n soon as possible.',
                                style: TextStyle(
                                  fontFamily: 'Campton',
                                  color: Colors.black,
                                  fontSize: 17.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(
                                height: 30.h,
                              ),
                              GestureDetector(
                                onTap: () {
                                  // Navigator.pop(context);
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              DietPlanView()));
                                },
                                child: Container(
                                  width: 300.w,
                                  height: 45.h,
                                  decoration: BoxDecoration(
                                    color: kDefaultActiveColor,
                                    borderRadius: BorderRadius.circular(30.w),
                                    // border: Border.all(color: borderColor ?? Colors.transparent)
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Done",
                                      style: TextStyle(
                                        fontFamily: 'Campton',
                                        color: Colors.black,
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      // style: TextStyle(
                                      //     color: textColor ?? Colors.white,
                                      //     fontWeight: fontWeight ?? FontWeight.w700,
                                      //     fontSize: fontSize ?? 14.sp),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          // child: ,
                        ),
                      ],
                    ),
                  ),
                ));
        
      Utils.showPrimarySnackbar(context, "Uploaded Successfully",
          type: SnackType.success);
    } else {
      Utils.showPrimarySnackbar(context, "Error on uploading",
          type: SnackType.error);
    }
  }

///////////////////////////////////////////////
  // String networkImage1 = "";
  // String fileName1 = "";
  // File fileImage1 = File("");
  // String image1Type = "";
  // void onChooseFile1() async {
  //   FilePickerResult? result = await FilePicker.platform.pickFiles(
  //     type: FileType.custom,
  //     allowedExtensions: ['pdf', 'jpg', 'png'],
  //   );
  //   if (result != null) {
  //     networkImage1 = "";
  //     fileName1 = result.files.first.name;
  //     print(result.files.single.extension);
  //     fileImage1 = File(result.files.single.path ?? "");
  //     if (result.files.single.extension == "pdf") {
  //       image1Type = "pdf";
  //     } else {
  //       image1Type = "jpg";
  //     }
  //   }
  //   // await uploadImage(context);
  //   notifyListeners();
  // }
  // List<File> selectedFiles = []; // List to hold selected files
  // List<String> imageTypes = []; // List to store types of images

  // void onChooseFiles() async {
  //   FilePickerResult? result = await FilePicker.platform.pickFiles(
  //     type: FileType.custom,
  //     allowedExtensions: ['pdf', 'jpg', 'png'],
  //     allowMultiple: true, // Allow multiple file selection
  //   );

  //   if (result != null) {
  //     selectedFiles.clear();
  //     imageTypes.clear();
  //     for (var file in result.files) {
  //       if (file.path != null) {
  //         selectedFiles.add(File(file.path!));
  //         imageTypes.add(file.extension!);
  //       }
  //     }
  //   }
  //   notifyListeners();
  // }

  List<File> selectedFiles = []; // List to hold selected files

  void onChooseFiles(BuildContext context) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'jpg', 'png'],
      allowMultiple: true, // Allow multiple file selection
    );

    if (result != null) {
      selectedFiles.clear(); // Clear previously selected files
      for (var file in result.files) {
        if (file.path != null) {
          selectedFiles.add(File(file.path!)); // Add the actual File object
        }
      }
      // await uploadDocuments(context, packageId, selectedFiles);
    }
  }
  ////////////////////////////////////

  // Future uploadImage(context) async {
  //   // LoadingOverlay.of(context).show();
  //   print("888888");
  //   SharedPreferences pref = await SharedPreferences.getInstance();
  //   String token = pref.getString("successToken").toString();
  //   print(token);
  //   var uri = Uri.parse(Endpoint.foodRequestForm);
  //   http.MultipartRequest request = http.MultipartRequest('POST', uri);
  //   request.headers['Authorization'] = "Bearer $token";
  //   request.fields['first_name'] = firstNameController.text;
  //   request.fields['last_name'] = lastNameController.text;
  //   request.fields['email'] = emailIdController.text;
  //   request.fields['country_id'] = countryListId.toString();
  //   request.fields['contact_no'] = phoneNumberController.text;
  //   request.fields['food_name_for_request'] = foodNameController.text;
  //   request.fields['details'] = detailController.text;
  //   request.fields['why_do_you_need_food_1'] = whydoyouneeedFoodController.text;
  //   request.fields['contactType'] = isTravelVisaYes && isTravelVisaNo
  //       ? "contact_type"
  //       : isTravelVisaYes
  //           ? "Whatsapp "
  //           : isTravelVisaNo
  //               ? "Telegram"
  //               : "";
  //   List<http.MultipartFile> newList = <http.MultipartFile>[];
  //   File imageFile1 = fileImage1;
  //   var stream1 =
  //       http.ByteStream(DelegatingStream.typed(imageFile1.openRead()));
  //   var length1 = await imageFile1.length();
  //   var multipartFile1 = http.MultipartFile(
  //       "treatment_image_path", stream1, length1,
  //       filename: basename(imageFile1.path));
  //   newList.add(multipartFile1);
  //   request.files.addAll(newList);
  //   print(request.fields);
  //   var streamedResponse = await request.send();
  //   var response = await http.Response.fromStream(streamedResponse);
  //   print(response.body);
  //   if (response.statusCode == 200) {
  //     SharedPreferences pref = await SharedPreferences.getInstance();
  //     pref.setString('status', 'Uploaded');
  //     Utils.showPrimarySnackbar(context, "Updated Successfully",
  //         type: SnackType.success);
  //   } else {
  //     Utils.showPrimarySnackbar(context, "Error on uploading",
  //         type: SnackType.error);
  //     return;
  //   }
  // }
  // Future<void> uploadImages(BuildContext context) async {
  //   print("Starting upload...");
  //   SharedPreferences pref = await SharedPreferences.getInstance();
  //   String token = pref.getString("successToken") ?? "";

  //   var uri = Uri.parse(Endpoint.foodRequestForm);
  //   var request = http.MultipartRequest('POST', uri)
  // ..headers['Authorization'] = "Bearer $token"
  // ..fields['first_name'] = firstNameController.text
  // ..fields['last_name'] = lastNameController.text
  // ..fields['email'] = emailIdController.text
  // ..fields['country_id'] = countryListId.toString()
  // ..fields['contact_no'] = phoneNumberController.text
  // ..fields['food_name_for_request'] = foodNameController.text
  // ..fields['details'] = detailController.text
  // ..fields['why_do_you_need_food_1'] = whydoyouneeedFoodController.text
  // ..fields['contactType'] = isTravelVisaYes && isTravelVisaNo
  //     ? "contact_type"
  //     : isTravelVisaYes
  //         ? "Whatsapp "
  //         : isTravelVisaNo
  //             ? "Telegram"
  //             : "";

  //   for (var file in selectedFiles) {
  //     var stream = http.ByteStream(DelegatingStream.typed(file.openRead()));
  //     var length = await file.length();
  //     var multipartFile = http.MultipartFile(
  //       "food_image_name[]", // Change the key to an array-like key
  //       stream,
  //       length,
  //       filename: basename(file.path),
  //     );
  //     request.files.add(multipartFile);
  //   }

  //   print(request.fields);
  //   var streamedResponse = await request.send();
  //   var response = await http.Response.fromStream(streamedResponse);
  //   print(response.body);

  //   if (response.statusCode == 200) {
  //     pref.setString('status', 'Uploaded');
  //     Utils.showPrimarySnackbar(context, "Updated Successfully",
  //         type: SnackType.success);
  //   } else {
  //     Utils.showPrimarySnackbar(context, "Error on uploading",
  //         type: SnackType.error);
  //   }
  // }
  Future<void> uploadImages(BuildContext context) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String token = pref.getString("successToken") ?? "";

    var uri = Uri.parse(Endpoint.uploadDocument);
    var request = http.MultipartRequest('POST', uri)
      ..headers['Authorization'] = "Bearer $token"
      ..fields['first_name'] = firstNameController.text
      ..fields['last_name'] = lastNameController.text
      ..fields['email'] = emailIdController.text
      ..fields['country_id'] = countryListId.toString()
      ..fields['contact_no'] = phoneNumberController.text
      ..fields['food_name_for_request'] = foodNameController.text
      ..fields['details'] = detailController.text
      ..fields['why_do_you_need_food_1'] = whydoyouneeedFoodController.text
      ..fields['contactType'] = isTravelVisaYes && isTravelVisaNo
          ? "contact_type"
          : isTravelVisaYes
              ? "Whatsapp "
              : isTravelVisaNo
                  ? "Telegram"
                  : "";

    // Add the actual files to the request
    for (var file in selectedFiles) {
      var stream = http.ByteStream(DelegatingStream.typed(file.openRead()));
      var length = await file.length();
      var multipartFile = http.MultipartFile(
        "food_image_name[]", // array-like key
        stream,
        length,
        filename: basename(file.path),
      );
      request.files.add(multipartFile);
    }

    var response = await request.send();
    var responseBody = await http.Response.fromStream(response);

    if (response.statusCode == 200) {
      Utils.showPrimarySnackbar(context, "Uploaded Successfully",
          type: SnackType.success);
    } else {
      Utils.showPrimarySnackbar(context, "Error on uploading",
          type: SnackType.error);
    }
  }
///////////////////////////////////

  CountryListRepository countryListRepo = CountryListRepository();

  Future<void> getCountry(context) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    countryListRepo.getCountries(context).then((response) {
      print(response.body);
      final result = CountryListModel.fromJson(jsonDecode(response.body));
      print(response.statusCode);
      if (response.statusCode == 200) {
        print(response.body);
        countryList = result.countryList;
        print(countryList);
        notifyListeners();
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
