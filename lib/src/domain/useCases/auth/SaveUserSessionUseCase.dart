import 'package:proyecto_inkar/src/domain/models/AuthResponse.dart';
import 'package:proyecto_inkar/src/domain/repository/AuthRepository.dart';

class SaveUserSessionUseCase {
  AuthRepository authRepository;

  SaveUserSessionUseCase(this.authRepository);

  run(AuthResponse authResponse) =>
      authRepository.saveUserSession(authResponse);
}
