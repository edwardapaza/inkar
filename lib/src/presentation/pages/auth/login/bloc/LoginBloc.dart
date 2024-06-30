import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyecto_inkar/src/domain/models/AuthResponse.dart';
import 'package:proyecto_inkar/src/domain/useCases/auth/AuthUseCases.dart';
import 'package:proyecto_inkar/src/domain/utils/Resource.dart';
import 'package:proyecto_inkar/src/presentation/pages/auth/login/bloc/LoginEvent.dart';
import 'package:proyecto_inkar/src/presentation/pages/auth/login/bloc/LoginState.dart';
import 'package:proyecto_inkar/src/presentation/utils/BlocFormItem.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final formKey = GlobalKey<FormState>();

  // LoginUseCase loginUseCase = LoginUseCase();

  AuthUseCases authUseCases;

  LoginBloc(this.authUseCases) : super(LoginState()) {
    on<LoginInitEvent>((event, emit) async {
      AuthResponse? authResponse =
          await authUseCases.getUserSessionUseCase.run();
      print('Auth response session: ${authResponse?.toJson()}');
      emit(state.copyWith(formKey: formKey));
      if (authResponse != null) {
        emit(state.copyWith(response: Success(authResponse), formKey: formKey));
      }
    });

    on<SaveUserSession>((event, emit) async {
      await authUseCases.saveUserSessionUseCase.run(event.authResponse);
    });

    on<EmailChanged>((event, emit) {
      emit(state.copyWith(
          email: BlocFormItem(
              value: event.email.value,
              error: event.email.value.isEmpty ? 'Ingresa el email' : null),
          formKey: formKey));
    });

    on<PasswordChanged>((event, emit) {
      emit(state.copyWith(
          password: BlocFormItem(
              value: event.password.value,
              error: event.password.value.isEmpty
                  ? 'Ingresa el password'
                  : event.password.value.length < 6
                      ? 'Minimo 6 caracteres'
                      : null),
          formKey: formKey));
    });
    on<FormSubmit>((event, emit) async {
      print('Email: ${state.email.value}');
      print('Password: ${state.password.value}');
      emit(state.copyWith(response: Loading(), formKey: formKey));

      Resource response =
          await authUseCases.login.run(state.email.value, state.password.value);
      emit(state.copyWith(response: response, formKey: formKey));
    });
  }
}
