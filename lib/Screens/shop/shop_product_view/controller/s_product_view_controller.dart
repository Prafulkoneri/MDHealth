import 'dart:convert';

import 'dart:io';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:md_health/Screens/shop/md_shop_home_page/model/ads_model.dart';
import 'package:md_health/Screens/shop/md_shop_home_page/repository/ads_repo.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:path/path.dart' as Path;
import 'package:md_health/Screens/shop/shop_product_view/model/add_to_cart_model.dart';
import 'package:md_health/Screens/shop/shop_product_view/model/follw_vendor_model.dart';
import 'package:md_health/Screens/shop/shop_product_view/model/shop_add_fav_model.dart';
import 'package:md_health/Screens/shop/shop_product_view/model/shop_product_model.dart';
import 'package:md_health/Screens/shop/shop_product_view/model/shop_rating_model.dart';
import 'package:md_health/Screens/shop/shop_product_view/model/unfollow_vendor_model.dart';
import 'package:md_health/Screens/shop/shop_product_view/repository/add_to_card_repo.dart';
import 'package:md_health/Screens/shop/shop_product_view/repository/add_to_fav_repo.dart';
import 'package:md_health/Screens/shop/shop_product_view/repository/follow_vendor_repo.dart';
import 'package:md_health/Screens/shop/shop_product_view/repository/shop_product_repo.dart';
import 'package:md_health/Screens/shop/shop_product_view/repository/shop_review_list_repo.dart';
import 'package:md_health/Screens/shop/shop_product_view/repository/unfollow_vendor_repo.dart';
import 'package:md_health/utils/utils.dart';
import 'package:md_health/widget/loading_overlay.dart';

class ProductViewController extends ChangeNotifier {
  String? productId;
  String? quantity;
  String? vendorId;
  ProductData? productData;
  List? productGallery;
  List productImages = [];
  bool isLoading = true;

  ShopProductViewRepo shopProductViewRepo = ShopProductViewRepo();
  ShopProductReviewRepo shopProductReviewRepo = ShopProductReviewRepo();
  FollowVendorRepo followVendorRepo = FollowVendorRepo();
  UNfollowVendorRepo uNfollowVendorRepo = UNfollowVendorRepo();
  AddToCardProductRepo addToCardProductRepo = AddToCardProductRepo();
  ShopProductAddToFavRepo shopProductAddToFavRepo = ShopProductAddToFavRepo();

  Future<void> initState(context, proId) async {
    await shopProductView(context, proId);
    await shopProductReview(context, proId);
    adsImage(context);
  }

  showLoader(value) {
    isLoading = value;
    notifyListeners();
  }

  String formatDescription() {
    final description = productData?.productDescrition ?? "";
    return description
        .split(
            RegExp(r'\.\s*')) // Split by period followed by zero or more spaces
        .map((point) => point.trim()) // Trim whitespace
        .where((point) => point.isNotEmpty) // Remove empty strings
        .map((point) => '• $point') // Add bullet point
        .join('\n'); // Join with newline
  }

  ///////////////////////////////////////
  AdsRepo ddsRepo = AdsRepo();
  AdsData? adsdata;

