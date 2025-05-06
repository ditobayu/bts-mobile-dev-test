import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:test_project/core/resources/data_state.dart';
import 'package:test_project/features/todo_item/domain/entities/todo_item.dart';
import 'package:test_project/features/todo_item/domain/usecases/delete_todo_item.dart';
import 'package:test_project/features/todo_item/domain/usecases/get_todo_item.dart';
import 'package:test_project/features/todo_item/domain/usecases/get_todo_items.dart';
import 'package:test_project/features/todo_item/domain/usecases/save_todo_item.dart';
import 'package:test_project/features/todo_item/domain/usecases/update_todo_item_name.dart';
import 'package:test_project/features/todo_item/domain/usecases/update_todo_item_status.dart';

part 'remote_todo_item_event.dart';
part 'remote_todo_item_state.dart';

class RemoteTodoItemBloc extends Bloc<RemoteTodoItemEvent, RemoteTodoItemState> {
  final GetTodoItemUsecase _getTodoItemUsecase;
  final DeleteTodoItemUsecase _deleteTodoItemUsecase;
  final SaveTodoItemUsecase _saveTodoItemUsecase;
  final UpdateTodoItemNameUsecase _updateTodoItemNameUsecase;
  final UpdateTodoItemStatusUsecase _updateTodoItemStatusUsecase;
  RemoteTodoItemBloc(
    this._getTodoItemUsecase,
    this._deleteTodoItemUsecase,
    this._saveTodoItemUsecase,
    this._updateTodoItemNameUsecase,
    this._updateTodoItemStatusUsecase,
  ) : super(RemoteTodoItemInitial()) {
    on<GetTodoItemEvent>(_onGetTodoItemEvent);
    on<DeleteTodoItemEvent>(_onDeleteTodoItemEvent);
    on<SaveTodoItemEvent>(_onSaveTodoItemEvent);
    on<UpdateTodoItemNameEvent>(_onUpdateTodoItemNameEvent);
    on<UpdateTodoItemStatusEvent>(_onUpdateTodoItemStatusEvent);
  }

  Future<void> _onGetTodoItemEvent(
    GetTodoItemEvent event,
    Emitter<RemoteTodoItemState> emit,
  ) async {
    emit(RemoteTodoItemLoading());
    final result = await _getTodoItemUsecase(
      params: GetTodoItemParams(
        todoId: event.todoId,
        todoItemId: event.todoItemId,
      ),
    );

    if (result is DataSuccess<TodoItemEntity>) {
      emit(RemoteTodoItemLoaded(result.data!));
    } else if (result is DataError) {
      emit(RemoteTodoItemError(result.error!));
    }
  }

  Future<void> _onDeleteTodoItemEvent(
    DeleteTodoItemEvent event,
    Emitter<RemoteTodoItemState> emit,
  ) async {
    emit(RemoteTodoItemLoading());
    final result = await _deleteTodoItemUsecase(
      params: DeleteTodoItemParams(
        todoId: event.todoId,
        todoItemId: event.todoItemId,
      ),
    );

    if (result is DataSuccess<void>) {
      emit(RemoteTodoItemDeleted('Todo item deleted successfully'));
    } else if (result is DataError) {
      emit(RemoteTodoItemError(result.error!));
    }
  }

  Future<void> _onSaveTodoItemEvent(
    SaveTodoItemEvent event,
    Emitter<RemoteTodoItemState> emit,
  ) async {
    emit(RemoteTodoItemLoading());
    final result = await _saveTodoItemUsecase(
      params: SaveTodoItemParams(
        name: event.name,
        todoId: event.todoId,
      ),
    );

    if (result is DataSuccess<void>) {
      emit(RemoteTodoItemSaved('Todo item saved successfully'));
    } else if (result is DataError) {
      emit(RemoteTodoItemError(result.error!));
    }
  }

  Future<void> _onUpdateTodoItemNameEvent(
    UpdateTodoItemNameEvent event,
    Emitter<RemoteTodoItemState> emit,
  ) async {
    emit(RemoteTodoItemLoading());
    final result = await _updateTodoItemNameUsecase(
      params: UpdateTodoItemNameParams(
        todoId: event.todoId,
        todoItemId: event.todoItemId,
        todoItemName: event.todoItemName,
      ),
    );

    if (result is DataSuccess<void>) {
      emit(RemoteTodoItemSaved('Todo item name updated successfully'));
    } else if (result is DataError) {
      emit(RemoteTodoItemError(result.error!));
    }
  }

  Future<void> _onUpdateTodoItemStatusEvent(
    UpdateTodoItemStatusEvent event,
    Emitter<RemoteTodoItemState> emit,
  ) async {
    emit(RemoteTodoItemLoading());
    final result = await _updateTodoItemStatusUsecase(
      params: UpdateTodoItemStatusParams(
        todoId: event.todoId,
        todoItemId: event.todoItemId,
      ),
    );

    if (result is DataSuccess<void>) {
      emit(RemoteTodoItemSaved('Todo item status updated successfully'));
    } else if (result is DataError) {
      emit(RemoteTodoItemError(result.error!));
    }
  }




}
