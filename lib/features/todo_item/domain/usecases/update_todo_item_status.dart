import 'package:test_project/core/resources/data_state.dart';
import 'package:test_project/core/usecase/usecase.dart';
import 'package:test_project/features/todo_item/domain/repository/todo_item_repository.dart';

class UpdateTodoItemStatusUsecase implements UseCase<DataState<void>, UpdateTodoItemStatusParams> {
  final TodoItemRepository _repository;

  UpdateTodoItemStatusUsecase(this._repository);

  @override
  Future<DataState<void>> call({UpdateTodoItemStatusParams? params}) async {
    if (params == null) {
      return DataError("Params cannot be null");
    }
    return await _repository.updateTodoItemStatus(params.todoId, params.todoItemId);
  }
}

class UpdateTodoItemStatusParams {
  final int todoId;
  final int todoItemId;

  UpdateTodoItemStatusParams({
    required this.todoId,
    required this.todoItemId,
  });

}