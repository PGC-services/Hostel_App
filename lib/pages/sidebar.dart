import 'package:flutter/material.dart';
import '../main.dart';
import 'contact.dart';
import 'profile.dart';

class Sidebar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      // for side navigation
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(20),
            color: Theme.of(context).primaryColor,
            child: Center(
              child: Column(
                children: <Widget>[
                  Container(
                    width: 100,
                    height: 100,
                    margin: EdgeInsets.only(
                      top: 30,
                      bottom: 10,
                    ),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: new AssetImage("assets/logo.jpeg"),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Text(
                    'Pacesetters Hostel',
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'example@dev.com',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text(
              'Profile',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => Profile(),
                ),
              );
            },
          ),
          ListTile(
              leading: Icon(Icons.person),
              title: Text(
                'Contact Us',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              onTap: () {
                //!page navigations
                Navigator.of(context).pop();
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => Contact(), //Login(),
                  ),
                );
              }),
          ListTile(
            leading: Icon(Icons.arrow_back),
            title: Text(
              'Logout',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => Login(),
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.question_answer),
            title: Text(
              "FAQs",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text(
              'Settings',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => Settings(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
