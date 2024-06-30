import 'package:proyecto_inkar/src/data/dataSource/local/SharefPref.dart';
import 'package:proyecto_inkar/src/data/dataSource/remote/services/AuthService.dart';
import 'package:proyecto_inkar/src/domain/models/AuthResponse.dart';
import 'package:proyecto_inkar/src/domain/models/user.dart';
import 'package:proyecto_inkar/src/domain/repository/AuthRepository.dart';
import 'package:proyecto_inkar/src/domain/utils/Resource.dart';

class AuthRepositoryimpl implements AuthRepository {
  AuthService authService;

  SharefPref sharefPref;

  AuthRepositoryimpl(this.authService, this.sharefPref);
  @override
  Future<Resource<AuthResponse>> login(String email, String password) {
    return authService.login(email, password);
  }

  @override
  Future<Resource<AuthResponse>> register(User user) {
    return authService.register(user);
  }

  @override
  Future<AuthResponse?> getUserSession() async {
    final data = await sharefPref.read('user');
    if (data != null) {
      AuthResponse authResponse = AuthResponse.fromJson(data);
      return authResponse;
    }
    return null;
  }

  @override
  Future<void> saveUserSession(AuthResponse authResponse) async {
    sharefPref.save('user', authResponse.toJson());
  }

  @override
  Future<bool> logout() async {
    return await sharefPref.remove('user');
  }
}
