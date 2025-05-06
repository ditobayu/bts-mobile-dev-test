import 'package:test_project/core/resources/data_state.dart';
import 'package:test_project/core/usecase/usecase.dart';
import 'package:test_project/features/todo_item/domain/repository/todo_item_repository.dart';

class UpdateTodoItemNameUsecase implements UseCase<DataState<void>, UpdateTodoItemNameParams> {
  final TodoItemRepository _repository;

  UpdateTodoItemNameUsecase(this._repository);

  @override
  Future<DataState<void>> call({UpdateTodoItemNameParams? params}) async {
    if (params == null) {
      return DataError("Params cannot be null");
    }
    return await _repository.updateTodoItemName(params.todoId, params.todoItemId, params.todoItemName);
  }
}

class UpdateTodoItemNameParams {
  final int todoId;
  final int todoItemId;
  final String todoItemName;

  UpdateTodoItemNameParams({
    required this.todoId,
    required this.todoItemId,
    required this.todoItemName, 
  });

}