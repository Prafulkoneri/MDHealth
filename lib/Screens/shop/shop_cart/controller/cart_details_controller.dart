import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:md_health/Screens/address/model/add_address_model.dart';
import 'package:md_health/Screens/address/model/address_list_model.dart';
import 'package:md_health/Screens/address/repository/add_address_list_repo.dart';
import 'package:md_health/Screens/address/repository/address_list_repo.dart';
import 'package:md_health/Screens/auth/model/city_list_model.dart';
import 'package:md_health/Screens/auth/model/country_list_model.dart';
import 'package:md_health/Screens/auth/repository/city_list_repository.dart';
import 'package:md_health/Screens/auth/repository/country_list_repository.dart';
// import 'package:md_health/Screens/md_shop_home_page/view/md_shop_home_page.dart';
import 'package:md_health/Screens/shop/md_shop_home_page/view/md_shop_home_page.dart';
import 'package:md_health/Screens/shop/shop_cart/model/all_cart_delete_model.dart';
import 'package:md_health/Screens/shop/shop_cart/model/cart_decrement_model.dart';
import 'package:md_health/Screens/shop/shop_cart/model/cart_increment_%20model.dart';
import 'package:md_health/Screens/shop/shop_cart/model/cart_view_model.dart';
import 'package:md_health/Screens/shop/shop_cart/model/contract_forms_model.dart';
import 'package:md_health/Screens/shop/shop_cart/model/one_item_delete_model.dart';
import 'package:md_health/Screens/shop/shop_cart/repository/all_cart_delete_repo.dart';
import 'package:md_health/Screens/shop/shop_cart/repository/cart_count_decrease_repo.dart';
import 'package:md_health/Screens/shop/shop_cart/repository/cart_count_increase_repo.dart';
import 'package:md_health/Screens/shop/shop_cart/repository/contract_forms_repo.dart';
import 'package:md_health/Screens/shop/shop_cart/repository/delete_one_cart_repo.dart';
import 'package:md_health/Screens/shop/shop_cart/repository/get_cart_details_repo.dart';
import 'package:md_health/Screens/shop/shop_cart/view/select_address.dart';
import 'package:md_health/test_widget.dart';
import 'package:md_health/utils/utils.dart';
import 'package:md_health/widget/loading_overlay.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class CartDetailViewController extends ChangeNotifier {
  TextEditingController addressNameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController postalcodeController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  CartViewRepo cartViewRepo = CartViewRepo();
  CartCountDecreaseRepo cartCountDecreaseRepo = CartCountDecreaseRepo();
  CartCountIncreaseRepo cartCountIncreaseRepo = CartCountIncreaseRepo();
  AllCartDelete allCartDeleterepo = AllCartDelete();
  DeleteOneCartItemRepo deleteOneCartItemRepo = DeleteOneCartItemRepo();
  List<CartItem>? cartItem;
  String? cartTotalPrice;
  String? productPrice;
  String? productId;
  String? cartItemId;
  String? salePrice;
  String? quantity;
  String? productName;
  String? deliveryChargesTotal;
  String? freeShipping;
  bool isLoading = true;

  Future<void> initState(context, productId, addID) async {
    await cartDetailsView(context, addID);

    getAddresslist(context);
    getCountry(context);
    getContractAndForms(context);
  }

  showLoader(value) {
    isLoading = value;
    notifyListeners();
  }

  AddAddressRepo addAddressRepo = AddAddressRepo();
  String countryName = "";

  List<CountryList>? countryList;
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
        countryName = countryList
                ?.where((element) =>
                    element.id?.toString().contains(countryListId.toString()) ??
                    false)
                .toList()[0]
                .countryName ??
            "";
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

  ContractFormsRepo contractFormsRepo = ContractFormsRepo();
  ContractFormsRequestModel get contractReqModel => ContractFormsRequestModel(
        addressId: selectAddressID.toString() ?? '',
      );

  String? data;
  String? rightOfWithDrawl;
  String? preliminary;
  Future<void> getContractAndForms(context) async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    contractFormsRepo
        .getContractAndFormsInfo(
            contractReqModel, pref.getString('successToken'))
        .then((response) {
      final result =
          ContractFormsResponseModel.fromJson(jsonDecode(response.body));
      if (response.statusCode == 200) {
        print('------ ${response}');
        // log(response.body);
        data = result.data;
        rightOfWithDrawl = result.rightOfWithDrawl;
        preliminary = result.preliminary;
        // right of withdrawl
        // preliminary
        notifyListeners();
      } else {
        log(response.body);
        Utils.showPrimarySnackbar(context, 'Contract and Forms data not found',
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

  int countryListId = 0;

  Future<void> onSelectCountryType(int value) async {
    countryListId = value;
    cityList = null;
    print(countryListId);
    notifyListeners();
  }

  int? selectedCityId;
  int? cityListId;
  Future<void> onSelectCityType(int value) async {
    selectedCityId = value;
    print("controller" + selectedCityId.toString());
    notifyListeners();
  }

  CityListRequestModel get requestModel =>
      CityListRequestModel(countryId: countryListId.toString());
  CityListRepository cityListRepo = CityListRepository();
  List<CityListData>? cityList;

  Future<void> getCitiesList(BuildContext context) async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    cityListRepo
        .getCityList(requestModel, pref.getString("successToken"))
        .then((response) {
      final result = CityListResponseModel.fromJson(jsonDecode(response.body));
      if (response.statusCode == 200) {
        if (result.status == 200) {
          cityList = result.cityList;
          debugPrint(cityList?[1].toString());
          notifyListeners();
        } else {
          // Utils.showPrimarySnackbar(context, result.message,
          //     type: SnackType.error);
        }
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
      // test: (Object e) {
      //   Utils.showPrimarySnackbar(context, e, type: SnackType.debugError);
      //   return false;
      // },
    );
  }

  AddressAddRequestModel get addressAddRequestModel => AddressAddRequestModel(
        addressName: addressNameController.text,
        postalCode: postalcodeController.text,
        mobileNo: phoneNumberController.text,
        cityId: selectedCityId.toString(),
        countryId: (countryListId.toString()),
        address: addressController.text,
      );
  Future<void> addAddress(
    context,
  ) async {
    if (addressNameController.text == "") {
      Utils.showPrimarySnackbar(context, "Please Fill Address Name ",
          type: SnackType.error);
      notifyListeners();
      return;
    }
    if (postalcodeController.text == "") {
      Utils.showPrimarySnackbar(context, "Please Fill Postal Codr",
          type: SnackType.error);
      notifyListeners();
      return;
    }

    if (addressController.text == "") {
      Utils.showPrimarySnackbar(context, "Please Fill Address",
          type: SnackType.error);
      notifyListeners();
      return;
    }

    if (phoneNumberController.text == "" ||
        phoneNumberController.text.length < 10) {
      Utils.showPrimarySnackbar(
          context, "Please Fill  10 Digits Contact Number",
          type: SnackType.error);
      notifyListeners();
      return;
    }

    if (countryListId == null) {
      Utils.showPrimarySnackbar(context, "Please Select Country",
          type: SnackType.error);
      return;
    }
    if (selectedCityId == null) {
      Utils.showPrimarySnackbar(context, "Please Select City",
          type: SnackType.error);
      return;
    }
    SharedPreferences pref = await SharedPreferences.getInstance();
    addAddressRepo
        .addAddress(addressAddRequestModel, pref.getString("successToken"))
        .then((response) async {
      // log(response.body);
      debugPrint('/////////////');
      final result =
          AddressAddResponseModel.fromJson(jsonDecode(response.body));
      if (response.statusCode == 200) {
        log(response.body);

        // return;
        Navigator.push(
          context,
          SlidePageRoute(
            page: SelectAddressView(),
            direction: SlideDirection.right,
            delay: Duration(milliseconds: 5000),
          ),
          // MaterialPageRoute(
          //     builder: (context) => ProfileView()
        );
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

  ///////////////////////////////////////
  bool isApproved = false;

  // bool get isApproved => _isApproved;

  void toggleApproval() {
    isApproved = !isApproved;
    notifyListeners();
  }

  bool isApproveddata = false;

  void toggleApprovaluser() {
    isApproveddata = !isApproveddata;
    notifyListeners();
  }

  CardIncrementRequestModel get cardIncrementRequestModel =>
      CardIncrementRequestModel(
        productId: productId.toString(),
      );
  Future<void> cartCountIncrease(BuildContext context, prId) async {
    productId = prId.toString();
    LoadingOverlay.of(context).show();
    SharedPreferences pref = await SharedPreferences.getInstance();
    cartCountIncreaseRepo
        .cartIncrement(cardIncrementRequestModel, pref.get('successToken'))
        .then((response) async {
      log(response.body);
      debugPrint('/////////////');
      final result =
          CardIncrementResponseModel.fromJson(jsonDecode(response.body));
      if (response.statusCode == 200) {
        log(response.body);
        // Find the index of the product in the cartItem list
        int? index = cartItem
            ?.indexWhere((element) => element.id.toString() == productId);
        if (index != null && index != -1) {
          // Check if product exists in the cartItem list
          // Update the quantity of the specific product
          cartItem![index].quantity = result.quantity;
          debugPrint('Updated quantity: ${cartItem![index].quantity}');
          getContractAndForms(context);
        } else {
          debugPrint('Product not found in cartItem list.');
        }
        cartTotalPrice = result.cartTotalPrice;
        productPrice = result.productPrice;
        deliveryChargesTotal = result.deliveryChargesTotal;
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

  //////////////////////////////////////////////////////////////////////////
  bool isEmptyCart = false; // Flag to indicate if the cart is empty
  CustomerList? customerList;

  CartDetailsViewRequestModel get cartDetailsViewRequestModel =>
      CartDetailsViewRequestModel(
        addressID: selectAddressID ?? '',
      );
  Future<void> cartDetailsView(context, addID) async {
    selectAddressID = addID;
    showLoader(true);
    SharedPreferences pref = await SharedPreferences.getInstance();
    cartViewRepo
        .cartView(cartDetailsViewRequestModel, pref.get('successToken'))
        .then((response) async {
      log(response.body);
      debugPrint('/////////////');
      final result =
          CartDetailsViewResponseModel.fromJson(jsonDecode(response.body));
      if (response.statusCode == 200) {
        log(response.body);
        cartItem = result.cartItem;
        cartTotalPrice = result.cartTotalPrice;
        productPrice = result.productPrice;
        salePrice = result.salePrice;
        quantity = result.quantity;
        productName = result.productName;
        deliveryChargesTotal = result.deliveryChargesTotal;
        freeShipping = result.freeShipping;
        customerList = result.customerList;
        // Check if the cart is empty
        isEmptyCart = cartItem?.isEmpty ?? true; // Add null check here
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

///////////////////////////////Address/////////////////////////////////////////
  int? selectAddressIndex;
  String? selectAddressID; // Declare a variable to store the selected city ID

  void selectAddresBox(context, int index, id) {
    if (selectAddressIndex == index) {
      getContractAndForms(context);
      selectAddressIndex = null;
      selectAddressID = null; // Clear the selected ID when unchecking
    } else {
      print("object111111");
      selectAddressIndex = index;
      selectAddressID = id.toString(); // Store the selected ID
      getContractAndForms(context);
    }
    notifyListeners();
  }

  List<AddressListData>? addressListData;
  AddressListRepo addressListRepo = AddressListRepo();
  Future<void> getAddresslist(context) async {
    // showLoader(true);
    SharedPreferences pref = await SharedPreferences.getInstance();
    print(pref.getString("successToken"));
    addressListRepo
        .addresslist(pref.getString("successToken"))
        .then((response) {
      log(response.body);
      final result = AccomodationResponseModel.fromJson(
        jsonDecode(response.body),
      );
      if (response.statusCode == 200) {
        // if (result.status == 200) {
        addressListData = result.addressListData;
        // showLoader(false);
        Utils.showPrimarySnackbar(context, '', type: SnackType.success);
        notifyListeners();
      } else {
        Utils.showPrimarySnackbar(context, '', type: SnackType.error);
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

///////////////////////////////Address///////////////////////////////////////////
  Future<void> cartOneItemDelete(context, cartId) async {
    cartItemId = cartId.toString();
    LoadingOverlay.of(context).show();
    SharedPreferences pref = await SharedPreferences.getInstance();
    deleteOneCartItemRepo
        .deletoneCartitem(
            cardOneItemDeleteRequestModel, pref.get('successToken'))
        .then((response) async {
      log(response.body);
      debugPrint('/////////////');
      final result =
          CardOneItemDeleteResponsetModel.fromJson(jsonDecode(response.body));
      if (response.statusCode == 200) {
        log(response.body);
        // Check if the cart is empty after deleting the product
        if (result.status == 200) {
          // Cart item deleted successfully, update the cart view
          await cartDetailsView(context, '');
          LoadingOverlay.of(context).hide();
          notifyListeners();
        } else {
          log(response.body);
          Utils.showPrimarySnackbar(context, result.message,
              type: SnackType.error);
        }
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

  // Future<void> cartDetailsView(context) async {
  //   SharedPreferences pref = await SharedPreferences.getInstance();
  //   cartViewRepo.cartView(pref.get('successToken')).then((response) async {
  //     log(response.body);
  //     debugPrint('/////////////');
  //     final result =
  //         CartDetailsViewResponseModel.fromJson(jsonDecode(response.body));
  //     if (response.statusCode == 200) {
  //       log(response.body);
  //       cartItem = result.cartItem;
  //       cartTotalPrice = result.cartTotalPrice;
  //       productPrice = result.productPrice;
  //       salePrice = result.salePrice;
  //       quantity = result.quantity;
  //       productName = result.productName;
  //       deliveryChargesTotal = result.deliveryChargesTotal;
  //       freeShipping = result.freeShipping;
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
  // ////////////////////////////////////////////////////////////

  CardOneItemDeleteRequestModel get cardOneItemDeleteRequestModel =>
      CardOneItemDeleteRequestModel(
        cartItemId: cartItemId,
      );
  // Future<void> cartOneItemDelete(context, cartId) async {
  //   cartItemId = cartId.toString();
  //   LoadingOverlay.of(context).show();
  //   SharedPreferences pref = await SharedPreferences.getInstance();
  //   deleteOneCartItemRepo
  //       .deletoneCartitem(
  //           cardOneItemDeleteRequestModel, pref.get('successToken'))
  //       .then((response) async {
  //     log(response.body);
  //     debugPrint('/////////////');
  //     final result =
  //         CardOneItemDeleteResponsetModel.fromJson(jsonDecode(response.body));
  //     if (response.statusCode == 200) {
  //       log(response.body);
  //       // Check if the cart is empty after deleting the product
  //       if (result.status == 200) {
  //         // Cart item deleted successfully, update the cart view
  //         cartDetailsView(context);
  //         LoadingOverlay.of(context).hide();
  //         notifyListeners();
  //       } else {
  //         log(response.body);
  //         Utils.showPrimarySnackbar(context, result.message,
  //             type: SnackType.error);
  //       }
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

  // Future<void> cartOneItemDelete(context, cartId) async {
  //   cartItemId = cartId.toString();
  //   LoadingOverlay.of(context).show();
  //   SharedPreferences pref = await SharedPreferences.getInstance();
  //   deleteOneCartItemRepo
  //       .deletoneCartitem(
  //           cardOneItemDeleteRequestModel, pref.get('successToken'))
  //       .then((response) async {
  //     log(response.body);
  //     debugPrint('/////////////');
  //     final result =
  //         CardOneItemDeleteResponsetModel.fromJson(jsonDecode(response.body));
  //     if (response.statusCode == 200) {
  //       log(response.body);
  //       cartDetailsView(context);

  //       LoadingOverlay.of(context).hide();
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
  ///////////////////////////////////////////////////

  CardDecrementRequestModel get cardDecrementRequestModel =>
      CardDecrementRequestModel(
        productId: productId.toString(),
      );
  Future<void> cartCountDecrement(context, prId) async {
    productId = prId.toString();
    LoadingOverlay.of(context).show();
    SharedPreferences pref = await SharedPreferences.getInstance();
    cartCountDecreaseRepo
        .cartdecrement(cardDecrementRequestModel, pref.get('successToken'))
        .then((response) async {
      log(response.body);
      debugPrint('/////////////');
      final result =
          CardDecrementResponseModel.fromJson(jsonDecode(response.body));
      if (response.statusCode == 200) {
        log(response.body);
        for (int i = 0; i < (cartItem?.length ?? 0); i++) {
          if (cartItem![i].id.toString() == productId) {
            cartItem![i].quantity = result.quantity;
            break;
          }
        }

        cartTotalPrice = result.cartTotalPrice;
        productPrice = result.productPrice;
        deliveryChargesTotal = result.deliveryChargesTotal;
        getContractAndForms(context);

        // if (cartItem!.isEmpty) {
        //   // final read =
        //   //     Provider.of<ProductViewController>(context, listen: false);
        //   Navigator.push(
        //     context,
        //     SlidePageRoute(
        //       page: MdShopHomePageView(
        //           // treatmentName: '${watch.packageDetails?.treatmentName}',
        //           // // refresh: true,
        //           // cityName: "${watch.packageDetails?.cityName}"
        //           ),
        //       direction:
        //           SlideDirection.left, // Specify the slide direction here
        //       delay: const Duration(milliseconds: 5000),
        //     ),
        //   );
        //   // read.onNavigation(2, const CartScreenView(), context);
        //   // read.showBottomNavigationBar();
        //   // Navigator.pushAndRemoveUntil(
        //   //   context,
        //   //   MaterialPageRoute(
        //   //       builder: (context) =>
        //   //           MainScreenView(index: 2, screenName: CartScreenView())),
        //   //   (Route<dynamic> route) => false,
        //   // );
        // }
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

  ///////////////////////////////////////

  Future<void> allCartDelete(context) async {
    LoadingOverlay.of(context).show();
    SharedPreferences pref = await SharedPreferences.getInstance();
    allCartDeleterepo
        .deleteall(pref.get('successToken'))
        .then((response) async {
      log(response.body);
      final result =
          AllCardDeleteResponseMOdel.fromJson(jsonDecode(response.body));
      if (response.statusCode == 200) {
        log(response.body);
        cartItem?.clear();
        Navigator.push(
          context,
          SlidePageRoute(
            page: MdShopHomePageView(
                // packageId:
                //     widget.packageId,
                ),
            direction: SlideDirection.right, // Specify the slide direction here
            delay: Duration(milliseconds: 5000),
          ),
        );
        // cartDetailsView(context);
        // cartTotalPrice = result.cartTotalPrice;
        // productPrice = result.productPrice;
        // quantity = result.productPrice.toString();
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

  /////////////////////////////////////////////////////

  launchTermsAndConditionURL() async {
    final Uri url = Uri.parse(
        'https://projects.m-staging.in/md-health-testing/terms-and-conditions');
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  launchPrivacyPolicyURL() async {
    final Uri url = Uri.parse(
        'https://projects.m-staging.in/md-health-testing/user-data-consent');
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }
}
