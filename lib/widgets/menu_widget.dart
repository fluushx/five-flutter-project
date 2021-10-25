import 'package:five_project/src/pages/home_screen.dart';
import 'package:five_project/src/pages/settings_page.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class MenuWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(padding: EdgeInsets.zero, children: [
        DrawerHeader(
            child: Container(),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/menu-img.jpg'),
                    fit: BoxFit.fill))),
        ListTile(
          title: Text('Home'),
          leading: Icon(
            Icons.home,
            color: Colors.blue,
          ),
          onTap: () {
            Navigator.pushReplacementNamed(context, HomePage.routeName);
          },
        ),
        ListTile(
          title: Text('Party Mode'),
          leading: Icon(
            Icons.party_mode_outlined,
            color: Colors.blue,
          ),
          onTap: () {},
        ),
        ListTile(
          title: Text('People'),
          leading: Icon(
            Icons.people_outline_sharp,
            color: Colors.blue,
          ),
          onTap: () {},
        ),
        ListTile(
          title: Text('Settings'),
          leading: Icon(
            Icons.settings,
            color: Colors.blue,
          ),
          onTap: () {
            Navigator.pushNamed(context, SettingPage.routeName);
          },
        ),
      ]),
    );
  }
}
