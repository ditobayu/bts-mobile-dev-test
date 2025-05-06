part of 'remote_todo_items_bloc.dart';

sealed class RemoteTodoItemsState extends Equatable {
  const RemoteTodoItemsState();
  
  @override
  List<Object> get props => [];
}

final class RemoteTodoItemsInitial extends RemoteTodoItemsState {}

final class RemoteTodoItemsLoading extends RemoteTodoItemsState {}

final class RemoteTodoItemsLoaded extends RemoteTodoItemsState {
  final List<TodoItemEntity> todoItems;

  const RemoteTodoItemsLoaded(this.todoItems);

  @override
  List<Object> get props => [todoItems];
}

final class RemoteTodoItemsError extends RemoteTodoItemsState {
  final String message;

  const RemoteTodoItemsError(this.message);

  @override
  List<Object> get props => [message];
}