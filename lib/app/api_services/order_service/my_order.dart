import 'dart:convert';
import 'package:al_khalifa/app/api_services/utility/urls.dart';
import 'package:al_khalifa/app/modules/order_history/models/my_order_model.dart';
import 'package:http/http.dart' as http;
import '../../shared_prerf_services/shared_pref_services.dart';

class MyOrder {
  static Future<List<MyOrderModel>> getMyOrder() async {
    String? token = await SharedPrefServices.getUserToken();

    try {
      final response = await http.get(
        Uri.parse(Urls.myOrder),
        headers: {
          'Content-Type': 'application/json',
          "Authorization": "Bearer $token",
        },
      );

      if (response.statusCode == 200) {
        print('✅ ${response.statusCode}');
        print('Response body: ${response.body}');

        final List<dynamic> data = jsonDecode(response.body);

        // Parse each item in the list
        List<MyOrderModel> orders = data.map((item) {
          return MyOrderModel.fromJson(item);
        }).toList();

        return orders;
      } else {
        print('❌ Error status code: ${response.statusCode}');
        print('Error response: ${response.body}');
        throw Exception(
          'Failed to load orders. Status code: ${response.statusCode}',
        );
      }
    } catch (e) {
      print('❌ Exception in getMyOrder: $e');
      throw Exception('There was some error: $e');
    }
  }
}
