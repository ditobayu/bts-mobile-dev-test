import 'package:test_project/core/resources/data_state.dart';
import 'package:test_project/core/usecase/usecase.dart';
import 'package:test_project/features/todo_item/domain/entities/todo_item.dart';
import 'package:test_project/features/todo_item/domain/repository/todo_item_repository.dart';

class GetTodoItemsUsecase implements UseCase<DataState<List<TodoItemEntity>>, GetTodoItemsParams> {
  final TodoItemRepository _repository;

  GetTodoItemsUsecase(this._repository);

  @override
  Future<DataState<List<TodoItemEntity>>> call({GetTodoItemsParams? params}) async {
    if (params == null) {
      return DataError('Params cannot be null');
    }
    return await _repository.getTodoItems(params.todoId);
  }
}

class GetTodoItemsParams {
  final int todoId;
  GetTodoItemsParams({
    required this.todoId,
  });
}