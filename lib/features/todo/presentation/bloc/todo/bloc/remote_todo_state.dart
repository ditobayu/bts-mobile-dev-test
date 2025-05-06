part of 'remote_todo_bloc.dart';

sealed class RemoteTodoState extends Equatable {
  const RemoteTodoState();
  
  @override
  List<Object> get props => [];
}

final class RemoteTodoInitial extends RemoteTodoState {}

final class RemoteTodoLoading extends RemoteTodoState {}

final class RemoteTodoLoaded extends RemoteTodoState {
  final TodoEntity todo;

  const RemoteTodoLoaded(this.todo);

  @override
  List<Object> get props => [todo];
}

final class RemoteTodoError extends RemoteTodoState {
  final String message;

  const RemoteTodoError(this.message);

  @override
  List<Object> get props => [message];
}