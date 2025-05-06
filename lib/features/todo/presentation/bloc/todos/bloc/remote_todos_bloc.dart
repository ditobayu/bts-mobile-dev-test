import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:test_project/core/resources/data_state.dart';
import 'package:test_project/features/todo/domain/entities/todo.dart';
import 'package:test_project/features/todo/domain/usecases/get_todos.dart';

part 'remote_todos_event.dart';
part 'remote_todos_state.dart';

class RemoteTodosBloc extends Bloc<RemoteTodosEvent, RemoteTodosState> {
  final GetTodosUsecase _getTodosUsecase;
  RemoteTodosBloc(this._getTodosUsecase) : super(RemoteTodosInitial()) {
    on<GetTodosEvent>(_onGetTodosEvent);
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
}
