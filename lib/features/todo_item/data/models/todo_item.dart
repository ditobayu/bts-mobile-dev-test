import 'package:test_project/features/todo_item/domain/entities/todo_item.dart';

class TodoItemModel extends TodoItemEntity {
  const TodoItemModel({
    required super.id,
    required super.name,
    required super.isCompleted,
  });


  factory TodoItemModel.fromJson(Map<String, dynamic> json) {
    return TodoItemModel(
      id: json['id'] as int,
      name: json['name'] as String,
      isCompleted: json['itemCompletionStatus'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'itemCompletionStatus': isCompleted,
    };
  }
}
