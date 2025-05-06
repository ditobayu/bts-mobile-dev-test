import 'package:test_project/features/todo/domain/entities/todo.dart';

class TodoModel extends TodoEntity {
  const TodoModel({
    required super.id,
    required super.name,
  });


  factory TodoModel.fromJson(Map<String, dynamic> json) {
    return TodoModel(
      id: json['id'] as int,
      name: json['name'] as String,
    );
  }

  TodoEntity toEntity() {
    return TodoEntity(
      id: id,
      name: name,
    );
  }
}
