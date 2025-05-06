import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract class LocalAuthDataSource {
  Future<void> saveToken(String token);
  Future<String?> getToken();
  Future<void> deleteToken();
}

class LocalAuthDataSourceImpl implements LocalAuthDataSource {
  final FlutterSecureStorage storage;

  LocalAuthDataSourceImpl(this.storage);

  static const _tokenKey = 'AUTH_TOKEN';

  @override
  Future<void> saveToken(String token) async {
    await storage.write(key: _tokenKey, value: token);
  }

  @override
  Future<String?> getToken() async {
    return await storage.read(key: _tokenKey);
  }

  @override
  Future<void> deleteToken() async {
    await storage.delete(key: _tokenKey);
  }
}
