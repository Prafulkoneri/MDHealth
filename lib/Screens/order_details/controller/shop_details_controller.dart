import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:md_health/Screens/auth/model/city_list_model.dart';
import 'package:md_health/Screens/auth/repository/city_list_repository.dart';
import 'package:md_health/Screens/auth/repository/country_list_repository.dart';
import 'package:md_health/Screens/order/view/order_view.dart';
import 'package:md_health/Screens/order_details/model/country_list_model.dart';
import 'package:md_health/Screens/order_details/model/country_search_list_model.dart';
import 'package:md_health/Screens/order_details/model/invoice_food_download_model.dart';
import 'package:md_health/Screens/order_details/model/order_cancelled_shop_model.dart';
import 'package:md_health/Screens/order_details/model/order_details_food_model.dart';
import 'package:md_health/Screens/order_details/model/shop_order_change_address_model.dart';
import 'package:md_health/Screens/order_details/model/shop_order_details_model.dart';
import 'package:md_health/Screens/order_details/model/show_shop_review_model.dart';
import 'package:md_health/Screens/order_details/model/submit_shop_review_model.dart';
import 'package:md_health/Screens/order_details/repo/calShopOrder_repo.dart';
import 'package:md_health/Screens/order_details/repo/chnage_address_repo.dart';
import 'package:md_health/Screens/order_details/repo/food_order_details_repo.dart';
import 'package:md_health/Screens/order_details/repo/invoices_food_repo.dart';
import 'package:md_health/Screens/order_details/repo/order_list_repo.dart';
import 'package:md_health/Screens/order_details/repo/order_search_package_repo.dart';
import 'package:md_health/Screens/order_details/repo/shop_order_details_repo.dart';
import 'package:md_health/Screens/order_details/repo/show_shop_repo.dart';
import 'package:md_health/Screens/order_details/repo/submit_shop_repo.dart';
import 'package:md_health/Screens/order_details/view/md_food_view.dart';
import 'package:md_health/Screens/order_details/view/md_shop_view.dart';
import 'package:md_health/Screens/order_details/view/show_shop_review_pop.dart';
import 'package:md_health/test_widget.dart';
import 'package:md_health/utils/utils.dart';
import 'package:md_health/widget/buttons.dart';
import 'package:md_health/widget/loading_overlay.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class ShopListDetailsController extends ChangeNotifier {
  ShopOrderDetailsRepo shopOrderDetailsRepo = ShopOrderDetailsRepo();
  CancelledShopOrdeRepo cancelledShopOrdeRepo = CancelledShopOrdeRepo();
  CityListRepository cityListRepo = CityListRepository();
  ChangeAddressRepo changeAddressRepo = ChangeAddressRepo();
  SubmitShopreviewRepo submitShopreviewRepo = SubmitShopreviewRepo();
  ShowShopReviewRepo showShopReviewRepo = ShowShopReviewRepo();

  String shopOrderId = '';
  String countryId = '';
  List<SdhopProductDetails>? shopProductDetails;
  String? deliveryCharge;
  String? productAmountPaid;
  String? totalAmountPaid;
  int? productCount;
  String? paymentStatus;
  String? orderId;
  String? paymentMode;
  String? invoice;
  String? orderStatus;
  String? paymentDate;
  String? cargoCompanyName;
  String? cargoTrackingNumber;
  String? cargoTrackingUrl;
  String? city;
  String? country;
  String? address;
  String? cancellationBy;
  String? cancellationDate;
  String? cancellationReason;
  bool isLoading = true;

  Future<void> initState(context, shdId, proID, proName) async {
    print("orderId");
    print(orderId);
    print("orderId");
    await ShopOrderDetailsView(context, shdId);
    getCountry(context);
    notifyListeners();
  }

  // String selectedCountryId = 'Choose Country';
  String selectedCountry = 'Choose Country'; // Change String? to String
  // String selectedCityId = 'Choose City';
  String selectedCity = 'Choose City'; // Change String? to String
  void selectCountry(String country) {
    selectedCountry = country;
    // selectedCountryId = id;
    notifyListeners();
  }

  void selectCity(String city) {
    selectedCity = city;
    // selectedCityId = id;
    notifyListeners();
  }

