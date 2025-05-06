import 'package:test_project/core/resources/data_state.dart';
import 'package:test_project/features/auth/domain/entities/token.dart';

abstract class AuthRepository {
  Future<DataState<TokenEntity>> login(String username, String password);
  Future<DataState<void>> register(String username, String password, String email);

  //check if user is logged in
  Future<DataState<TokenEntity>> checkCurrentUser();
}
