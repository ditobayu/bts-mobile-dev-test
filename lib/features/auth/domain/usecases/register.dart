import 'package:test_project/core/resources/data_state.dart';
import 'package:test_project/core/usecase/usecase.dart';
import 'package:test_project/features/auth/domain/repository/auth_repository.dart';

class RegisterUsecase implements UseCase<DataState<void>, RegisterParams> {
  final AuthRepository _repository;

  RegisterUsecase(this._repository);

  @override
  Future<DataState<void>> call({RegisterParams? params}) async {
    return await _repository.register(
      params?.username ?? '',
      params?.password ?? '',
      params?.email ?? '',
    );
  }
}

class RegisterParams {
  final String username;
  final String password;
  final String email;

  RegisterParams({
    required this.username,
    required this.password,
    required this.email,
  });
}