import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:md_health/Screens/MdBooking/md_booking_payment/controller/md_booking_home_view_controller.dart';
import 'package:md_health/Screens/address/controller/add_address_controller.dart';
import 'package:md_health/Screens/address/controller/address_controller.dart';
import 'package:md_health/Screens/auth/controller/forgot_password_view_controller.dart';
import 'package:md_health/Screens/auth/controller/login_view_controller.dart';
import 'package:md_health/Screens/auth/controller/signup_view_controller.dart';
import 'package:md_health/Screens/bottom_navigation/controller/bottom_controller.dart';
import 'package:md_health/Screens/change_information_form_view.dart/controller/change_information_controller.dart';
import 'package:md_health/Screens/food/diet_other/controller/diet_other_form_controller.dart';
import 'package:md_health/Screens/food/diet_plan/controller/diet_plan_controller.dart';
import 'package:md_health/Screens/favourt/controller/fav_controller.dart';
import 'package:md_health/Screens/food/Vendro_food_list/controller/vendor_list_controller.dart';
import 'package:md_health/Screens/food/dietBank/controller/diet_bank_controller.dart';
import 'package:md_health/Screens/food/diet_plan/controller/dient_view_controller.dart';
import 'package:md_health/Screens/food/make_request/controller/food_make_request_controller.dart';
import 'package:md_health/Screens/health/home/controller/home_controller.dart';
import 'package:md_health/Screens/health/information_form/controller/information_form_controller.dart';
import 'package:md_health/Screens/health/payment/controller/payment_controller.dart';
import 'package:md_health/Screens/health/payment_details/controller/payment_details_controller.dart';
import 'package:md_health/Screens/home_services/home_page_services/controller/home_services_controller.dart';
import 'package:md_health/Screens/home_services/homes_services_search_list/search_list/controller/home_services_serach_controller.dart';
import 'package:md_health/Screens/home_services/hs_other_form/controller/hs_other_controller.dart';
import 'package:md_health/Screens/home_services/hs_payment/controller/hs_payment_controller.dart';
import 'package:md_health/Screens/home_services/hs_review/controller/hs_review_list_controller.dart';
import 'package:md_health/Screens/home_services/make_request/controller/make_request_controller.dart';
import 'package:md_health/Screens/home_services/purchase_details/controller/hs_purchase_details_controller.dart';
import 'package:md_health/Screens/home_services/search_details/controller/hs_details_controller.dart';
import 'package:md_health/Screens/message/controller/live_convertion_list_controller.dart';
import 'package:md_health/Screens/health/my_details/controller/my_package_detail_view_controller.dart';
import 'package:md_health/Screens/health/my_documents/controller/my_documents_controller.dart';
import 'package:md_health/Screens/my_wallet/controller/my_wallet_controller.dart';
import 'package:md_health/Screens/notification/controller/notification_controller.dart';
import 'package:md_health/Screens/order/controller/order_count_controller.dart';
import 'package:md_health/Screens/order_details/controller/hs_details_controller.dart';
import 'package:md_health/Screens/order_details/controller/order_details_food_controller.dart';
import 'package:md_health/Screens/order_details/controller/order_list_controller.dart';
import 'package:md_health/Screens/order_details/controller/renew_food_pop_up_controller.dart';
import 'package:md_health/Screens/order_details/controller/shop_details_controller.dart';
import 'package:md_health/Screens/health/packages/controller/package_detail_view_controller.dart';
import 'package:md_health/Screens/health/packages/controller/packages_view_controller.dart';
import 'package:md_health/Screens/health/packages/controller/review_controller.dart';
import 'package:md_health/Screens/person_information/controller/person_information_form_controller.dart';
import 'package:md_health/Screens/profile/controller/profile_controller.dart';
import 'package:md_health/Screens/reports/controller/report_details_controller.dart';
import 'package:md_health/Screens/reports/controller/reports_list_controller.dart';
import 'package:md_health/Screens/reservation/controller/reservation_controller.dart';
import 'package:md_health/Screens/review/controller/review_controller.dart';
import 'package:md_health/Screens/health/search/controller/search_details_view_controller.dart';
import 'package:md_health/Screens/health/search/controller/search_view_controller.dart';
import 'package:md_health/Screens/shop/md_shop_home_page/controller/md_shop_home_page_controller.dart';
import 'package:md_health/Screens/shop/shop_make_request/controller/shop_request_controller.dart';
import 'package:md_health/Screens/shop/shop_cart/controller/cart_details_controller.dart';
import 'package:md_health/Screens/shop/shop_product_list/controller/shop_product_list_controller.dart';
import 'package:md_health/Screens/shop/shop_product_view/controller/s_product_view_controller.dart';
import 'package:md_health/Screens/shop/shop_vendors/controller/shop_vendor_controller.dart';
import 'package:md_health/Screens/splash/controller/splash_screen_controller.dart';
import 'package:md_health/Screens/splash/view/splash_screen.dart';
import 'package:md_health/network/services/firebase_api.dart';
import 'package:md_health/no_internet_screen.dart';
import 'package:md_health/widget/check_box.dart';
import 'package:md_health/widget/connection.dart';
import 'package:md_health/widget/loading_overlay.dart';
import 'package:provider/provider.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'Screens/food/diet_plan _payment/controller/diet_plan_controller.dart';
import 'Screens/message/controller/conversations_list_controller.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print("handled background message");
}

