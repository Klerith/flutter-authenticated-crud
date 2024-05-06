



import '../domain.dart';

abstract class AuthDataSource {

  Future<User> login(String email, String password);
  Future<User> register(String email, String password, String fullName);
  Future<User> checkAuthStatus(String token);

}
