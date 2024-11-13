import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:md_health/Screens/health/home/model/shop_cart_count_model.dart';
import 'package:md_health/Screens/health/home/repository/shop_cart_count_repo.dart';
import 'package:md_health/Screens/shop/md_shop_home_page/model/ads_model.dart';
import 'package:md_health/Screens/shop/md_shop_home_page/model/md_banner_model.dart';
import 'package:md_health/Screens/shop/md_shop_home_page/model/md_shop_home_page_model.dart';
import 'package:md_health/Screens/shop/md_shop_home_page/model/sub_categories_model.dart';
import 'package:md_health/Screens/shop/md_shop_home_page/repository/ads_repo.dart';
import 'package:md_health/Screens/shop/md_shop_home_page/repository/md_banner_repo.dart';
import 'package:md_health/Screens/shop/md_shop_home_page/repository/md_shop_home_page_repo.dart';
import 'package:md_health/Screens/shop/shop_product_view/model/shop_add_fav_model.dart';
import 'package:md_health/Screens/shop/shop_product_view/repository/add_to_fav_repo.dart';
import 'package:md_health/utils/utils.dart';
import 'package:md_health/widget/loading_overlay.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/categories_model.dart';
import '../repository/categories_repo.dart';
import '../repository/sub_categories_repo.dart';

class MdShopHomePageController extends ChangeNotifier {
  ShopHomePageRepo shopHomePageRepo = ShopHomePageRepo();
  ShopBannerRepo shopBannerRepo = ShopBannerRepo();
  TextEditingController shopNamesearchController = TextEditingController();

  int? id;

  bool isLoading = true;
  List<FeaturedProduct>? featuredProducts;

  Future<void> initState(context) async {
    await getShopCartCount(context);
    adsImage(context);
    await shopHomePage(context);
    await shopbanner(context);
    await getCategories(context);
    await initializeUserLocation();
    notifyListeners();
  }

/////////////////////////////

  showLoader(value) {
    isLoading = value;
    notifyListeners();
  }

  int _selected = -1;
  int get selected => _selected;
  void toggleExpansion(int index) {
    if (_selected == index) {
      _selected = -1;
    } else {
      _selected = index;
    }
    notifyListeners();
  }

  String? subCategorySelectedItem;
  Map<int, String?> selectedSubCategories = {};
  void subCategorySelectItem(int categoryIndex, String? subCategoryName) {
    selectedSubCategories[categoryIndex] = subCategoryName;
    notifyListeners();
  }

  int? categoryId;
  List<SubCategoryList>? subCategoryList;
  SubCategoriesRepo subCategoriesRepo = SubCategoriesRepo();

  SubCategoriesRequestModel get subCategoriesRequestModel =>
      SubCategoriesRequestModel(categoryId: categoryId);

  Map<int, List<SubCategoryList>?> categorySubCategories = {};

