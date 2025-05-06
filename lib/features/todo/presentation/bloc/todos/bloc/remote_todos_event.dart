part of 'remote_todos_bloc.dart';

sealed class RemoteTodosEvent extends Equatable {
  const RemoteTodosEvent();

  @override
  List<Object> get props => [];
}

final class GetTodosEvent extends RemoteTodosEvent {
  const GetTodosEvent();
}

