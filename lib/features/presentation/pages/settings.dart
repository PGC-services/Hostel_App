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
                fontSize: 35,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 40),
            buildAccountOptions(context),
            Divider(
              height: 4,
              thickness: 3,
            ), //!works like the hr propert in html
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

  GestureDetector buildAccountOptions(BuildContext context) {
    return GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text("Change Password"),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text("Option 1"),
                        Text("Option 2"),
                        Text("Option 3"),
                      ],
                    ),
                    actions: [
                      FlatButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text("Close"),
                      ),
                    ],
                  );
                },
              );
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.person, color: Colors.cyan),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Account",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.w500),
                )
              ],
            ),
          );
  }
}
