import 'package:flutter/material.dart';

import '../../../../../core/services/auth.dart';
import '../../../../../core/shared/loading.dart';
import '../../../homepage/presentation/pages/home.dart';



class SignUp extends StatefulWidget {
  final Function toggleView;
  SignUp({this.toggleView});

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  // textField state
  String email = '';
  String pass = '';
  String error = '';

  final AuthService _auth = AuthService();
  final _formkey = GlobalKey<FormState>(); // for form validation
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            backgroundColor: Colors.black87,
            appBar: AppBar(
              backgroundColor: Colors.cyanAccent,
              elevation: 0.0,
              title: Text('Sign Up'),
              actions: <Widget>[
                FlatButton.icon(
                  icon: Icon(Icons.person),
                  label: Text('Log In'),
                  onPressed: () {
                    widget.toggleView();
                  },
                )
              ],
            ),
            body: Container(
              child: new Stack(
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
                      new Form(
                        key: _formkey,
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
                                  validator: (val) => val.isEmpty
                                      ? 'Enter a valid email address'
                                      : null,
                                  decoration: new InputDecoration(
                                    hintText: "Enter email",
                                    labelText: "Email",
                                    focusColor: Colors.cyanAccent,
                                  ),
                                  keyboardType: TextInputType.emailAddress,
                                  style: TextStyle(
                                    fontFamily: 'Consolas',
                                    color: Colors.blueAccent,
                                  ),
                                  onChanged: (val) {
                                    setState(() => email = val);
                                  },
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                new TextFormField(
                                  //validates the textfield
                                  validator: (val) => val.length < 8
                                      ? 'Enter a password with at least 8 characters'
                                      : null,
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
                                  onChanged: (val) {
                                    setState(() => pass = val);
                                  },
                                ),
                                //
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
                                  onPressed: () async {
                                    if (_formkey.currentState.validate()) {
                                      setState(() => loading = true);
                                      dynamic result =
                                          await _auth.signUpwithEmailandPassword(
                                              email, pass);
                                      if (result == null){
                                        setState(() {
                                          error = 'Please enter a valid email address';
                                          loading = false;
                                        });
                                        setState(() => loading = false);
                                      }
                                    }
                                    Pace();
                                  },
                                  splashColor: Colors.tealAccent,
                                ),
                                SizedBox(
                                  height: 20.0,
                                ),
                                Text(
                                  error,
                                  style: TextStyle(
                                    color: Colors.red[700],
                                    fontSize: 15.0,
                                  ),
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
            ),
          );
  }
}
