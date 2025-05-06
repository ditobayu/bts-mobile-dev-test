import 'package:test_project/core/resources/data_state.dart';
import 'package:test_project/core/usecase/usecase.dart';
import 'package:test_project/features/todo/domain/entities/todo.dart';
import 'package:test_project/features/todo/domain/repository/todo_repository.dart';

class GetTodosUsecase implements UseCase<DataState<List<TodoEntity>>, void> {
  final TodoRepository _repository;

  GetTodosUsecase(this._repository);

  @override
  Future<DataState<List<TodoEntity>>> call({void params}) async {
    return await _repository.getTodos();
  }
}