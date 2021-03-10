import 'package:Hostel/src/features/login/presentation/pages/sign-in.dart';
import 'package:Hostel/src/features/signup/presentation/pages/signup.dart';
import 'package:flutter/material.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showLogIn = true;//!login-signup toggling
  void toggleView() {
    setState(() => showLogIn = !showLogIn);
  }

  @override
  Widget build(BuildContext context) {
    if (showLogIn) {
      return SignUp(toggleView: toggleView);
    } else {
      return Login(toggleView: toggleView);
    }
    
  }
}
