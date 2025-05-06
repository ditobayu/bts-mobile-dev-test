import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_project/config/router/app_router.dart';
import 'package:test_project/core/di/injection_container.dart';
import 'package:test_project/features/auth/presentation/bloc/auth/auth_bloc.dart';
import 'package:test_project/features/todo/presentation/bloc/todo/bloc/remote_todo_bloc.dart';
import 'package:test_project/features/todo/presentation/bloc/todos/remote/remote_todos_bloc.dart';
// import 'package:test_project/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';
// import 'package:test_project/features/daily_news/presentation/pages/home/daily_news.dart';

Future<void> main() async {
  await init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // BlocProvider<RemoteArticleBloc>(
        //   create: (context) => sl<RemoteArticleBloc>()..add(GetArticlesEvent()),
        // ),
        BlocProvider<AuthBloc>(
          create: (context) => sl<AuthBloc>(),
        ),
        BlocProvider<RemoteTodosBloc>(
          create: (context) => sl<RemoteTodosBloc>(),
        ),
        BlocProvider<RemoteTodoBloc>(
          create: (context) => sl<RemoteTodoBloc>(),
        ),

      ],
      child: Builder(
        builder: (context) {
          final router = AppRouter().router;
          return MaterialApp.router(
            routerConfig: router,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            ),
          );
        }
      ),
    );
  }
}
