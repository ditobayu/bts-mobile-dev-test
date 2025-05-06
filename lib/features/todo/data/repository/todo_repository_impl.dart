
import 'package:test_project/core/resources/data_state.dart';
import 'package:test_project/features/todo/data/data_sources/remote_todo_data_sources.dart';
import 'package:test_project/features/todo/domain/entities/todo.dart';
import 'package:test_project/features/todo/domain/repository/todo_repository.dart';

class TodoRepositoryImpl implements TodoRepository {
  final RemoteTodoDataSources _remoteTodoDataSources;
  TodoRepositoryImpl(this._remoteTodoDataSources);

  @override
  Future<DataState<List<TodoEntity>>> getTodos() async {
    try {
      final response = await _remoteTodoDataSources.getTodos();
      
      return DataSuccess(response);
    } catch (e) {
      return DataError(e.toString());
    }
      
  }
  
  @override
  Future<DataState<void>> deleteTodo(int id) async {
    try {
      await _remoteTodoDataSources.deleteTodo(id.toString());
      return DataSuccess(null);
    } catch (e) {
      return DataError(e.toString());
    }
    
  }
  
  @override
  Future<DataState<void>> saveTodo(String name) async {
    try {
      await _remoteTodoDataSources.saveTodo({'name': name});
      return DataSuccess(null);
    } catch (e) {
      return DataError(e.toString());
    }
  } 
}
