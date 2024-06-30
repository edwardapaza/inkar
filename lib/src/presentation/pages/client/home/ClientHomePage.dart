import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyecto_inkar/main.dart';
import 'package:proyecto_inkar/src/presentation/pages/client/home/bloc/ClientHomeBloc.dart';
import 'package:proyecto_inkar/src/presentation/pages/client/home/bloc/ClientHomeEvent.dart';
import 'package:proyecto_inkar/src/presentation/pages/client/home/bloc/ClientHomeState.dart';
import 'package:proyecto_inkar/src/presentation/pages/profile/info/ProfileInfoPage.dart';

class ClientHomePage extends StatefulWidget {
  const ClientHomePage({super.key});

  @override
  State<ClientHomePage> createState() => _ClientHomePageState();
}

class _ClientHomePageState extends State<ClientHomePage> {
  List<Widget> pageList = <Widget>[
    ProfileInfoPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu de opciones'),
      ),
      body: BlocBuilder<ClientHomeBloc, ClientHomeState>(
        builder: (context, state) {
          return pageList[state.pageIndex];
        },
      ),
      drawer: BlocBuilder<ClientHomeBloc, ClientHomeState>(
        builder: (context, state) {
          return Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                DrawerHeader(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [
                            Color.fromARGB(255, 12, 38, 145),
                            Color.fromARGB(255, 34, 156, 249)
                          ]),
                    ),
                    child: Text(
                      'Menu del cliente',
                      style: TextStyle(color: Colors.white),
                    )),
                ListTile(
                  title: Text('Perfil del usuario'),
                  selected: state.pageIndex == 0,
                  onTap: () {
                    context
                        .read<ClientHomeBloc>()
                        .add(ChangeDrawerPage(pageIndex: 0));
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: Text('Cerrar sesion'),
                  onTap: () {
                    context.read<ClientHomeBloc>().add(Logout());
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => MyApp()),
                        (route) => false);
                  },
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
