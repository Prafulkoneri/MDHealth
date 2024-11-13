class Endpoint {
  Endpoint._();

  static const String baseUrl =
      // 'https://projects.m-staging.in/md-health-development/api/';
      // 'https://projects.m-staging.in/md-health-testing/api/';
      'https://mdhealth.m-staging.in/api/';
  // "public/media/moa_664358e305106 (1)_1726836773.jpg"
  // 'https://projects.m-staging.in/md-health-beta/api/';
  static const String mdCustomerRegister = '${baseUrl}md-customer-register';
  static const String foodRequestForm = '${baseUrl}request-treatment-food';
  static const String shopRequestForm = '${baseUrl}request-treatment-shop';
  static const String homeServicesRequestForm =
      '${baseUrl}request-treatment-home';
  static const String useMyCoinnew = '${baseUrl}md-customer-coins';
  static const String newCityforTreatment =
      '${baseUrl}md-get-city-list-of-treatments';
  static const String bankDetails = '${baseUrl}md-helath-bank-details';
  static const String foodPacakgeSearchViewDetails =
      '${baseUrl}md-food-packages-search';
  static const String mdNewForgotPassword = '${baseUrl}md-forgot-password';
  // static const String viewMenuClick = '${baseUrl}food-packages-menu-details';
  static const String viewMenuClick = '${baseUrl}food-packages-menu-details';
  static const String getwhoPurchase = '${baseUrl}md-food-get-who-purchase';
  static const String guestLogin = '${baseUrl}md-health-guest-login';
  static const String getInvitelink = '${baseUrl}send-invitation-link';
  static const String netWorkRepo = '${baseUrl}md-customer-coins-count';
  static const String treatemntList = '${baseUrl}md-treatment-list-all';
  static const String mdGetCitylistNew = '${baseUrl}md-city-list-of-packages';
  static const String mdCountryList = '${baseUrl}md-country-list';
  static const String walletCoin = '${baseUrl}md-customer-coins';
  static const String guestNumber = '${baseUrl}md-guest-numbers';
  static const String downloadInvoices = '${baseUrl}md-generate-invoice-health';
  static const String hsdownloadInvoices = '${baseUrl}md-generate-invoice-home';
  static const String fooddownloadInvoices =
      '${baseUrl}md-generate-invoice-food';
  static const String makeHomeRequestForm = '${baseUrl}request-treatment';
  // static const String makeHomeRequestForm = '${baseUrl}md-make-request-form';
  static const String mdCityList = '${baseUrl}md-city-list';
  static const String notificationUpdate = '${baseUrl}md-change-seen-status';
  static const String numberCheck = '${baseUrl}md-check-number-exist';
  static const String mdCustomerLogin = '${baseUrl}md-customer-login';
  static const String mdUpdateCustomerPassword =
      '${baseUrl}md-update-customer-password';
  static const String mdCustomerPackageSearchFilter =
      '${baseUrl}md-customer-package-search-filter';
  static const String mdPackageViewSearch = '${baseUrl}md-packages-view-search';
  static const String addTofav = '${baseUrl}md-add-package-to-favourite';
  static const String mdCustomerPackagePurchaseDetails =
      '${baseUrl}md-customer-package-purchase-details';
  static const String mdCustomerPurchasePackage =
      '${baseUrl}md-customer-purchase-package';
  static const String getProfileData = '${baseUrl}md-update-customer-list';
  static const String upadteProfile = '${baseUrl}md-update-customer-profile';
  static const String shopHomePage = '${baseUrl}featured-product';
  static const String favListDetail = '${baseUrl}md-customer-favourite-list';
  static const String tourDetails = '${baseUrl}md-customer-tour-details-view';
  static const String transportationDetails =
      '${baseUrl}md-customer-transporatation-details-view';
  static const String favCountList =
      '${baseUrl}md-customer-favourite-list-count';
  static const String updatePercetage = '${baseUrl}md-customer-get-percentage';
  static const String removePackage = '${baseUrl}md-remove-from-favourite';
  static const String removeFood = '${baseUrl}md-food-remove-fav';
  static const String sendInvite = '${baseUrl}send-invitation';
  static const String bankList = '${baseUrl}md-helath-bank-list';
  static const String tourNotes = '${baseUrl}md-customer-tour-notes';
  static const String canclledSearch =
      '${baseUrl}md-customer-purchase-package-cancelled-list-search';
  static const String completedSearch =
      '${baseUrl}md-customer-purchase-package-completed-list-search';
  static const String activeSearchPackageList =
      '${baseUrl}md-customer-purchase-package-active-list-search'; //
  static const String accomodationTourNotes =
      '${baseUrl}md-customer-accomodition-notes';
  static const String transportationNOte =
      '${baseUrl}md-customer-transportation-notes';
  static const String changePatientInforamtion =
      '${baseUrl}md-update-patient-information';
  static const String patientInforamtion =
      '${baseUrl}md-change-patient-information';
  static const String packagePaymentDone =
      '${baseUrl}md-customer-purchase-package';
  static const String getPurchesInformation =
      '${baseUrl}md-customer-get-purchase-information';
  static const String activePackageList =
      '${baseUrl}md-customer-purchase-package-active-list';
  static const String completedPackageList =
      '${baseUrl}md-customer-purchase-package-completed-list';
  static const String canclledPackageList =
      '${baseUrl}md-customer-purchase-package-cancelled-list';
  static const String passwordExist = '${baseUrl}md-check-password-exist';
  static const String cancelledActivePackages =
      '${baseUrl}md-customer-change-package-list-active-cancelled';
  static const String packageDetailsView =
      '${baseUrl}md-customer-package-details';
  static const String getChangePatientInforamtion =
      '${baseUrl}md-change-patient-information-list';
  static const String myPackageDetailView = '${baseUrl}md-customer-my-details';
  static const String foodPayemtDetails = '${baseUrl}md-food-payment-details';
  static const String writeReview = '${baseUrl}md-customer-reviews';
  static const String writeFoodReview =
      '${baseUrl}md-customer-add-food-reviews';
  static const String threeReview = '${baseUrl}md-customer-reviews-screen';
  // static const String shopProductView = '${baseUrl}customer-product-view';
  static const String shopProductView =
      '${baseUrl}customer-product-view-for-app';
  static const String reviewList = '${baseUrl}md-customer-review-list';
  static const String uploadDocument = '${baseUrl}md-customer-upload-documents';
  static const String listDocument = '${baseUrl}md-customer-documents-list';
  static const String removeDocument = '${baseUrl}md-customer-remove-documents';
  static const String userName = '${baseUrl}md-get-login-user-name';
  static const String cartCountProduct = '${baseUrl}md-customer-cart-count';
  static const String showfoodReview =
      '${baseUrl}md-customer-food-reviews-data';
  static const String notificationSeenStatus =
      '${baseUrl}md-notification-status';
  static const String notificatCounts =
      '${baseUrl}md-customer-notification-count';
  static const String acoomodation =
      '${baseUrl}md-customer-acommodition-details-view';
  static const String reportsList =
      '${baseUrl}md-customer-all-reports-list-for-app';
  static const String getUserConversations =
      '${baseUrl}md-get-user-conversations';
  static const String reportListDetails =
      '${baseUrl}md-customer-all-reports-list-details-for-app';
  static const String videoShedule = '${baseUrl}md-schedule-a-meeting';
  static const String userLiveappoinment = '${baseUrl}md-user-live-appoinment';
  static const String mdLivecam = '${baseUrl}md-live-cam';
  static const String mdLiveCancel = '${baseUrl}md-cancel-user-live-appoinment';
  static const String timeSelect = '${baseUrl}md-get-provider-appointments';
  ////////////////////////////////////////////////fOOD////////////////////////////
  static const String mdFoodType = '${baseUrl}md-food-type';
  static const String mdFoodAddtoFavorite = '${baseUrl}md-food-add-fav';
  static const String mdFoodOtherform = '${baseUrl}md-food-gift-form';
  static const String mdFoodCalories = '${baseUrl}md-food-calories';
  static const String mdPaymentDiet = '${baseUrl}md-food-purchase-food';
  static const String orderCount = '${baseUrl}md-food-order-count';
  static const String orderList = '${baseUrl}md-food-order-list';
  static const String calculationPurches =
      '${baseUrl}md-food-get-who-purchase-for-calculation';
  static const String mostUsedProvider =
      '${baseUrl}md-food-most-used-providers';
  static const String orderListFoodDetails =
      '${baseUrl}md-food-order-list-view';
  static const String mdFoodsubscriptionType =
      '${baseUrl}md-food-subscription-type';
  /////////////////////////////Shop//////////////////////////////
  static const String shopFirstBanner = '${baseUrl}md-shop-banner';
  static const String adsRepo = '${baseUrl}md-ads-promo';
  static const String shopProductReviewList = '${baseUrl}md-shop-reviews-list';
  static const String followVendor = '${baseUrl}follow-vendor';
  static const String unfollowVendor = '${baseUrl}unfollow-vendor';
  static const String addToCart = '${baseUrl}add-to-cart';
  static const String cartView = '${baseUrl}shopping-cart-view';
  static const String deletedFullCart = '${baseUrl}shopping-cart-clear';
  static const String deletCartitem = '${baseUrl}shopping-cart-delete-item';
  static const String cartIncrement = '${baseUrl}md-cart-product-increment';
  static const String cartdecrement = '${baseUrl}md-cart-product-decrement';
  static const String shopPaymentDone = '${baseUrl}store-payment-details';
  static const String ShopOrderCount = '${baseUrl}md-shop-order-list-count';
  static const String notificaationList =
      '${baseUrl}md-customer-notification-list';
  static const String shopOrderList = '${baseUrl}md-shop-order-list';
  static const String orderCountrySearch = '${baseUrl}md-country-list-search';
  static const String foodfavCount = '${baseUrl}md-food-fav-count'; //new///
  static const String foodVendorList =
      '${baseUrl}md-food-all-food-list-providers'; //new///
  static const String shopFavList =
      '${baseUrl}md-customer-favourite-list-shop'; //new///
  static const String mdFoodFavList =
      '${baseUrl}md-customer-favourite-list-food'; ////New///
  static const String shopFavCount = '${baseUrl}md-shop-favourite-list-count';
  static const String homeScroole = '${baseUrl}home-cards-list';
  static const String shopProductAddToFav =
      '${baseUrl}md-shop-add-to-favourite';
  static const String cancelledShopOrder =
      '${baseUrl}md-shop-cancellation-reason';
  static const String shopOrderAddressChange =
      '${baseUrl}md-shop-order-change-address';
  static const String shopOrderListDetailss =
      '${baseUrl}md-shop-order-list-view';

////////////////HOMESERVICES//////////////////////////////
  // static const String hsTopProvider = '${baseUrl}md-get-top-providers';
  static const String hsTopProvider = '${baseUrl}md-home-get-top-packages';
  static const String addreddListnew =
      '${baseUrl}md-add-customer-addresses-list';
  static const String addnewAddress = '${baseUrl}md-add-customer-addresses';
  static const String editadrressList = '${baseUrl}md-view-edit-addresses-list';
  static const String editSubmit = '${baseUrl}md-edit-customer-addresses';
  static const String deleteaddress = '${baseUrl}md-delete-customer-addresses';
  static const String hspopUpList = '${baseUrl}md-home-services-list';
  static const String hsCity = '${baseUrl}md-get-home-services-cities';
  static const String hssearchlist = '${baseUrl}md-search-package';
  static const String hsOrderCount = '${baseUrl}md-home-order-count';
  static const String hsorderList = '${baseUrl}md-home-order-list';
  static const String hsorderListdetails = '${baseUrl}md-home-order-list-view';
  static const String hspackageDetails = '${baseUrl}md-view-package';
  static const String hslistReview = '${baseUrl}md-get-reviews';
  static const String hsfavCount = '${baseUrl}md-home-favourite-count';
  static const String hsOther = '${baseUrl}md-purchase-package-other';
  static const String hsAddFav = '${baseUrl}md-home-add-favourite';
  static const String hsFavViewList = '${baseUrl}md-home-favourite-list';
  static const String hsRemovePackage = '${baseUrl}md-home-remove-favourite';
  static const String hsSortSearch = '${baseUrl}md-sort-search';
  static const String hsorderidNumberDone = '${baseUrl}md-purchase-package';
  static const String shopVendorproduct = '${baseUrl}md-shop-view-products';
  static const String shopSubmitReview = '${baseUrl}md-shop-review-products';
  static const String showHsReview = '${baseUrl}md-get-home-reviews';
  static const String submitHsReview = '${baseUrl}md-submit-home-reviews';
  static const String showShopReview = '${baseUrl}md-product-name-for-review';
  static const String shopProductList = '${baseUrl}md-shop-side-product-filter';
  static const String reviewStatus =
      '${baseUrl}md-customer-check-review-status';
  static const String hsPricesCount =
      '${baseUrl}md-get-home-filter-price-count';
  static const String hsServicesCount =
      '${baseUrl}md-get-home-filter-service-count';
  static const String hsRatingCount =
      '${baseUrl}md-get-home-filter-rating-count';
  static const String hsFiltterCount =
      '${baseUrl}md-get-home-search-filter-count';
  static const String hsGetPurchseInformation =
      '${baseUrl}md-home-customer-get-purchase-information';
  static const String hsgethspercentage =
      '${baseUrl}md-get-homeservice-percentage';
  static const String hspackagePurchaseDetails =
      '${baseUrl}md-get-package-purchase-details';
  static const String shopGetCategories = '${baseUrl}md-shop-get-categories';
  static const String shopGetSubCategories =
      '${baseUrl}md-shop-get-sub-categories';
  static const String getCheckMessageStatus =
      '${baseUrl}md-check-message-status';
  static const String sendMessage = '${baseUrl}md-send-notification';
  static const String contractAndForms = '${baseUrl}md-shop-contract-and-forms';
  static const String generateFoodInvoice =
      '${baseUrl}md-generate-invoice-food';
  static const String getCompletedPackageReview =
      '${baseUrl}md-customer-show-reviews';
}