  Future<void> getSubCategories(context, cId) async {
    categoryId = cId;
    // LoadingOverlay.of(context).show();
    SharedPreferences pref = await SharedPreferences.getInstance();
    subCategoriesRepo
        .getSubCategories(
            subCategoriesRequestModel, pref.getString("successToken"))
        .then((response) async {
      final result =
          SubCategoriesResponseModel.fromJson(jsonDecode(response.body));
      if (response.statusCode == 200) {
        // subCategoryList = result.subCategoryList;
        categorySubCategories[cId] = result.subCategoryList;
        print(subCategoryList?.length);
        print(response.body);
        // LoadingOverlay.of(context).hide();
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

  CategoriesRepo categoriesRepo = CategoriesRepo();
  List<CategoryList>? categoryList;

  Future<void> getCategories(context) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    categoriesRepo
        .getCategories(pref.getString("successToken"))
        .then((response) async {
      print('lkjsflkjsldfjlskjdf');
      final result =
          CategoriesResponseModel.fromJson(jsonDecode(response.body));
      if (response.statusCode == 200) {
        categoryList = result.categoryList;
        print(categoryList?.length);
        notifyListeners();
      } else {
        print(response.body);
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

  bool isFavProduct = true; //fvrt Product
  ShopProductAddToFavRepo shopProductAddToFavRepo = ShopProductAddToFavRepo();

  ShopProductAddToFavRequestModel get shopProductAddToFavRequestModel =>
      ShopProductAddToFavRequestModel(
        shopType: "shop",
        productId: id.toString(),
      );
  Future<void> addToFavProducthome(context, addPId) async {
    id = addPId;
    LoadingOverlay.of(context).show();

    SharedPreferences pref = await SharedPreferences.getInstance();
    shopProductAddToFavRepo
        .shopProductaddfav(
            shopProductAddToFavRequestModel, pref.get('successToken'))
        .then((response) async {
      // log(response.body);
      debugPrint('/////////////');
      final result =
          ShopProductAddToFavResponseModel.fromJson(jsonDecode(response.body));
      if (response.statusCode == 200) {
        // log(response.body);
        // shopHomePage(context);
        if (result.favStatus == "added") {
          isFavProduct = true;
          shopHomePage(context);
          LoadingOverlay.of(context).hide();
          shopHomePage(context);
        } else {
          isFavProduct = false;
          LoadingOverlay.of(context).hide();
          shopHomePage(context);
        }
        // shopHomePage(context);
        LoadingOverlay.of(context).hide();
        Utils.showPrimarySnackbar(context, result.message,
            type: SnackType.success);
        notifyListeners();
      } else {
        // log(response.body);
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

  String? cartCount;
  ShopCartCountRepo shopCartCountRepo = ShopCartCountRepo();

  Future<void> getShopCartCount(context) async {
    showLoader(true);
    SharedPreferences pref = await SharedPreferences.getInstance();
    shopCartCountRepo
        .cartCount(pref.getString("successToken"))
        .then((response) async {
      // log(response.body);
      debugPrint('/////////////');
      final result = ShopCartCountModel.fromJson(jsonDecode(response.body));
      if (response.statusCode == 200) {
        log("///77777777777777/// ${result.cartCount}");
        cartCount = result.cartCount.toString() ?? "";
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

  Future<void> shopHomePage(context) async {
    // LoadingOverlay.of(context).show();
    SharedPreferences pref = await SharedPreferences.getInstance();
    print(pref.getString("successToken"));
    shopHomePageRepo
        .shopHomepage(pref.getString("successToken"))
        .then((response) {
      log(response.body);
      final result = ShopHomeResmodel.fromJson(
        jsonDecode(response.body),
      );
      if (response.statusCode == 200) {
        if (result.status == 200) {
          featuredProducts = result.featuredProducts;

          // LoadingOverlay.of(context).hide();
          // Utils.showPrimarySnackbar(context, result.message,
          //     type: SnackType.success);
          notifyListeners();
        } else {
          Utils.showPrimarySnackbar(context, result.message,
              type: SnackType.error); //
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

  //////////////////////////////////////////////////////////
  SuperFeaturedProduct? superFeaturedProduct;

  Future<void> shopbanner(context) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    print(pref.getString("successToken"));
    shopBannerRepo.shopBanner(pref.getString("successToken")).then((response) {
      log(response.body);
      final result = ShopOwnerBannerResponseMOdel.fromJson(
        jsonDecode(response.body),
      );
      if (response.statusCode == 200) {
        if (result.status == 200) {
          superFeaturedProduct = result.superFeaturedProduct;
          Utils.showPrimarySnackbar(context, "", type: SnackType.success);
          notifyListeners();
        } else {
          Utils.showPrimarySnackbar(context, "", type: SnackType.error); //
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

  //////////////////////////////////////////////
  AdsRepo ddsRepo = AdsRepo();
  AdsData? adsdata;

  Future<void> adsImage(context) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    ddsRepo.ads(pref.getString("successToken")).then((response) async {
      // log(response.body);
      debugPrint('/////////////');
      final result = ShopAdsResponseModel.fromJson(jsonDecode(response.body));
      if (response.statusCode == 200) {
        adsdata = result.adsdata;
        // cityList = result.cityList;
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

  //////////////////////////////////

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
        print('+++++++++++++++++++++++++++++++++++++++++');
        print("Selected pincode is $pinCode");
        print('+++++++++++++++++++++++++++++++++++++++++');
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
      print('No pin code selected');
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
