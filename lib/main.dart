import 'package:five_project/share_prefs/preferencias_usuarios.dart';
import 'package:flutter/material.dart';

import 'src/pages/home_screen.dart';
import 'src/pages/settings_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = PreferenciasUsuarios();
  prefs.initPrefs();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Preferencias',
        debugShowCheckedModeBanner: false,
        initialRoute: HomePage.routeName,
        routes: {
          HomePage.routeName: (BuildContext context) => HomePage(),
          SettingPage.routeName: (BuildContext context) => SettingPage(),
        });
  }
}
