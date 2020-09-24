import 'package:flutter/material.dart';
import 'pages/signup.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: Login(),
      theme: new ThemeData(
        primarySwatch: Colors.black87,
      ),
    );
  }
}

class Login extends StatefulWidget {
  @override
  State createState() => new LoginState();
}

class LoginState extends State<Login> with SingleTickerProviderStateMixin {
  AnimationController _iconAnimationController;
  Animation<double> _iconAnimation;

  @override
  void initState() {
    super.initState();
    _iconAnimationController = new AnimationController(
        vsync: this, duration: new Duration(microseconds: 500));

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
            image: new AssetImage("assets/Logo.jpg"),
            fit: BoxFit.cover, //!covers the screen
            color: Colors.black87,
            colorBlendMode: BlendMode.darken,
          ),
          new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new FlutterLogo(
                //!will change to Hostel Logo inna bit
                //image: new AssetImage("assets/Logo.jpg"),
                size: _iconAnimation.value * 100,
              ),
              new Form(
                child: Theme(
                  data: new ThemeData(
                    brightness: Brightness.dark,
                    primarySwatch: Colors.cyan,
                    inputDecorationTheme: new InputDecorationTheme(
                      labelStyle: new TextStyle(
                        color: Colors.cyanAccent,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(35.0),
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        new TextFormField(
                          decoration: new InputDecoration(
                            hintText: "Enter e-mail",
                            labelText: "Email Address",
                          ),
                          keyboardType: TextInputType.emailAddress,
                        ),
                        new TextFormField(
                          decoration: new InputDecoration(
                            hintText: "Enter password",
                            labelText: "Password",
                            focusColor: Colors.cyanAccent,
                          ),
                          keyboardType: TextInputType.text,
                          obscureText: true,
                        ),
                        new Padding(
                          padding: const EdgeInsets.only(top: 25.0),
                        ),
                        new RaisedButton(
                          shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(25.5),
                            ),
                          color: Colors.cyan,
                          textColor: Colors.white,
                          child: new Text("Log In"),
                          onPressed: () {},
                          splashColor: Colors.tealAccent,
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        new Text(
                          "Tap SIGN UP to Create an Account, otherwise, SIGN IN!",
                          style: TextStyle(
                            color: Colors.cyanAccent,
                            fontSize: 15.0,
                          ),
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
                                builder: (context) => Homepage(),
                              ),
                            );
                          },
                          splashColor: Colors.tealAccent,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
