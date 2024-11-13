import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_share_me/flutter_share_me.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lecle_social_share/lecle_social_share.dart';
import 'package:md_health/Screens/my_wallet/controller/my_wallet_controller.dart';
import 'package:md_health/Screens/my_wallet/view/my_wallet_view.dart';
import 'package:md_health/constants/styles/colors.dart';
import 'package:md_health/test_widget.dart';
import 'package:md_health/utils/utils.dart';
import 'package:md_health/widget/base_screen.dart';
import 'package:md_health/widget/buttons.dart';
import 'package:md_health/widget/custom_appbar.dart';
import 'package:md_health/widget/text_field.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

enum Share {
  facebook,
  messenger,
  twitter,
  whatsapp,
  whatsapp_personal,
  whatsapp_business,
  share_system,
  share_instagram,
  share_telegram
}

class InviteFriendsView extends StatefulWidget {
  final String? email;
  final String? sendLink;

  const InviteFriendsView({super.key, this.email, this.sendLink});

  @override
  State<InviteFriendsView> createState() => _InviteFriendsViewState();
}

class _InviteFriendsViewState extends State<InviteFriendsView> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      context.read<MyWalletScreenController>().initState(context);
    });
  }

  _launchWhatsApp(String link) async {
    String whatsappUrl = "whatsapp://send?text=$link";
    await canLaunch(whatsappUrl)
        ? launch(whatsappUrl)
        : ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("WhatsApp is not installed on your device"),
            ),
          );
  }
