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
                color: Colors.black87,
                fontSize: 35,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Row(children: [
              Icon(
                Icons.person,
                color: Colors.cyan,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "Account",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              )
            ]),
            Divider(
              height: 3,
              thickness: 2,
            ),
            SizedBox(
              height: 10,
            ),
            buildAccountOptions(context, "Change Password"),
            buildAccountOptions(
                context, "Chat with Us"), //! social media handles
            buildAccountOptions(context, "Privacy and Security"),
            buildAccountOptions(context,
                "Theme"), //!at the right time, more options will be added!
            // Divider(
            //   height: 3,
            //   thickness: 2,
            // ), //!works like the hr property in html
            SizedBox(
              height: 40,
            ),
            Row(
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.volume_up_outlined,
                    color: Colors.cyan,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Notifications",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    width: 193,
                  ),
                  Switch(
                    value: true,
                    onChanged: (bool val) {},
                  ), //!if off, all other notifications are off as well
                ]),
            Divider(
              height: 3,
              thickness: 2,
            ),
            SizedBox(
              height: 10,
            ),
            buildNotificationsOptions("News for You", true),
            buildNotificationsOptions("Account Activity", true),
            buildNotificationsOptions("News Around the World", true),
            // buildNotificationsOptions("", false),
            SizedBox(
              height: 190,
            ),
            Center(
              child: Text(
                'Version 1.0.0',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row buildNotificationsOptions(String title, bool isActive) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ), //gonna be changed very very very soon!!!!!
        ),
        Switch(
          value: false,
          onChanged: (bool val) {},
        ),
      ],
    );
  }

//method for options
  GestureDetector buildAccountOptions(BuildContext context, String title) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(title),
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
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //Icon(Icons.person, color: Colors.cyan),
            // SizedBox(
            //   width: 10,
            // ),
            Text(
              title,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            Icon(Icons.arrow_forward_ios_outlined, color: Colors.cyan),
          ],
        ),
      ),
    );
  }
}
