import 'package:flutter/material.dart';

import 'sidebar.dart';

void main() => runApp(new Settings());

class Settings extends StatefulWidget {
  @override
  SettingsState createState() => SettingsState();
}

class SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      drawer: Sidebar(),
      body: new Stack(
        children: <Widget>[
          // new Image(
          //   image: new AssetImage("assets/logo.jpeg"),
          //   fit: BoxFit.cover,
          //   color: Colors.white70,
          //   colorBlendMode: BlendMode.clear,
          // ),
        ],
      ),
    );
  }
}
