import 'package:test_project/core/resources/data_state.dart';
import 'package:test_project/core/usecase/usecase.dart';
import 'package:test_project/features/auth/domain/entities/token.dart';
import 'package:test_project/features/auth/domain/repository/auth_repository.dart';

class CheckCurrentUserUsecase implements UseCase<DataState<TokenEntity>, void> {
  final AuthRepository _repository;

  CheckCurrentUserUsecase(this._repository);

  @override
  Future<DataState<TokenEntity>> call({void params}) async {
    return await _repository.checkCurrentUser();
  }
}