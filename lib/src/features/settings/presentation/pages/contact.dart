import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../homepage/presentation/pages/sidebar.dart';


void main() => runApp(new Contact());

class Contact extends StatefulWidget {
  @override
  State createState() => ContactState();
}

class ContactState extends State<Contact> with SingleTickerProviderStateMixin {
  void customLaunch(command) async {
    if (await canLaunch(command)) {
      await launch(command);
    } else {
      print('Could not launch $command');
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.black45,
      appBar: AppBar(
        title: Text('Contact Us...'),
      ),
      drawer: Sidebar(),
      body: new Stack(
        fit: StackFit.expand,
        children: <Widget>[
          // new Image(
          //   image: new AssetImage("assets/logo.jpeg"),
          //   fit: BoxFit.cover,
          //   color: Colors.black54,
          //   colorBlendMode: BlendMode.darken,
          // ),
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
                      color: Colors.white70,
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.call),
                    title: Text(
                      'Hostel Manager',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.cyan,
                      ),
                    ),
                    onTap: () {
                      customLaunch('tel: +233 24 353 6375');
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.call),
                    title: Text(
                      'Hostel Representative',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.cyan,
                      ),
                    ),
                    onTap: () {
                      customLaunch('tel: +233 55 973 9718');
                    },
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
