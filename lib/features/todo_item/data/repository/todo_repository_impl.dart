
import 'package:test_project/core/resources/data_state.dart';
import 'package:test_project/features/todo_item/data/data_sources/remote_todo_item_data_sources.dart';
import 'package:test_project/features/todo_item/domain/entities/todo_item.dart';
import 'package:test_project/features/todo_item/domain/repository/todo_item_repository.dart';

class TodoItemRepositoryImpl implements TodoItemRepository {
  final RemoteTodoItemDataSources _remoteTodoItemDataSources;
  TodoItemRepositoryImpl(this._remoteTodoItemDataSources);

  @override
  Future<DataState<void>> deleteTodoItem(int todoId, int todoItemId) async {
    try {
      await _remoteTodoItemDataSources.deleteTodoItem(todoId, todoItemId);
      return DataSuccess(null);
    } catch (e) {
      return DataError(e.toString());
    }
    
  }

  @override
  Future<DataState<TodoItemEntity>> getTodoItem(int todoId, int todoItemId) async {
    try {
      final response = await _remoteTodoItemDataSources.getTodoItem(todoId, todoItemId);
      return DataSuccess(response);
    } catch (e) {
      return DataError(e.toString());
    }
  }

  @override
  Future<DataState<void>> saveTodoItem(int todoId, String todoItemName) async {
    try {
      await _remoteTodoItemDataSources.saveTodoItem(todoId, todoItemName);
      return DataSuccess(null);
    } catch (e) {
      return DataError(e.toString());
    }
  }

  @override
  Future<DataState<void>> updateTodoItemName(int todoId, int todoItemId, String todoItemName) async {
    try {
      await _remoteTodoItemDataSources.updateTodoItemName(todoId, todoItemId, todoItemName);
      return DataSuccess(null);
    } catch (e) {
      return DataError(e.toString());
    }
  }

  @override
  Future<DataState<void>> updateTodoItemStatus(int todoId, int todoItemId) async {
    try {
      await _remoteTodoItemDataSources.updateTodoItemStatus(todoId, todoItemId);
      return DataSuccess(null);
    } catch (e) {
      return DataError(e.toString());
    }
  }
  
  @override
  Future<DataState<List<TodoItemEntity>>> getTodoItems(int todoId) async {
    try {
      final response = await _remoteTodoItemDataSources.getTodoItems(todoId);
      return DataSuccess(response);
    } catch (e) {
      return DataError(e.toString());
    }
  } 
}
