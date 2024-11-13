import 'dart:async';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:md_health/Screens/food/diet_plan/view/diet_plan_details_view.dart';
import 'package:md_health/Screens/shop/md_shop_home_page/controller/md_shop_home_page_controller.dart';
import 'package:md_health/Screens/shop/md_shop_home_page/view/shop_map.dart';
import 'package:md_health/Screens/shop/shop_make_request/view/shop_make_request_form.dart';
import 'package:md_health/Screens/shop/shop_product_list/view/shop_product_list.dart';
import 'package:md_health/Screens/shop/shop_product_view/controller/s_product_view_controller.dart';
import 'package:md_health/Screens/shop/shop_product_view/view/shop_product_view.dart';
import 'package:md_health/constants/styles/colors.dart';
import 'package:md_health/test_widget.dart';
import 'package:md_health/utils/utils.dart';
import 'package:md_health/widget/base_screen.dart';
import 'package:md_health/widget/buttons.dart';
import 'package:md_health/widget/custom_appbar.dart';
import 'package:md_health/widget/loader.dart';
import 'package:md_health/widget/network_image.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class MdShopHomePageView extends StatefulWidget {
  const MdShopHomePageView({super.key});

  @override
  State<MdShopHomePageView> createState() => _MdShopHomePageViewState();
}

