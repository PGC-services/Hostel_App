//import 'package:Hostel/features/presentation/pages/home.dart';
import 'package:Hostel/core/services/auth.dart';
import 'package:Hostel/features/presentation/pages/signup.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  State createState() => new LoginState();
}

class LoginState extends State<Login> with SingleTickerProviderStateMixin {
  final AuthService _auth = AuthService();
  // String email = "";
  // String password = "";

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.black87,
      //appBar: AppBar(),
      body: Container(
        padding: EdgeInsets.symmetric(),
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
                            SizedBox(height: 40,),
                            new Text(
                              "Tap SIGN UP to Create an Account, otherwise, SIGN IN!",
                              style: TextStyle(
                                color: Colors.cyanAccent,
                                fontSize: 15.0,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                new RaisedButton(
                                  shape: new RoundedRectangleBorder(
                                    borderRadius:
                                        new BorderRadius.circular(25.5),
                                  ),
                                  color: Colors.cyan,
                                  textColor: Colors.white,
                                  child: new Text("Log In"),
                                  onPressed: () async {
                                    dynamic result = await _auth.anonymous();
                                    if (result == null) {
                                      print("Error signing in");
                                    } else {
                                      print("Signed in");
                                      print(result.uid);
                                      
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
