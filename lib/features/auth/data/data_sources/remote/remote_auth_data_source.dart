import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:test_project/core/constants/constants.dart';
import 'package:test_project/features/auth/data/models/token.dart';

class RemoteAuthDataSource {
  final http.Client client;

  RemoteAuthDataSource( this.client);

  // Login
  Future<TokenModel> login(Map<String, dynamic> requestBody) async {
    final response = await client.post(
      Uri.parse('$apiBaseUrl/login'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(requestBody),
    );

    if (response.statusCode == 200) {
      return TokenModel.fromJson(jsonDecode(response.body)['data']);
    } else {
      final errorResponse = jsonDecode(response.body);
      throw Exception(errorResponse['errorMessage'] ?? 'Failed to login');
    }
  }

  // Register
  Future<void> register(Map<String, dynamic> requestBody) async {
    final response = await client.post(
      Uri.parse('$apiBaseUrl/register'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(requestBody),
    );

    if (response.statusCode != 200) {
      final errorResponse = jsonDecode(response.body);
      throw Exception(errorResponse['errorMessage'] ?? 'Failed to register');
    }
  }
}
