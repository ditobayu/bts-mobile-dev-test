import 'package:go_router/go_router.dart';
import 'package:test_project/features/auth/presentation/pages/home/login_screen.dart';
import 'package:test_project/features/auth/presentation/pages/home/register_screen.dart';

const loginPath = '/login';
const registerPath = '/register';

final authRoutes = <GoRoute>[
  GoRoute(path: loginPath, builder: (context, state) => const LoginScreen()),
  GoRoute(path: registerPath, builder: (context, state) => const RegisterScreen()),

];