  Future<void> adsImage(context) async {
    // showLoader(true);
    SharedPreferences pref = await SharedPreferences.getInstance();
    ddsRepo.ads(pref.getString("successToken")).then((response) async {
      // log(response.body);
      debugPrint('/////////////');
      final result = ShopAdsResponseModel.fromJson(jsonDecode(response.body));
      if (response.statusCode == 200) {
        adsdata = result.adsdata;
        // cityList = result.cityList;
        // showLoader(false);
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

  ShopProductViewRequestModel get shopProductViewRequestModel =>
      ShopProductViewRequestModel(
        id: productId.toString(),
      );
  Future<void> shopProductView(context, proId) async {
    showLoader(true);
    productId = proId;
    SharedPreferences pref = await SharedPreferences.getInstance();
    shopProductViewRepo
        .shopProductView(shopProductViewRequestModel, pref.get('successToken'))
        .then((response) async {
      // log(response.body);
      debugPrint('/////////////');
      final result =
          ShopProductViewResponseModel.fromJson(jsonDecode(response.body));
      if (response.statusCode == 200) {
        // log(response.body);

        productData = result.productData;
        isFavProduct = productData?.favouriteStatus == "yes" ? true : false;
        followerCount = result.followersCount.toString();

        // productImages = result.data?.unitBasedProductImagePath?.imageList ?? [];

        productImages = result.productGallery ?? [];
        showLoader(false);
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

  ////////////////////////////////////////////////////
  int? totalReviews;
  String? totalAverageRating;
  List<ReviewsList>? reviewsList;
  ShopProductReviewRequestModel get shopProductReviewRequestModel =>
      ShopProductReviewRequestModel(
        id: productId.toString(),
      );
  Future<void> shopProductReview(context, proId) async {
    productId = proId;
    SharedPreferences pref = await SharedPreferences.getInstance();
    shopProductReviewRepo
        .shopProductReView(
            shopProductReviewRequestModel, pref.get('successToken'))
        .then((response) async {
      // log(response.body);
      debugPrint('/////////////');
      final result =
          ShopProductReviewResponseModel.fromJson(jsonDecode(response.body));
      if (response.statusCode == 200) {
        // log(response.body);

        reviewsList = result.reviewsList;
        totalAverageRating = result.totalAverageRating.toString() ?? '';
        totalReviews = result.totalReviews;

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

  ///////////////////////////////////////////////////////////////////////////////////////
  String? followerCount;
  String? folloWStatus;

  FollowVendorRequestmodel get followVendorRequestmodel =>
      FollowVendorRequestmodel(
        vendorId: vendorId.toString(),
      );
  Future<void> vendorFollow(context, vId) async {
    vendorId = vId.toString();
    LoadingOverlay.of(context).show();

    SharedPreferences pref = await SharedPreferences.getInstance();
    followVendorRepo
        .followVendor(followVendorRequestmodel, pref.get('successToken'))
        .then((response) async {
      // log(response.body);
      debugPrint('/////////////');
      final result =
          FollowVendorResponsemodel.fromJson(jsonDecode(response.body));
      if (response.statusCode == 200) {
        // log(response.body);
        followerCount = result.followerCount.toString();
        folloWStatus = result.folloWStatus;
        LoadingOverlay.of(context).hide();

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
  ///////////////////////////////////////////////////////////////////////////

  UnfollowVendorRequestmodel get unfollowVendorRequestmodel =>
      UnfollowVendorRequestmodel(
        vendorId: vendorId.toString(),
      );
  Future<void> VendorUnFollow(context, vId) async {
    vendorId = vId.toString();
    LoadingOverlay.of(context).show();

    SharedPreferences pref = await SharedPreferences.getInstance();
    uNfollowVendorRepo
        .unfollowVendor(unfollowVendorRequestmodel, pref.get('successToken'))
        .then((response) async {
      // log(response.body);
      debugPrint('/////////////');
      final result =
          FollowVendorResponsemodel.fromJson(jsonDecode(response.body));
      if (response.statusCode == 200) {
        // log(response.body);
        followerCount = result.followerCount.toString();
        folloWStatus = result.folloWStatus;
        LoadingOverlay.of(context).hide();

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
  ////////////////////////////////////////////////////////////

  AddtoCartRequestModel get addtoCartRequestModel => AddtoCartRequestModel(
        quantity: "1",
        productId: productId.toString(),
      );
  Future<void> AddToCart(context, addPId) async {
    productId = addPId.toString();
    LoadingOverlay.of(context).show();

    SharedPreferences pref = await SharedPreferences.getInstance();
    addToCardProductRepo
        .addToCart(addtoCartRequestModel, pref.get('successToken'))
        .then((response) async {
      // log(response.body);
      debugPrint('/////////////');
      final result = AddtoCartResponseModel.fromJson(jsonDecode(response.body));
      if (response.statusCode == 200) {
        // log(response.body);

        LoadingOverlay.of(context).hide();

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

  //////////////////////////////////
  bool isFavProduct = true; //fvrt Product

  ShopProductAddToFavRequestModel get shopProductAddToFavRequestModel =>
      ShopProductAddToFavRequestModel(
        shopType: "shop",
        productId: productId.toString(),
      );
  Future<void> addToFavProduct(context, addPId) async {
    productId = addPId.toString();
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
        if (result.favStatus == "added") {
          isFavProduct = true;
          LoadingOverlay.of(context).hide();
        } else {
          isFavProduct = false;
          LoadingOverlay.of(context).hide();
        }
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
  ////////////////////////////////////////////////////////////////

  void shareProduct(url) async {
    XFile fileForShare = await fileFromImageUrl(url, "");

    Share.shareXFiles([fileForShare],
        text:
            " Download Local Supermart now!\n Buy ${productData?.productName} at a discounted prices! \nDownload app here : ",
        // "hey! check out this new app https://play.google.com/store/apps/details?id=com.lsm.local_supper_market&hl=en&gl=US",
        subject: "hey! check out this new app");
  }
  //////////////////////////////////

  fileFromImageUrl(String url, String userName) async {
    final response = await http.get(
      Uri.parse(url),
    );

    final documentDirectory = await getApplicationDocumentsDirectory();

    var randomNumber = Random();

    final file = File(Path.join(
      documentDirectory.path,
      "${randomNumber.nextInt(100)}_$userName.png",
    ));

    file.writeAsBytesSync(response.bodyBytes);

    return XFile(file.path);
  }
}
