import 'package:flutter/material.dart';

import 'sidebar.dart';

void main() => runApp(new Contact());

class Contact extends StatefulWidget {
  @override
  State createState() => ContactState();
}

class ContactState extends State<Contact> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        title: Text('Contact Us...'),
      ),
      drawer: Sidebar(),
      body: new Stack(
        children: <Widget>[
          new Image(
            image: new AssetImage("assets/logo.jpeg"),
            fit: BoxFit.cover,
            color: Colors.white70,
            colorBlendMode: BlendMode.clear,
          ),
          new Form(
            child: Container(
              padding: const EdgeInsets.all(30),
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Text(
                    'Talk to the Hostel Managers and Reps using the contact infomation given below',
                    style: TextStyle(
                      fontSize: 22,
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.call),
                    title: Text(
                      '',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    onTap: () {},
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