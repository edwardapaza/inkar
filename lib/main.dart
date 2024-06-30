import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:proyecto_inkar/blocProviders.dart';
import 'package:proyecto_inkar/injection.dart';
import 'package:proyecto_inkar/src/presentation/pages/auth/login/LoginPage.dart';
import 'package:proyecto_inkar/src/presentation/pages/auth/register/RegisterPage.dart';
import 'package:proyecto_inkar/src/presentation/pages/client/home/ClientHomePage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // HOT RELOAD, CADA VES QUE HACEMOS CTRL+S --> GUARDAR
  // HOT RESTART --> CUANDO VAMOS A VOLVER A EJECUTAR EL CODIGO CTRL+SHIFT+F5
  // FULL RESTART --> CUANDO DETENEMOS LA APLICACION Y VOLVEMOS A CORRER LA APLICACION
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: blockProviders,
      child: MaterialApp(
        builder: FToastBuilder(),
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: 'login',
        routes: {
          'login': (BuildContext context) => LoginPage(),
          'register': (BuildContext context) => RegisterPage(),
          'client/home': (BuildContext context) => ClientHomePage(),
        },
      ),
    );
  }
}
