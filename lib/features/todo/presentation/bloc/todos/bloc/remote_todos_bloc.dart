import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:test_project/core/resources/data_state.dart';
import 'package:test_project/features/todo/domain/entities/todo.dart';
import 'package:test_project/features/todo/domain/usecases/delete_todo.dart';
import 'package:test_project/features/todo/domain/usecases/get_todos.dart';
import 'package:test_project/features/todo/domain/usecases/save_todo.dart';

part 'remote_todos_event.dart';
part 'remote_todos_state.dart';

class RemoteTodosBloc extends Bloc<RemoteTodosEvent, RemoteTodosState> {
  final GetTodosUsecase _getTodosUsecase;
  final DeleteTodoUsecase _deleteTodoUsecase;
  final SaveTodoUsecase _saveTodoUsecase;
  RemoteTodosBloc(this._getTodosUsecase, this._deleteTodoUsecase, this._saveTodoUsecase) : super(RemoteTodosInitial()) {
    on<GetTodosEvent>(_onGetTodosEvent);
    on<DeleteTodoEvent>(_onDeleteTodoEvent);
    on<SaveTodoEvent>(_onSaveTodoEvent);
  }

  Future<void> _onGetTodosEvent(
    GetTodosEvent event,
    Emitter<RemoteTodosState> emit,
  ) async {
    emit(RemoteTodosLoading());
    final result = await _getTodosUsecase();
    
    if (result is DataSuccess<List<TodoEntity>>) {
      emit(RemoteTodosLoaded(result.data!));
    } else if (result is DataError) {
      emit(RemoteTodosError(result.error!));
    }
  }

  Future<void> _onDeleteTodoEvent(
    DeleteTodoEvent event,
    Emitter<RemoteTodosState> emit,
  ) async {
    emit(RemoteTodosLoading());
    final result = await _deleteTodoUsecase(
      params: DeleteTodoParams(event.id),
    );

    if (result is DataSuccess<void>) {
      final todosResult = await _getTodosUsecase();
      if (todosResult is DataSuccess<List<TodoEntity>>) {
        emit(RemoteTodosLoaded(todosResult.data!));
      } else if (todosResult is DataError) {
        emit(RemoteTodosError(todosResult.error!));
      }
    } else if (result is DataError) {
      emit(RemoteTodosError(result.error!));
    }
  }

  Future<void> _onSaveTodoEvent(
    SaveTodoEvent event,
    Emitter<RemoteTodosState> emit,
  ) async {
    emit(RemoteTodosLoading());
    final result = await _saveTodoUsecase(
      params: SaveTodoParams(event.name),
    );

    if (result is DataSuccess<void>) {
      final todosResult = await _getTodosUsecase();
      if (todosResult is DataSuccess<List<TodoEntity>>) {
        emit(RemoteTodosLoaded(todosResult.data!));
      } else if (todosResult is DataError) {
        emit(RemoteTodosError(todosResult.error!));
      }
    } else if (result is DataError) {
      emit(RemoteTodosError(result.error!));
    }
  }
}
