import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:md_health/Screens/favourt/model/fav_count_model.dart';
import 'package:md_health/Screens/favourt/model/fav_list_Detail_view.dart';
import 'package:md_health/Screens/favourt/model/food_fav_count_model.dart';
import 'package:md_health/Screens/favourt/model/hs_fav_count_model.dart';
import 'package:md_health/Screens/favourt/model/hs_fav_list_view_model.dart';
import 'package:md_health/Screens/favourt/model/hs_remove_package_model.dart';
import 'package:md_health/Screens/favourt/model/md_food_fav_list_model.dart';
import 'package:md_health/Screens/favourt/model/remoe_food_model.dart';
import 'package:md_health/Screens/favourt/model/remove_fav_packge_model.dart';
import 'package:md_health/Screens/favourt/model/shop_fav_count.dart';
import 'package:md_health/Screens/favourt/model/shop_fav_list_model.dart';
import 'package:md_health/Screens/favourt/repository/fav_count_repo.dart';
import 'package:md_health/Screens/favourt/repository/fav_list_detail_repo.dart';
import 'package:md_health/Screens/favourt/repository/food_fav_count_repo.dart';
import 'package:md_health/Screens/favourt/repository/food_fav_list_repo.dart';
import 'package:md_health/Screens/favourt/repository/hs_fav_count_repo.dart';
import 'package:md_health/Screens/favourt/repository/hs_fav_list_view_repo.dart';
import 'package:md_health/Screens/favourt/repository/hs_remove_fav_repo.dart';
import 'package:md_health/Screens/favourt/repository/remove_food_fav_repo.dart';
import 'package:md_health/Screens/favourt/repository/remove_pack_repo.dart';
import 'package:md_health/Screens/favourt/repository/shop_fav_count_repo.dart';
import 'package:md_health/Screens/favourt/repository/shop_fav_list_repo.dart';
import 'package:md_health/Screens/favourt/view/favt_list.dart';
import 'package:md_health/Screens/shop/shop_product_view/model/shop_add_fav_model.dart';
import 'package:md_health/Screens/shop/shop_product_view/repository/add_to_fav_repo.dart';
// import 'package:md_health/Screens/shop_product_view/model/shop_add_fav_model.dart';
// import 'package:md_health/Screens/shop_product_view/repository/add_to_fav_repo.dart';
import 'package:md_health/test_widget.dart';
import 'package:md_health/utils/utils.dart';
import 'package:md_health/widget/loading_overlay.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoriteListController extends ChangeNotifier {
  FavCountlistRepo favCountlistRepo = FavCountlistRepo();
  HsFavCountlistRepo hsFavCountlistRepo = HsFavCountlistRepo();
  FoodFavCountrepo foodFavCountrepo = FoodFavCountrepo();
  ShopFavCountlistRepo shopFavCountlistRepo = ShopFavCountlistRepo();
  RemoveFoodFromFavRepo removeFoodFromFavRepo = RemoveFoodFromFavRepo();
  HsRemovePackgeFromFavRepo hsRemovePackgeFromFavRepo =
      HsRemovePackgeFromFavRepo();
  FavListDetailtRepo favlistdetailtRepo = FavListDetailtRepo();
  FoodFavListRepo foodFavListRepo = FoodFavListRepo();
  HsFavListViewRepo hsFavListViewRepo = HsFavListViewRepo();
  RemovePackgeFromFavRepo removePackgeFromFavRepo = RemovePackgeFromFavRepo();
  ShopProductAddToFavRepo shopProductAddToFavRepo = ShopProductAddToFavRepo();
  String? productId = '';
  ShopProductAddToFavRequestModel get shopProductAddToFavRequestModel =>
      ShopProductAddToFavRequestModel(
        shopType: "shop",
        productId: productId.toString(),
      );
  Future<void> addshopToFavProduct(context, addPId) async {
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
        // if (result.favStatus == "added") {
        //   isFavProduct = true;
        //   LoadingOverlay.of(context).hide();
        // } else {
        //   isFavProduct = false;
        //   LoadingOverlay.of(context).hide();
        // }
        shopFavList(context);
        notifyListeners();
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

  ShopFavListRepo shopFavListRepo = ShopFavListRepo();
  String? hsPackageId = '';
  HsRemoveFavRequestmodel get hsRemoveFavRequestmodel =>
      HsRemoveFavRequestmodel(id: hsPackageId.toString());
  String? hsFacCount;
  bool isLoading = true;
  AddFavCount? addCount;
  List<FavDetailViewList>? favdetailViewList;

  Future<void> initState(context) async {
    print("object");
    print(foodfavouriteCount);
    print("object");
    addCount?.mdhealthcount = 0;
    shopCount = 0;
    foodfavouriteCount = 0;
    await hsFavDetailsList(context);
    await FavCountList(context);
    await shopFavCountList(context);
    await foodFavCount(context);
    await FavListDetailView(context);
    await foodFavDetailsList(context);
    await homeServicesFAv(context);
    shopFavList(context);
    notifyListeners();
  }

/////////////////////////////

  showLoader(value) {
    isLoading = value;
    notifyListeners();
  }

//////////////////////////////////////////Shop///////////////////////////////
  int? shopCount;
  List<ShopFavListDatas>? shopFavListDatas;

  Future<void> shopFavCountList(context) async {
    showLoader(true);
    SharedPreferences pref = await SharedPreferences.getInstance();
    print(pref.getString("successToken"));
    shopFavCountlistRepo
        .shopfavCount(pref.getString("successToken"))
        .then((response) {
      log(response.body);
      final result = ShopFavCountRes.fromJson(
        jsonDecode(response.body),
      );
      if (response.statusCode == 200) {
        if (result.status == 200) {
          shopCount = result.shopCount;

          showLoader(false);
          notifyListeners();

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

  Future<void> shopFavList(context) async {
    showLoader(true);
    SharedPreferences pref = await SharedPreferences.getInstance();
    print(pref.getString("successToken"));
    shopFavListRepo
        .shopFavList(pref.getString("successToken"))
        .then((response) {
      log(response.body);
      final result = ShopFavListReponseModel.fromJson(
        jsonDecode(response.body),
      );
      if (response.statusCode == 200) {
        if (result.status == 200) {
          shopFavListDatas = result.shopFavListDatas;
          showLoader(false);

          notifyListeners();
          // Utils.showPrimarySnackbar(context, "", type: SnackType.success);
          notifyListeners();
        } else {
          // Utils.showPrimarySnackbar(context, "", type: SnackType.error); //
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

////////////////////////////SHOp///////////////////////////////////////
  Future<void> FavCountList(context) async {
    showLoader(true);
    SharedPreferences pref = await SharedPreferences.getInstance();
    print(pref.getString("successToken"));
    favCountlistRepo.favCount(pref.getString("successToken")).then((response) {
      log(response.body);
      final result = FavListRes.fromJson(
        jsonDecode(response.body),
      );
      if (response.statusCode == 200) {
        if (result.status == 200) {
          addCount = result.addCount;

          showLoader(false);
          notifyListeners();

          // Utils.showPrimarySnackbar(context, "", type: SnackType.success);
          notifyListeners();
        } else {
          // Utils.showPrimarySnackbar(context, "", type: SnackType.error); //
        }
      } else {
        // Utils.showPrimarySnackbar(context, "", type: SnackType.error);
      }
    }
        // ).onError((error, stackTrace) {
        //   Utils.showPrimarySnackbar(context, error, type: SnackType.debugError);
        // }).catchError(
        //   (Object e) {
        //     Utils.showPrimarySnackbar(context, e, type: SnackType.debugError);
        //   },
        //   test: (Object e) {
        //     Utils.showPrimarySnackbar(context, e, type: SnackType.debugError);
        //     return false;
        //   },
        );
  }

  Future<void> FavListDetailView(context) async {
    showLoader(true);
    SharedPreferences pref = await SharedPreferences.getInstance();
    print(pref.getString("successToken"));
    favlistdetailtRepo
        .favListdetails(pref.getString("successToken"))
        .then((response) {
      log(response.body);
      final result = FavDetailViewModelRes.fromJson(
        jsonDecode(response.body),
      );
      if (response.statusCode == 200) {
        if (result.status == 200) {
          favdetailViewList = result.favdetailViewList;
          showLoader(false);
          notifyListeners();
          // Utils.showPrimarySnackbar(context, "", type: SnackType.success);
          notifyListeners();
        } else {
          // Utils.showPrimarySnackbar(context, "", type: SnackType.error); //
        }
      } else {
        // Utils.showPrimarySnackbar(context, "", type: SnackType.error);
      }
    });
    // .onError((error, stackTrace) {
    //   Utils.showPrimarySnackbar(context, error, type: SnackType.debugError);
    // }).catchError(
    //   (Object e) {
    //     Utils.showPrimarySnackbar(context, e, type: SnackType.debugError);
    //   },
    //   test: (Object e) {
    //     Utils.showPrimarySnackbar(context, e, type: SnackType.debugError);
    //     return false;
    //   },
    // );
  }

  ////////////////////////////
  Future<void> removeToFav(context, packId) async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    removePackgeFromFavRepo
        .removePackgeFromFavRepo(
            RemoveFavRequestmodel(id: packId), pref.getString("successToken"))
        .then((response) async {
      log("response.body${response.body}");
      final result = RemoveFavResmodel.fromJson(jsonDecode(response.body));
      if (response.statusCode == 200) {
        if (result.status == 200) {
          FavCountList(context);
          FavListDetailView(context);

          notifyListeners();
        }
        // Utils.showPrimarySnackbar(context, result.message,
        //     type: SnackType.success);
        notifyListeners();
      } else {
        // Utils.showPrimarySnackbar(context, result.message,
        //     type: SnackType.error);
        notifyListeners();
      }
    });
  }

  ///////////////////////////////////////Foood/////////////////
  Future<void> removeFoodToFav(context, foodID) async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    removeFoodFromFavRepo
        .removeFoodFromFavRepo(RemoveFooodFavRequestmodel(id: foodID),
            pref.getString("successToken"))
        .then((response) async {
      log("response.body${response.body}");
      final result =
          RemoveFoodFavResposeModel.fromJson(jsonDecode(response.body));
      if (response.statusCode == 200) {
        // FavCountList(context);
        // FavListDetailView(context);
        foodFavDetailsList(context);
        notifyListeners();
      }
      Utils.showPrimarySnackbar(context, result.message,
          type: SnackType.success);
      notifyListeners();
    });
  }

  //////////////////////////////////FOOD////////////////////////////
  List<FoodFavListData>? foodFavListdata;
  int? foodfavouriteCount;

  Future<void> foodFavDetailsList(context) async {
    showLoader(true);
    SharedPreferences pref = await SharedPreferences.getInstance();
    print(pref.getString("successToken"));
    foodFavListRepo
        .foodFavlist(pref.getString("successToken"))
        .then((response) {
      log(response.body);
      final result = FoodFavListResponseModel.fromJson(
        jsonDecode(response.body),
      );
      if (response.statusCode == 200) {
        if (result.status == 200) {
          foodFavListdata = result.foodFavListdata;
          showLoader(false);
          notifyListeners();
          // Utils.showPrimarySnackbar(context, "", type: SnackType.success);
          notifyListeners();
        } else {
          // Utils.showPrimarySnackbar(context, "", type: SnackType.error); //
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

  ///////////////////////////////////////
  Future<void> foodFavCount(context) async {
    showLoader(true);
    SharedPreferences pref = await SharedPreferences.getInstance();
    print(pref.getString("successToken"));
    foodFavCountrepo.foodFavCount(pref.getString("successToken")).then(
        (response) {
      log(response.body);
      final result = MdFoodCountResponseModel.fromJson(
        jsonDecode(response.body),
      );
      if (response.statusCode == 200) {
        if (result.status == 200) {
          foodfavouriteCount = result.foodfavouriteCount;

          showLoader(false);
          notifyListeners();

          // Utils.showPrimarySnackbar(context, "", type: SnackType.success);
          notifyListeners();
        } else {
          // Utils.showPrimarySnackbar(context, "", type: SnackType.error); //
        }
      } else {
        // Utils.showPrimarySnackbar(context, "", type: SnackType.error);
      }
    }
        // ).onError((error, stackTrace) {
        //   Utils.showPrimarySnackbar(context, error, type: SnackType.debugError);
        // }).catchError(
        //   (Object e) {
        //     Utils.showPrimarySnackbar(context, e, type: SnackType.debugError);
        //   },
        //   test: (Object e) {
        //     Utils.showPrimarySnackbar(context, e, type: SnackType.debugError);
        //     return false;
        //   },
        );
  }

  /////////////////////////////////////////////////////////////////
  Future<void> homeServicesFAv(context) async {
    showLoader(true);
    SharedPreferences pref = await SharedPreferences.getInstance();
    print(pref.getString("successToken"));
    hsFavCountlistRepo.hsfavCount(pref.getString("successToken")).then(
        (response) {
      log(response.body);
      final result = HsFavtCountResponseModel.fromJson(
        jsonDecode(response.body),
      );
      if (response.statusCode == 200) {
        hsFacCount = result.hsFacCount;

        showLoader(false);
        notifyListeners();

        Utils.showPrimarySnackbar(context, "", type: SnackType.success);
        notifyListeners();
      } else {
        // Utils.showPrimarySnackbar(context, "", type: SnackType.error);
      }
    }
        // ).onError((error, stackTrace) {
        //   Utils.showPrimarySnackbar(context, error, type: SnackType.debugError);
        // }).catchError(
        //   (Object e) {
        //     Utils.showPrimarySnackbar(context, e, type: SnackType.debugError);
        //   },
        //   test: (Object e) {
        //     Utils.showPrimarySnackbar(context, e, type: SnackType.debugError);
        //     return false;
        //   },
        );
  }

  ////////////////////////////////////////////
  List<HsfavListView>? hsFavListdata;

  Future<void> hsFavDetailsList(context) async {
    showLoader(true);
    SharedPreferences pref = await SharedPreferences.getInstance();
    print(pref.getString("successToken"));
    hsFavListViewRepo
        .homeSFavListView(pref.getString("successToken"))
        .then((response) {
      log(response.body);
      final result = HsFavListViewResponse.fromJson(
        jsonDecode(response.body),
      );
      if (response.statusCode == 200) {
        // if (result.status == 200) {
        hsFavListdata = result.hsFavListdata;
        showLoader(false);
        notifyListeners();
        // Utils.showPrimarySnackbar(context, "", type: SnackType.success);
        notifyListeners();
        // } else {
        //   // Utils.showPrimarySnackbar(context, "", type: SnackType.error); //
        // }
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
  Future<void> hsremoveToFav(context, hsId) async {
    hsPackageId = hsId;
    LoadingOverlay.of(context).show();
    SharedPreferences pref = await SharedPreferences.getInstance();
    hsRemovePackgeFromFavRepo
        .hsremovePackgeFromFav(
            hsRemoveFavRequestmodel, pref.getString("successToken"))
        .then((response) async {
      log("response.body${response.body}");
      final result =
          HsRemoveFavResposeModel.fromJson(jsonDecode(response.body));
      if (response.statusCode == 200) {
        // FavCountList(context);
        // FavListDetailView(context);
        LoadingOverlay.of(context).hide();
        await hsFavDetailsList(context);
        Navigator.push(
          context,
          SlidePageRoute(
            page: FavourtListView(),
            direction: SlideDirection.right, // Specify the slide direction here
            delay: Duration(milliseconds: 5000),
          ),
        );
        notifyListeners();
      }
      Utils.showPrimarySnackbar(context, result.message,
          type: SnackType.success);
      notifyListeners();
    });
  }
}
