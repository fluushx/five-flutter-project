import 'package:five_project/share_prefs/preferencias_usuarios.dart';
import 'package:five_project/src/pages/settings_page.dart';
import 'package:five_project/widgets/menu_widget.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  static final String routeName = "home_screen";
  @override
  final prefs = PreferenciasUsuarios();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Preferencias de Usuario'),
      ),
      drawer: MenuWidget(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          Text('Color Secundario ${prefs.colorSecundario}'),
          Divider(),
          Text('Genero ${prefs.genero}'),
          Divider(),
          Text('Nombre de usuario ${prefs.nombreUsuario}'),
          Divider(),
        ],
      ),
    );
  }
}
