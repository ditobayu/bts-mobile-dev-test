import 'package:test_project/core/resources/data_state.dart';
import 'package:test_project/core/usecase/usecase.dart';
import 'package:test_project/features/todo/domain/repository/todo_repository.dart';

class SaveTodoUsecase implements UseCase<DataState<void>, SaveTodoParams> {
  final TodoRepository _repository;

  SaveTodoUsecase(this._repository);

  @override
  Future<DataState<void>> call({SaveTodoParams? params}) async {
    if (params == null) {
      return DataError("Params cannot be null");
    }
    return await _repository.saveTodo(params.name);
  }
}

class SaveTodoParams {
  final String name;

  SaveTodoParams(this.name);
}