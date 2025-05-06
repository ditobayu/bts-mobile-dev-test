import 'package:test_project/core/resources/data_state.dart';
import 'package:test_project/core/usecase/usecase.dart';
import 'package:test_project/features/todo_item/domain/repository/todo_item_repository.dart';

class SaveTodoItemUsecase implements UseCase<DataState<void>, SaveTodoItemParams> {
  final TodoItemRepository _repository;

  SaveTodoItemUsecase(this._repository);

  @override
  Future<DataState<void>> call({SaveTodoItemParams? params}) async {
    if (params == null) {
      return DataError("Params cannot be null");
    }
    return await _repository.saveTodoItem(params.todoId, params.name);
  }
}

class SaveTodoItemParams {
  final String name;
  final int todoId;

  SaveTodoItemParams({
    required this.name,
    required this.todoId,
  });
}