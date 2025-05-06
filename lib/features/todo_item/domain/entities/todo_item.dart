import 'package:equatable/equatable.dart';

class TodoItemEntity extends Equatable {
  final int id;
  final String name;
  final bool isCompleted;
 
  const TodoItemEntity({
    required this.id,
    required this.name,
    required this.isCompleted,
  });

  @override
  List<Object> get props => [id, name, isCompleted];
}