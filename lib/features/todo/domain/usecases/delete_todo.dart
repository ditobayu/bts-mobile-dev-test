import 'package:test_project/core/resources/data_state.dart';
import 'package:test_project/core/usecase/usecase.dart';
import 'package:test_project/features/todo/domain/repository/todo_repository.dart';

class DeleteTodoUsecase implements UseCase<DataState<void>, DeleteTodoParams> {
  final TodoRepository _repository;

  DeleteTodoUsecase(this._repository);

  @override
  Future<DataState<void>> call({DeleteTodoParams? params}) async {
    if (params == null) {
      return DataError("Params cannot be null");
    }
    return await _repository.deleteTodo(params.id);
  }
}

class DeleteTodoParams {
  final int id;

  DeleteTodoParams(this.id);
}