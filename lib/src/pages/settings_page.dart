import 'package:five_project/share_prefs/preferencias_usuarios.dart';
import 'package:five_project/widgets/menu_widget.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingPage extends StatefulWidget {
  static final String routeName = "setting_screen";

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  bool _colorSecundario = true;
  int _genero = 2;
  String _nombre = 'Pedro';

  TextEditingController? _textController;

  final prefs = PreferenciasUsuarios();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _textController = new TextEditingController(text: _nombre);
    _genero = prefs.genero;
    _colorSecundario = prefs.colorSecundario;
    _nombre = prefs.nombreUsuario;
  }

  _setSelectRadio(int? valor) async {
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // prefs.setInt('genero', valor ?? 1);
    prefs.genero = valor ?? 1;
    _genero = valor ?? 1;

    _colorSecundario = prefs.colorSecundario;
    _nombre = prefs.nombreUsuario;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ajustes'),
        backgroundColor: (prefs.colorSecundario) ? Colors.teal : Colors.blue,
      ),
      drawer: MenuWidget(),
      body: ListView(children: [
        Container(
          padding: EdgeInsets.all(5.0),
          child: Text('Settings',
              style: TextStyle(fontSize: 45.0, fontWeight: FontWeight.bold)),
        ),
        Divider(),
        SwitchListTile(
            value: _colorSecundario,
            title: Text('Color Secundario'),
            onChanged: (value) {
              setState(() {
                _colorSecundario = value;
                prefs.colorSecundario = _colorSecundario;
              });
            }),
        RadioListTile(
            value: 1,
            title: Text('Masculino'),
            groupValue: _genero,
            onChanged: _setSelectRadio),
        RadioListTile(
            value: 2,
            title: Text('Femenino'),
            groupValue: _genero,
            onChanged: _setSelectRadio),
        Divider(),
        Container(
          padding: EdgeInsets.all(20),
          child: TextField(
            controller: _textController,
            decoration: InputDecoration(
                labelText: 'Nombre',
                helperText: 'Nombre de la persona usando la vista $_nombre'),
            onChanged: (value) {
              setState(() {
                _nombre = value;
                prefs.nombreUsuario = _nombre;
              });
            },
          ),
        )
      ]),
    );
  }
}
