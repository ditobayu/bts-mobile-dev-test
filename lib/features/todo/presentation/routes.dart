import 'package:go_router/go_router.dart';
import 'package:test_project/features/todo/presentation/pages/todo/splash_screen.dart';
import 'package:test_project/features/todo/presentation/pages/todo/todo_detail_screen.dart';
import 'package:test_project/features/todo/presentation/pages/todo/todo_screen.dart';

const todosPath = '/todos';
const todoDetailPath = '/todos/:todoId';
const splashPath = '/'; 

final todoRoutes = <GoRoute>[
  GoRoute(

    path: todosPath,
    builder: (context, state) => TodoScreen(),
  ),
  GoRoute(

    path: splashPath,
    builder: (context, state) => SplashScreen(),

  ),
  GoRoute(
    path: todoDetailPath,
    builder: (context, state) {
      final todoId = int.parse(state.pathParameters['todoId']!);
      return TodoDetailScreen(todoId: todoId);
    },
  ),
];
