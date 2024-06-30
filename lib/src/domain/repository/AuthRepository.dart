import 'package:proyecto_inkar/src/domain/models/AuthResponse.dart';
import 'package:proyecto_inkar/src/domain/models/user.dart';
import 'package:proyecto_inkar/src/domain/utils/Resource.dart';

abstract class AuthRepository {
  Future<Resource<AuthResponse>> login(String email, String password);

  Future<Resource<AuthResponse>> register(User user);
  Future<void> saveUserSession(AuthResponse authResponse);
  Future<AuthResponse?> getUserSession();
  Future<bool> logout();
}
