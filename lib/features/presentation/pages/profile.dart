import 'dart:ui';

import 'package:flutter/material.dart';

import 'sidebar.dart';

void main() => runApp(new Profile());

class Profile extends StatefulWidget {
  @override
  ProfileState createState() => ProfileState();
}

class ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      drawer: Sidebar(),
      body: new Stack(
        fit: StackFit.expand,
        children: <Widget>[
          new Form(
            child: new Container(
              padding: const EdgeInsets.all(30),
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Text(
                    'EDIT YOUR PROFILE',
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.cyan,
                    ),
                  ),
                  new Container(
                    child: ListTile(
                      leading: Icon(Icons.edit),
                      title: Text(
                        'Edit Profile',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.cyanAccent,
                        ),
                      ),
                      onTap: () {},
                    ),
                  ),
                  
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
