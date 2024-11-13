import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:md_health/Screens/address/view/address_view.dart';
import 'package:md_health/Screens/auth/view/login_view.dart';
import 'package:md_health/Screens/bottom_navigation/controller/bottom_controller.dart';
import 'package:md_health/Screens/favourt/view/favt_list.dart';
import 'package:md_health/Screens/health/home/controller/home_controller.dart';
import 'package:md_health/Screens/message/view/message_view.dart';
import 'package:md_health/Screens/my_wallet/view/my_wallet_view.dart';
import 'package:md_health/Screens/order/view/order_view.dart';
import 'package:md_health/Screens/health/packages/view/packages_view.dart';
import 'package:md_health/Screens/profile/view/profile_view.dart';
import 'package:md_health/Screens/reports/view/view/report_list_view.dart';
import 'package:md_health/Screens/reservation/view/reservation_view.dart';
import 'package:md_health/constants/styles/colors.dart';
import 'package:md_health/test_widget.dart';
import 'package:md_health/utils/utils.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final readMain = context.read<NewMainScreenController>();
    final watch = context.watch<NewMainScreenController>();
    final readHome = context.read<HomeViewController>();
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Drawer(
              backgroundColor: Colors.transparent,
              child: Container(
                padding: const EdgeInsets.only(top: 10, right: 10, left: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30),
                      bottomRight: Radius.circular(30)),
                  color: Colors.white,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'MD',
                                  style: TextStyle(
                                    fontFamily: 'Campton',
                                    fontSize: 20.sp,
                                    color: Colors.black,
                                    letterSpacing: -1,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                                TextSpan(
                                  text: 'health',
                                  style: TextStyle(
                                    fontFamily: 'Campton',
                                    fontSize: 20.sp,
                                    color: Colors.black,
                                    letterSpacing: -1,
                                    fontWeight: FontWeight.w400,
                                  ),
                                )
                              ],
                            ),
                          ),
                          GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: SvgPicture.asset(
                                'assets/icons/Close-Square.svg',
                                height: 25.h,
                                width: 25.w,
                              ))
                        ],
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        DrawerItem(
                          onTap: () async {
                            Navigator.pop(context);

                            SharedPreferences pref =
                                await SharedPreferences.getInstance();
                            if (pref.getString("status") == "guestLoggedIn") {
                              Utils.showLogdinDialog(
                                  context, "Please Login to continue");
                              return;
                            }
                            // readMain.onNavigation(
                            //     0, const ProfileView(), context);

                            Navigator.push(
                              context,
                              SlidePageRoute(
                                page: ProfileView(),
                                direction: SlideDirection
                                    .right, // Specify the slide direction here
                                delay: Duration(milliseconds: 5000),
                              ),
                              // MaterialPageRoute(
                              //     builder: (context) => ProfileView()
                            );
                          },
                          imgSrc: 'assets/icons/gg_profile.svg',
                          title: 'Profile',
                        ),
                        DrawerItem(
                            onTap: () async {
                              SharedPreferences pref =
                                  await SharedPreferences.getInstance();
                              if (pref.getString("status") == "guestLoggedIn") {
                                Utils.showLogdinDialog(
                                    context, "Please Login to continue");
                                return;
                              }
                              Navigator.push(
                                context,
                                SlidePageRoute(
                                  page: AddressView(),
                                  direction: SlideDirection.right,
                                  delay: Duration(milliseconds: 5000),
                                ),
                                // MaterialPageRoute(
                                //     builder: (context) => ProfileView()
                              );
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //       builder: (context) => PackageSView()),
                              // );
                            },
                            imgSrc: 'assets/icons/addresss.svg',
                            title: 'Address'),
                        ////////////////////////////////////
                        // DrawerItem(
                        //   onTap: () async {
                        //     Navigator.pop(context);

                        //     SharedPreferences pref =
                        //         await SharedPreferences.getInstance();
                        //     if (pref.getString("status") == "guestLoggedIn") {
                        //       Utils.showLogdinDialog(
                        //           context, "Please Login to continue");
                        //       return;
                        //     }
                        //     // readMain.onNavigation(
                        //     //     0, const ProfileView(), context);

                        //     Navigator.push(
                        //       context,
                        //       SlidePageRoute(
                        //         page: AddressView(),
                        //         direction: SlideDirection
                        //             .right, // Specify the slide direction here
                        //         delay: Duration(milliseconds: 5000),
                        //       ),
                        //       // MaterialPageRoute(
                        //       //     builder: (context) => ProfileView()
                        //     );
                        //   },
                        //   // onTap: () async {
                        //   //   Navigator.pop(context);

                        //   //   SharedPreferences pref =
                        //   //       await SharedPreferences.getInstance();
                        //   //   if (pref.getString("status") == "guestLoggedIn") {
                        //   //     Utils.showLogdinDialog(
                        //   //         context, "Please Login to continue");
                        //   //     return;
                        //   //   }
                        //   //   // readMain.onNavigation(
                        //   //   //     0, const ProfileView(), context);

                        //   //   Navigator.push(
                        //   //     context,
                        //   //     SlidePageRoute(
                        //   //       page: AddressView(),
                        //   //       direction: SlideDirection
                        //   //           .right, // Specify the slide direction here
                        //   //       delay: Duration(milliseconds: 5000),
                        //   //     ),
                        //   //     // MaterialPageRoute(
                        //   //     //     builder: (context) => ProfileView()
                        //   //   );
                        //   // },
                        //   // imgSrc: 'assets/icons/address_01.svg',
                        //   imgSrc: 'assets/icons/addresss.svg',
                        //   title: 'Address',
                        // ),
                        ///////////////////////////////////
                        DrawerItem(
                            onTap: () async {
                              SharedPreferences pref =
                                  await SharedPreferences.getInstance();
                              if (pref.getString("status") == "guestLoggedIn") {
                                Utils.showLogdinDialog(
                                    context, "Please Login to continue");
                                return;
                              }
                              Navigator.push(
                                context,
                                SlidePageRoute(
                                  page: PackageSView(),
                                  direction: SlideDirection.right,
                                  delay: Duration(milliseconds: 5000),
                                ),
                                // MaterialPageRoute(
                                //     builder: (context) => ProfileView()
                              );
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //       builder: (context) => PackageSView()),
                              // );
                            },
                            imgSrc: 'assets/icons/lucide_package-open.svg',
                            title: 'Packages'),
                        DrawerItem(
                            onTap: () async {
                              SharedPreferences pref =
                                  await SharedPreferences.getInstance();
                              if (pref.getString("status") == "guestLoggedIn") {
                                Utils.showLogdinDialog(
                                    context, "Please Login to continue");
                                return;
                              }
                              // Navigator.push(
                              //   context,
                              //   SlidePageRoute(
                              //     page: ReservationView(),
                              //     direction: SlideDirection.right,
                              //     delay: Duration(milliseconds: 5000),
                              //   ),
                              //   // MaterialPageRoute(
                              //   //     builder: (context) => ProfileView()
                              // );
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //       builder: (context) => ReservationView()),
                              // );
                            },
                            imgSrc:
                                'assets/icons/fluent-mdl2_reservation-orders.svg',
                            title: 'Reservations'),
                        DrawerItem(
                            onTap: () async {
                              SharedPreferences pref =
                                  await SharedPreferences.getInstance();
                              if (pref.getString("status") == "guestLoggedIn") {
                                Utils.showLogdinDialog(
                                    context, "Please Login to continue");
                                return;
                              }
                              Navigator.push(
                                context,
                                SlidePageRoute(
                                  page: MessageListView(),
                                  direction: SlideDirection.right,
                                  delay: Duration(milliseconds: 5000),
                                ),
                                // MaterialPageRoute(
                                //     builder: (context) => ProfileView()
                              );
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //       builder: (context) => MessageListView()),
                              // );
                            },
                            imgSrc: readHome.readStatus == "yes"
                                ? 'assets/icons/Vector.svg' // add new msg svg here.
                                : 'assets/icons/iconoir_message.svg',
                            title: readHome.readStatus == "yes"
                                ? 'Messages New'
                                : 'Messages'),
                        DrawerItem(
                            onTap: () async {
                              SharedPreferences pref =
                                  await SharedPreferences.getInstance();
                              if (pref.getString("status") == "guestLoggedIn") {
                                Utils.showLogdinDialog(
                                    context, "Please Login to continue");
                                return;
                              }
                              Navigator.push(
                                context,
                                SlidePageRoute(
                                  page: OrderView(),
                                  direction: SlideDirection.right,
                                  delay: Duration(milliseconds: 5000),
                                ),
                              );
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //       builder: (context) => OrderView()),
                              // );
                            },
                            imgSrc:
                                'assets/icons/mdi_order-bool-descending.svg',
                            title: 'Orders'),
                        DrawerItem(
                            onTap: () async {
                              SharedPreferences pref =
                                  await SharedPreferences.getInstance();
                              if (pref.getString("status") == "guestLoggedIn") {
                                Utils.showLogdinDialog(
                                    context, "Please Login to continue");
                                return;
                              }
                              Navigator.push(
                                context,
                                SlidePageRoute(
                                  page: MyWalletScreenView(),
                                  direction: SlideDirection.right,
                                  delay: Duration(milliseconds: 5000),
                                ),
                              );
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //       builder: (context) => MyWalletScreenView()),
                              // );
                            },
                            imgSrc: 'assets/icons/solar_wallet-linear.svg',
                            title: 'Wallet'),
                        DrawerItem(
                            onTap: () async {
                              SharedPreferences pref =
                                  await SharedPreferences.getInstance();
                              if (pref.getString("status") == "guestLoggedIn") {
                                Utils.showLogdinDialog(
                                    context, "Please Login to continue");
                                return;
                              }
                              Navigator.push(
                                context,
                                SlidePageRoute(
                                  page: ReportView(),
                                  direction: SlideDirection.right,
                                  delay: Duration(milliseconds: 5000),
                                ),
                              );
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //       builder: (context) => ReportView()),
                              // );
                            },
                            imgSrc: 'assets/icons/Vector.svg',
                            // mdi_book-favorite-outline.svg',
                            title: 'Reports'),
                        DrawerItem(
                            onTap: () async {
                              SharedPreferences pref =
                                  await SharedPreferences.getInstance();
                              if (pref.getString("status") == "guestLoggedIn") {
                                Utils.showLogdinDialog(
                                    context, "Please Login to continue");
                                return;
                              }
                              Navigator.push(
                                context,
                                SlidePageRoute(
                                  page: FavourtListView(),
                                  direction: SlideDirection.right,
                                  delay: Duration(milliseconds: 5000),
                                ),
                              );
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //       builder: (context) => FavourtListView()),
                              // );
                            },
                            imgSrc:
                                'assets/icons/mdi_book-favorite-outline.svg',
                            title: 'Favorites'),
                      ],
                    ),
                    GestureDetector(
                      onTap: () async {
                        SharedPreferences pref =
                            await SharedPreferences.getInstance();
                        pref.remove("successToken");
                        pref.clear();

                        Navigator.pushReplacement(
                          context,
                          SlidePageRoute(
                            page: LoginScreenView(),
                            direction: SlideDirection.right,
                            delay: Duration(milliseconds: 5000),
                          ),
                        );
                        // Navigator.pushReplacement(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => LoginScreenView()));
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 20,
                          // right: 20,
                          // bottom: 15,
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset(
                                  'assets/icons/Group_1.svg',
                                  height: 18.h,
                                  width: 18.w,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'Logout',
                                  style: TextStyle(
                                      color: Color(0xff000000),
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'Campton',
                                      fontSize: 19.sp),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 30.h,
                            )
                          ],
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Divider(
                            color: kDefaultActiveColor,
                            indent: 5,
                            endIndent: 5,
                            thickness: 1),
                        Container(
                          padding: EdgeInsets.only(
                              right: 15.w, left: 15.w, bottom: 15.w, top: 10.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichText(
                                text: TextSpan(
                                  style: TextStyle(
                                      fontFamily: 'Campton',
                                      fontSize: 15.sp,
                                      color: kDefaultActiveColor,
                                      fontWeight: FontWeight.w400,
                                      letterSpacing: -1),
                                  children: [
                                    TextSpan(
                                        text: 'MD',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                    TextSpan(
                                      text: 'health',
                                    )
                                  ],
                                ),
                              ),
                              Text(
                                'Version 1.0',
                                style: TextStyle(
                                    fontFamily: 'Campton',
                                    fontSize: 14.sp,
                                    color: kDefaultActiveColor,
                                    fontWeight: FontWeight.w400,
                                    letterSpacing: -0.5),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class DrawerItem extends StatelessWidget {
  final String? imgSrc;
  final String? title;
  final void Function() onTap;

  const DrawerItem(
      {super.key,
      required this.imgSrc,
      required this.title,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 15),
        child: Column(
          children: [
            Row(
              children: [
                SvgPicture.asset(
                  imgSrc!,
                  height: 15.h,
                  width: 15.w,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  title!,
                  style: TextStyle(
                      color: Color(0xff000000),
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Campton',
                      fontSize: 19.sp),
                ),
              ],
            ),
            SizedBox(
              height: 15.h,
            ),
            SvgPicture.asset('assets/icons/Vector_8.svg')
          ],
        ),
      ),
    );
  }
}
