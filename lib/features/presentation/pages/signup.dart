import 'package:flutter/material.dart';

import 'home.dart';

void main() => runApp(new Homepage());

class Homepage extends StatefulWidget {
  @override
  State createState() => HomeState();
}

class HomeState extends State<Homepage> with SingleTickerProviderStateMixin {
  AnimationController _iconAnimationController;
  Animation<double> _iconAnimation;

  @override
  void initState() {
    super.initState();
    _iconAnimationController = new AnimationController(
        vsync: this, duration: new Duration(milliseconds: 1000));

    _iconAnimation = new CurvedAnimation(
        parent: _iconAnimationController, curve: Curves.bounceOut);

    _iconAnimation.addListener(() => this.setState(() {}));
    _iconAnimationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.black87,
      body: new Stack(
        fit: StackFit.expand, //!makes the picture fill the entire screen
        children: <Widget>[
          new Image(
            image: new AssetImage("assets/logo.jpeg"),
            fit: BoxFit.cover, //!covers the screen
            color: Colors.black87,
            colorBlendMode: BlendMode.darken,
          ),
          new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // new Image(
              //   //!will change to Hostel Logo inna bit
              //   image: new AssetImage("assets/logo.jpeg"),
              //   fit:BoxFit.cover,
              //   //size: _iconAnimation.value * 100),
              // ),
              new FlutterLogo(
               // duration: (microseconds: 500),
                size: _iconAnimation.value * 100
              ),
              new Form(
                child: Theme(
                  data: new ThemeData(
                    brightness: Brightness.dark,
                    primarySwatch: Colors.blueGrey,
                    inputDecorationTheme: new InputDecorationTheme(
                      labelStyle: new TextStyle(
                          color: Colors.cyanAccent,
                          fontSize: 20.0,
                          fontFamily: 'Consolas'),
                    ),
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(45.0),
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        new TextFormField(
                          decoration: new InputDecoration(
                            hintText: "Enter username",
                            labelText: "Username",
                            focusColor: Colors.cyanAccent,
                          ),
                          keyboardType: TextInputType.emailAddress,
                          style: TextStyle(
                            fontFamily: 'Consolas',
                            color: Colors.blueAccent,
                          ),
                        ),
                        // new TextFormField(
                        //   decoration: new InputDecoration(
                        //     hintText: "Enter e-mail",
                        //     labelText: "Email Address",
                        //     focusColor: Colors.cyanAccent,
                        //   ),
                        //   keyboardType: TextInputType.emailAddress,
                        //   style: TextStyle(
                        //     fontFamily: 'Consolas',
                        //     color: Colors.blueAccent,
                        //   ),
                        // ),
                        SizedBox(
                          height: 12,
                        ),
                        new TextFormField(
                          decoration: new InputDecoration(
                            hintText: "Enter password",
                            labelText: "Password",
                            focusColor: Colors.cyanAccent,
                          ),
                          keyboardType: TextInputType.text,
                          obscureText: true,
                          style: TextStyle(
                            fontFamily: 'Consolas',
                            color: Colors.blueAccent,
                          ),
                        ),
                        new TextFormField(
                          decoration: new InputDecoration(
                            hintText: "Verify password",
                            labelText: "Verify Password",
                            focusColor: Colors.cyanAccent,
                          ),
                          keyboardType: TextInputType.text,
                          obscureText: true,
                          style: TextStyle(
                            color: Colors.greenAccent,
                            fontFamily: 'Consolas',
                          ),
                        ),
                        new Padding(
                          padding: const EdgeInsets.only(top: 25.0),
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        new RaisedButton(
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(25.5),
                          ),
                          color: Colors.cyan,
                          textColor: Colors.white,
                          child: new Text("Sign Up"),
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => Pace(),
                              ),
                            );
                          },
                          splashColor: Colors.tealAccent,
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
