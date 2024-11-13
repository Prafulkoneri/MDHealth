import 'dart:io';
import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:md_health/Screens/food/diet_plan/view/deit_plan_result.dart';
import 'package:md_health/Screens/favourt/view/shop_fav_list_view.dart';
import 'package:md_health/Screens/shop/md_shop_home_page/view/md_shop_home_page.dart';
import 'package:md_health/Screens/shop/shop_cart/view/cart_view.dart';
import 'package:md_health/Screens/shop/shop_product_view/controller/s_product_view_controller.dart';
import 'package:md_health/Screens/shop/shop_vendors/view/shop_vendor.dart';
import 'package:md_health/constants/styles/colors.dart';
import 'package:md_health/test_widget.dart';
import 'package:md_health/widget/buttons.dart';
import 'package:md_health/widget/loader.dart';
import 'package:md_health/widget/network_image.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

class ShopProductView extends StatefulWidget {
  final String? id;
  final String? screenName;
  const ShopProductView({super.key, required this.id, this.screenName});

  @override
  State<ShopProductView> createState() => _ShopProductViewState();
}

class _ShopProductViewState extends State<ShopProductView> {
  PageController? _pageController;
  int activePage = 0;
  List<Widget> indicators(imagesLength, currentIndex) {
    return List<Widget>.generate(imagesLength, (index) {
      return currentIndex == index
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 5.w),
                  width: 12.w,
                  height: 12.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.w),
                    color: currentIndex == index
                        ? kDefaultActiveColor
                        : Colors.red,
                  ),
                ),
              ],
            )
          : Container(
              margin: EdgeInsets.only(left: 7.w),
              width: 12.w,
              height: 12.w,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                border:
                    Border.all(color: const Color.fromARGB(129, 182, 170, 170)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5), // Shadow color
                    spreadRadius: 0.5, // Spread radius
                    blurRadius: 1, // Blur radius
                    // offset: Offset(0, 2), // Offset of shadow
                  ),
                ],
              ),
            );
    });
  }

  // final String imageUrl =
  //     "https://projects.m-staging.in/md-health-testing/storage/vendorProductImages/17092748775FWcu.jpg";

  // Future<void> _shareImage() async {
  //   try {
  //     // Download the image
  //     final response = await http.get(Uri.parse(imageUrl));
  //     final bytes = response.bodyBytes;

  //     // Get the temporary directory on the device
  //     final tempDir = await getTemporaryDirectory();
  //     final file = File('${tempDir.path}/image.jpg');

  //     // Write the image to the temp directory
  //     await file.writeAsBytes(bytes);

  //     // Share the downloaded image
  //     Share.shareFiles([file.path], text: "Check out this product!");
  //   } on PlatformException catch (e) {
  //     print("Failed to share image: ${e.message}");
  //   } catch (e) {
  //     print("Failed to share image: $e");
  //   }
  // }

  @override
  void initState() {
    final watch = Provider.of<ProductViewController>(context, listen: false);
    SchedulerBinding.instance.addPostFrameCallback((_) {
      context.read<ProductViewController>().initState(context, widget.id);
    });
    _pageController = PageController(viewportFraction: 1, initialPage: 1);
  }

  bool isFollowed = false;
  void _showImagePopup(BuildContext context, {required String imageUrl}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context); // Close the dialog when tapped
            },
            child: Container(
              width: 200.h,
              height: 200.h,
              child: Image.network(
                imageUrl,
                fit: BoxFit.contain,
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final read = context.read<ProductViewController>();
    final watch = context.watch<ProductViewController>();
    return Scaffold(
      backgroundColor: const Color(0xffF5F5F5),
      body: WillPopScope(
        onWillPop: () async {
          print("hufdsghuydsfgyudfsguyd");
          // widget.screenName != "Favpage"
          //     ?
          Navigator.pushReplacement(
            context,
            SlidePageRoute(
              page: const MdShopHomePageView(), // Home page
              direction: SlideDirection.right, // Slide direction
            ),
          );

          return false;
        },
        child: watch.isLoading
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                    SizedBox(height: 50.h),
                    const Loader(),
                  ])
            : Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      physics: const BouncingScrollPhysics(),
                      child: Stack(
                        children: [
                          Positioned(
                            top: -5,
                            left: -5,
                            child: _circle(),
                          ),
                          BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 150, sigmaY: 150),
                            child: Container(
                              color: Colors.transparent,
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 61.h,
                              ),
                              Stack(
                                children: [
                                  Container(
                                    // color: black,
                                    // width: MediaQuery.of(context).size.width,
                                    height: 160.w,
                                    child: PageView.builder(
                                      // itemCount: 10,
                                      itemCount: watch.productImages.length,
                                      // watch.productViewData?.productUnitDetails?.length ??
                                      //     0,
                                      physics: const BouncingScrollPhysics(),
                                      padEnds: false,
                                      pageSnapping: true,
                                      // controller: _pageController,
                                      onPageChanged: (page) {
                                        setState(() {
                                          activePage = page;
                                        });
                                      },
                                      itemBuilder: (context, pagePosition) {
                                        final element =
                                            watch.productImages[pagePosition];
                                        return Container(
                                          padding: EdgeInsets.only(
                                              left: 15.w, right: 15.w),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              // GestureDetector(
                                              //     onTap: () {
                                              //       Navigator.push(
                                              //         context,
                                              //         SlidePageRoute(
                                              //           page:
                                              //               const MdShopHomePageView(),
                                              //           direction:
                                              //               SlideDirection.right,
                                              //           delay: const Duration(
                                              //               milliseconds: 5000),
                                              //         ),
                                              //         // MaterialPageRoute(
                                              //         //     builder: (context) => ShopProductView()),
                                              //       );
                                              //     },
                                              //     child: Image(
                                              //       image: const AssetImage(
                                              //           "assets/images/new_p_back.png"),
                                              //       width: 38.w,
                                              //       height: 38.h,
                                              //     )),
                                              GestureDetector(
                                                onTap: () {
                                                  _showImagePopup(context,
                                                      imageUrl: element);
                                                },
                                                child: AppNetworkImages(
                                                  showShopImage: true,
                                                  imageUrl: element,
                                                  height: 241.w,
                                                  width: 200.w,
                                                  fit: BoxFit.contain,
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                  Positioned(
                                    left: 20,
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          SlidePageRoute(
                                            page: const MdShopHomePageView(),
                                            direction: SlideDirection.right,
                                            delay: const Duration(
                                                milliseconds: 5000),
                                          ),
                                        );
                                      },
                                      child: const Image(
                                        image: AssetImage(
                                            "assets/images/new_p_back.png"),
                                        width: 38.0,
                                        height: 38.0,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    right: 20,
                                    top: 1,
                                    child: Column(
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            Share.share(
                                                "Check out latest product ${watch.productImages[activePage]}");
                                          },
                                          child: const Image(
                                            image: AssetImage(
                                                "assets/images/new_share.png"),
                                            width: 38.0,
                                            height: 38.0,
                                          ),
                                        ),
                                        SizedBox(height: 10.h),
                                        GestureDetector(
                                          onTap: () {
                                            read.addToFavProduct(
                                                context,
                                                watch.productData?.id
                                                    .toString());
                                          },
                                          child: watch.isFavProduct
                                              ? Container(
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color:
                                                              kDefaultActiveColor),
                                                      color: Colors.white,
                                                      shape: BoxShape.circle),
                                                  height: 24.w,
                                                  width: 24.w,
                                                  child: Container(
                                                      height: 5.w,
                                                      width: 5.w,
                                                      child: Icon(
                                                        size: 17,
                                                        Icons.favorite,
                                                        color:
                                                            kDefaultActiveColor,
                                                      )),
                                                )
                                              : const Image(
                                                  image: AssetImage(
                                                      "assets/images/new_remove_fav.png"),
                                                  width: 38.0,
                                                  height: 38.0,
                                                ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),

                              //  ] ),
                              SizedBox(
                                height: 10.w,
                              ),

                              Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: indicators(
                                      watch.productImages.length, activePage)),
                              ///////////////////

                              SizedBox(
                                height: 25.w,
                              ),
                              Container(
                                padding: EdgeInsets.only(
                                    left: 21.w, right: 20.w, top: 25.w),
                                color: const Color(0xffD9D9D9).withOpacity(0.3),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      // padding: ED,
                                      // width: 300.w,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Flexible(
                                            child: Text(
                                              "${watch.productData?.productName}",
                                              // "Nivea",featured
                                              style: TextStyle(
                                                  decoration:
                                                      TextDecoration.underline,
                                                  // letterSpacing: 3.5,
                                                  color: kDefaultActiveColor,
                                                  fontSize: 20.sp,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                          ),
                                          Column(
                                            children: [
                                              watch.productData?.featured ==
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
                                              SizedBox(
                                                height: 10.h,
                                              ),
                                              watch.productData?.verified ==
                                                      "yes"
                                                  ? Image(
                                                      image: const AssetImage(
                                                        "assets/images/Shop.png",
                                                      ),
                                                      width: 50.w,
                                                      // height: 60.h,
                                                    )
                                                  : Container()
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                    // SizedBox(
                                    //   height: 10.h,
                                    // ),
                                    Text(
                                      "${watch.productData?.productCategoryName}",
                                      // "Nivea Essentially Enriched Body Lotion and Hand Cream Variety Pack",
                                      style: TextStyle(
                                          // letterSpacing: 3.5,
                                          color: black,
                                          fontSize: 20.sp,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    // SizedBox(
                                    //   height: 17.h,
                                    // ),
                                    Row(
                                      children: [
                                        if ((double.tryParse(watch.productData
                                                        ?.salePrice ??
                                                    '0') ??
                                                0) <
                                            (double.tryParse(watch.productData
                                                        ?.productPrice ??
                                                    '0') ??
                                                0))
                                          Stack(
                                            children: [
                                              // Your other content here

                                              // Conditionally display slanted line or container

                                              Positioned.fill(
                                                child: CustomPaint(
                                                  painter: SlantedLinePainter(
                                                      color: Colors.red),
                                                ),
                                              ),

                                              RichText(
                                                text: TextSpan(
                                                    text:
                                                        "${watch.productData?.productPrice}",
                                                    style: TextStyle(
                                                        fontFamily: 'Campton',
                                                        color: Colors.black,
                                                        fontSize: 16.sp,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                    children: [
                                                      TextSpan(
                                                        text: ' ₺',
                                                        style:
                                                            GoogleFonts.inter(
                                                          textStyle: TextStyle(
                                                              // fontFamily: 'Campton',
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                        ),
                                                      ),
                                                    ]),
                                              ),
                                            ],
                                          )
                                        else
                                          Container(),
                                        SizedBox(width: 10.w),
                                        if ((double.tryParse(watch.productData
                                                        ?.salePrice ??
                                                    '0') ??
                                                0) <
                                            (double.tryParse(watch.productData
                                                        ?.productPrice ??
                                                    '0') ??
                                                0))
                                          Text(
                                              "( ${watch.productData?.discount} % Discount )",
                                              style: TextStyle(
                                                  fontSize: 13.sp,
                                                  color: black,
                                                  fontFamily: 'Campton',
                                                  fontWeight: FontWeight.w500))
                                        else
                                          Container(),
                                      ],
                                    ),

                                    RichText(
                                      text: TextSpan(
                                        style: TextStyle(
                                          fontFamily: 'Campton',
                                          color: Colors.black,
                                          fontSize: 16.sp,
                                          letterSpacing: 1.5,
                                          fontWeight: FontWeight.w600,
                                        ),
                                        children: [
                                          TextSpan(
                                              text:
                                                  '${watch.productData?.salePrice}'),
                                          TextSpan(
                                            text: '₺',
                                            style: GoogleFonts.inter(),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        // Text(
                                        //   "${watch.productData?.reviews}",
                                        //   // "5.0",
                                        //   style: TextStyle(
                                        //       // letterSpacing: 3.5,
                                        //       color: black,
                                        //       fontSize: 13.sp,
                                        //       fontWeight: FontWeight.w600),
                                        // ),
                                        // SizedBox(
                                        //   width: 10.h,
                                        // ),
                                        for (int i = 0; i < 5; i++)
                                          SvgPicture.asset(
                                            i < watch.productData!.reviews!
                                                ? 'assets/icons/black-star.svg'
                                                : 'assets/icons/black-star.svg',
                                            width: 10,
                                            color:
                                                i < watch.productData!.reviews!
                                                    ? Colors.green
                                                    : Colors.black,
                                            // alignment: Alignment.topRight,
                                          ),
                                        SizedBox(
                                          width: 10.h,
                                        ),
                                        Text(
                                          "( ${watch.productData?.totalReviews} Review )",
                                          style: TextStyle(
                                              // letterSpacing: 3.5,
                                              color: black,
                                              fontSize: 10.sp,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    Text(
                                      "Product Specifications ",
                                      style: TextStyle(
                                          // letterSpacing: 3.5,
                                          color: kDefaultActiveColor,
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(top: 2.w),
                                      child: RichText(
                                        text: TextSpan(
                                          style: const TextStyle(
                                            fontSize: 16,
                                            color: Colors.black,
                                            height: 1.55,
                                          ),
                                          children: [
                                            TextSpan(
                                              text: watch.productData
                                                      ?.productDescrition ??
                                                  "",
                                              // watch
                                              // .formatDescription(), // The bullet-pointed description
                                              style: TextStyle(
                                                  fontSize: 14.sp,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ],
                                        ),
                                        textAlign: TextAlign.left,
                                      ),

                                      // child: Row(
                                      //   crossAxisAlignment:
                                      //       CrossAxisAlignment.start,
                                      //   mainAxisAlignment:
                                      //       MainAxisAlignment.end,
                                      //   children: [
                                      //     Text(
                                      //       "•",
                                      //       style: TextStyle(fontSize: 20.sp),
                                      //     ),
                                      //     const SizedBox(
                                      //       width: 8,
                                      //     ),
                                      //     Flexible(
                                      //       child: Text(
                                      //         "${watch.productData?.productDescrition}",

                                      //         // softWrap: true,
                                      //         // maxLines: 3,//
                                      //         // "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do",
                                      //         textAlign: TextAlign.start,
                                      //         style: TextStyle(
                                      //             color: black,
                                      //             // height: 1.5,
                                      //             // letterSpacing:
                                      //             //     0.5,
                                      //             // overflow: TextOverflow.ellipsis,
                                      //             fontSize: 14.sp,
                                      //             fontWeight: FontWeight.w400
                                      // ),
                                      //       ),
                                      //     ),
                                      //   ],
                                      // ),
                                    ),
                                    // Padding(
                                    //   padding: EdgeInsets.only(
                                    //       left: 5.w, top: 5.w, right: 6.w),
                                    //   child: Row(
                                    //     crossAxisAlignment: CrossAxisAlignment.start,
                                    //     children: [
                                    //       Text(
                                    //         "•",
                                    //         style: TextStyle(fontSize: 20.sp),
                                    //       ),
                                    //       const SizedBox(
                                    //         width: 8,
                                    //       ),
                                    //       Flexible(
                                    //         child: Text(
                                    //           // softWrap: true,
                                    //           // maxLines: 3,//
                                    //           "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do",
                                    //           textAlign: TextAlign.start,
                                    //           style: TextStyle(
                                    //               // color: black,
                                    //               // height: 1.5,
                                    //               // letterSpacing:
                                    //               //     0.5,
                                    //               // overflow: TextOverflow.ellipsis,
                                    //               fontSize: 14.sp,
                                    //               fontWeight: FontWeight.w400),
                                    //         ),
                                    //       ),
                                    //     ],
                                    //   ),
                                    // ),
                                    SizedBox(
                                      height: 20.h,
                                    ),
                                    GestureDetector(
                                        onTap: () {
                                          print('object');
                                          print(watch.adsdata?.adsUrl);
                                          watch.adsdata?.adsUrl;
                                          launchUrl(Uri.parse(
                                                  '${(watch.adsdata?.adsUrl)}'))
                                              .onError(
                                            (error, stackTrace) {
                                              print("Url is not valid!");
                                              return false;
                                            },
                                          );
                                        },
                                        child: Image(
                                          image: NetworkImage(
                                            '${watch.adsdata?.adsImagePath}',
                                          ),
                                          width: ScreenUtil().screenWidth,
                                          fit: BoxFit.fill,
                                          // height: 400.h,
                                        )
                                        // Image(
                                        //   image: NetworkImage(
                                        //       '${watch.adsdata?.adsImagePath}'
                                        //       // "assets/images/vecteezy_hamburger-food-png-generative-ai_27147309.png",
                                        //       ),
                                        //   width: ScreenUtil().screenWidth,
                                        //   fit: BoxFit.fill,
                                        //   height: 150.h,
                                        // ),
                                        //  Image(
                                        //   image: NetworkImage(
                                        //       '${watch.adsdata?.adsImagePath}'),
                                        //   height: 144.h,
                                        //   width: 500,
                                        //   fit: BoxFit.cover,
                                        // ),
                                        ),
                                    SizedBox(
                                      height: 20.h,
                                    ),

                                    Container(
                                        margin: EdgeInsets.only(
                                            left: 0.w,
                                            right: 18.w,
                                            top: 14.w,
                                            bottom: 15.w),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        child: Column(children: [
                                          Container(
                                            margin: EdgeInsets.only(
                                                left: 22.w,
                                                right: 18.w,
                                                top: 8.w,
                                                bottom: 5.w),
                                            padding: EdgeInsets.only(
                                                left: 5.w,
                                                right: 12.w,
                                                top: 8.w,
                                                bottom: 5.w),
                                            decoration: BoxDecoration(
                                                color: const Color(0xffD9D9D9)
                                                    .withOpacity(0.3),
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    Container(
                                                      padding: EdgeInsets.only(
                                                          left: 11.w,
                                                          right: 11.w,
                                                          top: 4.w,
                                                          bottom: 1.w),
                                                      decoration: BoxDecoration(
                                                          color: const Color(
                                                              0xff4CDB06),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8)),
                                                      child: Text(
                                                        "${watch.productData?.reviews}",
                                                        style: TextStyle(
                                                            // letterSpacing: 3.5,
                                                            color: black,
                                                            fontSize: 13.sp,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w700),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 10.w,
                                                    ),
                                                    Text(
                                                      "${watch.productData?.vendorName}",
                                                      // "evony medikal",
                                                      style: TextStyle(
                                                          // letterSpacing: 3.5,
                                                          color: black,
                                                          fontSize: 16.sp,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ),
                                                  ],
                                                ),
                                                Text(
                                                  "${watch.followerCount} Followers ",
                                                  style: TextStyle(
                                                      // letterSpacing: 3.5,
                                                      color: black,
                                                      fontSize: 10.sp,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                              ],
                                            ),
                                          ),
                                          watch.folloWStatus == "no"
                                              ? GestureDetector(
                                                  onTap: () {
                                                    print(watch
                                                        .productData?.vendorId);
                                                    read.vendorFollow(
                                                        context,
                                                        watch.productData
                                                            ?.vendorId);
                                                  },
                                                  child: Container(
                                                    margin: EdgeInsets.only(
                                                        left: 22.w,
                                                        right: 18.w,
                                                        top: 5.w,
                                                        bottom: 15.w),
                                                    padding: EdgeInsets.only(
                                                        top: 7.w, bottom: 8.w),
                                                    decoration: BoxDecoration(
                                                      border: Border.all(
                                                          width: 1,
                                                          color: Colors.black),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                    ),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        SvgPicture.asset(
                                                          'assets/icons/mingcute_user-follow-fill.svg',
                                                          color: Colors.black,
                                                        ),
                                                        SizedBox(
                                                          width: 5.w,
                                                        ),
                                                        Text(
                                                          "Follow   ",
                                                          style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 14.sp,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ))
                                              : GestureDetector(
                                                  onTap: () {
                                                    print(watch
                                                        .productData?.vendorId);
                                                    read.VendorUnFollow(
                                                        context,
                                                        watch.productData
                                                            ?.vendorId);
                                                    // setState(() {
                                                    //   isFollowed = !isFollowed;
                                                    // });
                                                  },
                                                  child: Container(
                                                    margin: EdgeInsets.only(
                                                        left: 22.w,
                                                        right: 18.w,
                                                        top: 14.w,
                                                        bottom: 15.w),
                                                    padding: EdgeInsets.only(
                                                        top: 7.w, bottom: 8.w),
                                                    decoration: BoxDecoration(
                                                      color: const Color(
                                                          0xff4CDB06),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                    ),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        SvgPicture.asset(
                                                          'assets/icons/mingcute_user-follow-fill.svg',
                                                          color: Colors.black,
                                                          // : Colors.black,
                                                        ),
                                                        SizedBox(
                                                          width: 5.w,
                                                        ),
                                                        Text(
                                                          "Following",
                                                          style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 14.sp,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  )),
                                          GestureDetector(
                                              onTap: () {
                                                print(watch
                                                    .productData?.vendorId);
                                                print('**********${widget.id}');

                                                // return;
                                                Navigator.push(
                                                  context,
                                                  SlidePageRoute(
                                                    page:
                                                        ViewAllMdShopHomePageView(
                                                      vendorId: watch
                                                          .productData?.vendorId
                                                          .toString(),
                                                      pId: widget.id,
                                                      // packageId: "watch.packageId.toString()",
                                                      // refresh: true,
                                                    ),
                                                    direction: SlideDirection
                                                        .left, // Specify the slide direction here
                                                    delay: const Duration(
                                                        milliseconds: 5000),
                                                  ),
                                                );
                                                print(watch
                                                    .productData?.vendorId);
                                                // read.VendorUnFollow(context,
                                                //     watch.productData?.vendorId);
                                                // setState(() {
                                                //   isFollowed = !isFollowed;
                                                // });ViewAllMdShopHomePageView
                                              },
                                              child: Container(
                                                margin: EdgeInsets.only(
                                                  left: 22.w,
                                                  right: 18.w,
                                                  bottom: 14.w,
                                                ),
                                                padding: EdgeInsets.only(
                                                    top: 7.w, bottom: 8.w),
                                                decoration: BoxDecoration(
                                                  color:
                                                      const Color(0xff4CDB06),
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                ),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      "View All Products",
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 14.sp,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ))
                                        ])),

                                    watch.reviewsList!.isEmpty
                                        ? Container()
                                        : Column(children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  "${watch.totalReviews}",
                                                  style: TextStyle(
                                                    fontFamily: 'Campton',
                                                    color: Colors.black,
                                                    fontSize: 40.sp,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 5.h,
                                            ),
                                            Center(
                                              child: Text(
                                                "${watch.totalAverageRating ?? ''} Reviews",
                                                style: TextStyle(
                                                  decoration:
                                                      TextDecoration.underline,
                                                  fontFamily: 'Campton',
                                                  color: Colors.black,
                                                  fontSize: 16.sp,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 5.h,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                for (int i = 0; i < 5; i++)
                                                  Row(
                                                    children: [
                                                      SvgPicture.asset(
                                                        i <
                                                                (watch.totalAverageRating !=
                                                                        null
                                                                    ? double.tryParse(watch.totalAverageRating.toString() ??
                                                                                '0')
                                                                            ?.round() ??
                                                                        0
                                                                    : 0)
                                                            ? 'assets/icons/Star.svg'
                                                            : 'assets/icons/Star.svg',
                                                        width: 14.w,
                                                        height: 25.w,
                                                        color: i <
                                                                (watch.totalAverageRating !=
                                                                        null
                                                                    ? double.tryParse(watch.totalAverageRating.toString() ??
                                                                                '0')
                                                                            ?.round() ??
                                                                        0
                                                                    : 0)
                                                            ? kDefaultActiveColor
                                                            : Colors.black,
                                                      ),
                                                      if (i < 4)
                                                        SizedBox(
                                                          width: 3.w,
                                                        ),
                                                    ],
                                                  ),
                                              ],
                                            ),
                                            Container(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  SizedBox(
                                                    height: 10.h,
                                                  ),
                                                  ListView.builder(
                                                    physics:
                                                        NeverScrollableScrollPhysics(),
                                                    shrinkWrap: true,
                                                    itemCount: watch.reviewsList
                                                            ?.length ??
                                                        0,
                                                    itemBuilder:
                                                        (context, index) {
                                                      final element = watch
                                                          .reviewsList?[index];

                                                      // Calculate the number of stars based on the rating
                                                      int numberOfStars =
                                                          element?.rating
                                                                  ?.round() ??
                                                              0;

                                                      return Container(
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            SizedBox(
                                                              height: 10.h,
                                                            ),
                                                            Row(
                                                              children: [
                                                                for (int i = 0;
                                                                    i < 5;
                                                                    i++)
                                                                  Row(
                                                                    children: [
                                                                      SvgPicture
                                                                          .asset(
                                                                        i < (element?.rating != null ? double.tryParse(element!.rating!.toString())?.round() ?? 0 : 0)
                                                                            ? 'assets/icons/black-star.svg'
                                                                            : 'assets/icons/black-star.svg',
                                                                        width:
                                                                            14,
                                                                        color: i <
                                                                                (element?.rating != null ? double.tryParse(element!.rating!.toString())?.round() ?? 0 : 0)
                                                                            ? kDefaultActiveColor
                                                                            : Colors.black,
                                                                      ),
                                                                      if (i < 4)
                                                                        SizedBox(
                                                                          width:
                                                                              3.w,
                                                                        ),
                                                                    ],
                                                                  ),
                                                              ],
                                                            ),
                                                            SizedBox(
                                                              height: 5.h,
                                                            ),
                                                            Text.rich(
                                                              TextSpan(
                                                                children: [
                                                                  TextSpan(
                                                                    text: element
                                                                            ?.feedback ??
                                                                        '',
                                                                    style:
                                                                        TextStyle(
                                                                      fontFamily:
                                                                          'Campton',
                                                                      color: Colors
                                                                          .black,
                                                                      fontSize:
                                                                          16.sp,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            SizedBox(
                                                                height: 10.h),
                                                            RichText(
                                                              textAlign:
                                                                  TextAlign
                                                                      .start,
                                                              text: TextSpan(
                                                                text:
                                                                    "${element?.fullName ?? ''}  /",
                                                                style:
                                                                    TextStyle(
                                                                  fontFamily:
                                                                      'Campton',
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize:
                                                                      16.sp,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                ),
                                                                children: <TextSpan>[
                                                                  TextSpan(
                                                                    text:
                                                                        ' Heart Valve Replacement Surgery\n ${element?.createdAt ?? ''}',
                                                                    style:
                                                                        TextStyle(
                                                                      fontFamily:
                                                                          'CamptonBookItalic',
                                                                      fontStyle:
                                                                          FontStyle
                                                                              .italic,
                                                                      color: Colors
                                                                          .black,
                                                                      fontSize:
                                                                          16.sp,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                    ),
                                                                    recognizer:
                                                                        TapGestureRecognizer()
                                                                          ..onTap =
                                                                              () {
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
                                                            SizedBox(
                                                                height: 28.h),
                                                            const Divider(
                                                              thickness: 1,
                                                              color: Color(
                                                                  0xff4CDB06),
                                                            ),
                                                          ],
                                                        ),
                                                      );
                                                    },
                                                  ),

                                                  // ListView.builder(
                                                  //   shrinkWrap: true,
                                                  //   itemCount: watch.reviewsList?.length ?? 0,
                                                  //   itemBuilder: (context, index) {
                                                  //     final element = watch.reviewsList?[index];
                                                  //     int numberOfStars =
                                                  //         element?.rating?.round() ?? 0;

                                                  //     return Container(
                                                  //       child: Column(
                                                  //         children: [
                                                  //           Text.rich(
                                                  //             TextSpan(
                                                  //               children: [
                                                  //                 WidgetSpan(
                                                  //                   element?.rating,
                                                  //                   child: SvgPicture.asset(
                                                  //                     'assets/icons/Star.svg',
                                                  //                     // width: 30,
                                                  //                     // alignment: Alignment.topRight,
                                                  //                   ),
                                                  //                 ),
                                                  //                 TextSpan(
                                                  //                   text: element?.feedback,
                                                  //                   style: TextStyle(
                                                  //                     fontFamily: 'Campton',
                                                  //                     color: Colors.black,
                                                  //                     fontSize: 16.sp,
                                                  //                     fontWeight:
                                                  //                         FontWeight.w400,
                                                  //                   ),
                                                  //                 )
                                                  //               ],
                                                  //             ),
                                                  //           ),
                                                  //           SizedBox(
                                                  //             height: 10.h,
                                                  //           ),
                                                  //           RichText(
                                                  //             textAlign: TextAlign.start,
                                                  //             text: TextSpan(
                                                  //               text: "Ali G.  /",
                                                  //               style: TextStyle(
                                                  //                   fontFamily: 'Campton',
                                                  //                   color: Colors.black,
                                                  //                   fontSize: 16.sp,
                                                  //                   fontWeight:
                                                  //                       FontWeight.w700),

                                                  //               /*defining default style is optional */
                                                  //               children: <TextSpan>[
                                                  //                 TextSpan(
                                                  //                   text:
                                                  //                       ' Heart Valve Replacement Surgery\n 12/12/2023',
                                                  //                   style: TextStyle(
                                                  //                       fontFamily:
                                                  //                           'CamptonBookItalic',
                                                  //                       fontStyle:
                                                  //                           FontStyle.italic,
                                                  //                       color: Colors.black,
                                                  //                       fontSize: 16.sp,
                                                  //                       fontWeight:
                                                  //                           FontWeight.w500),
                                                  //                   recognizer:
                                                  //                       new TapGestureRecognizer()
                                                  //                         ..onTap = () {
                                                  //                           // Navigator.push(
                                                  //                           //   context,
                                                  //                           //   MaterialPageRoute(
                                                  //                           //       builder: (context) => SignUpView()),
                                                  //                           // );
                                                  //                         },
                                                  //                 ),
                                                  //               ],
                                                  //             ),
                                                  //           ),
                                                  //           SizedBox(
                                                  //             height: 28.h,
                                                  //           ),
                                                  //           Divider(
                                                  //             thickness: 1,
                                                  //             color: Color(0xff4CDB06),
                                                  //             // height: height,
                                                  //           ),
                                                  //         ],
                                                  //       ),
                                                  //     );
                                                  //   },
                                                  // ),
                                                  SizedBox(
                                                    height: 28.h,
                                                  ),
                                                ],
                                              ),
                                            )
                                          ]),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      // Container(
                      //   // width: ScreenUtil().screenWidth,
                      //   padding: EdgeInsets.only(
                      //       left: 18.w, right: 18.w, top: 5.w, bottom: 3.w),
                      //   color: Colors.white,
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //     children: [
                      //       Flexible(
                      //         child: Text(
                      //           "5 installments for your medical expenses for the cash price via",
                      //           style: TextStyle(
                      //               // letterSpacing: 0.9,
                      //               fontFamily: 'Campton',
                      //               color: Colors.black,
                      //               // letterSpacing: .5,
                      //               fontSize: 12.sp,
                      //               fontWeight: FontWeight.w400),
                      //         ),
                      //       ),
                      //       Image.asset(
                      //         "assets/images/aiixess.png",
                      //         height: 14.h,
                      //         width: 50.w,
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      // SizedBox(
                      //   height: 7.h,
                      // ),
                      // watch.productData?.freeShipping == "yes"
                      //     ? Container(
                      //         width: ScreenUtil().screenWidth,
                      //         padding: EdgeInsets.only(
                      //             left: 10.w,
                      //             right: 21.w,
                      //             top: 8.w,
                      //             bottom: 8.w),
                      //         color: const Color(0xff4CDB06),
                      //         child: Row(
                      //           mainAxisAlignment:
                      //               MainAxisAlignment.spaceBetween,
                      //           // crossAxisAlignment: CrossAxisAlignment.start,
                      //           children: [
                      //             Row(
                      //               children: [
                      //                 SvgPicture.asset(
                      //                   "assets/icons/box-02.svg",
                      //                 ),
                      //                 Text(
                      //                   "FREE SHIPPING",
                      //                   style: TextStyle(
                      //                       letterSpacing: 1.5,
                      //                       fontFamily: 'Campton',
                      //                       color: Colors.white,
                      //                       // letterSpacing: .5,
                      //                       fontSize: 10.sp,
                      //                       fontWeight: FontWeight.w700),
                      //                 ),
                      //               ],
                      //             ),
                      //             Text(
                      //               "Free shipping on orders over 100 ₺",
                      //               style: TextStyle(
                      //                   // letterSpacing: 0.9,
                      //                   // fontFamily: 'Campton',
                      //                   color: Colors.black,
                      //                   // letterSpacing: .5,
                      //                   fontSize: 13.sp,
                      //                   fontWeight: FontWeight.w500),
                      //             ),
                      //           ],
                      //         ),
                      //       )
                      //     : Container(),
                      Container(
                        padding: EdgeInsets.only(
                            left: 33.w, top: 19.w, bottom: 18.w, right: 27.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RichText(
                              text: TextSpan(
                                text: "${watch.productData?.salePrice}",
                                // "299,99 ₺",
                                style: TextStyle(
                                    // letterSpacing: 0.9,
                                    fontFamily: 'Campton',
                                    color: Colors.black,
                                    // letterSpacing: .5,
                                    fontSize: 30.sp,
                                    fontWeight: FontWeight.w600),

                                /*defining default style is optional */
                                children: <TextSpan>[
                                  TextSpan(
                                    text: '₺',
                                    style: GoogleFonts.inter(
                                      textStyle: TextStyle(
                                          // letterSpacing: 0.9,
                                          // fontFamily: 'Campton',
                                          color: Colors.black,
                                          // letterSpacing: .5,
                                          fontSize: 30.sp,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // Text(
                            // "${watch.productData?.salePrice}₺",
                            // // "299,99 ₺",
                            // style: TextStyle(
                            //     // letterSpacing: 0.9,
                            //     fontFamily: 'Campton',
                            //     color: Colors.black,
                            //     // letterSpacing: .5,
                            //     fontSize: 30.sp,
                            //     fontWeight: FontWeight.w600),
                            // ),
                            PrimaryButton(
                              height: 42.h,
                              width: 127.w,
                              // borderRadius: BorderRadius.circular(),
                              borderRadius: 15,
                              // width: ScreenUtil().screenWidth,
                              color: const Color(0xff4CDB06),
                              onTap: () {
                                read.AddToCart(
                                    context, watch.productData?.id.toString());
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(15.0))),
                                        contentPadding:
                                            const EdgeInsets.only(top: 0.0),
                                        content: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Stack(
                                              children: [
                                                Container(
                                                  width:
                                                      ScreenUtil().screenWidth,
                                                  decoration: const BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  15.0))),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15), // Image border
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
                                                Positioned(
                                                    top: 15,
                                                    right: 15,
                                                    // left: 0,
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        Navigator.pop(context);
                                                        // Navigator.push(
                                                        //   context,
                                                        //   MaterialPageRoute(
                                                        //       builder: (context) =>
                                                        //           AllOrderDetailView()),
                                                        // );
                                                        // Now using the context obtained from the builder
                                                      },
                                                      child: SvgPicture.asset(
                                                          "assets/icons/red_close.svg"),
                                                    )),
                                                Positioned(
                                                    top: 25,
                                                    right: 135,
                                                    // left: 0,
                                                    child: SvgPicture.asset(
                                                        "assets/icons/request.svg")),
                                                Positioned(
                                                  top: 80,
                                                  right: 85.w,
                                                  // left: 0,
                                                  child: Text(
                                                    "Successfully",
                                                    // textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        fontFamily: 'Campton',
                                                        color: Colors.black,
                                                        // letterSpacing: .5,
                                                        fontSize: 20.sp,
                                                        fontWeight:
                                                            FontWeight.w700),
                                                  ),
                                                )
                                              ],
                                            ),
                                            SizedBox(
                                              height: 38.h,
                                            ),
                                            Center(
                                              child: Text(
                                                "The product has been ",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontFamily: 'Campton',
                                                    color: Colors.black,
                                                    // letterSpacing: .5,
                                                    fontSize: 19.sp,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                            ),
                                            Center(
                                              child: Text(
                                                "added to the cart.",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontFamily: 'Campton',
                                                    color: Colors.black,
                                                    // letterSpacing: .5,
                                                    fontSize: 19.sp,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 30.h,
                                            ),
                                            Container(
                                              padding: EdgeInsets.only(
                                                  left: 18.0.w, right: 18.0.w),
                                              child: PrimaryButton(
                                                // borderColor: Colors.black,
                                                width: 352.w,
                                                height: 40.w,
                                                borderColor: black,
                                                borderRadius: 30,

                                                // color: Color(0xff4CDB06),
                                                // color: kDefaultActiveColor,
                                                onTap: () {
                                                  // Navigator.pop(context);
                                                  Navigator.push(
                                                    context,
                                                    SlidePageRoute(
                                                      page:
                                                          const MdShopHomePageView(),
                                                      direction:
                                                          SlideDirection.right,
                                                      delay: const Duration(
                                                          milliseconds: 5000),
                                                    ),
                                                    // MaterialPageRoute(
                                                    //     builder: (context) => ShopProductView()),
                                                  );
                                                  // Navigator.push(
                                                  //   context,
                                                  //   MaterialPageRoute(
                                                  //       builder: (context) =>
                                                  //           ShopProductView()),
                                                  // );
                                                },
                                                color: Colors.transparent,
                                                child: Text(
                                                  "Continue Shopping",
                                                  style: TextStyle(
                                                      fontFamily: 'Campton',
                                                      color: Colors.black,
                                                      // letterSpacing: .5,
                                                      fontSize: 16.sp,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 20.h,
                                            ),
                                            Container(
                                              padding: EdgeInsets.only(
                                                  left: 18.0.w, right: 18.0.w),
                                              child: PrimaryButton(
                                                // borderColor: Colors.black,
                                                width: 352.w,
                                                height: 40.w,

                                                borderRadius: 30,

                                                color: const Color(0xff4CDB06),
                                                // color: kDefaultActiveColor,
                                                onTap: () {
                                                  print(
                                                    watch.productData?.id
                                                        .toString(),
                                                  );
                                                  // return;
                                                  Navigator.pop(context);
                                                  Navigator.push(
                                                    context,
                                                    SlidePageRoute(
                                                      page: ShopCartScreenView(
                                                        id: watch
                                                            .productData?.id
                                                            .toString(),
                                                        // packageId:
                                                        //     widget.packageId,
                                                      ),
                                                      direction: SlideDirection
                                                          .right, // Specify the slide direction here
                                                      delay: const Duration(
                                                          milliseconds: 5000),
                                                    ),
                                                  );
                                                  // Navigator.push(ShopCartScreenView
                                                  //   context,
                                                  //   MaterialPageRoute(
                                                  //       builder: (context) =>
                                                  //           SignUpView()),
                                                  // );
                                                },
                                                child: Text(
                                                  "Go to Cart",
                                                  style: TextStyle(
                                                      fontFamily: 'Campton',
                                                      color: Colors.black,
                                                      // letterSpacing: .5,
                                                      fontSize: 16.sp,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 30.h,
                                            )
                                          ],
                                        ),
                                      );
                                    });
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(builder: (context) => LoginOtoView()),
                                // );
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(builder: (context) => LoginScreenView()),
                                // );
                              },
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  SvgPicture.asset(
                                    "assets/icons/add_to_cart.svg",
                                  ),
                                  Text(
                                    "Add to Cart",
                                    style: TextStyle(
                                        color: Colors.black,
                                        // letterSpacing: .5,
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
      ),
    );
  }
}

Widget _circle() {
  return Container(
    height: 100,
    width: 100,
    decoration: const BoxDecoration(
      shape: BoxShape.circle,
      color: Color(0xff4CDB06),
    ),
  );
}
