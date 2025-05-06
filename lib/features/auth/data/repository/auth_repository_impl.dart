

import 'package:test_project/core/resources/data_state.dart';
import 'package:test_project/features/auth/data/data_sources/local/local_auth_data_source.dart';
import 'package:test_project/features/auth/data/data_sources/remote/remote_auth_data_source.dart';
import 'package:test_project/features/auth/data/models/token.dart';
import 'package:test_project/features/auth/domain/entities/token.dart';
import 'package:test_project/features/auth/domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final RemoteAuthDataSource _remoteAuthDataSource;
  final LocalAuthDataSource localDataSource;
  AuthRepositoryImpl(this._remoteAuthDataSource, this.localDataSource);

  @override
  Future<DataState<TokenEntity>> login(String username, String password)async {
    try {
      print('Logging in user: ${{
      'username': username,
      'password': password,
    }}');
    final response = await _remoteAuthDataSource.login(
      {
        'username': username,
        'password': password,
      },
    );

    localDataSource.saveToken(response.token);

    return DataSuccess(response);
    } catch (e) {
      
      return DataError("Failed to login: ${e.toString()}"); 
    }

  }

  @override
  Future<DataState<void>> register(String username, String password, String email) async {
    try {
      print('Registering user: ${{
      'username': username,
      'password': password,
      'email': email,
    }}');

    final response = await _remoteAuthDataSource.register({
      'username': username,
      'password': password,
      'email': email,
    });

    return DataSuccess(response);
    } catch (e) {
      return DataError("Failed to register: ${e.toString()}");
    }

  }
  
  @override
  Future<DataState<TokenEntity>> checkCurrentUser() async {
    
    final token = await localDataSource.getToken();
    if (token != null) {
      return DataSuccess(TokenModel(token: token));
    } else {
      return DataError(
        "asd"
      );
    }
  }

}
