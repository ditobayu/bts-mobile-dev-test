import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_project/features/todo/presentation/bloc/todo/bloc/remote_todo_bloc.dart';
import 'package:test_project/features/todo_item/presentation/bloc/todo_item/remote/remote_todo_item_bloc.dart';
import 'package:test_project/features/todo_item/presentation/bloc/todo_items/remote/remote_todo_items_bloc.dart';

class TodoDetailScreen extends StatefulWidget {
  final int todoId;
  const TodoDetailScreen({super.key, required this.todoId});

  @override
  State<TodoDetailScreen> createState() => _TodoDetailScreenState();
}

class _TodoDetailScreenState extends State<TodoDetailScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Fetch todo details using widget.todoId
    BlocProvider.of<RemoteTodoItemsBloc>(context).add(GetTodoItemsEvent(widget.todoId));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo Detail'),
      ),
      body: BlocBuilder<RemoteTodoBloc, RemoteTodoState>(
        builder: (context, state) {
          if (state is RemoteTodoLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is RemoteTodoLoaded) {
            final todo = state.todo;
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Title: ${todo.name}', style: const TextStyle(fontSize: 24)),
                  const SizedBox(height: 10),
                  Text('Description: ${todo.id}', style: const TextStyle(fontSize: 18)),
                ],
              ),
            );
          } else if (state is RemoteTodoError) {
            return Center(child: Text('Error: ${state.message}'));
          }
          return const Center(child: Text('Unknown state'));
        },
      ),
    );
  }
}