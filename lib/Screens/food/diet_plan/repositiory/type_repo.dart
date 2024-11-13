import 'package:http/http.dart' as http;
import 'package:md_health/network/end_point.dart';

class TypeSubscriptionRepo {
  Future<http.Response> typesub(token) async {
    try {
      print(Endpoint.mdFoodsubscriptionType);
      return await http
          .get(Uri.parse(Endpoint.mdFoodsubscriptionType), headers: {
        "Authorization": "Bearer $token",
        'Content-Type': 'application/json',
      });
    } catch (e) {
      throw Exception(e);
    }
  }
}
// Route::post('md-food-packages-search', 'food_packages_search');
//         Route::post('md-food-view', 'food_view');
//         Route::post('md-food-update', 'food_update');
//         Route::get('md-food-calories', 'food_calories');
//         Route::get('md-food-type', 'food_type');
//         Route::get('md-food-subscription-type', 'food_subscription_type');
//         Route::post('md-food-add-fav', 'add_to_fav');
//         Route::post('md-food-remove-fav', 'food_remove_from_fav');
//         Route::post('md-food-view-menu-list', 'view_menu_list');
//         Route::post('md-food-get-who-purchase', 'get_who_purchase_for');
//         Route::post('md-food-get-who-purchase-for-calculation', 'food_get_who_purchase_for_calculation');
//         Route::post('md-food-update-sale-price', 'food_update_sale_price');
//         Route::post('md-food-gift-form', 'gift_form');
//         Route::post('md-food-payment-details', 'payment_details');
//         Route::post('md-food-purchase-food', 'purchase_food');
//         Route::get('md-food-order-count', 'order_count');
//         Route::get('md-food-order-list', 'food_order_list');
//         Route::post('md-food-order-list-view', 'food_order_list_view');
//         Route::post('md-food-most-used-providers', 'food_most_used_providers');