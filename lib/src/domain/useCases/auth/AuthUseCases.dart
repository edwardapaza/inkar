import 'package:proyecto_inkar/src/domain/useCases/auth/GetUserSessionUseCase.dart';
import 'package:proyecto_inkar/src/domain/useCases/auth/LoginUseCase.dart';
import 'package:proyecto_inkar/src/domain/useCases/auth/LogoutUseCase.dart';
import 'package:proyecto_inkar/src/domain/useCases/auth/RegisterUseCase.dart';
import 'package:proyecto_inkar/src/domain/useCases/auth/SaveUserSessionUseCase.dart';

class AuthUseCases {
  LoginUseCase login;
  RegisterUseCase register;
  SaveUserSessionUseCase saveUserSessionUseCase;
  GetUserSessionUseCase getUserSessionUseCase;
  LogoutUseCase logout;

  AuthUseCases(
      {required this.login,
      required this.register,
      required this.saveUserSessionUseCase,
      required this.getUserSessionUseCase,
      required this.logout});
}
