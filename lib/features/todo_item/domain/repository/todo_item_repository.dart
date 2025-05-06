import 'package:test_project/core/resources/data_state.dart';
import 'package:test_project/features/todo_item/domain/entities/todo_item.dart';

abstract class TodoItemRepository {
  Future<DataState<List<TodoItemEntity>>> getTodoItems(int todoId);
  Future<DataState<TodoItemEntity>> getTodoItem(int todoId, int todoItemId);
  Future<DataState<void>> saveTodoItem(int todoId, String todoItemName);
  Future<DataState<void>> deleteTodoItem(int todoId, int todoItemId);
  Future<DataState<void>> updateTodoItemStatus(int todoId, int todoItemId);
  Future<DataState<void>> updateTodoItemName(int todoId, int todoItemId, String todoItemName);
}
