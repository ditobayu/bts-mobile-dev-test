part of 'remote_todos_bloc.dart';

sealed class RemoteTodosState extends Equatable {
  const RemoteTodosState();
  
  @override
  List<Object> get props => [];
}

final class RemoteTodosInitial extends RemoteTodosState {}

final class RemoteTodosLoading extends RemoteTodosState {}

final class RemoteTodosLoaded extends RemoteTodosState {
  final List<TodoEntity> todos;

  const RemoteTodosLoaded(this.todos);

  @override
  List<Object> get props => [todos];
}

final class RemoteTodosError extends RemoteTodosState {
  final String message;

  const RemoteTodosError(this.message);

  @override
  List<Object> get props => [message];
}