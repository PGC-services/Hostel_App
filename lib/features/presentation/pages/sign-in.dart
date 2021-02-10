import 'package:Hostel/core/services/auth.dart';
import 'package:Hostel/core/shared/loading.dart';
//import 'package:Hostel/features/presentation/pages/home.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  final Function toggleView;
  Login({this.toggleView});

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final AuthService _auth = AuthService();
  final _formkey = GlobalKey<FormState>(); //form validations
  bool loading = false;

  //text field state
  String email = "";
  String pass = "";
  String error = "";

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            backgroundColor: Colors.black87,
            appBar: AppBar(
              backgroundColor: Colors.cyanAccent,
              elevation: 0.0,
              title: Text('Log In'),
              actions: <Widget>[
                FlatButton.icon(
                  icon: Icon(Icons.person),
                  label: Text('Sign Up'),
                  onPressed: () {
                    widget.toggleView();
                  },
                )
              ],
            ),
            body: Container(
              //padding: EdgeInsets.symmetric(),
              child: new Stack(
                fit:
                    StackFit.expand, //!makes the picture fill the entire screen
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
                      new Form(
                        key: _formkey,
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
                            padding: const EdgeInsets.all(45.0),
                            child: new Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                new TextFormField(
                                  validator: (val) => val.isEmpty
                                      ? 'Enter a registered email!'
                                      : null,
                                  decoration: new InputDecoration(
                                    hintText: "Enter e-mail",
                                    labelText: "Email Address",
                                  ),
                                  keyboardType: TextInputType.emailAddress,
                                  onChanged: (val) {},
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                new TextFormField(
                                  validator: (val) => val.length < 8
                                      ? 'Enter your password!'
                                      : null,
                                  decoration: new InputDecoration(
                                    hintText: "Enter password",
                                    labelText: "Password",
                                    focusColor: Colors.cyanAccent,
                                  ),
                                  keyboardType: TextInputType.text,
                                  obscureText: true,
                                  onChanged: (val) {},
                                ),
                                new Padding(
                                  padding: const EdgeInsets.only(top: 25.0),
                                ),
                                SizedBox(
                                  height: 40,
                                ),
                                new Text(
                                  "Tap SIGN UP to Create an Account, otherwise, SIGN IN!",
                                  style: TextStyle(
                                    color: Colors.cyanAccent,
                                    fontSize: 17.0,
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    new RaisedButton(
                                      shape: new RoundedRectangleBorder(
                                        borderRadius:
                                            new BorderRadius.circular(25.5),
                                      ),
                                      color: Colors.cyan,
                                      textColor: Colors.white,
                                      child: new Text(
                                        "Log In",
                                        style: TextStyle(
                                          letterSpacing: 2.2,
                                        ),
                                      ),
                                      onPressed: () async {
                                        if (_formkey.currentState.validate()) {
                                          setState(() => loading = true);
                                          dynamic result = await _auth
                                              .signInWithEmailandPassword(
                                                  email, pass);
                                          print('vaild credentials');
                                          if (result == null) {
                                            setState(() {
                                              error = 'Invalid Credentials';
                                            });
                                            setState(() => loading = false);
                                          }
                                        }
                                      },
                                      splashColor: Colors.tealAccent,
                                    ),
                                    new RaisedButton(
                                      shape: new RoundedRectangleBorder(
                                        borderRadius:
                                            new BorderRadius.circular(25.5),
                                      ),
                                      color: Colors.cyan,
                                      textColor: Colors.white,
                                      child: new Text(
                                        "Sign Up",
                                        style: TextStyle(
                                          letterSpacing: 2.2,
                                        ),
                                      ),
                                      onPressed: () {
                                        widget.toggleView();
                                      },
                                      splashColor: Colors.tealAccent,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 20.0,
                                ),
                                Text(
                                  error,
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 15.0,
                                  ),
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
            ),
          );
  }
}
