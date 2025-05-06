import 'package:test_project/core/resources/data_state.dart';
import 'package:test_project/core/usecase/usecase.dart';
import 'package:test_project/features/todo_item/domain/entities/todo_item.dart';
import 'package:test_project/features/todo_item/domain/repository/todo_item_repository.dart';

class GetTodoItemUsecase implements UseCase<DataState<TodoItemEntity>, GetTodoItemParams?> {
  final TodoItemRepository _repository;

  GetTodoItemUsecase(this._repository);

  @override
  Future<DataState<TodoItemEntity>> call({GetTodoItemParams? params}) async {
    if (params == null) {
      return DataError('Params cannot be null');
    }
    return await _repository.getTodoItem(params.todoId, params.todoItemId);
  }
}

class GetTodoItemParams {
  final int todoId;
  final int todoItemId;

  GetTodoItemParams({
    required this.todoId,
    required this.todoItemId,
  });
}