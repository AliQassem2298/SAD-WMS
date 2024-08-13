// ignore_for_file: file_names, avoid_print

import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:warehouse_manegment_system/staff/model/helper/api.dart';

class PostAddFavoriteService {
  Future<Map<String, dynamic>> postAddFavoriteService({
    required int id,
    required String token,
  }) async {
    final url = Uri.parse('$baseUrl/products/$id/favorites/create/');
    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 201) {
        // Product added successfully
        print('Product added successfully');
        return {'success': true, 'message': 'Product added successfully'};
      } else if (response.statusCode == 400) {
        // Check for specific error message
        final responseBody = jsonDecode(response.body);
        if (responseBody['detail'] == 'Product already favorited.') {
          print('Product already favorited.');
          return {'success': false, 'message': 'Product already favorited.'};
        } else {
          // Other error messages
          print('Failed to add to favorites: ${responseBody['detail']}');
          return {'success': false, 'message': responseBody['detail']};
        }
      } else {
        // Other status codes
        print('Failed to add to favorites: ${response.statusCode}');
        return {
          'success': false,
          'message': 'Failed with status code: ${response.statusCode}'
        };
      }
    } catch (e) {
      // Network or other errors
      print('Error: $e');
      return {'success': false, 'message': 'Error: $e'};
    }
  }
}
