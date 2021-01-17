import 'dart:ui';

import 'package:flutter/material.dart';

import 'settings.dart';

//void main() => runApp(new Profile());

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool showPassword = false;
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text('Profile'),
        elevation: 1, //!changing from 2 to 1
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.cyan,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.settings,
              color: Colors.cyan,
            ),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) => Settings()),
              );//page routing
            },
          ),
        ],
      ),
      //drawer: Sidebar(),
      body: new Container(
        padding: EdgeInsets.only(
          left: 16,
          right: 16,
          top: 25,
        ),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          }, //!Allows users to deslect text fields
          child: ListView(
            children: [
              Text(
                'Edit Profile',
                style: TextStyle(
                  fontSize: 25, //!A bigger font size makes it more attractive
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Center(
                child: new Stack(
                  children: [
                    Container(
                      width: 140,
                      height: 140,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 4,
                          color: Theme.of(context).scaffoldBackgroundColor,
                        ),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 12,
                            spreadRadius: 3.5,
                            color: Colors.cyanAccent.withOpacity(0.5),
                            offset: Offset(0, 15),
                          ),
                        ],
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage("https://www.bing.com/th?id=OIP.BbztveqQXM-Mp6e7q4XogwHaLB&w=136&h=204&c=8&rs=1&qlt=90&pid=3.1&rm=2"),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            width: 4,
                            color: Theme.of(context).scaffoldBackgroundColor,
                          ),
                          color: Colors.cyan,
                        ),
                        child: Icon(
                          Icons.edit,
                          color: Colors.cyanAccent,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              //TextField(),
              buildTextField("Full Name", "Okley Christopher", false),
              buildTextField("E-mail", "example@dev.com", false),
              buildTextField("Password", "*************", true),
              buildTextField("Room Allocated", "O-5", false),
              SizedBox(
                height: 35,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlineButton(
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    onPressed: () {},
                    child: Text("CANCEL",
                        style: TextStyle(
                          fontSize: 14,
                          letterSpacing: 2.2,
                          color: Colors.black,
                        )),
                  ),
                  RaisedButton(
                    onPressed: () {},
                    color: Colors.green,
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: Text("SAVE",
                        style: TextStyle(
                          fontSize: 14,
                          letterSpacing: 2.2,
                          color: Colors.white,
                        )),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

//method for text fields
  Widget buildTextField(
      String labelText, String placeholder, bool isPasswordTextField) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 35),
      child: TextField(
        obscureText: isPasswordTextField ? showPassword : false,
        decoration: InputDecoration(
            suffixIcon: isPasswordTextField
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        showPassword = !showPassword;
                      });
                    },
                    icon: Icon(
                      Icons.remove_red_eye,
                      color: Colors.cyan,
                    ),
                  )
                : null, //!This makes the icon appear only for the password field
            contentPadding: EdgeInsets.only(bottom: 3),
            labelText: labelText,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: placeholder,
            hintStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.cyan,
            )),
      ),
    );
  }
}
