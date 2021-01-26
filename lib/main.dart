import 'package:Hostel/features/presentation/pages/signup.dart';
import 'package:Hostel/features/presentation/pages/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/models/user.dart';
import 'core/services/auth.dart';


void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<Person>.value(
      value: AuthService().person,
      child: new MaterialApp(
        home: Wrapper(),
        theme: new ThemeData(
          primarySwatch: Colors.cyan,
        ),
      ),
    );
  }
}

