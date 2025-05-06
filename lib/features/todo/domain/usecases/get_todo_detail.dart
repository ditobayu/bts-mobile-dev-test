import 'package:test_project/core/resources/data_state.dart';
import 'package:test_project/core/usecase/usecase.dart';
import 'package:test_project/features/todo/domain/entities/todo.dart';
import 'package:test_project/features/todo/domain/repository/todo_repository.dart';

class GetTodoDetailUsecase implements UseCase<DataState<TodoEntity>, GetTodoDetailParams> {
  final TodoRepository _repository;

  GetTodoDetailUsecase(this._repository);

  @override
  Future<DataState<TodoEntity>> call({GetTodoDetailParams? params}) async {
    if (params == null) {
      return DataError("Params cannot be null");
    }
    return await _repository.getTodoDetail(params.todoId);
  }
}

class GetTodoDetailParams {
  final int todoId;

  GetTodoDetailParams(this.todoId);
}