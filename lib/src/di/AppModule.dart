import 'package:injectable/injectable.dart';
import 'package:proyecto_inkar/src/data/dataSource/local/SharefPref.dart';
import 'package:proyecto_inkar/src/data/dataSource/remote/services/AuthService.dart';
import 'package:proyecto_inkar/src/data/repository/AuthRepositoryImpl.dart';
import 'package:proyecto_inkar/src/domain/repository/AuthRepository.dart';
import 'package:proyecto_inkar/src/domain/useCases/auth/AuthUseCases.dart';
import 'package:proyecto_inkar/src/domain/useCases/auth/GetUserSessionUseCase.dart';
import 'package:proyecto_inkar/src/domain/useCases/auth/LoginUseCase.dart';
import 'package:proyecto_inkar/src/domain/useCases/auth/LogoutUseCase.dart';
import 'package:proyecto_inkar/src/domain/useCases/auth/RegisterUseCase.dart';
import 'package:proyecto_inkar/src/domain/useCases/auth/SaveUserSessionUseCase.dart';

@module
abstract class AppModule {
  @injectable
  SharefPref get sharefPref => SharefPref();
  @injectable
  AuthService get authService => AuthService();
  @injectable
  AuthRepository get authRepository =>
      AuthRepositoryimpl(authService, sharefPref);
  @injectable
  AuthUseCases get authUseCases => AuthUseCases(
      login: LoginUseCase(authRepository),
      register: RegisterUseCase(authRepository),
      saveUserSessionUseCase: SaveUserSessionUseCase(authRepository),
      getUserSessionUseCase: GetUserSessionUseCase(authRepository),
      logout: LogoutUseCase(authRepository));
}
