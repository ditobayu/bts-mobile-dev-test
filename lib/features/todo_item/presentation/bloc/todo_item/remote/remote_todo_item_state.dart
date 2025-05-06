part of 'remote_todo_item_bloc.dart';

sealed class RemoteTodoItemState extends Equatable {
  const RemoteTodoItemState();
  
  @override
  List<Object> get props => [];
}

final class RemoteTodoItemInitial extends RemoteTodoItemState {}

final class RemoteTodoItemLoading extends RemoteTodoItemState {}

final class RemoteTodoItemLoaded extends RemoteTodoItemState {
  final TodoItemEntity todoItems;

  const RemoteTodoItemLoaded(this.todoItems);

  @override
  List<Object> get props => [todoItems];
}

final class RemoteTodoItemError extends RemoteTodoItemState {
  final String message;

  const RemoteTodoItemError(this.message);

  @override
  List<Object> get props => [message];
}

final class RemoteTodoItemDeleted extends RemoteTodoItemState {
  final String message;

  const RemoteTodoItemDeleted(this.message);

  @override
  List<Object> get props => [message];
}

final class RemoteTodoItemSaved extends RemoteTodoItemState {
  final String message;

  const RemoteTodoItemSaved(this.message);

  @override
  List<Object> get props => [message];
}