final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
String? selectedNotificationPayload;

Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print("common baby");
}

Future<void> initNotification(context) async {
  print("helloo init notification");
  showNotificationWithImage();
  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('mipmap/ic_launcher');

  final InitializationSettings initializationSettings =
      const InitializationSettings(
    android: initializationSettingsAndroid,
  );
}

Future<void> showNotificationWithImage() async {
  final bigPictureStyleInformation = const BigPictureStyleInformation(
    FilePathAndroidBitmap('your_image_path'),
    contentTitle: 'Notification with Image',
    summaryText: 'This is an example of a notification with an image.',
  );
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
  await FireBaseApi().initNotification();
  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('@mipmap/ic_launcher');
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NewMainScreenController()),
        ChangeNotifierProvider(create: (_) => ShopProductListConoller()),
        ChangeNotifierProvider(create: (_) => MdBookingHomeViewController()),
        ChangeNotifierProvider(create: (_) => SignupViewController()),
        ChangeNotifierProvider(create: (_) => LoginViewController()),
        ChangeNotifierProvider(create: (_) => SplashScreenController()),
        ChangeNotifierProvider(create: (_) => HomeViewController()),
        ChangeNotifierProvider(create: (_) => ForgotPasswordViewController()),
        ChangeNotifierProvider(create: (_) => PackageViewController()),
        ChangeNotifierProvider(create: (_) => ReservationController()),
        ChangeNotifierProvider(create: (_) => PrimaryCheckBoxController()),
        ChangeNotifierProvider(create: (_) => ProductViewController()),
        ChangeNotifierProvider(create: (_) => SplashScreenController()),
        ChangeNotifierProvider(create: (_) => ProfileDetailController()),
        ChangeNotifierProvider(create: (_) => SearchDetailsViewController()),
        ChangeNotifierProvider(create: (_) => SearchViewController()),
        ChangeNotifierProvider(create: (_) => PaymentController()),
        ChangeNotifierProvider(create: (_) => ReviewController()),
        ChangeNotifierProvider(create: (_) => PaymentDetailsController()),
        ChangeNotifierProvider(create: (_) => PackageDetailViewController()),
        ChangeNotifierProvider(create: (_) => InformationFormController()),
        ChangeNotifierProvider(create: (_) => ChnagePatientController()),
        ChangeNotifierProvider(create: (_) => MyPackageDetailController()),
        ChangeNotifierProvider(create: (_) => MyDocumnetsListController()),
        ChangeNotifierProvider(create: (_) => WriteReviewController()),
        ChangeNotifierProvider(create: (_) => MdShopHomePageController()),
        ChangeNotifierProvider(create: (_) => MyWalletScreenController()),
        ChangeNotifierProvider(create: (_) => FavoriteListController()),
        ChangeNotifierProvider(create: (_) => ReportsListController()),
        ChangeNotifierProvider(create: (_) => DietPlanController()),
        ChangeNotifierProvider(create: (_) => ReoprtDetailsController()),
        ChangeNotifierProvider(create: (_) => DietPlanviewController()),
        ChangeNotifierProvider(create: (_) => ConversationListController()),
        ChangeNotifierProvider(create: (_) => DietPlanPaymertController()),
        ChangeNotifierProvider(create: (_) => DietOtherFormController()),
        ChangeNotifierProvider(create: (_) => DietOrderCountController()),
        ChangeNotifierProvider(create: (_) => OrderListViewController()),
        ChangeNotifierProvider(create: (_) => OrderListFoodViewController()),
        ChangeNotifierProvider(create: (_) => DietBankTransferController()),
        ChangeNotifierProvider(create: (_) => CartDetailViewController()),
        ChangeNotifierProvider(create: (_) => ShopListDetailsController()),
        ChangeNotifierProvider(create: (_) => LiveConvertionListController()),
        ChangeNotifierProvider(create: (_) => HomeServicesController()),
        ChangeNotifierProvider(create: (_) => HsDetailsViewController()),
        ChangeNotifierProvider(create: (_) => DetailsHomeServicesController()),
        ChangeNotifierProvider(create: (_) => HsPaymentDetailsController()),
        ChangeNotifierProvider(create: (_) => HsOtherFormController()),
        ChangeNotifierProvider(create: (_) => HsPaymentLastController()),
        ChangeNotifierProvider(create: (_) => ShopVendorListCOntroller()),
        ChangeNotifierProvider(create: (_) => VendorFoodController()),
        ChangeNotifierProvider(create: (_) => FoodRequestFormController()),
        ChangeNotifierProvider(create: (_) => ShopRequestFormController()),
        ChangeNotifierProvider(create: (_) => NotificationCOntroller()),
        ChangeNotifierProvider(
            create: (_) => HomeSerivesMakeRequestController()),
        ChangeNotifierProvider(
            create: (_) => HomeServicesReviewListController()),
        ChangeNotifierProvider(
            create: (_) => HomeServicesSearchListController()),
        ChangeNotifierProvider(
            create: (_) => PersonInformationFormController()),
        ChangeNotifierProvider(create: (_) => AddressController()),
        ChangeNotifierProvider(create: (_) => EditAddAddressController()),
        ChangeNotifierProvider(create: (_) => ConnectivityService()),
        ChangeNotifierProvider(create: (_) => RenewFoodPopUpController()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

var fcmToken;

final firebaseMessaging = FirebaseMessaging.instance;

class _MyAppState extends State<MyApp> {
  bool isUserLoggedIn = false;

  @override
  void initState() {
    if (!kDebugMode) {
      FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
    }
    initNotification(context);
    showNotificationWithImage();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.transparent,
      ),
    );
    SystemChrome.setPreferredOrientations(
      [
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ],
    );
    return Consumer<ConnectivityService>(
        builder: (context, networkProvider, child) {
      return ScreenUtilInit(
          useInheritedMediaQuery: true,
          designSize: const Size(360, 690),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) {
            return Container(
              alignment: Alignment.center,
              child: Directionality(
                textDirection: TextDirection.ltr,
                child: LoadingOverlay(
                  child: MaterialApp(
                    locale: const Locale('tr', 'TR'),
                    builder: (context, child) {
                      return MediaQuery(
                        data: MediaQuery.of(context)
                            .copyWith(textScaleFactor: 0.81.sp),
                        child: child!,
                      );
                    },
                    title: 'Flutter Demo',
                    theme: ThemeData(
                      primarySwatch: Colors.blue,
                      fontFamily: 'Campton',
                    ),
                    debugShowCheckedModeBanner: false,
                    home: networkProvider.isOnline
                        ? Navigator(
                            onGenerateRoute: (settings) {
                              return MaterialPageRoute(
                                builder: (context) {
                                  return const SplashScreen();
                                },
                              );
                            },
                          )
                        : TestWidget(),

                    // Navigator(onGenerateRoute: (settings) {
                    //   return MaterialPageRoute(
                    //     builder: (
                    //       context,
                    //     ) {
                    //       return const SplashScreen();
                    //     },
                    //   );
                    // }
                    // home: ReportView()),
                  ),
                ),
              ),
            );
          });
    });
  }
}