/////////////////////////////////////////////////

  _launchTelegram(String link) async {
    String telegramUrl = "https://t.me/share/url?url=$link";
    await canLaunch(telegramUrl)
        ? launch(telegramUrl)
        : ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Telegram is not installed on your device"),
            ),
          );
  }

  @override
  Widget build(BuildContext context) {
    final read = context.read<MyWalletScreenController>();
    final watch = context.watch<MyWalletScreenController>();
    return Builder(builder: (context) {
      return BaseScreen(
        onWillPop: () async {
          Navigator.push(
            context,
            SlidePageRoute(
              page: MyWalletScreenView(
                  // packageId:
                  //     widget.packageId,
                  ),
              direction:
                  SlideDirection.right, // Specify the slide direction here
              delay: Duration(milliseconds: 5000),
            ),
            // MaterialPageRoute(builder: (context) => InviteFriendsView()),
          );

          return false;
        },
        backgroundColor: const Color(0xffFBFBFB),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(130.w),
          child: CustomAppBar(
            onBackPressed: () {
              Navigator.push(
                context,
                SlidePageRoute(
                  page: MyWalletScreenView(
                      // packageId:
                      //     widget.packageId,
                      ),
                  direction:
                      SlideDirection.right, // Specify the slide direction here
                  delay: Duration(milliseconds: 5000),
                ),
                // MaterialPageRoute(builder: (context) => InviteFriendsView()),
              );
            },
            hasBackButton: true,
            // hasBackButton: ,
            hasMdTitle: false,
            drawerTitle: "Wallet",
          ),
        ),
        content: Builder(builder: (context) {
          return Container(
            padding: EdgeInsets.only(left: 25.w, right: 17.w),
            child: Column(children: [
              SizedBox(
                height: 47.w,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                      height: 70,
                      width: 70,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(color: Color(0xff4CDB06), width: 3),
                      ),
                      child: Center(
                        child: Text(
                          "${watch.networkCount}",
                          style: TextStyle(
                            fontFamily: 'Campton',
                            fontSize: 21.sp,
                            color: black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      )),
                  Container(
                      height: 70,
                      width: 70,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(color: Color(0xffF3771D), width: 3),
                      ),
                      child: Center(
                        child: Text(
                          "${watch.pendingInvite}",
                          style: TextStyle(
                            fontFamily: 'Campton',
                            fontSize: 21.sp,
                            color: Color(0xffF3771D),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      )),
                  Container(
                      height: 70,
                      width: 70,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(color: Color(0xffF55C5C), width: 3),
                      ),
                      child: Center(
                        child: Text(
                          "${watch.leftinviteCount}",
                          style: TextStyle(
                            fontFamily: 'Campton',
                            fontSize: 21.sp,
                            color: Color(0xffF55C5C),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      )),
                ],
              ),
              SizedBox(
                height: 8.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Center(
                    child: Text(
                      "Your Network",
                      style: TextStyle(
                        fontFamily: 'Campton',
                        fontSize: 14.sp,
                        color: black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      "Pending Invite",
                      style: TextStyle(
                        fontFamily: 'Campton',
                        fontSize: 14.sp,
                        color: black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      "Invites Left",
                      style: TextStyle(
                        fontFamily: 'Campton',
                        fontSize: 14.sp,
                        color: black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 54.h,
              ),
              Center(
                child: Text(
                  "*You can invite up to 10 friends monthly.",
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontFamily: 'Campton',
                    fontSize: 14.sp,
                    color: Color(0xffF31D1D),
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              SizedBox(
                height: 40.h,
              ),
              Center(
                child: Text(
                  "Your Invite URL",
                  style: TextStyle(
                    // fontStyle: FontStyle.italic,
                    fontFamily: 'Campton',
                    fontSize: 20.sp,
                    color: Color(0xff4CDB06),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(
                height: 12.h,
              ),
              GestureDetector(
                onTap: () async {
                  print("object");
                  String url = Uri.encodeFull(watch.invitationLink.toString());
                  if (await canLaunch(url)) {
                    await launch(url);
                  } else {
                    throw 'Could not launch $url';
                  }
                },
                child: Text(
                  "${watch.invitationLink}",
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontFamily: 'Campton',
                    fontSize: 16.sp,
                    color: black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(
                height: 41.h,
              ),
              Text(
                "Share With",
                style: TextStyle(
                  // fontStyle: FontStyle.italic,
                  fontFamily: 'Campton',
                  fontSize: 20.sp,
                  color: Color(0xff4CDB06),
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 27.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: () {
                      if (watch.invitationLink != null) {
                        _launchWhatsApp(watch.invitationLink!);
                      }
                    },
                    child: Center(
                      child: SvgPicture.asset(
                        "assets/icons/whatsapp.svg",
                        width: 21.w,
                        height: 21.h,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      if (watch.invitationLink != null) {
                        _launchTelegram(watch.invitationLink!);
                      }
                    },
                    child: Center(
                      child: SvgPicture.asset(
                        "assets/icons/Vector (8).svg",
                        width: 21.h,
                        height: 21.h,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      // Copy to clipboard when SVG is tapped
                      if (watch.invitationLink != null) {
                        FlutterClipboard.copy(watch.invitationLink!)
                            .then((value) {
                          // Show a snackbar or any other feedback
                          Utils.showPrimarySnackbar(context, "Link Copied",
                              type: SnackType.success);
                        });
                      }
                    },
                    child: Center(
                      child: SvgPicture.asset(
                        "assets/icons/copy_.svg",
                        width: 21.w,
                        height: 21.h,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Center(
                    child: Text(
                      "WhatsApp",
                      style: TextStyle(
                        fontFamily: 'Campton',
                        fontSize: 13.sp,
                        color: black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => onButtonTap(Share.whatsapp_personal),
                    child: Center(
                      child: Text(
                        "Telegram",
                        style: TextStyle(
                          fontFamily: 'Campton',
                          fontSize: 13.sp,
                          color: black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      "Copy Link",
                      style: TextStyle(
                        fontFamily: 'Campton',
                        fontSize: 13.sp,
                        color: black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 54.h,
              ),
              Center(
                child: Text(
                  "Invite Friends",
                  style: TextStyle(
                    fontFamily: 'Campton',
                    fontSize: 20.sp,
                    color: black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: 17.0.w, top: 15.w, right: 17.w, bottom: 15.w),
                child: PrimaryInformationTextFormField(
                  controller: watch.emailIdController,
                  // color: Colors.red,
                  // width: 48.w,
                  // titleHeader: "*Patient Contact Number",
                  hintText: "E - mail",
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: 17.0.w, top: 15.w, right: 17.w, bottom: 15.w),
                child: PrimaryInformationTextFormField(
                  controller: watch.twoemailIdController,
                  // color: Colors.red,
                  // width: 48.w,
                  // titleHeader: "*Patient Contact Number",
                  hintText: "E - mail",
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: 17.0.w, top: 15.w, right: 17.w, bottom: 15.w),
                child: PrimaryInformationTextFormField(
                  controller: watch.threeemailIdController,
                  // color: Colors.red,
                  // width: 48.w,
                  // titleHeader: "*Patient Contact Number",
                  hintText: "E - mail",
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: 17.0.w, top: 15.w, right: 17.w, bottom: 15.w),
                child: PrimaryInformationTextFormField(
                  controller: watch.fouremailIdController,
                  // color: Colors.red,
                  // width: 48.w,
                  // titleHeader: "*Patient Contact Number",
                  hintText: "E - mail",
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: 17.0.w, top: 15.w, right: 17.w, bottom: 15.w),
                child: PrimaryInformationTextFormField(
                  controller: watch.fiveemailIdController,
                  // color: Colors.red,
                  // width: 48.w,
                  // titleHeader: "*Patient Contact Number",
                  hintText: "E - mail",
                ),
              ),
              PrimaryButton(
                width: 300.w,
                height: 45.w,
                borderRadius: 30,
                color: Colors.black,
                onTap: () {
                  List<String> emailList = [
                    watch.emailIdController.text,
                    watch.twoemailIdController.text,
                    watch.threeemailIdController.text,
                    watch.fouremailIdController.text,
                    watch.fiveemailIdController.text,
                  ];

                  // Check for duplicates
                  Set<String> emailSet = emailList.toSet();
                  if (emailSet.length < emailList.length) {
                    Utils.showPrimarySnackbar(
                      context,
                      'Duplicate email IDs found. Please ensure all email IDs are unique.',
                      type: SnackType.error,
                    );
                  } else if (emailList.any((email) => email.isEmpty)) {
                    Utils.showPrimarySnackbar(
                      context,
                      'Please enter all email IDs.',
                      type: SnackType.error,
                    );
                  } else if (watch.invitationLink == null ||
                      watch.invitationLink!.isEmpty) {
                    Utils.showPrimarySnackbar(
                      context,
                      'Invitation link is missing.',
                      type: SnackType.error,
                    );
                  } else {
                    // Proceed with the invite request
                    read.sendInvite(
                      context,
                      emailList,

                      watch
                          .invitationLink, // Safe to use '!' since we checked for null
                    );
                  }
                },
                child: Text(
                  "Send Invite Request",
                  style: TextStyle(
                      color: Color(0xff4CDB06),
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600),
                ),
              ),

              // PrimaryButton(
              //   // borderColor: Colors.black,
              //   width: 300.w,
              //   height: 45.w,

              //   borderRadius: 30,

              //   color: Colors.black,
              //   // color: kDefaultActiveColor,
              //   onTap: () {
              //     List<String> emailList = [
              //       watch.emailIdController.text,
              //       watch.twoemailIdController.text,
              //       watch.threeemailIdController.text,
              //       watch.fouremailIdController.text,
              //       watch.fiveemailIdController.text,
              //     ];

              //     // Check for duplicates
              //     Set<String> emailSet = emailList.toSet();
              //     if (emailSet.length < emailList.length) {
              //       Utils.showPrimarySnackbar(
              //         context,
              //         'Duplicate email IDs found. Please ensure all email IDs are unique.',
              //         type: SnackType.error,
              //       );
              //     } else if (emailList.any((email) => email.isEmpty)) {
              //       Utils.showPrimarySnackbar(
              //         context,
              //         'Please enter all email IDs.',
              //         type: SnackType.error,
              //       );
              //     } else {
              //       // Proceed with the invite request
              //       read.sendInvite(
              //         context,
              //         emailList,
              //         // watch.twoemailIdController,
              //         // watch.threeemailIdController,
              //         // watch.fouremailIdController,
              //         // watch.fiveemailIdController,
              //         watch.invitationLink,
              //       );
              //     }
              //   },

              //   //   if (watch.emailIdController.text.isEmpty) {
              //   //     // Show error message for empty email
              //   //     Utils.showPrimarySnackbar(
              //   //       context,
              //   //       'Please enter email ID.',
              //   //       type: SnackType.error,
              //   //     );
              //   //   } else {
              //   //     // Proceed with the invite request
              //   //     read.sendInvite(
              //   //       context,
              //   //       watch.emailIdController,
              //   //       watch.invitationLink,
              //   //     );
              //   //   }
              //   // },
              //   child: Text(
              //     "Send Invite Request",
              //     style: TextStyle(
              //         color: Color(0xff4CDB06),
              //         // letterSpacing: .5,
              //         fontSize: 16.sp,
              //         fontWeight: FontWeight.w600),
              //   ),
              // ),
              SizedBox(
                height: 100.h,
              ),
            ]),
          );
        }),
      );
    });
  }
}

Future<void> onButtonTap(Share share) async {
  String msg =
      'Flutter share is great!!\n Check out full example at https://pub.dev/packages/flutter_share_me';
  String url = 'https://pub.dev/packages/flutter_share_me';

  String? response;
  final FlutterShareMe flutterShareMe = FlutterShareMe();
  switch (share) {
    case Share.facebook:
      response = await flutterShareMe.shareToFacebook(url: url, msg: msg);
      break;
    case Share.messenger:
      response = await flutterShareMe.shareToMessenger(url: url, msg: msg);
      break;
    case Share.twitter:
      response = await flutterShareMe.shareToTwitter(url: url, msg: msg);
      break;
    case Share.whatsapp:
    // if (file != null) {
    //   response = await flutterShareMe.shareToWhatsApp(
    //       imagePath: file!.path,
    //       fileType: videoEnable ? FileType.video : FileType.image);
    // } else {
    //   response = await flutterShareMe.shareToWhatsApp(msg: msg);
    // }
    // break;
    case Share.whatsapp_business:
      response = await flutterShareMe.shareToWhatsApp(msg: msg);
      break;
    case Share.share_system:
      response = await flutterShareMe.shareToSystem(msg: msg);
      break;
    case Share.whatsapp_personal:
      response = await flutterShareMe.shareWhatsAppPersonalMessage(
          message: msg, phoneNumber: 'phone-number-with-country-code');
      break;
    case Share.share_instagram:
      // response = await flutterShareMe.shareToInstagram(
      //     filePath: file!.path,
      //     fileType: videoEnable ? FileType.video : FileType.image);
      break;
    case Share.share_telegram:
      response = await flutterShareMe.shareToTelegram(msg: msg);
      break;
  }
  debugPrint(response);
}
