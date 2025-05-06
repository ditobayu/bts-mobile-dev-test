import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:test_project/core/constants/constants.dart';
import 'package:test_project/features/auth/data/data_sources/local/local_auth_data_source.dart';
import 'package:test_project/features/todo/data/models/todo.dart';

class RemoteTodoDataSources {
  final http.Client client;
  final LocalAuthDataSource localDataSource;

  RemoteTodoDataSources( this.client, this.localDataSource);

  Future<List<TodoModel>> getTodos() async {

    final token = await localDataSource.getToken();
    if (token == null) {
      throw Exception('No token found');
    }
    final response = await client.get(
      Uri.parse('$apiBaseUrl/checklist'),
      headers: {
      'Authorization': 'Bearer $token',
      },
    );

    print('Response status: ${response.body}');

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body)['data'];
      return data.map((json) => TodoModel.fromJson(json)).toList();
    } else {
      print('Errorqwe: ${response.body}');
      throw Exception('Failed to load articles');
    }
  }

  Future<void> saveTodo(Map<String, dynamic> requestBody) async {
    final token = await localDataSource.getToken();
    if (token == null) {
      throw Exception('No token found');
    }
    final response = await client.post(
      Uri.parse('$apiBaseUrl/checklist'),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
      body: jsonEncode(requestBody),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to add todo');
    }
  }

  Future<void> deleteTodo(String id) async {
    final token = await localDataSource.getToken();
    if (token == null) {
      throw Exception('No token found');
    }
    final response = await client.delete(
      Uri.parse('$apiBaseUrl/checklist/$id'),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to delete todo');
    }
  }

  Future<TodoModel> getTodoDetail(int id) async {
    final token = await localDataSource.getToken();
    if (token == null) {
      throw Exception('No token found');
    }
    final response = await client.get(
      Uri.parse('$apiBaseUrl/checklist/$id/item'),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body)['data'];
      return TodoModel.fromJson(data);
    } else {
      throw Exception('Failed to load todo detail');
    }
  }
}
