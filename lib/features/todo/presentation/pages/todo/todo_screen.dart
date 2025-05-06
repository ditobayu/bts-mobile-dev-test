import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:test_project/features/auth/presentation/bloc/auth/auth_bloc.dart';
import 'package:test_project/features/todo/presentation/bloc/todos/bloc/remote_todos_bloc.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<RemoteTodosBloc>(context).add(GetTodosEvent());
  }
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is! AuthLoaded) {
          print("object");
          // redirect to login screen
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
              return ListView.builder(
                itemCount: state.todos.length,
                itemBuilder: (context, index) {
                  final todo = state.todos[index];
                  return ListTile(
                    title: Text(todo.name),
                    subtitle: Text(todo.id.toString()),
                  );
                },
              );
            } else if (state is RemoteTodosError) {
              return Center(child: Text(state.message));
            }
            return const Center(child: Text('No todos found.'));
          },
      ),
    ),
    );
  }
}
