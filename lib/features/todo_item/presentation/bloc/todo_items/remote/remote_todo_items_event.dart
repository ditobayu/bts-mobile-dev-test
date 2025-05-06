part of 'remote_todo_items_bloc.dart';

sealed class RemoteTodoItemsEvent extends Equatable {
  const RemoteTodoItemsEvent();

  @override
  List<Object> get props => [];
}

final class GetTodoItemsEvent extends RemoteTodoItemsEvent {
  final int todoId;
  const GetTodoItemsEvent(this.todoId);

  @override
  List<Object> get props => [todoId];
}