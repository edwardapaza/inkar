import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:proyecto_inkar/src/domain/models/AuthResponse.dart';
import 'package:proyecto_inkar/src/domain/utils/Resource.dart';
import 'package:proyecto_inkar/src/presentation/pages/auth/register/RegisterContent.dart';
import 'package:proyecto_inkar/src/presentation/pages/auth/register/bloc/RegisterBloc.dart';
import 'package:proyecto_inkar/src/presentation/pages/auth/register/bloc/RegisterEvent.dart';
import 'package:proyecto_inkar/src/presentation/pages/auth/register/bloc/RegisterState.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<RegisterBloc, RegisterState>(
        listener: (context, state) {
          final response = state.response;
          if (response is ErrorData) {
            Fluttertoast.showToast(
                msg: response.message, toastLength: Toast.LENGTH_LONG);
          } else if (response is Success) {
            context.read<RegisterBloc>().add(FormReset());
            final authResponse = response.data as AuthResponse;
            context
                .read<RegisterBloc>()
                .add(SaveUserSession(authResponse: authResponse));
            Navigator.pushNamedAndRemoveUntil(
                context, 'client/home', (route) => false);
          }
        },
        child: BlocBuilder<RegisterBloc, RegisterState>(
          builder: (context, state) {
            return RegisterContent(state);
          },
        ),
      ),
    );
  }
}
