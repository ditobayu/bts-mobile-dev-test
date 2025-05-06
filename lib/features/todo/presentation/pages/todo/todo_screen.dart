import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:test_project/features/auth/presentation/bloc/auth/auth_bloc.dart';
import 'package:test_project/features/todo/domain/entities/todo.dart';
import 'package:test_project/features/todo/presentation/bloc/todos/bloc/remote_todos_bloc.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  final TextEditingController _todoController = TextEditingController();

  @override
  void initState() {
    super.initState();
    BlocProvider.of<RemoteTodosBloc>(context).add(GetTodosEvent());
  }

  void _showAddTodoBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return Padding(
          padding: MediaQuery.of(context).viewInsets.add(const EdgeInsets.all(16)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Add Todo', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              TextField(
                controller: _todoController,
                decoration: const InputDecoration(labelText: 'Todo name'),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  final name = _todoController.text.trim();
                  if (name.isNotEmpty) {
                    BlocProvider.of<RemoteTodosBloc>(context).add(SaveTodoEvent(name));
                    _todoController.clear();
                    Navigator.pop(context);
                  }
                },
                child: const Text('Add'),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is! AuthLoaded) {
          context.go('/register');
        }
      },
      child: Scaffold(
        appBar: AppBar(title: const Text('Todo List')),
        body: BlocBuilder<RemoteTodosBloc, RemoteTodosState>(
          builder: (context, state) {
            if (state is RemoteTodosLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is RemoteTodosLoaded) {
              if (state.todos.isEmpty) {
                return const Center(child: Text('No todos found.'));
              }
              return ListView.builder(
                itemCount: state.todos.length,
                itemBuilder: (context, index) {
                  final todo = state.todos[index];
                  return ListTile(
                    title: Text(todo.name),
                    subtitle: Text('ID: ${todo.id}'),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        BlocProvider.of<RemoteTodosBloc>(context).add(DeleteTodoEvent(todo.id));
                      },
                    ),
                  );
                },
              );
            } else if (state is RemoteTodosError) {
              return Center(child: Text(state.message));
            }
            return const Center(child: Text('No todos found.'));
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => _showAddTodoBottomSheet(context),
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
