import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        // title: Text('Settings'),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 1,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back),
          color: Colors.cyan,
        ),
      ),
      body: new Container(
        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
        child: ListView(
          children: [
            new Text(
              "Settings Page",
              style: TextStyle(
                color: Colors.black,
                fontSize: 25,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 40),
            Row(
              children: [
                Icon(Icons.person, color: Colors.cyan),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Account",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                )
              ],
            ),
          ],
        ),
        // new Image(
        //   image: new AssetImage("assets/logo.jpeg"),
        //   fit: BoxFit.cover,
        //   color: Colors.white70,
        //   colorBlendMode: BlendMode.clear,
        // ),
      ),
    );
  }
}
