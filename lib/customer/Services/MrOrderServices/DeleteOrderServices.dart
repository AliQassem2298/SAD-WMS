// ignore_for_file: file_names, avoid_print

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:warehouse_manegment_system/staff/model/helper/api.dart';

class DeleteOrderService {
  Future<Map<String, dynamic>> deleteOrder({
    required int id,
    required String token,
  }) async {
    final url = Uri.parse('$baseUrl/orders/cancel/$id/');
    try {
      final response = await http.put(
        url,
        headers: {'Authorization': 'Bearer $token'},
      );

      if (response.statusCode == 200) {
        print('Order cancaled successfully');
        return {'success': true, 'message': 'Order deleted successfully'};
      } else if (response.statusCode == 404) {
        final Map<String, dynamic> responseBody = jsonDecode(response.body);
        return {
          'success': false,
          'message': responseBody['detail'] ?? 'Favorite not found'
        };
      } else {
        return {
          'success': false,
          'message':
              'Failed to delete order. Status Code: ${response.statusCode}',
          'responseBody': response.body
        };
      }
    } catch (e) {
      return {'success': false, 'message': 'Error: $e'};
    }
  }
}
