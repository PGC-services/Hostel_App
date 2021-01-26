import 'package:Hostel/core/services/auth.dart';
import 'package:Hostel/features/presentation/pages/sign-in.dart';
import 'package:flutter/material.dart';

import 'contact.dart';
import 'edit_profile.dart';
import 'settings.dart';

class Sidebar extends StatelessWidget {
  final AuthService _auth = AuthService();
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
                      border: Border.all(
                        width: 0.5,
                        color: Colors.cyanAccent,
                      ),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 10,
                          spreadRadius: 3,
                          color: Colors.lightBlueAccent.withOpacity(0.8),
                          offset: Offset(0, 15),
                        ),
                      ],
                      image: DecorationImage(
                        image: new AssetImage(
                          "assets/logo.jpeg",
                        ),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Text(
                    //!This field will be the name of the user in Version 1.0
                    'Pacesetters Hostel',
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    //!This field will be the email of the user in Version 1.0
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
              leading: Icon(Icons.phone),
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
            onTap: () async {
              await _auth.logout();
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
          SizedBox(
            height: 335,
          ),
          Text(
            'Version 1.0.0',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 20,
              fontWeight: FontWeight.normal,
            ),
          ),
          // Row(
          //   children: [
          //     Positioned(
          //       bottom: 0,
          //       right: 0,
          //       child: Center(
          //         child: Container(
          //           Text(
          //             'Version 1.0.0',
          //             style: TextStyle(
          //               color: Colors.grey,
          //               fontSize: 20,
          //               fontWeight: FontWeight.normal,
          //             ),
          //           ),
          //         ),
          //       ),
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }
}
