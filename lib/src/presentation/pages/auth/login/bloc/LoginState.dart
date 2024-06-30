import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:proyecto_inkar/src/domain/utils/Resource.dart';
import 'package:proyecto_inkar/src/presentation/utils/BlocFormItem.dart';

class LoginState extends Equatable {
  final BlocFormItem email;
  final BlocFormItem password;
  final GlobalKey<FormState>? formKey;
  final Resource? response;

  const LoginState(
      {this.email = const BlocFormItem(error: 'Ingresa el email'),
      this.password = const BlocFormItem(error: 'Ingresa el password'),
      this.formKey,
      this.response});

  LoginState copyWith(
      {GlobalKey<FormState>? formKey,
      BlocFormItem? email,
      BlocFormItem? password,
      Resource? response}) {
    return LoginState(
        email: email ?? this.email,
        password: password ?? this.password, // if
        formKey: formKey,
        response: response);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [email, password, response];
}
