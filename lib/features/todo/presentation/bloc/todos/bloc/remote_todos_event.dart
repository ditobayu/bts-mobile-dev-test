part of 'remote_todos_bloc.dart';

sealed class RemoteTodosEvent extends Equatable {
  const RemoteTodosEvent();

  @override
  List<Object> get props => [];
}

final class GetTodosEvent extends RemoteTodosEvent {
  const GetTodosEvent();
}

final class SaveTodoEvent extends RemoteTodosEvent {
  final String name;

  const SaveTodoEvent(this.name);

  @override
  List<Object> get props => [name];
}

final class DeleteTodoEvent extends RemoteTodosEvent {
  final int id;

  const DeleteTodoEvent(this.id);

  @override
  List<Object> get props => [id];
}