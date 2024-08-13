// ignore_for_file: file_names, avoid_print

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:warehouse_manegment_system/staff/model/helper/api.dart';

class DeleteFavoriteService {
  Future<Map<String, dynamic>> deleteFavoriteService({
    required int id,
    required String token,
  }) async {
    final url = Uri.parse('$baseUrl/products/$id/favorites/delete/');
    try {
      final response = await http.delete(
        url,
        headers: {'Authorization': 'Bearer $token'},
      );

      if (response.statusCode == 204) {
        print('Favorite deleted successfully');
        return {'success': true, 'message': 'Favorite deleted successfully'};
      } else if (response.statusCode == 404) {
        // Not found: Favorite not found for the specified product
        final Map<String, dynamic> responseBody = jsonDecode(response.body);
        return {
          'success': false,
          'message': responseBody['detail'] ?? 'Favorite not found'
        };
      } else {
        return {
          'success': false,
          'message':
              'Failed to delete favorite. Status Code: ${response.statusCode}',
          'responseBody': response.body
        };
      }
    } catch (e) {
      // Network or other errors
      return {'success': false, 'message': 'Error: $e'};
    }
  }
}
