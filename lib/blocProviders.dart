import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyecto_inkar/injection.dart';
import 'package:proyecto_inkar/src/domain/useCases/auth/AuthUseCases.dart';
import 'package:proyecto_inkar/src/presentation/pages/auth/login/bloc/LoginBloc.dart';
import 'package:proyecto_inkar/src/presentation/pages/auth/login/bloc/LoginEvent.dart';
import 'package:proyecto_inkar/src/presentation/pages/auth/register/bloc/RegisterBloc.dart';
import 'package:proyecto_inkar/src/presentation/pages/auth/register/bloc/RegisterEvent.dart';
import 'package:proyecto_inkar/src/presentation/pages/client/home/bloc/ClientHomeBloc.dart';

List<BlocProvider> blockProviders = [
  BlocProvider<LoginBloc>(
      create: (context) =>
          LoginBloc(locator<AuthUseCases>())..add(LoginInitEvent())),
  BlocProvider<RegisterBloc>(
      create: (context) =>
          RegisterBloc(locator<AuthUseCases>())..add(RegisterInitEvent())),
  BlocProvider<ClientHomeBloc>(
      create: (context) => ClientHomeBloc(locator<AuthUseCases>())),
];
