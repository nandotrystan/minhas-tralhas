import 'dtos/model_token.dart';

abstract class IRepository {
  Future<void> login({required String email, required String password});
  Future<void> fetchInfo();
  Future<bool> hasUser();
  Future<void> logout();
}
