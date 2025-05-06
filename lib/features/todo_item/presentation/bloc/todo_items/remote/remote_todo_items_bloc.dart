import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:test_project/core/resources/data_state.dart';
import 'package:test_project/features/todo_item/domain/entities/todo_item.dart';
import 'package:test_project/features/todo_item/domain/usecases/get_todo_items.dart';

part 'remote_todo_items_event.dart';
part 'remote_todo_items_state.dart';

class RemoteTodoItemsBloc extends Bloc<RemoteTodoItemsEvent, RemoteTodoItemsState> {
  final GetTodoItemsUsecase _getTodoItemsUsecase;
  RemoteTodoItemsBloc(this._getTodoItemsUsecase) : super(RemoteTodoItemsInitial()) {
    on<GetTodoItemsEvent>(_onGetTodoItemsEvent);
  }


  Future<void> _onGetTodoItemsEvent(GetTodoItemsEvent event, Emitter<RemoteTodoItemsState> emit) async {
    emit(RemoteTodoItemsLoading());

      final todoItems = await _getTodoItemsUsecase(
        params: GetTodoItemsParams(
          todoId: event.todoId,
        ),
      );
      
    if (todoItems is DataSuccess<List<TodoItemEntity>>) {
      emit(RemoteTodoItemsLoaded(todoItems.data!));
    } else if (todoItems is DataError) {
      emit(RemoteTodoItemsError(todoItems.error!));
    }
  }
}
