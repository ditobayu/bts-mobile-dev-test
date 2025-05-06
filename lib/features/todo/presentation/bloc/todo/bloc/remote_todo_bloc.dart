import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:test_project/core/resources/data_state.dart';
import 'package:test_project/features/todo/domain/entities/todo.dart';
import 'package:test_project/features/todo/domain/usecases/get_todo_detail.dart';

part 'remote_todo_event.dart';
part 'remote_todo_state.dart';

class RemoteTodoBloc extends Bloc<RemoteTodoEvent, RemoteTodoState> {
  final GetTodoDetailUsecase getTodoDetailUsecase;
  RemoteTodoBloc(this.getTodoDetailUsecase) : super(RemoteTodoInitial()) {
    on<GetTodoDetailEvent>(_onGetTodoDetailEvent);
  }

  Future<void> _onGetTodoDetailEvent(
    GetTodoDetailEvent event,
    Emitter<RemoteTodoState> emit,
  ) async {
    emit(RemoteTodoLoading());
    final result = await getTodoDetailUsecase(params: GetTodoDetailParams(event.todoId));
    
    if (result is DataSuccess<TodoEntity>) {
      final todo = result.data;
      emit(RemoteTodoLoaded(todo!));
    } else {
      emit(RemoteTodoError(result.error!));
    }
  }
}
