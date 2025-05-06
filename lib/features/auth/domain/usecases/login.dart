import 'package:test_project/core/resources/data_state.dart';
import 'package:test_project/core/usecase/usecase.dart';
import 'package:test_project/features/auth/domain/entities/token.dart';
import 'package:test_project/features/auth/domain/repository/auth_repository.dart';

class LoginUsecase implements UseCase<DataState<TokenEntity>, LoginParams> {
  final AuthRepository _repository;

  LoginUsecase(this._repository);

  @override
  Future<DataState<TokenEntity>> call({LoginParams? params}) async {
    return await _repository.login(params?.username ?? '', params?.password ?? '');
  }
}

class LoginParams {
  final String username;
  final String password;

  LoginParams({
    required this.username,
    required this.password,
  });
}