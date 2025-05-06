part of 'remote_todo_bloc.dart';

sealed class RemoteTodoEvent extends Equatable {
  const RemoteTodoEvent();

  @override
  List<Object> get props => [];
}

final class GetTodoDetailEvent extends RemoteTodoEvent {
  final int todoId;
  const GetTodoDetailEvent(this.todoId);

  @override
  List<Object> get props => [todoId];
}