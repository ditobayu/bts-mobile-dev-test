import 'package:test_project/core/resources/data_state.dart';
import 'package:test_project/features/todo/domain/entities/todo.dart';

abstract class TodoRepository {
  Future<DataState<List<TodoEntity>>> getTodos();
  Future<DataState<void>> saveTodo(String name);
  Future<DataState<void>> deleteTodo(int id);
}
