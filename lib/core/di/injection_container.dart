import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:test_project/features/auth/data/data_sources/local/local_auth_data_source.dart';
import 'package:test_project/features/auth/data/data_sources/remote/remote_auth_data_source.dart';
import 'package:test_project/features/auth/data/repository/auth_repository_impl.dart';
import 'package:test_project/features/auth/domain/repository/auth_repository.dart';
import 'package:test_project/features/auth/domain/usecases/check_current_user.dart';
import 'package:test_project/features/auth/domain/usecases/login.dart';
import 'package:test_project/features/auth/domain/usecases/register.dart';
import 'package:test_project/features/auth/presentation/bloc/auth/auth_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:test_project/features/todo/data/data_sources/remote_todo_data_sources.dart';
import 'package:test_project/features/todo/data/repository/todo_repository_impl.dart';
import 'package:test_project/features/todo/domain/repository/todo_repository.dart';
import 'package:test_project/features/todo/domain/usecases/get_todos.dart';
import 'package:test_project/features/todo/presentation/bloc/todos/bloc/remote_todos_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {

  sl.registerSingleton<FlutterSecureStorage>(FlutterSecureStorage());
  sl.registerLazySingleton<http.Client>(() => http.Client());

  // Auth
  sl.registerSingleton<RemoteAuthDataSource>(RemoteAuthDataSource(sl()));
  sl.registerSingleton<LocalAuthDataSource>(LocalAuthDataSourceImpl(sl()));

  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl(sl(), sl()));

  sl.registerSingleton<LoginUsecase>(LoginUsecase(sl()));
  sl.registerSingleton<RegisterUsecase>(RegisterUsecase(sl()));
  sl.registerSingleton<CheckCurrentUserUsecase>(CheckCurrentUserUsecase(sl()));

  sl.registerFactory(() => AuthBloc(sl(), sl(), sl()));

  // Todo
  sl.registerSingleton<RemoteTodoDataSources>(RemoteTodoDataSources( sl(), sl()));

  sl.registerSingleton<TodoRepository>(TodoRepositoryImpl(sl()));

  sl.registerSingleton<GetTodosUsecase>(GetTodosUsecase(sl()));
  sl.registerFactory(() => RemoteTodosBloc(sl()));
}
