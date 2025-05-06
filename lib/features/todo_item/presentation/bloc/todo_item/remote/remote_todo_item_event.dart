part of 'remote_todo_item_bloc.dart';

sealed class RemoteTodoItemEvent extends Equatable {
  const RemoteTodoItemEvent();

  @override
  List<Object> get props => [];
}

final class GetTodoItemEvent extends RemoteTodoItemEvent {
  final int todoId;
  final int todoItemId;

  const GetTodoItemEvent({
    required this.todoId,
    required this.todoItemId,
  });
  @override
  List<Object> get props => [todoId, todoItemId];
}
final class SaveTodoItemEvent extends RemoteTodoItemEvent {
  final String name;
  final int todoId;

  const SaveTodoItemEvent(this.name, this.todoId);

  @override
  List<Object> get props => [name];
}
final class DeleteTodoItemEvent extends RemoteTodoItemEvent {
  final int todoId;
  final int todoItemId;

  const DeleteTodoItemEvent({
    required this.todoId,
    required this.todoItemId,
  });

  @override
  List<Object> get props => [todoId, todoItemId];

}
final class UpdateTodoItemNameEvent extends RemoteTodoItemEvent {
  final int todoId;
  final int todoItemId;
  final String todoItemName;
  
  const UpdateTodoItemNameEvent({
    required this.todoId,
    required this.todoItemId,
    required this.todoItemName,
  });
  @override
  List<Object> get props => [todoId, todoItemId, todoItemName];
}
final class UpdateTodoItemStatusEvent extends RemoteTodoItemEvent {
  final int todoId;
  final int todoItemId;

  const UpdateTodoItemStatusEvent({
    required this.todoId,
    required this.todoItemId,
  });
  
  @override
  List<Object> get props => [todoId, todoItemId];
}