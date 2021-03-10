import 'package:flutter/material.dart';

import '../../../login/presentation/pages/sign-in.dart';
import 'sidebar.dart';

class Pace extends StatefulWidget {
  @override
  _PaceState createState() => _PaceState();
}

//! must contain a sidebar for side navigations.
class _PaceState extends State<Pace> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        title: Text('Home'),
        elevation: 1.5,
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text("Logout"),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => Login(),
                ),
              );
            },
          ),
        ],
      ),
      drawer: Sidebar(),
      body: new Stack(
        fit: StackFit.expand,
        children: <Widget>[
          new Image(
            image: new AssetImage("assets/logo.jpeg"),
            fit: BoxFit.cover,
            color: Colors.white70,
            colorBlendMode: BlendMode.darken,
          ),
          new Form(
            child: Container(
              padding: const EdgeInsets.all(30.0),
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
