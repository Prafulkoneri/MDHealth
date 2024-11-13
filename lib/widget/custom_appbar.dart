import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:md_health/Screens/bottom_navigation/view/bottom_view.dart';
import 'package:md_health/Screens/health/home/controller/home_controller.dart';
import 'package:md_health/Screens/notification/view/notification_view.dart';
import 'package:md_health/Screens/shop/md_shop_home_page/controller/md_shop_home_page_controller.dart';
import 'package:md_health/Screens/shop/shop_cart/view/cart_view.dart';
import 'package:provider/provider.dart';
import 'package:badges/badges.dart' as badges;

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  CustomAppBar({
    super.key,
    this.mdTitle,
    this.drawerTitleFontWeight, // Add the new parameter
    this.hasMdTitle = true,
    this.hasHiText = false,
    this.drawerTitle,
    this.hasBackButton = false,
    this.onBackPressed,
    this.isMdBookingAppBar = false,
    this.hasCartIcon = false,
    this.drawerStyle,
    this.drawerTitleColor,
  });

  @override
  final Size preferredSize = Size.fromHeight(130.h);
  final String? mdTitle;
  // final TextStyle? drawerStyle;
  final FontWeight? drawerTitleFontWeight;
  final Widget? drawerStyle;
  final bool hasBackButton;
  final void Function()? onBackPressed;
  final bool hasHiText;
  final bool hasMdTitle;
  final String? drawerTitle;
  final Color? drawerTitleColor;
  final bool isMdBookingAppBar;
  final bool hasCartIcon;

  @override
  Widget build(BuildContext context) {
    @override
    void initState() {
      SchedulerBinding.instance.addPostFrameCallback((_) {
        context.read<HomeViewController>().initState(context, "");
        context.read<MdShopHomePageController>().initState(context);
      });
    }

    final watch = context.watch<HomeViewController>();
    final read = context.read<HomeViewController>();
    final watchShop = context.read<MdShopHomePageController>();
    return PreferredSize(
      preferredSize: preferredSize,
      child: Stack(children: [
        Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/layer_blur.png'),
                  fit: BoxFit.cover)),
        ),
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () async {
                    final ScaffoldState? scaffoldState =
                        Scaffold.maybeOf(context);
                    scaffoldState?.openDrawer();
                    await read.getMessageStatus(context);
                  },
                  child: Container(
                    padding: const EdgeInsets.only(top: 50),
                    // color: Colors.pink,
                    child: Container(
                      height: 50.h,
                      // alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Row(
                          // mainAxisAlignment: MainAxisAlignment.,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SvgPicture.asset(
                              'assets/icons/3_lines.svg',
                              alignment: Alignment.topRight,
                              height: 20.h,
                              width: 30.w,
                            ),
                            hasCartIcon
                                ? Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      SvgPicture.asset(
                                        'assets/icons/Group_19.svg',
                                        height: 17.h,
                                        width: 27.w,
                                        color: Colors.transparent,
                                        alignment: Alignment.topRight,
                                      ),
                                      SizedBox(
                                        width: 3.w,
                                      ),
                                      Text(
                                        '(1)',
                                        style: TextStyle(
                                            color: Colors.transparent,
                                            fontFamily: 'Campton',
                                            letterSpacing: -1,
                                            fontSize: 15.sp,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ],
                                  )
                                : SizedBox(),
                            hasCartIcon
                                ? SizedBox(
                                    width: 10.w,
                                  )
                                : SizedBox(),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 45.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        // color: Colors.red,
                        child: Image.asset(
                          'assets/images/katman_1.png',
                          height: 33.h,
                          width: 43.42.w,
                          // fit: BoxFit.fitHeight,/
                        ),
                      ),
                      !isMdBookingAppBar
                          ? hasMdTitle
                              ? RichText(
                                  text: TextSpan(
                                    text: 'MD',
                                    style: TextStyle(
                                        fontFamily: 'Campton',
                                        color: Colors.white,
                                        fontSize: 22.sp,
                                        fontWeight: FontWeight.w700),
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: mdTitle ?? 'health',
                                        style: TextStyle(
                                          fontFamily: 'Campton',
                                          color: Colors.white,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 22.sp,
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              : Container()
                          : Column(
                              children: [
                                Text(
                                  'powered by',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Campton',
                                      fontSize: 14.sp,
                                      letterSpacing: -1,
                                      fontWeight: FontWeight.w400),
                                ),
                                RichText(
                                    text: TextSpan(
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: 'Campton',
                                            fontSize: 22.sp,
                                            letterSpacing: -1,
                                            fontWeight: FontWeight.w400),
                                        children: [
                                      const TextSpan(
                                          text: 'MD',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w700)),
                                      const TextSpan(text: 'booking')
                                    ])),
                              ],
                            ),
                      const SizedBox(
                        height: 10,
                      ),
                      hasHiText
                          ? RichText(
                              text: TextSpan(
                                text: 'Hi ',
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontFamily: 'Campton',
                                  color: Colors.white,
                                  fontSize: 12.sp,
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: '${watch.fullName ?? ""}',
                                    style: TextStyle(
                                      letterSpacing: -1,
                                      fontFamily: 'Campton',
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white,
                                      fontSize: 12.sp,
                                    ),
                                  )
                                ],
                              ),
                            )
                          : drawerTitle != null
                              ? Container(
                                  padding: EdgeInsets.only(top: 20.w),
                                  child: drawerStyle ??
                                      Text(
                                        drawerTitle!,
                                        style: TextStyle(
                                          fontFamily: 'Campton',
                                          color:
                                              drawerTitleColor ?? Colors.white,
                                          letterSpacing: -1,
                                          fontSize: 19.sp,
                                          fontWeight: drawerTitleFontWeight ??
                                              FontWeight
                                                  .w400, // Use the dynamic fontWeight
                                        ),
                                      ),
                                )
                              : Container(),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 30, top: 50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      hasCartIcon
                          ? GestureDetector(
                              onTap: () {
                                print("000000000000000987");
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const ShopCartScreenView()),
                                );
                              },
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  SvgPicture.asset(
                                    'assets/icons/Group_19.svg',
                                    height: 17.h,
                                    width: 27.w,
                                    alignment: Alignment.topRight,
                                  ),
                                  SizedBox(
                                    width: 3.w,
                                  ),
                                  Text(
                                    '(${watchShop.cartCount ?? 0})',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'Campton',
                                        letterSpacing: -1,
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ],
                              ),
                            )
                          : SizedBox(),
                      hasCartIcon
                          ? SizedBox(
                              width: 10.w,
                            )
                          : SizedBox(),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const NotificationView()),
                          );
                        },
                        child: Container(
                          color: Colors.transparent,
                          padding: EdgeInsets.only(left: 2.w, right: 2.w),
                          child: Column(
                            children: [
                              watch.seenStatus != 'inactive'
                                  ? Container(
                                      child: SvgPicture.asset(
                                        'assets/icons/notification.svg',
                                        color: Colors.green,
                                        // 'assets/icons/notification.svg',
                                        // width: 14.w,
                                        // height: 13.h,
                                      ),
                                    )
                                  : badges.Badge(
                                      // badgeContent: Text(
                                      //   watch.notificationCount.toString() ?? '',
                                      //   // "",
                                      //   style: TextStyle(
                                      //       color: Colors.white,
                                      //       fontSize: 11.sp,
                                      //       fontWeight: FontWeight.w400),
                                      // ),
                                      badgeStyle: const badges.BadgeStyle(
                                          badgeColor: Colors.green),
                                      position: badges.BadgePosition.topEnd(
                                          top: -4, end: -1),
                                      showBadge: true,
                                      child: SizedBox(
                                        height: 20.w,
                                        width: 21.w,
                                        child: SvgPicture.asset(
                                          'assets/icons/notification.svg',
                                          color: Colors.green,
                                          // 'assets/icons/notification.svg',
                                          // width: 14.w,
                                          // height: 13.h,
                                        ),
                                        //  SvgPicture.asset(
                                        //   "assets/icons/cart.svg",
                                        // ),
                                      ),
                                    ),
                              SizedBox(
                                height: 5.w,
                              ),
                            ],
                          ),
                        ),
                      ),
                      // GestureDetector(
                      //   onTap: () {
                      //     print("hjfgjhfdhghjgfhjgf");
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //       builder: (context) => const NotificationView()),
                      // );
                      //   },
                      //   child: SvgPicture.asset(
                      //     'assets/icons/box.svg',
                      //     alignment: Alignment.topRight,
                      //     height: 20.h,
                      //     width: 30.w,
                      //   ),
                      // ),
                    ],
                  ),
                )
              ],
            ),
            hasBackButton
                ? GestureDetector(
                    onTap: onBackPressed ??
                        () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => NewMainScreenView(),
                            ),
                          );
                        },
                    child: Container(
                      padding: EdgeInsets.only(
                        left: 18.w,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'assets/icons/backicon.svg',
                            alignment: Alignment.topRight,
                          ),
                          Text(
                            "Back",
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Campton',
                                // letterSpacing: 5.5,
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                    ),
                  )
                : Container(),
          ],
        ),
      ]),
    );
  }
}