/////////////////////////////

  showLoader(value) {
    isLoading = value;
    notifyListeners();
  }

  OrderFoodDetails? orderFoodDetails;

  DetailsShopOrderListRequestModel get detailsShopOrderListRequestModel =>
      DetailsShopOrderListRequestModel(
        shopOrderId: shopOrderId,
      );
  Future<void> ShopOrderDetailsView(context, shdId) async {
    shopOrderId = shdId.toString();

    showLoader(true);
    SharedPreferences pref = await SharedPreferences.getInstance();
    shopOrderDetailsRepo
        .shopOrderDetails(
            detailsShopOrderListRequestModel, pref.getString("successToken"))
        .then((response) async {
      final result =
          ShopOrderListResponseModel.fromJson(jsonDecode(response.body));
      if (response.statusCode == 200) {
        log(response.body);
        shopProductDetails = result.shopProductDetails;
        deliveryCharge = result.deliveryCharge.toString();
        productAmountPaid = result.productAmountPaid.toString();
        totalAmountPaid = result.totalAmountPaid;
        orderId = result.orderId;
        productCount = result.productCount;
        paymentStatus = result.paymentStatus;
        paymentMode = result.paymentMode;
        orderStatus = result.orderStatus;
        paymentDate = result.paymentDate;
        cargoCompanyName = result.cargoCompanyName;
        cargoTrackingNumber = result.cargoTrackingNumber;
        cargoTrackingUrl = result.cargoTrackingUrl;
        city = result.cityName;
        country = result.countryName;
        address = result.address;
        cancellationBy = result.cancellationBy;
        cancellationDate = result.cancellationDate;
        cancellationReason = result.cancellationReason;
        invoice = result.invoice;
        // Utils.showPrimarySnackbar(context, result.message,
        //     type: SnackType.success);
        showLoader(false);
        notifyListeners();
      }
      notifyListeners();
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

  bool isChecked = false;

  void onChecked() {
    isChecked = !isChecked;
    notifyListeners();
  }

  void clearCancellationPopup() {
    reasonController.clear();
    isChecked = false;
    notifyListeners();
  }

  TextEditingController reasonController = TextEditingController();

  OrderCancelledRequestModelShop get orderCancelledRequestModelShop =>
      OrderCancelledRequestModelShop(
        cancelledReasom: reasonController.text,
        shopOrderId: shopOrderId.toString(),
      );
  Future<void> deletedShopProduct(
    context,
    shdId,
  ) async {
    shopOrderId = shdId.toString();
    // reasonController = cancelledReasom.text;
    showLoader(true);
    SharedPreferences pref = await SharedPreferences.getInstance();
    cancelledShopOrdeRepo
        .cancelledshopOrder(
            orderCancelledRequestModelShop, pref.getString("successToken"))
        .then((response) async {
      final result =
          OrderCancelledResponseModelShop.fromJson(jsonDecode(response.body));
      if (response.statusCode == 200) {
        reasonController.clear(); // Clear text field
        isChecked = false; //
        // Navigator.push(
        //   context,
        //   SlidePageRoute(
        //     page: OrderMdShopView(
        //         // foodOrderID: element?.id.toString(),
        //         // packageId:MdShopView
        //         //     widget.packageId,
        //         ),
        //     direction: SlideDirection.right, // Specify the slide direction here
        //     delay: Duration(milliseconds: 5000),
        //   ),
        // );

        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15.0))),
                  contentPadding: EdgeInsets.only(top: 0.0),
                  content: Container(
                    width: ScreenUtil().screenWidth,
                    height: 350.h,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15.0))),
                              child: ClipRRect(
                                borderRadius:
                                    BorderRadius.circular(15), // Image border
                                child: SizedBox.fromSize(
                                  // size: Size.fromRadius(
                                  //     10), // Image radius
                                  child: Image(
                                      image: AssetImage(
                                          "assets/images/pop__new_.png")),
                                ),
                              ),
                            ),
                            Positioned(
                                top: 25,
                                right: 0,
                                left: 0,
                                child: Column(
                                  children: [
                                    SvgPicture.asset("assets/icons/sad.svg"),
                                    RichText(
                                      text: TextSpan(
                                        text: 'Thank',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 30.sp,
                                            fontWeight: FontWeight.w700),
                                        children: <TextSpan>[
                                          TextSpan(
                                            text: ' You!',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 30.sp,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                )),
                          ],
                        ),
                        SizedBox(
                          height: 38.h,
                        ),
                        Text(
                          "Thank you for your request.",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.black,
                              // letterSpacing: .5,
                              fontSize: 21.sp,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 38.h,
                        ),
                        Text(
                          'Our team will contact you as soon as possible \nregarding your cancellation request.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.black,
                              // letterSpacing: .5,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          height: 48.h,
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 22.w, right: 21.w),
                          child: PrimaryButton(
                            // width:
                            //     125.w,
                            // height:
                            //     35.w,
                            // borderRadius: BorderRadius.circular(),
                            borderRadius: 25,
                            // width: ScreenUtil().screenWidth,
                            color: Color(0xffF55C5C),
                            onTap: () {
                              Navigator.push(
                                context,
                                SlidePageRoute(
                                  page: OrderMdShopView(
                                      // foodOrderID: element?.id.toString(),
                                      // packageId:MdShopView
                                      //     widget.packageId,
                                      ),
                                  direction: SlideDirection
                                      .right, // Specify the slide direction here
                                  delay: Duration(milliseconds: 5000),
                                ),
                              );
                              // Navigator.pop(context);
                              // // Navigator.push(
                              // //   context,
                              // //   MaterialPageRoute(
                              // //       builder: (context) =>
                              // //           ChangeInformationFormView()),
                              // // );
                            },
                            child: Text(
                              "Done",
                              style: TextStyle(
                                  color: Colors.white,
                                  // letterSpacing: .5,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ));
        // print(cancelId);
        print("object");
        // activePackageList(context);
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

  List<CountryList>? countryList;
  CountryListRepository countryListRepo = CountryListRepository();

  Future<void> getCountry(context) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    countryListRepo.getCountries(context).then((response) {
      print(response.body);
      final result =
          CountryListModelOrderRes.fromJson(jsonDecode(response.body));
      print(response.statusCode);
      if (response.statusCode == 200) {
        print(response.body);
        countryList = result.countryList;
        print(countryList);
        notifyListeners();
      } else {
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

  List<CityListData>? cityList;

  CityListRequestModel get requestModel =>
      CityListRequestModel(countryId: countryId.toString());

  Future<void> getCities(context, cId) async {
    countryId = cId;
    cityListRepo.getCityList(requestModel, context).then((response) {
      final result = CityListResponseModel.fromJson(jsonDecode(response.body));
      if (response.statusCode == 200) {
        if (result.status == 200) {
          cityList = result.cityList;
          debugPrint(cityList?[1].toString());
          notifyListeners();
        } else {
          Utils.showPrimarySnackbar(context, result.message,
              type: SnackType.error);
        }
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
  /////////////////////////////////////////////////////

  TextEditingController chnageAddressController = TextEditingController();
  ChangeAddresstRequestModel get changeAddresstRequestModel =>
      ChangeAddresstRequestModel(
        address: chnageAddressController.text,
        countryId: selectedCountry.toString(),
        cityId: selectedCity.toString(),
        oId: orderId,
      );

  Future<void> chnageAddress(context, sCountry, sCity, changeadd, shdId) async {
    selectedCountry = sCountry;
    selectedCity = sCity;
    chnageAddressController.text = changeadd;
    orderId = shdId;
    // LoadingOverlay.of(context).show();
    SharedPreferences pref = await SharedPreferences.getInstance();
    changeAddressRepo
        .chnageAddress(
            changeAddresstRequestModel, pref.getString("successToken"))

        // changeAddressRepo
        //     .chnageAddress(changeAddresstRequestModel, token)
        .then((response) {
      final result =
          ChangeAddresstResponseModel.fromJson(jsonDecode(response.body));
      if (response.statusCode == 200) {
        if (result.status == 200) {
          ShopOrderDetailsView(context, shdId);
          Navigator.push(
            context,
            SlidePageRoute(
              page: OrderMdShopView(
                  // packageId:MdShopView
                  //     widget.packageId,
                  ),
              direction:
                  SlideDirection.left, // Specify the slide direction here
              delay: Duration(milliseconds: 5000),
            ),
          );
          // cityList = result.cityList;
          // debugPrint(cityList?[1].toString());
          notifyListeners();

          Utils.showPrimarySnackbar(context, result.message,
              type: SnackType.success);
          // notifyListeners();
        } else {
          Utils.showPrimarySnackbar(context, result.message,
              type: SnackType.error);
          // LoadingOverlay.of(context).hide();
        }
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

  double? shopRecommanded;
  double? shopReview;
  String? productId;

  void onTapShopRecommanded(value) {
    shopRecommanded = value;
    notifyListeners();
  }

  TextEditingController shopFeedBackController = TextEditingController();

  void onTapShopReview(value) {
    shopReview = value;
    notifyListeners();
  }

  ShopAddReviewNewRequestModel get shopAddReviewNewRequestModel =>
      ShopAddReviewNewRequestModel(
          recommendation: shopRecommanded.toString(),
          rating: shopReview.toString(),
          productId: productId,
          feedback: shopFeedBackController.text,
          orderId: orderId);
  Future<void> shopAddReview(context, od, pId, sFeed, sR, sRc, shdId) async {
    // showLoader(true);
    orderId = od;
    productId = pId;
    shopFeedBackController.text = sFeed;
    shopReview = sR;
    shopRecommanded = sRc;

    // LoadingOverlay.of(context).show();

    // type = tp;
    SharedPreferences pref = await SharedPreferences.getInstance();
    submitShopreviewRepo
        .submitshopreview(
            shopAddReviewNewRequestModel, pref.getString("successToken"))
        .then((response) async {
      // log(response.body);
      debugPrint('/////////////');
      final result =
          ShopAddReviewNewResponseModel.fromJson(jsonDecode(response.body));
      debugPrint('1111111111111111111111');
      if (response.statusCode == 200) {
        log(response.body);
        ShopOrderDetailsView(context, shdId);
        Navigator.pop(context);
        notifyListeners();

        // showDialog(
        //     context: context,
        //     builder: (BuildContext context) => AlertDialog(
        //           shape: RoundedRectangleBorder(
        //               borderRadius: BorderRadius.all(Radius.circular(15.0))),

        //           // insetPadding:
        //           //    EdgeInsets.all(0),
        //           contentPadding: EdgeInsets.only(top: 0.0),

        //           content: Container(
        //             width: ScreenUtil().screenWidth,
        //             height: 350.h,
        //             // padding:
        //             //     EdgeInsets.only(bottom: 10.w),
        //             child: Column(
        //               crossAxisAlignment: CrossAxisAlignment.center,
        //               children: [
        //                 Stack(
        //                   children: [
        //                     Container(
        //                       decoration: BoxDecoration(
        //                           borderRadius:
        //                               BorderRadius.all(Radius.circular(15.0))),
        //                       child: ClipRRect(
        //                         borderRadius:
        //                             BorderRadius.circular(15), // Image border
        //                         child: SizedBox.fromSize(
        //                           // size: Size.fromRadius(
        //                           //     10), // Image radius
        //                           child: Image(
        //                               image: AssetImage(
        //                                   "assets/images/green_pop_up.png")),
        //                         ),
        //                       ),

        //                       // Image(
        //                       //     image: AssetImage(
        //                       //         "assets/images/pop__new_.png")),
        //                     ),
        //                     Positioned(
        //                         top: 15,
        //                         right: 0,
        //                         left: 0,
        //                         child: Column(
        //                           children: [
        //                             SvgPicture.asset(
        //                                 "assets/icons/happy_pop_up.svg"),
        //                             // Text(
        //                             //   "Delete",
        //                             //   style: TextStyle(
        //                             //       color: Colors.white,
        //                             //       // letterSpacing: .5,
        //                             //       fontSize: 30.sp,
        //                             //       fontWeight: FontWeight.w700),
        //                             // ),
        //                             SizedBox(
        //                               height: 10.w,
        //                             ),
        //                             RichText(
        //                               text: TextSpan(
        //                                 text: 'Thank',
        //                                 style: TextStyle(
        //                                     letterSpacing: -1,
        //                                     fontFamily: 'Campton',
        //                                     color: Colors.white,
        //                                     fontSize: 30.sp,
        //                                     fontWeight: FontWeight.w700),

        //                                 /*defining default style is optional */
        //                                 children: <TextSpan>[
        //                                   TextSpan(
        //                                     text: ' You!',
        //                                     style: TextStyle(
        //                                         letterSpacing: -1,
        //                                         fontFamily: 'Campton',
        //                                         color: Colors.black,
        //                                         fontSize: 30.sp,
        //                                         fontWeight: FontWeight.w500),
        //                                   ),
        //                                 ],
        //                               ),
        //                             ),
        //                           ],
        //                         )),
        //                   ],
        //                 ),
        //                 SizedBox(
        //                   height: 38.h,
        //                 ),
        //                 Text(
        //                   "Thank you for your review.",
        //                   textAlign: TextAlign.center,
        //                   style: TextStyle(
        //                       color: Colors.black,
        //                       letterSpacing: -1,
        //                       fontFamily: 'Campton',
        //                       fontSize: 21.sp,
        //                       fontWeight: FontWeight.w600),
        //                 ),
        //                 SizedBox(
        //                   height: 15.h,
        //                 ),
        //                 RichText(
        //                   textAlign: TextAlign.center,
        //                   text: TextSpan(
        //                     text: 'The reward will be credited to your\n',
        //                     style: TextStyle(
        //                         letterSpacing: -1,
        //                         fontFamily: 'Campton',
        //                         color: Colors.black,
        //                         fontSize: 14.sp,
        //                         fontWeight: FontWeight.w400),
        //                     children: <TextSpan>[
        //                       TextSpan(
        //                         text: 'MD',
        //                         style: TextStyle(
        //                             letterSpacing: -1,
        //                             fontFamily: 'Campton',
        //                             color: Colors.black,
        //                             fontSize: 17.sp,
        //                             fontWeight: FontWeight.w700),
        //                       ),
        //                       TextSpan(
        //                         text: 'Coin account as soon as possible.',
        //                         style: TextStyle(
        //                             letterSpacing: -1,
        //                             fontFamily: 'Campton',
        //                             color: Colors.black,
        //                             fontSize: 14.sp,
        //                             fontWeight: FontWeight.w400),
        //                       ),
        //                     ],
        //                   ),
        //                 ),
        //                 SizedBox(
        //                   height: 48.h,
        //                 ),
        //                 Container(
        //                   padding: EdgeInsets.only(left: 22.w, right: 21.w),
        //                   child: PrimaryButton(
        //                     // width:
        //                     //     125.w,
        //                     // height:
        //                     //     35.w,
        //                     // borderRadius: BorderRadius.circular(),
        //                     borderRadius: 25,
        //                     // width: ScreenUtil().screenWidth,
        //                     color: Color(0xff4CDB06),
        //                     onTap: () {
        //                       // Navigator.pop(this.context);
        //                       Navigator.pop(context);
        //                     },
        //                     child: Text(
        //                       "Done",
        //                       style: TextStyle(
        //                           color: Colors.black,
        //                           letterSpacing: -1,
        //                           fontFamily: 'Campton',
        //                           fontSize: 16.sp,
        //                           fontWeight: FontWeight.w600),
        //                     ),
        //                   ),
        //                 )
        //               ],
        //             ),
        //           ),
        //         ));
        // LoadingOverlay.of(context).hide();
        notifyListeners();
      } else {
        log(response.body);
        Utils.showPrimarySnackbar(context, result.message,
            type: SnackType.error);
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

  ShowShopOrderReviewRequestModel get showShopOrderReviewRequestModel =>
      ShowShopOrderReviewRequestModel(id: productId, orderID: orderId);
  // ShowFoodReviewdata? showfoodreviewdata;
  int? recommendation; //
  String? productName; //
  int? rating; //
  String? feedback; //
  ShowShopdReviewdata? showshopreviewdata;

  Future<void> getShopReview(context, orId, pId, pName) async {
    // showLoader(true);
    orderId = orId;
    productId = pId;
    productName = pName;
    LoadingOverlay.of(context).show();

    //
    // type = tp;
    SharedPreferences pref = await SharedPreferences.getInstance();
    showShopReviewRepo
        .showShopreview(
            showShopOrderReviewRequestModel, pref.getString("successToken"))
        .then((response) async {
      // log(response.body);
      debugPrint('/////////////');
      final result =
          ShowShopOrderResponseModel.fromJson(jsonDecode(response.body));
      if (response.statusCode == 200) {
        log(response.body);
        // showshopreviewdata = result.showshopreviewdata;
        rating = result.rating;
        feedback = result.feedback ?? '';
        recommendation = result.recommendation;
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15.0))),
                contentPadding: EdgeInsets.only(top: 0.0),
                content: ShowShopReviewPopUp(
                  orderId: orderId,
                  productId: productId.toString(),
                  productName: productName,
                )));
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
}
