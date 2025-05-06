import 'package:test_project/core/resources/data_state.dart';
import 'package:test_project/core/usecase/usecase.dart';
import 'package:test_project/features/todo_item/domain/repository/todo_item_repository.dart';

class DeleteTodoItemUsecase implements UseCase<DataState<void>, DeleteTodoItemParams> {
  final TodoItemRepository _repository;

  DeleteTodoItemUsecase(this._repository);

  @override
  Future<DataState<void>> call({DeleteTodoItemParams? params}) async {
    if (params == null) {
      return DataError("Params cannot be null");
    }
    return await _repository.deleteTodoItem(params.todoId, params.todoItemId);
  }
}

class DeleteTodoItemParams {
  final int todoId;
  final int todoItemId;

  DeleteTodoItemParams({required this.todoId, required this.todoItemId});
}