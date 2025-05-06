import 'package:go_router/go_router.dart';
import '../../../features/auth/presentation/routes.dart' as auth_routes;
import '../../../features/todo/presentation/routes.dart' as todo_routes;

class AppRouter {
  final GoRouter router;

  AppRouter()
    : router = GoRouter(
        initialLocation: '/',
        routes: [
          ...auth_routes.authRoutes,
          ...todo_routes.todoRoutes,
        ],
      );

  // static final router = GoRouter(
  //   initialLocation: auth_routes.loginPath,
  //   routes: [
  //     ...auth_routes.authRoutes,
  //     // ...home_routes.homeRoutes,
  //   ],
  //   // redirect: (context, state) {
  //   //   // Contoh: redirect jika belum login
  //   //   final loggedIn = false; // Ganti dengan auth logic asli
  //   //   final loggingIn = state.subloc == auth_routes.loginPath;

  //   //   if (!loggedIn && !loggingIn) return auth_routes.loginPath;
  //   //   if (loggedIn && loggingIn) return home_routes.homePath;

  //   //   return null;
  //   // },
  // );
}
