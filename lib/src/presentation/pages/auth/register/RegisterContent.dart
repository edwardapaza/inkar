import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:proyecto_inkar/src/presentation/pages/auth/register/bloc/RegisterBloc.dart';
import 'package:proyecto_inkar/src/presentation/pages/auth/register/bloc/RegisterEvent.dart';
import 'package:proyecto_inkar/src/presentation/pages/auth/register/bloc/RegisterState.dart';
import 'package:proyecto_inkar/src/presentation/utils/BlocFormItem.dart';
import 'package:proyecto_inkar/src/presentation/widgets/DefaultButton.dart';
import 'package:proyecto_inkar/src/presentation/widgets/DefaultTextFieldOutlined.dart';

class RegisterContent extends StatelessWidget {
  RegisterState state;
  RegisterContent(this.state);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: state.formKey,
      child: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.only(left: 12),
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                  Color.fromARGB(255, 12, 38, 145),
                  Color.fromARGB(255, 34, 156, 249)
                ])),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, //horizontal
              mainAxisAlignment: MainAxisAlignment.center, //vertical
              children: [
                _textLoginRotated(context),
                SizedBox(height: 100),
                _textRegisterRotated(context),
                SizedBox(height: MediaQuery.of(context).size.height * 0.25),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 60, bottom: 35),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(35),
                    bottomLeft: Radius.circular(35)),
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      Color.fromARGB(255, 14, 29, 166),
                      Color.fromARGB(255, 30, 112, 227)
                    ])),
            child: Stack(
              children: [
                _imageBackground(context),
                SingleChildScrollView(
                  // scroll
                  child: Column(
                    children: [
                      _imageBanner(),
                      DefaultTextFieldOutlined(
                        text: 'Nombre',
                        icon: Icons.person_outline,
                        margin: EdgeInsets.only(left: 50, right: 50, top: 50),
                        onChanged: (text) {
                          context.read<RegisterBloc>().add(
                              NameChanged(name: BlocFormItem(value: text)));
                        },
                        validator: (value) {
                          return state.name.error;
                        },
                      ),
                      DefaultTextFieldOutlined(
                        text: 'Apellido',
                        icon: Icons.person_2_outlined,
                        margin: EdgeInsets.only(left: 50, right: 50, top: 15),
                        onChanged: (text) {
                          context.read<RegisterBloc>().add(LastNameChanged(
                              lastname: BlocFormItem(value: text)));
                        },
                        validator: (value) {
                          return state.lastname.error;
                        },
                      ),
                      DefaultTextFieldOutlined(
                        text: 'Email',
                        icon: Icons.email_outlined,
                        margin: EdgeInsets.only(left: 50, right: 50, top: 15),
                        onChanged: (text) {
                          context.read<RegisterBloc>().add(
                              EmailChanged(email: BlocFormItem(value: text)));
                        },
                        validator: (value) {
                          return state.email.error;
                        },
                      ),
                      DefaultTextFieldOutlined(
                        text: 'Telefono',
                        icon: Icons.phone_outlined,
                        margin: EdgeInsets.only(left: 50, right: 50, top: 15),
                        onChanged: (text) {
                          context.read<RegisterBloc>().add(
                              PhoneChanged(phone: BlocFormItem(value: text)));
                        },
                        validator: (value) {
                          return state.phone.error;
                        },
                      ),
                      DefaultTextFieldOutlined(
                        text: 'Password',
                        icon: Icons.password_outlined,
                        margin: EdgeInsets.only(left: 50, right: 50, top: 15),
                        onChanged: (text) {
                          context.read<RegisterBloc>().add(PasswordChanged(
                              password: BlocFormItem(value: text)));
                        },
                        validator: (value) {
                          return state.password.error;
                        },
                      ),
                      DefaultTextFieldOutlined(
                        text: 'Confirmar Password',
                        icon: Icons.person_2_outlined,
                        margin: EdgeInsets.only(left: 50, right: 50, top: 15),
                        onChanged: (text) {
                          context.read<RegisterBloc>().add(
                              ConfirmPasswordChanged(
                                  confirmPassword: BlocFormItem(value: text)));
                        },
                        validator: (value) {
                          return state.confirmPassword.error;
                        },
                      ),
                      DefaultButton(
                        onPressed: () {
                          if (state.formKey!.currentState!.validate()) {
                            context.read<RegisterBloc>().add(FormSubmit());
                            context.read<RegisterBloc>().add(FormReset());
                          }
                        },
                        text: 'Crear Usuario',
                        margin: EdgeInsets.only(top: 30, left: 60, right: 60),
                      ),
                      SizedBox(height: 25),
                      _separatorOr(),
                      SizedBox(height: 10),
                      _textAlreadyHaveAccount(context)
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _imageBackground(BuildContext context) {
    return FadeTransition(
      opacity: AlwaysStoppedAnimation(0.2),
      child: Container(
        margin: EdgeInsets.only(bottom: 50),
        alignment: Alignment.bottomCenter,
        child: Image.asset(
          'assets/img/destination.png',
          width: MediaQuery.of(context).size.width * 0.6,
          height: MediaQuery.of(context).size.height * 0.4,
        ),
      ),
    );
  }

  Widget _textAlreadyHaveAccount(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Ya tienes cuenta?',
          style: TextStyle(color: Colors.grey[100], fontSize: 16),
        ),
        SizedBox(width: 5),
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Text(
            'Inicia sesion',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
      ],
    );
  }

  Widget _separatorOr() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 25,
          height: 1,
          color: Colors.white,
          margin: EdgeInsets.only(right: 5),
        ),
        Text(
          'O',
          style: TextStyle(color: Colors.white, fontSize: 17),
        ),
        Container(
          width: 25,
          height: 1,
          color: Colors.white,
          margin: EdgeInsets.only(left: 5),
        ),
      ],
    );
  }

  Widget _imageBanner() {
    return Container(
      margin: EdgeInsets.only(top: 60),
      alignment: Alignment.center,
      child: Image.asset(
        'assets/img/delivery.png',
        width: 180,
        height: 180,
      ),
    );
  }

  Widget _textRegisterRotated(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: RotatedBox(
        quarterTurns: 1,
        child: Text(
          'Registro',
          style: TextStyle(
              fontSize: 27, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _textLoginRotated(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: RotatedBox(
        quarterTurns: 1,
        child: Text(
          'Login',
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
      ),
    );
  }
}
