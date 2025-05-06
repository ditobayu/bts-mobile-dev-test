import 'package:go_router/go_router.dart';
import 'package:test_project/features/todo/presentation/pages/todo/splash_screen.dart';
import 'package:test_project/features/todo/presentation/pages/todo/todo_screen.dart';

const todosPath = '/todos';
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
];
