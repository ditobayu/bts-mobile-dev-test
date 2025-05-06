import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:test_project/core/constants/constants.dart';
import 'package:test_project/features/auth/data/data_sources/local/local_auth_data_source.dart';
import 'package:test_project/features/todo_item/data/models/todo_item.dart';

class RemoteTodoItemDataSources {
  final http.Client client;
  final LocalAuthDataSource localDataSource;

  RemoteTodoItemDataSources(this.client, this.localDataSource);

  Future<List<TodoItemModel>> getTodoItems(int todoId) async {
    final token = await localDataSource.getToken();
    if (token == null) {
      throw Exception('No token found');
    }
    final response = await client.get(
      Uri.parse('$apiBaseUrl/checklist/$todoId/items'),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body)['data'];
      return data.map((json) => TodoItemModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load todos');
    }
  }

  Future<TodoItemModel> getTodoItem(int todoId, int todoItemId) async {
    final token = await localDataSource.getToken();
    if (token == null) {
      throw Exception('No token found');
    }
    final response = await client.get(
      Uri.parse('$apiBaseUrl/checklist/$todoId/items/$todoItemId'),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      final dynamic item = jsonDecode(response.body)['data'];
      return TodoItemModel.fromJson(item);
    } else {
      throw Exception('Failed to load todos');
    }
  }

  Future<void> saveTodoItem(int todoId, String todoItemName) async {
    final token = await localDataSource.getToken();
    if (token == null) {
      throw Exception('No token found');
    }
    final response = await client.post(
      Uri.parse('$apiBaseUrl/checklist/$todoId/items'),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'name': todoItemName,
      }),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to save todo item');
    }
  }
  Future<void> deleteTodoItem(int todoId, int todoItemId) async {
    final token = await localDataSource.getToken();
    if (token == null) {
      throw Exception('No token found');
    }
    final response = await client.delete(
      Uri.parse('$apiBaseUrl/checklist/$todoId/items/$todoItemId'),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to delete todo item');
    }
  }
  Future<void> updateTodoItemStatus(int todoId, int todoItemId) async {
    final token = await localDataSource.getToken();
    if (token == null) {
      throw Exception('No token found');
    }
    final response = await client.patch(
      Uri.parse('$apiBaseUrl/checklist/$todoId/items/$todoItemId'),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'status': 'done',
      }),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to update todo item status');
    }
  }
  Future<void> updateTodoItemName(int todoId, int todoItemId, String todoItemName) async {
    final token = await localDataSource.getToken();
    if (token == null) {
      throw Exception('No token found');
    }
    final response = await client.patch(
      Uri.parse('$apiBaseUrl/checklist/$todoId/items/$todoItemId'),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'name': todoItemName,
      }),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to update todo item name');
    }
  }
}