class _MdShopHomePageViewState extends State<MdShopHomePageView>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration:
          const Duration(milliseconds: 500), // Adjust the duration as needed
    );
    _animation = Tween<double>(begin: 1, end: 0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.linear),
    );

    SchedulerBinding.instance.addPostFrameCallback((_) {
      context.read<MdShopHomePageController>().initState(
            context,
          );
    });
  }

  void _showDialog() {
    debugPrint('helooooooooooooooooooo');
    _animationController.reset();
    _animationController.forward();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        final watch = context.watch<MdShopHomePageController>();
        // final read = context.read<HomeViewController>();
        return AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return Transform.translate(
              offset: Offset(
                  0, MediaQuery.of(context).size.height * _animation.value),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                alignment: Alignment.center,
                child: Stack(
                  children: [
                    Container(
                      height: 400.h,
                      // color: Colors.red,
                      child: GestureDetector(
                        onTap: () {
                          watch.toggleExpansion(-1);
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    Positioned(
                      top: 10,
                      child: GestureDetector(
                        onTap: () {
                          print('--------------------------------');
                          watch.selectedSubCategories.clear();
                          Navigator.pop(context);
                          watch.toggleExpansion(-1);
                        },
                        child: Container(
                          // color: Colors.pink,
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.only(left: 150.w),
                          child: SvgPicture.asset(
                            'assets/icons/Close-Square.svg',
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      right: 1,
                      left: 1,
                      top: 0,
                      child: Container(
                        // color: Colors.pink,
                        height: 100.h,
                        width: 300.w,

                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          // borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                      ),
                    ),
                    Positioned(
                      right: 0,
                      left: 0,
                      top: 25,
                      child: Container(
                        // color: Colors.red,
                        // padding:  EdgeInsets.fromLTRB(30.w, 20.w, 30.w, 48.w),
                        child: Image.asset(
                          'assets/icons/katman_1.png',
                          height: 30.h,
                          width: 37.w,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 1,
                      top: 60.w,
                      child: Material(
                        type: MaterialType.transparency,
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          width: 300.w,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20.w, vertical: 20.w),
                            child: Column(
                              children: [
                                Container(
                                  height: 300.h,
                                  child: ListView.builder(
                                    key: Key(watch.selected.toString()),
                                    shrinkWrap: true,
                                    physics: BouncingScrollPhysics(),
                                    itemCount: watch.categoryList?.length ??
                                        0, // count of response list
                                    itemBuilder: (context, index) {
                                      final element =
                                          watch.categoryList?[index];
                                      return Container(
                                        child: Column(
                                          children: [
                                            Container(
                                              child: ExpansionTile(
                                                key: Key(index.toString()),
                                                initiallyExpanded:
                                                    index == watch.selected,
                                                title: Row(
                                                  children: [
                                                    Text(
                                                        "${element?.categoryName}",
                                                        style: TextStyle(
                                                            fontSize: 20.sp,
                                                            color: black,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w700)),
                                                    SizedBox(width: 10.w),
                                                    Flexible(
                                                        child: Text(
                                                            watch.selectedSubCategories[
                                                                    index] ??
                                                                "")),
                                                  ],
                                                ),
                                                onExpansionChanged: (newState) {
                                                  if (newState) {
                                                    // Only load subcategories if not already loaded
                                                    if (watch
                                                            .categorySubCategories[
                                                                element?.id]
                                                            ?.isEmpty ??
                                                        true) {
                                                      watch.getSubCategories(
                                                          context, element?.id);
                                                    }
                                                    watch
                                                        .toggleExpansion(index);
                                                  }
                                                },
                                                children: [
                                                  ListView.builder(
                                                    shrinkWrap: true,
                                                    physics:
                                                        BouncingScrollPhysics(),
                                                    itemCount: watch
                                                            .categorySubCategories[
                                                                element?.id]
                                                            ?.length ??
                                                        0,
                                                    itemBuilder:
                                                        (context, subIndex) {
                                                      final element2 = watch
                                                              .categorySubCategories[
                                                          element
                                                              ?.id]?[subIndex];
                                                      return GestureDetector(
                                                        onTap: () {
                                                          watch.subCategorySelectItem(
                                                              index,
                                                              element2
                                                                  ?.subCategoryName);
                                                          watch.toggleExpansion(
                                                              -1);

                                                          print(
                                                              'this is category id');
                                                          print(
                                                              '${element?.id}');
                                                          print(
                                                              'this is sub category id');
                                                          print(
                                                              '${element2?.id}');

                                                          Navigator.push(
                                                            context,
                                                            SlidePageRoute(
                                                              page:
                                                                  ShopProductListView(
                                                                pincode: '',
                                                                productName: '',
                                                                categoryId: element
                                                                    ?.id
                                                                    .toString(),
                                                                subCategoryId:
                                                                    element2?.id
                                                                        .toString(),
                                                              ),
                                                              direction:
                                                                  SlideDirection
                                                                      .right, // Specify the slide direction here
                                                              delay: const Duration(
                                                                  milliseconds:
                                                                      5000),
                                                            ),
                                                          );
                                                          // watch.subCategorySelectedItem = element?.subCategoryName;
                                                          // watch.selectSubCategory(
                                                          //     context,
                                                          //     subItems[subIndex]);
                                                        },
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left: 24.sp),
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                element2?.subCategoryName ??
                                                                    '',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        17.sp,
                                                                    color:
                                                                        black,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400),
                                                              ),
                                                              SizedBox(
                                                                  height: 15.h),
                                                            ],
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  )
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final read = context.read<MdShopHomePageController>();
    final watch = context.watch<MdShopHomePageController>();
    final readp = context.read<ProductViewController>();
    // final watchp = context.watch<ProductViewController>();
    return BaseScreen(
      hasScrollView: false,
      onWillPop: () async {
        // Navigator.pushReplacement(
        //   context,
        //   SlidePageRoute(
        //     page: DiscoverView(
        //         // type: widget.type,
        //         // purchesId: watch.purchesId,
        //         // packageId: watch.packageId,
        //         ),
        //     direction: SlideDirection.left, // Specify the slide direction here
        //     delay: Duration(milliseconds: 5000),
        //   ),
        // );

        return false;
      },
      backgroundColor: const Color(0xffF5F5F5),
      appBar: CustomAppBar(
        hasCartIcon: true,
        mdTitle: "shop",
        hasHiText: true,
        // hasBackButton: ,
        hasMdTitle: true,
        // drawerTitle: "Orders",
      ),
      content: watch.isLoading
          ? Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 200.h),
                const Loader(),
              ],
            )
          : Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        // height: 394.h,
                        // width: ScreenUtil().scaleWidth,
                        padding: EdgeInsets.only(
                            top: 23.w, left: 29.w, right: 37.w, bottom: 49.w),
                        color: Colors.black,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                SizedBox(width: 25.w),
                                AppNetworkImages(
                                  imageUrl:
                                      "${watch.superFeaturedProduct?.productImage}",
                                  height: 160.h,
                                  width: 262.w,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 15.w,
                            ),
                            Text(
                              "${watch.superFeaturedProduct?.productName}",
                              //  ${watch.superFeaturedProduct?.productDescription}

                              style: TextStyle(
                                  fontFamily: 'Campton',
                                  color: Colors.white,
                                  // letterSpacing: 5.5,
                                  fontSize: 24.5.sp,
                                  fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              height: 9.h,
                            ),
                            watch.superFeaturedProduct?.discountPrice == ""
                                ? Container()
                                : Row(
                                    children: [
                                      if ((double.tryParse(watch
                                                      .superFeaturedProduct
                                                      ?.salePrice ??
                                                  '0') ??
                                              0) <
                                          (double.tryParse(watch
                                                      .superFeaturedProduct
                                                      ?.productPrice ??
                                                  '0') ??
                                              0))
                                        Stack(
                                          children: [
                                            Positioned.fill(
                                              child: CustomPaint(
                                                painter: SlantedLinePainter(
                                                    color: Colors.red),
                                              ),
                                            ),
                                            RichText(
                                              text: TextSpan(
                                                text:
                                                    "${watch.superFeaturedProduct?.productPrice}",
                                                style: TextStyle(
                                                    fontFamily: 'Campton',
                                                    color: Colors.white,
                                                    fontSize: 24.sp,
                                                    fontWeight:
                                                        FontWeight.w600),

                                                /*defining default style is optional */
                                                children: <TextSpan>[
                                                  TextSpan(
                                                    text: ' ₺',
                                                    style: GoogleFonts.inter(
                                                      textStyle: TextStyle(
                                                          color: Colors.white,
                                                          // letterSpacing: .5,
                                                          fontSize: 24.sp,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        )
                                      else
                                        Container(),
                                      Text(
                                        "   ( ${watch.superFeaturedProduct?.discountPrice}% Discount )",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 13.sp,
                                            fontFamily: 'Campton',
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ],
                                  ),
                            SizedBox(
                              height: 10.h,
                            ),
                            RichText(
                              text: TextSpan(
                                text:
                                    '${watch.superFeaturedProduct?.salePrice} ',
                                style: TextStyle(
                                    fontFamily: 'Campton',
                                    color: Colors.white,
                                    fontSize: 34.sp,
                                    fontWeight: FontWeight.w600),

                                /*defining default style is optional */
                                children: <TextSpan>[
                                  TextSpan(
                                    text: '₺',
                                    style: GoogleFonts.inter(
                                      textStyle: TextStyle(
                                          color: Colors.white,
                                          // letterSpacing: .5,
                                          fontSize: 34.sp,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 9.h,
                            ),
                            PrimaryButton(
                              width: 232.w,
                              height: 43.w,
                              borderRadius: 10,
                              color: const Color(0xff4CDB06),
                              onTap: () async {
                                SharedPreferences pref =
                                    await SharedPreferences.getInstance();
                                if (pref.getString("status") ==
                                    "guestLoggedIn") {
                                  Utils.showLogdinDialog(
                                      context, "Please Login to continue");
                                  return;
                                }
                                Navigator.push(
                                  context,
                                  SlidePageRoute(
                                    page: ShopProductView(
                                      id: watch.superFeaturedProduct?.id
                                          .toString(),
                                    ),
                                    direction: SlideDirection.right,
                                    delay: const Duration(milliseconds: 5000),
                                  ),
                                );
                              },
                              child: Text(
                                "Buy Now",
                                style: TextStyle(
                                  fontFamily: 'Campton',
                                  color: Colors.white,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: 20.0.w, top: 30.w, right: 20.w),
                        child: Container(
                          height: 50.h,
                          padding: EdgeInsets.only(left: 20.0.w),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(30)),
                            border: Border.all(color: Colors.black, width: 1.w),
                          ),
                          child: TextFormField(
                            controller: watch.shopNamesearchController,
                            // textCapitalization: TextCapitalization
                            //     .sentences, // Capitalizes first letter of each sentence.

                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.copyWith(
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Campton',
                                    fontSize: 16.sp),
                            decoration: InputDecoration(
                                hintText: 'Product Name',
                                labelText: "Search by",
                                border: InputBorder.none,
                                labelStyle: TextStyle(
                                  color: const Color(0xff8B8B8B),
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Campton',
                                  // letterSpacing: -0.5,
                                  fontSize: 15.sp,
                                ),
                                suffixIcon: const Icon(
                                  Icons.search,
                                  color: Colors.black,
                                )),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            isDismissible: false,
                            enableDrag: false,
                            builder: (context) {
                              return const ShopLocationBottomSheet();
                            },
                          );
                        },
                        child: Padding(
                          padding: EdgeInsets.only(left: 20.0.w, right: 10.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SvgPicture.asset("assets/icons/location100.svg"),
                              // Icon(Icons.ac_unit_rounded),
                              SizedBox(
                                width: 10.h,
                              ),
                              Flexible(
                                child: Text(
                                  "${watch.currentLocationText ?? '...'} ",
                                  style: TextStyle(
                                      color: Colors.black,
                                      // letterSpacing: .5,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Container(
                        padding: const EdgeInsets.only(
                            // top: 21.w,
                            // bottom: 40.w,
                            ),
                        margin: EdgeInsets.only(
                          left: 21.w,
                          right: 17.w,
                        ),
                        child: PrimaryButton(
                          // borderRadius: BorderRadius.circular(),
                          borderRadius: 30,
                          // width: ScreenUtil().screenWidth,
                          color: const Color(0xff4CDB06),

                          onTap: () async {
                            print(watch.shopNamesearchController.text);
                            print(watch.pinCode);

                            // return;
                            Navigator.push(
                              context,
                              SlidePageRoute(
                                page: ShopProductListView(
                                  productName:
                                      watch.shopNamesearchController.text,
                                  pincode: watch.pinCode,
                                ),
                                direction: SlideDirection
                                    .right, // Specify the slide direction here
                                delay: const Duration(milliseconds: 5000),
                              ),
                            );

                            watch.shopNamesearchController.clear();
                          },
                          child: Text(
                            "Search",
                            style: TextStyle(
                                color: Colors.black,
                                // letterSpacing: .5,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            print('object');
                            print(watch.adsdata?.adsUrl);
                            watch.adsdata?.adsUrl;
                            launchUrl(Uri.parse('${(watch.adsdata?.adsUrl)}'))
                                .onError(
                              (error, stackTrace) {
                                print("Url is not valid!");
                                return false;
                              },
                            );
                          },
                          child: AppNetworkImages(
                              imageUrl: "${watch.adsdata?.adsImagePath}",
                              width: ScreenUtil().screenWidth,
                              fit: BoxFit.contain),
                        ),
                      ),
                      // SizedBox(
                      //   height: 25.h,
                      // ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              SlidePageRoute(
                                page: const ShopMakeRequestView(

                                    // packageId: watch.packageId,
                                    ),
                                direction: SlideDirection
                                    .right, // Specify the slide direction here
                                delay: const Duration(milliseconds: 5000),
                              ),
                              // MaterialPageRoute(
                              //     builder: (context) => PersonInformationFormView())
                            );
                          },
                          child: Image(
                            image: const AssetImage(
                              "assets/images/shop  product.png",
                            ),
                            width: 400.w,
                            height: 150.h,
                          ),
                        ),
                      ),
                      RichText(
                        // textAlign: TextAlign.start,
                        text: TextSpan(
                          text: "Most",
                          style: TextStyle(
                              fontFamily: 'Campton',
                              color: Colors.black,
                              fontSize: 24.sp,
                              fontWeight: FontWeight.w700),

                          /*defining default style is optional */
                          children: <TextSpan>[
                            TextSpan(
                              text: ' Sales',
                              style: TextStyle(
                                  color: kDefaultActiveColor,
                                  fontSize: 25.sp,
                                  fontFamily: 'Campton',
                                  fontWeight: FontWeight.w700),
                              recognizer: new TapGestureRecognizer()
                                ..onTap = () {
                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(
                                  //       builder: (context) => SignUpView()),
                                  // );
                                },
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            top: 25.w, right: 9.w, bottom: 5.w, left: 10.w),
                        child: GridView.builder(
                          shrinkWrap: true,

                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: watch.featuredProducts?.length ?? 0,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio: (1.0.w / 1.7.w),
                                  crossAxisSpacing: 4.0,
                                  mainAxisSpacing: 10.0.w),
                          // padding: EdgeInsets.all(8.0), // padding around the grid

                          itemBuilder: (context, index) {
                            final element = watch.featuredProducts?[index];
                            return GestureDetector(
                              onTap: () async {
                                SharedPreferences pref =
                                    await SharedPreferences.getInstance();
                                if (pref.getString("status") ==
                                    "guestLoggedIn") {
                                  Utils.showLogdinDialog(
                                      context, "Please Login to continue");
                                  return;
                                }
                                Navigator.push(
                                  context,
                                  SlidePageRoute(
                                    page: ShopProductView(
                                      id: element?.id.toString() ?? '',
                                    ),
                                    direction: SlideDirection.right,
                                    delay: const Duration(milliseconds: 5000),
                                  ),
                                );
                              },
                              child: Container(
                                child: Card(
                                  // elevation: 5,
                                  shape: const RoundedRectangleBorder(
                                      // borderRadius: BorderRadius.circular(15.0),
                                      ),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: [
                                          BoxShadow(
                                            color:
                                                Colors.black.withOpacity(0.10),
                                            // offset: Offset(2, 2),
                                            blurRadius: 50,
                                          ),
                                        ]),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(
                                              // top: 7.w,
                                              right: 10.w,
                                              // bottom: 5.w,
                                              left: 18.w),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                height: 10.w,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  element?.featuredStatus ==
                                                          'yes'
                                                      ? Container(
                                                          margin:
                                                              EdgeInsets.only(
                                                                  right: 5.w),
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left: 8,
                                                                  top: 4,
                                                                  right: 8.w,
                                                                  bottom: 4),
                                                          decoration: BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20),
                                                              color: Colors
                                                                  .yellow),
                                                          child: Text(
                                                            "Featured",
                                                            // "Nivea",featured
                                                            style: TextStyle(
                                                                // decoration:
                                                                // TextDecoration.underline,
                                                                // letterSpacing: 3.5,
                                                                color: black,
                                                                fontSize: 10.sp,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700),
                                                          ),
                                                        )
                                                      : Container(),
                                                  GestureDetector(
                                                    onTap: () {
                                                      read.addToFavProducthome(
                                                          context, element?.id);
                                                    },
                                                    child: element
                                                                ?.favouriteStatus ==
                                                            'yes'
                                                        ?
                                                        // Image(
                                                        //     image: const AssetImage(
                                                        //         "assets/images/new_fav.png"),
                                                        //     width: 38.w,
                                                        //     height: 38.h,
                                                        //   )
                                                        Container(
                                                            decoration: BoxDecoration(
                                                                border: Border.all(
                                                                    color:
                                                                        kDefaultActiveColor),
                                                                color: Colors
                                                                    .white,
                                                                shape: BoxShape
                                                                    .circle),
                                                            height: 24.w,
                                                            width: 24.w,
                                                            child: Container(
                                                                height: 5.w,
                                                                width: 5.w,
                                                                child: Icon(
                                                                  size: 17,
                                                                  Icons
                                                                      .favorite,
                                                                  color:
                                                                      kDefaultActiveColor,
                                                                )),
                                                          )
                                                        : Image(
                                                            image: const AssetImage(
                                                                "assets/images/new_remove_fav.png"),
                                                            width: 38.w,
                                                            height: 38.h,
                                                          ),
                                                  )
                                                ],
                                              ),
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  SizedBox(
                                                    child: AppNetworkImages(
                                                      imageUrl:
                                                          "${element?.productImage}",
                                                      fit: BoxFit.cover,
                                                      width: 107.w,
                                                      height: 107.h,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 12.w,
                                              ),
                                              Text(
                                                "${element?.productName}",
                                                // "Nivea Essentially Enriched Body Lotion and Hand Cream Variety Pack",
                                                textAlign: TextAlign.start,
                                                style: TextStyle(
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    fontFamily: 'Campton',
                                                    color: Colors.black,
                                                    // letterSpacing: .5,
                                                    fontSize: 14.sp,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                              SizedBox(
                                                height: 9.w,
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 8.w,
                                        ),
                                        element?.freeShipping == "yes"
                                            ? Container(
                                                width: ScreenUtil().screenWidth,
                                                padding: EdgeInsets.only(
                                                    left: 18.w,
                                                    right: 21.w,
                                                    top: 5.w,
                                                    bottom: 3.w),
                                                color: const Color(0xff4CDB06),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    SvgPicture.asset(
                                                      "assets/icons/box-02.svg",
                                                    ),
                                                    Text(
                                                      "FREE SHIPPING",
                                                      style: TextStyle(
                                                          // letterSpacing: 0.9,
                                                          fontFamily: 'Campton',
                                                          color: Colors.white,
                                                          letterSpacing: 2.5,
                                                          fontSize: 10.sp,
                                                          fontWeight:
                                                              FontWeight.w700),
                                                    ),
                                                  ],
                                                ),
                                              )
                                            : element?.shippingFee != ''
                                                ? Container(
                                                    padding: EdgeInsets.only(
                                                        left: 10.w,
                                                        top: 10.w,
                                                        bottom: 5.w),
                                                    child: Row(
                                                      children: [
                                                        Text(
                                                          "Shipping Fees : ${element?.shippingFee}",
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  'Campton',
                                                              color: const Color(
                                                                  0xffffc107),
                                                              fontSize: 12.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700),
                                                        ),
                                                        Text(
                                                          "₺",
                                                          style:
                                                              GoogleFonts.inter(
                                                            textStyle: TextStyle(
                                                                color: const Color(
                                                                    0xffffc107),
                                                                fontSize: 12.sp,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  )
                                                : Container(),
                                        SizedBox(
                                          height: 8.w,
                                        ),

                                        /////////////////////////////////////////////////////////////
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Container(
                                              // padding:
                                              //     EdgeInsets.only(left: 10.w, right: 20.w),
                                              child: element?.featuredStatus ==
                                                      "approved"
                                                  ? Container(
                                                      padding: EdgeInsets.only(
                                                          left: 8,
                                                          top: 4,
                                                          right: 8.w,
                                                          bottom: 4),
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(20),
                                                          color: const Color(
                                                              0xffffc107)),
                                                      child: Text(
                                                        "Featured",
                                                        // "Nivea",featured
                                                        style: TextStyle(
                                                            // decoration:
                                                            // TextDecoration.underline,
                                                            // letterSpacing: 3.5,
                                                            color: black,
                                                            fontSize: 10.sp,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w700),
                                                      ),
                                                    )
                                                  : Container(),
                                            ),
                                            element?.verification == "yes"
                                                ? Image(
                                                    image: const AssetImage(
                                                      "assets/images/new_group.png",
                                                    ),
                                                    width: 45.w,
                                                    // height: 60.h,
                                                  )
                                                : Container(),
                                          ],
                                        ),

                                        /////////////////////////////////////////////////////////////
                                        Container(
                                          padding: EdgeInsets.only(
                                              left: 10.w, right: 10.w),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              RichText(
                                                text: TextSpan(
                                                  text: "${element?.salePrice}",
                                                  style: TextStyle(
                                                      fontFamily: 'Campton',
                                                      color: const Color(
                                                          0xff4CDB06),
                                                      fontSize: 18.sp,
                                                      fontWeight:
                                                          FontWeight.w700),

                                                  /*defining default style is optional */
                                                  children: <TextSpan>[
                                                    TextSpan(
                                                      text: '₺',
                                                      style: GoogleFonts.inter(
                                                        textStyle: TextStyle(
                                                            fontFamily:
                                                                'Campton',
                                                            color: const Color(
                                                                0xff4CDB06),
                                                            fontSize: 18.sp,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w700),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              element?.featuredStatus ==
                                                      "approved"
                                                  ? Container(
                                                      padding: EdgeInsets.only(
                                                          left: 8,
                                                          top: 4,
                                                          right: 8.w,
                                                          bottom: 4),
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(20),
                                                          color: const Color(
                                                              0xffffc107)),
                                                      child: Text(
                                                        "Featured",
                                                        // "Nivea",featured
                                                        style: TextStyle(
                                                            // decoration:
                                                            // TextDecoration.underline,
                                                            // letterSpacing: 3.5,
                                                            color: black,
                                                            fontSize: 10.sp,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w700),
                                                      ),
                                                    )
                                                  : Container(),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10.h,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      // SizedBox(
                      //   height: 80,
                      // ),
                    ],
                  ),
                ),
                Positioned(
                  top: 365.h,
                  left: 280.h,
                  height: 50.h,
                  child: GestureDetector(
                      onTap: () {
                        watch.getCategories(context);
                        watch.selectedSubCategories.clear();
                        _showDialog();
                      },
                      child:
                          SvgPicture.asset('assets/icons/shopopenpopup.svg')),
                )
              ],
            ),
    );
  }
}
