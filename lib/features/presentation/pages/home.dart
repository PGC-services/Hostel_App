import 'package:flutter/material.dart';

import 'sidebar.dart';

void main() => runApp(new Pace());

class Pace extends StatefulWidget {
  @override
  State createState() => PaceState();
}
//! must contain a sidebar for side navigations.
class PaceState extends State<Pace> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        title :Text('Home',),
        elevation: 1.5,
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
                children: <Widget>[
                  
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}